#!/bin/sh
# trace-packet.sh —— #23 §11.3 的显式验收项：packets/ 不得长出别处没有的事实。
#
# 🔴 **五项**机械检查，不是三条也不是四项——条数在这里写错过两次（注释停在「三条」时实有 [1]–[4]），
# 所以下面每一项都由它自己的 `=== [N] ... ===` 分隔行自陈，注释只做索引：
#   [1] packets/ 里不得出现自己的 `✓ <url>` 证据行（取证归 channels/，包只引用）
#   [2] 每个 `← channels/<key>.md § <节名>` 指针都能解析到一个真实存在的节
#   [3] 每个渲染物的 frontmatter `rendered_from:` 指向的真相源文件必须存在
#   [4] `source_fingerprint` 与当前真相源一致（陈旧包检测，ADR 0013）
#   [5] `season-stamp-matches-owners`（ADR 0008 限定 4 / docs/checks.md 短名，#47）
#
# 全部用 awk / grep —— CONTRACT.md §4.5：BSD uniq 与 sort -u 在中文下是坏的；
# awk 的 `==` / `!=` / `<` 在两个纯中文串之间同样是坏的（硬规则 4），本脚本一律走
# `index(a,b)==1 && length(a)==length(b)` 或数组下标（数组下标走精确哈希，不经 strcoll）。
# 🔴 中文拼进 shell 字符串一律写 `${var}`：macOS 的 /bin/sh 是 bash 3.2，`$var` 紧邻多字节字符会被截断。
#
# 在 sample-workspace/ 的上一级跑：./trace-packet.sh
set -u
export LC_ALL=en_US.UTF-8   # 🔴 §4.5：剥离步骤必须要它，且不能靠继承环境（失效是静默的）
HERE="$(dirname "$0")"
WS="${HERE}/sample-workspace"
CONTRACT="${HERE}/CONTRACT.md"
# 规则的作用域是 packets/<program_key>/**。packets/README.md 是设计文档，讲规则时必须说得出
# 「✓」与「待核实」这两个词，不受规则 ② 约束——作用域写错会把设计文档本身判成违规。
PK="${WS}/packets"
fail=0

echo "=== [1] packets/ 的断言行里不得出现 ✓ 或 待核实 ==="
# #8 决议②：二元标记编码成「有没有 ⬜」。两个词都是真相源的词汇，
# 转述进包就是镜像（channels/ 换季降级后包里那行不改就是假的）。
# 说明层（以 > 开头的引用块）豁免——读法声明本身必须说得出这两个词。
viol=$(find "${PK}" -mindepth 2 -name '*.md' -exec grep -n '待核实\|✓' /dev/null {} + 2>/dev/null | awk -F':' '{line=$0; sub(/^[^:]*:[^:]*:/,"",line); if (line !~ /^[ \t]*>/) print}' || true)
skipped=$(find "${PK}" -mindepth 2 -name '*.md' -exec grep -n '待核实\|✓' /dev/null {} + 2>/dev/null | awk -F':' '{line=$0; sub(/^[^:]*:[^:]*:/,"",line); if (line ~ /^[ \t]*>/) c++} END{print c+0}')
if [ -n "${viol}" ]; then
  printf '%s\n' "${viol}"
  echo "🔴 FAIL：断言行里出现了真相源的证据词汇。改成 ⬜，或去掉。"
  fail=1
else
  echo "✅ PASS：0 条断言行含 ✓ / 待核实（说明层豁免 ${skipped} 行）"
fi
echo

echo "=== [2] ← channels/<key>.md § <节名> 指针可解析 ==="
# 逐条抽出 (file, 节名)
find "${PK}" -mindepth 2 -name '*.md' -exec grep -no '← `channels/[a-z-]*\.md § [^`]*`' /dev/null {} + 2>/dev/null \
| awk -F'← `channels/' '{print $1"\t"$2}' \
| awk -F'\t' '{loc=$1; rest=$2; sub(/`$/,"",rest); n=index(rest," § "); ch=substr(rest,1,n-1); sec=substr(rest,n+4); print loc"\t"ch"\t"sec}' \
> /tmp/_ptr2.$$
total=$(grep -c . /tmp/_ptr2.$$ || echo 0)
echo "共 ${total} 条指针"
while IFS="$(printf '\t')" read -r loc ch sec; do
  cf="${WS}/channels/${ch}"
  if [ ! -f "${cf}" ]; then echo "🔴 ${loc} → 文件不存在：channels/${ch}"; fail=1; continue; fi
  # 严格前缀匹配（ADR 0008 / CONTRACT.md §1.2 的判据；剥离步骤 + ### 层跳过同 [5]/section-prefix-match，#68）
  strict=$(awk -v s="${sec}" '/^## / || /^#### /{t=$0; sub(/^#+[ ]*/,"",t); gsub(/^[^一-龥A-Za-z0-9]+/,"",t); if (index(t,s)==1) c++} END{print c+0}' "${cf}")
  # 宽松子串匹配（诊断用，不是契约）
  loose=$(awk -v s="${sec}" '/^## / || /^#### /{t=$0; sub(/^#+[ ]*/,"",t); gsub(/^[^一-龥A-Za-z0-9]+/,"",t); if (index(t,s)>0) c++} END{print c+0}' "${cf}")
  if [ "${strict}" -gt 0 ]; then
    echo "✅ ${loc} → channels/${ch} § ${sec}"
  elif [ "${loose}" -gt 0 ]; then
    echo "⚠️  ${loc} → channels/${ch} § ${sec} —— 节存在但**过不了前缀匹配**（#28）"
    if [ "${fail}" -eq 0 ]; then fail=2; fi
  else
    echo "🔴 ${loc} → channels/${ch} 里根本没有 § ${sec}"
    fail=1
  fi
done < /tmp/_ptr2.$$
rm -f /tmp/_ptr2.$$
echo

echo "=== [3] 渲染物的 rendered_from 真相源存在 ==="
# 🔴 不走管道 —— `... | while` 把循环丢进子 shell，里面的 fail=1 出不来。
# 本脚本此前 [3] 与 [4] 都栽在这上面：14 行 🔴 打印出来了，结论却报 ⚠️。
find "${PK}" -mindepth 2 -name '*.md' -exec grep -n '^rendered_from:' /dev/null {} + 2>/dev/null \
| awk -F':' '{loc=$1":"$2; p=$4; gsub(/^ +| +$/,"",p); print loc"\t"p}' > /tmp/_rf.$$ || true
while IFS="$(printf '\t')" read -r loc p; do
  if [ -f "${WS}/${p}" ]; then echo "✅ ${loc} → ${p}"
  else echo "🔴 ${loc} → 真相源不存在：${p}"; fail=1; fi
done < /tmp/_rf.$$
rm -f /tmp/_rf.$$
echo

echo "=== [4] source_fingerprint 是否与当前真相源一致（陈旧包检测） ==="
# #8 决议①：整包重生成，绝不就地改。fingerprint 记的是**生成那一刻**源是什么样
# （历史观察值，同 log.md 的豁免），不是「源现在是什么样」，所以它不是镜像。
# 取 cksum 而不是 mtime —— 实测 git checkout 会把全部文件的 mtime 刷成同一个值，
# mtime 在新克隆的仓库里恒定失配，等于「每次都重生成」，检测不出任何东西。
# 🔴 ADR 0017：本项跑在**落后于契约的分支**上时输出无信息（参照物与被检对象同处一个可分叉副本）。
for pk in $(find "${PK}" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; 2>/dev/null); do
  rd="${WS}/packets/${pk}/README.md"
  [ -f "${rd}" ] || continue
  echo "--- ${pk}"
  awk 'NR==1&&/^---$/{fm=1;next} fm&&/^---$/{exit} !fm{exit} /^source_fingerprint:/{f=1;next} f&&/^[^ ]/{f=0} f&&/^  /{sub(/^  /,"");print}' "${rd}" > /tmp/_fp.$$
  while IFS= read -r line; do
    src=$(printf '%s' "${line}" | awk -F': ' '{print $1}')
    want=$(printf '%s' "${line}" | awk -F': ' '{print $2}')
    if [ ! -f "${WS}/${src}" ]; then echo "🔴 ${src} 已不存在"; fail=1; continue; fi
    got=$(cksum "${WS}/${src}" | awk '{print $1"-"$2}')
    if [ "${want}" = "${got}" ]; then echo "✅ ${src}"
    else echo "🔴 ${src} 已变（包内 ${want} → 现在 ${got}）→ 整包重生成"; fail=1; fi
  done < /tmp/_fp.$$
  rm -f /tmp/_fp.$$
done
echo

echo "=== [5] season-stamp-matches-owners（ADR 0008 限定 4 / docs/checks.md 短名） ==="
# 断言：承载证据标记（✓ / 待核实）的每个路径，其 frontmatter 的 `season_downgraded` 表，
# 键必须**恰好等于「在该文件里实际有内容的 owner」集合**；文件级 `season` 字段出现即违规。
#
# 🔴 参照物为什么不是恒真的（ADR 0017 / #57）：本项比的是**同一个文件的 frontmatter 表 vs 它自己的正文**，
# 归属表只是把「节名 → owner」这一步翻译过来。因此归属表**必须活读跑它这棵树自己的 CONTRACT.md §1.2**
# （下面 ${CONTRACT}），不得内嵌副本、不得跨分支取参照物——内嵌就退化成「脚本和自己比」，
# 跨分支取则是 ADR 0017 已经否掉的那个方向。改 §1.2 的归属，本项当场跟着变，这就是它有信息的证据。
#
# ⚠️ 本项只判「键集合」。某个 owner 的戳**落后于本季**不是违规，那正是惰性降级的正常中间态，
# 只打印成 ⏳ 供准备包渲染「本季待复核」表用。
CUR_SEASON=$(awk 'NR==1&&/^---$/{fm=1;next} fm&&/^---$/{exit} fm&&/^season:[ ]/{sub(/^season:[ ]*/,"");print;exit}' "${WS}/apply.md")
echo "apply.md 的当前申请季 = ${CUR_SEASON}"
if [ ! -f "${CONTRACT}" ]; then
  echo "🔴 读不到归属表：${CONTRACT} 不存在 —— 本项无法执行（不许改成内嵌一份，见上面注释）"
  fail=1
else
for tgt in "${WS}"/channels/*.md "${WS}/programs.md"; do
  [ -f "${tgt}" ] || continue
  rel=$(printf '%s' "${tgt}" | sed "s|^${WS}/||")
  echo "--- ${rel}"
  awk -v cur="${CUR_SEASON}" -v overlay="项目级差异" -v rel="${rel}" '
    function eq(a,b) { return (length(a)==length(b) && index(a,b)==1) }   # 硬规则 4：禁 == 比中文
    # ---- pass 1：活读 CONTRACT.md §1.2 的十节归属表
    NR==FNR {
      if (intab) {
        if ($0 !~ /^\|/)                { intab=0; next }
        if ($0 ~ /^\|[-| ]+\|$/)        { next }
        split($0, c, "|")
        sec=c[3]; own=c[5]
        gsub(/[`*]/,"",sec); gsub(/^[ \t]+/,"",sec); gsub(/[ \t]+$/,"",sec)
        gsub(/[`*]/,"",own); sub(/（.*/,"",own); gsub(/^[ \t]+/,"",own); gsub(/[ \t]+$/,"",own)
        if (length(sec)>0 && length(own)>0) { OWNER[sec]=own; SECLIST[++nsec]=sec }
        next
      }
      if (inftab) {
        if ($0 !~ /^\|/)          { inftab=0; next }
        if ($0 ~ /^\|[-| ]+\|$/) { next }
        split($0, d, "|")
        fp=d[3]; fo=d[6]
        gsub(/[`*]/,"",fp); gsub(/^[ \t]+/,"",fp); gsub(/[ \t]+$/,"",fp)
        gsub(/[`*]/,"",fo); sub(/（.*/,"",fo); sub(/——.*/,"",fo)
        gsub(/^[ \t]+/,"",fo); gsub(/[ \t]+$/,"",fo)
        if (length(fp)>0 && length(fo)>0) FILEOWNER[fp]=fo
        next
      }
      if ($0 ~ /法定节/ && $0 ~ /owner 阶段/) intab=1
      else if ($0 ~ /路径/ && $0 ~ /owner 阶段/) inftab=1
      next
    }
    # ---- pass 2：被检文件
    FNR==1 { if ($0 ~ /^---$/) { infm=1; next } }
    infm {
      if ($0 ~ /^---$/) { infm=0; next }
      if ($0 ~ /^season:/)                  { fileseason=1; next }
      if ($0 ~ /^season_downgraded:[ \t]*$/){ hastab=1; instamp=1; next }
      if (instamp) {
        if ($0 ~ /^[ \t]+[^ \t]/) {
          l=$0; gsub(/^[ \t]+/,"",l); ci=index(l,":")
          if (ci>0) { k=substr(l,1,ci-1); v=substr(l,ci+1)
                      gsub(/^[ \t]+/,"",v); gsub(/[ \t]+$/,"",v)
                      STAMP[k]=v; nst++ }
          next
        }
        instamp=0
      }
      next
    }
    # 只看 ## 与 ####。### 那一层是 program_key，从来不是法定节名（docs/checks.md 坑 2/3）。
    /^## / || /^#### / {
      t=$0; sub(/^#+[ ]*/,"",t); gsub(/^[^一-龥A-Za-z0-9]+/,"",t)
      if (eq(substr(t,1,length(overlay)), overlay)) next   # 覆盖层：在词表内但不带 owner
      hit=0
      for (i=1;i<=nsec;i++) {
        s=SECLIST[i]
        if (index(t,s)==1) { PRESENT[OWNER[s]]=1; hit=1; nhit++; break }
      }
      if (!hit) UNMATCHED[t]=1
    }
    END {
      v=0
      if (nsec==0) { print "🔴 §1.2 归属表没解析出任何一行 —— 表头变了？"; v++ }
      # 不按节切的路径（programs.md：结构单元是列，§1.5 注 ① 判它单 owner）——
      # owner 活读 §1.1 的十四文件表那一行，同样不内嵌副本。
      if (nhit==0) {
        if (rel in FILEOWNER) { PRESENT[FILEOWNER[rel]]=1
          print "· 本路径不按节切，owner 取 §1.1 那一行：" FILEOWNER[rel] }
        else { print "🔴 §1.1 里查不到路径 " rel " 的 owner"; v++ }
      }
      if (!hastab) { print "🔴 frontmatter 里没有 season_downgraded 表"; v++ }
      if (fileseason) { print "🔴 文件级 season 字段仍在 —— 辖区路径上出现即违规（ADR 0008 限定 4）"; v++ }
      for (k in STAMP) if (!(k in PRESENT)) { print "🔴 有戳而无内容：" k " —— 预建空行"; v++ }
      for (o in PRESENT) if (!(o in STAMP)) { print "🔴 有内容而无戳：" o " —— 漏戳（建节即戳）"; v++ }
      lag=""
      for (k in STAMP) if (!eq(STAMP[k], cur)) lag = lag " " k "(" STAMP[k] ")"
      if (v==0) {
        n=0; ks=""
        for (k in STAMP) { n++; ks = ks " " k }
        print "✅ 键集合恰好等于有内容的 owner 集合（" n " 行）：" ks
      }
      if (length(lag)>0) print "⏳ 落后于 " cur " 的 owner（不是违规，是待降级）：" lag
      for (u in UNMATCHED) print "⚠️  节名过不了封闭词表前缀匹配，无 owner 可推：[" u "] —— 归 section-prefix-match，不归本项"
      print "VIOL=" v
    }
  ' "${CONTRACT}" "${tgt}" > /tmp/_s5.$$
  grep -v '^VIOL=' /tmp/_s5.$$
  v5=$(awk -F= '/^VIOL=/{print $2}' /tmp/_s5.$$)
  rm -f /tmp/_s5.$$
  if [ "${v5}" -gt 0 ]; then fail=1; fi
done
fi
echo
echo "=== 结论 ==="
case "${fail}" in
  0) echo "✅ 五项全过" ;;
  2) echo "⚠️  指针全部指向真实存在的节，但部分节过不了 CONTRACT.md §1.2 的前缀匹配 —— 这是 #28 的洞，不是本包的洞" ;;
  *) echo "🔴 有 FAIL，见上" ;;
esac
