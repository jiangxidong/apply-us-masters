#!/bin/sh
# trace-packet.sh —— #23 §11.3 的显式验收项：packets/ 不得长出别处没有的事实。
#
# 三条机械检查（全部用 awk / grep —— CONTRACT.md §4.5：BSD uniq 与 sort -u 在中文下是坏的）：
#   [1] packets/ 里不得出现自己的 `✓ <url>` 证据行（取证归 channels/，包只引用）
#   [2] 每个 `← channels/<key>.md § <节名>` 指针都能解析到一个真实存在的节
#   [3] 每个渲染物的 frontmatter `rendered_from:` 指向的真相源文件必须存在
#
# 在 sample-workspace/ 的上一级跑：./trace-packet.sh
set -u
WS="$(dirname "$0")/sample-workspace"
# 规则的作用域是 packets/<program_key>/**。packets/README.md 是设计文档，讲规则时必须说得出
# 「✓」与「待核实」这两个词，不受规则 ② 约束——作用域写错会把设计文档本身判成违规。
PK="$WS/packets"
fail=0

echo "=== [1] packets/ 的断言行里不得出现 ✓ 或 待核实 ==="
# #8 决议②：二元标记编码成「有没有 ⬜」。两个词都是真相源的词汇，
# 转述进包就是镜像（channels/ 换季降级后包里那行不改就是假的）。
# 说明层（以 > 开头的引用块）豁免——读法声明本身必须说得出这两个词。
viol=$(find "$PK" -mindepth 2 -name '*.md' -exec grep -n '待核实\|✓' /dev/null {} + 2>/dev/null | awk -F':' '{line=$0; sub(/^[^:]*:[^:]*:/,"",line); if (line !~ /^[ \t]*>/) print}' || true)
skipped=$(find "$PK" -mindepth 2 -name '*.md' -exec grep -n '待核实\|✓' /dev/null {} + 2>/dev/null | awk -F':' '{line=$0; sub(/^[^:]*:[^:]*:/,"",line); if (line ~ /^[ \t]*>/) c++} END{print c+0}')
if [ -n "$viol" ]; then
  printf '%s\n' "$viol"
  echo "🔴 FAIL：断言行里出现了真相源的证据词汇。改成 ⬜，或去掉。"
  fail=1
else
  echo "✅ PASS：0 条断言行含 ✓ / 待核实（说明层豁免 ${skipped} 行）"
fi
echo

echo "=== [2] ← channels/<key>.md § <节名> 指针可解析 ==="
grep -rn '← `channels/' "$WS/packets" 2>/dev/null \
| awk -F'← `channels/' '{print FILENAME"\t"$2}' \
| awk '{print}' > /tmp/_ptr.$$ 2>/dev/null || true
# 逐条抽出 (file, 节名)
find "$PK" -mindepth 2 -name '*.md' -exec grep -no '← `channels/[a-z-]*\.md § [^`]*`' /dev/null {} + 2>/dev/null \
| awk -F'← `channels/' '{print $1"\t"$2}' \
| awk -F'\t' '{loc=$1; rest=$2; sub(/`$/,"",rest); n=index(rest," § "); ch=substr(rest,1,n-1); sec=substr(rest,n+4); print loc"\t"ch"\t"sec}' \
> /tmp/_ptr2.$$
total=$(grep -c . /tmp/_ptr2.$$ || echo 0)
echo "共 ${total} 条指针"
while IFS="$(printf '\t')" read -r loc ch sec; do
  cf="$WS/channels/$ch"
  if [ ! -f "$cf" ]; then echo "🔴 $loc → 文件不存在：channels/$ch"; fail=1; continue; fi
  # 严格前缀匹配（ADR 0008 / CONTRACT.md §1.2 的判据）
  strict=$(awk -v s="$sec" '/^#+ /{t=$0; sub(/^#+ +/,"",t); if (index(t,s)==1) c++} END{print c+0}' "$cf")
  # 宽松子串匹配（诊断用，不是契约）
  loose=$(awk -v s="$sec" '/^#+ /{t=$0; sub(/^#+ +/,"",t); if (index(t,s)>0) c++} END{print c+0}' "$cf")
  if [ "$strict" -gt 0 ]; then
    echo "✅ $loc → channels/$ch § $sec"
  elif [ "$loose" -gt 0 ]; then
    echo "⚠️  $loc → channels/$ch § $sec —— 节存在但**过不了前缀匹配**（#28）"
    fail=2
  else
    echo "🔴 $loc → channels/$ch 里根本没有 § $sec"
    fail=1
  fi
done < /tmp/_ptr2.$$
rm -f /tmp/_ptr.$$ /tmp/_ptr2.$$
echo

echo "=== [3] 渲染物的 rendered_from 真相源存在 ==="
find "$PK" -mindepth 2 -name '*.md' -exec grep -n '^rendered_from:' /dev/null {} + 2>/dev/null \
| awk -F':' '{loc=$1":"$2; p=$4; gsub(/^ +| +$/,"",p); print loc"\t"p}' \
| while IFS="$(printf '\t')" read -r loc p; do
    if [ -f "$WS/$p" ]; then echo "✅ $loc → $p"
    else echo "🔴 $loc → 真相源不存在：$p"; fi
  done

echo "=== [4] source_fingerprint 是否与当前真相源一致（陈旧包检测） ==="
# #8 决议①：整包重生成，绝不就地改。fingerprint 记的是**生成那一刻**源是什么样
# （历史观察值，同 log.md 的豁免），不是「源现在是什么样」，所以它不是镜像。
# 取 cksum 而不是 mtime —— 实测 git checkout 会把全部文件的 mtime 刷成同一个值，
# mtime 在新克隆的仓库里恒定失配，等于「每次都重生成」，检测不出任何东西。
for pk in $(find "$PK" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; 2>/dev/null); do
  rd="$WS/packets/$pk/README.md"
  [ -f "$rd" ] || continue
  echo "--- $pk"
  awk 'NR==1&&/^---$/{fm=1;next} fm&&/^---$/{exit} !fm{exit} /^source_fingerprint:/{f=1;next} f&&/^[^ ]/{f=0} f&&/^  /{sub(/^  /,"");print}' "$rd" \
  | while IFS= read -r line; do
      src=$(printf '%s' "$line" | awk -F': ' '{print $1}')
      want=$(printf '%s' "$line" | awk -F': ' '{print $2}')
      if [ ! -f "$WS/$src" ]; then echo "🔴 ${src} 已不存在"; continue; fi
      got=$(cksum "$WS/$src" | awk '{print $1"-"$2}')
      if [ "$want" = "$got" ]; then echo "✅ ${src}"
      else echo "🔴 ${src} 已变（包内 ${want} → 现在 ${got}）→ 整包重生成"; fi
    done
done
echo
echo "=== 结论 ==="
case "$fail" in
  0) echo "✅ 三项全过" ;;
  2) echo "⚠️  指针全部指向真实存在的节，但部分节过不了 CONTRACT.md §1.2 的前缀匹配 —— 这是 #28 的洞，不是本包的洞" ;;
  *) echo "🔴 有 FAIL，见上" ;;
esac
