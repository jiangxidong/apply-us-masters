#!/bin/sh
# 派生视图演示 —— 证明「待核实清单 / 完成度 / 闸口状态」可以机械算出，不必落盘。
#
# ⚠️ 两个 BSD 工具在中文下是坏的，全程绕开：
#    uniq   —— 把不同的中文行合并计数（`printf '冲刺\n匹配\n' | uniq -c` → `2 冲刺`）
#    sort -u —— 更严重，直接丢行（三个不同的中文值只剩一个）
#    LC_ALL 都修不好。去重用 `awk '!s[$0]++'`，计数用 awk 关联数组。
#
# Markdown 表用 awk -F'|' 解析：前导 `|` 会产生一个空的 $1，所以第 N 列是 $(N+1)。
cd "$(dirname "$0")/sample-workspace" || exit 1
W=programs.md

# 只取表体行（以 | 开头、不是表头、不是分隔行），并去掉每格首尾空白
body() {
  awk -F'|' '/^\|/ && !/^\|[ -]*-/ && $2 !~ /program_key/ {
    for (i=2; i<NF; i++) gsub(/^[ \t]+|[ \t]+$/, "", $i); print
  }' OFS='|' $W
}

echo "=== 列数完整性 ==="
awk -F'|' '/^\|/ && !/^\|[ -]*-/ {if(!n) n=NF; else if(NF!=n){bad=1; print "  ✗ 第 "NR" 行 "NF-2" 列，应为 "n-2}; r++}
  END{if(!bad) print "  ✓ 全部 "r" 行（含表头）均为 "n-2" 列"}' $W

echo
echo "=== 待核实清单（自动汇出，不落盘）==="
body | awk -F'|' '$10 ~ /待核实/ {c++; print "  · "$3" — "$5} END{print "  合计 "c+0" 行"}'

echo
echo "=== 上季核过、本季尚未复核（换季降级留下的痕迹）==="
body | awk -F'|' '$10 ~ /核过/ {print "  · "$5"\n    "$10}'

echo
echo "=== 分档 / 状态统计（枚举列是 ASCII，中文标签在展示层）==="
body | awk -F'|' '{t[$7]++; s[$9]++} END{
  print "  分档:"; for(k in t) print "    "k": "t[k];
  print "  状态:"; for(k in s) print "    "k": "s[k]}'

echo
echo "=== 每个项目是否有对应的约束层文件 ==="
body | awk -F'|' '{print $6}' | awk '!s[$0]++' | while read -r k; do
  [ -f "channels/$k.md" ] && echo "  ✓ channels/$k.md" || echo "  ✗ 缺 channels/$k.md"
done

echo
echo "=== 🔴 推荐信闸口（未过闸不得进入任何涉及推荐人邮箱的步骤）==="
# 闸口行的 id 已按 CONTRACT §1.1 的 recommender_id（`r1`…）归一为小写（#43）。
# ⚠️ 这两个 pattern 原来写死大写 `R`，归一后会双双数到 0，而 `0 -lt 0` 为假 —— 闸口会静默消失。
total=$(grep -c '^- \[.\] r[0-9]' recommenders.md)
done_n=$(grep -c '^- \[x\] r[0-9]' recommenders.md)
echo "  已确认 $done_n / $total"
[ "$done_n" -lt "$total" ] && echo "  🔴 未过闸 — 推荐信流程阻塞"

echo
echo "=== 「主张 → 支撑素材」对照表（派生视图，不落盘）==="
# claims.md 的四列：$2=claim_id $3=断言 $4=materials $5=voice（前导 | 产生空的 $1）
# 只认 claim_id 形如 cNN 的行 —— 文件里另有两张说明用的表，靠这条判据滤掉。
awk -F'|' '/^\|/ {
    for (i=2; i<NF; i++) gsub(/^[ \t]+|[ \t]+$/, "", $i)
    if ($2 !~ /^c[0-9]+$/) next
    n++
    if ($4 == "") { gap++; printf "  🔴 %s [voice=%s] %s — 零素材缺口\n", $2, $5, $3 }
    else            printf "  ✓  %s [voice=%s] %s — 素材 %s\n", $2, $5, $3, $4
  } END {
    printf "  合计 %d 条主张，其中 %d 条无素材支撑\n", n+0, gap+0
    if (gap) print "  ⚠️ 零素材主张合法（全局集允许），但不得进入任何成稿"
  }' claims.md

echo
echo "=== 🔴 硬约束：成稿引用的主张必须有素材支撑 ==="
# 空 materials 的 claim_id 集合，比对每篇 canonical frontmatter 的 claims:
awk -F'|' '/^\|/ {
    for (i=2; i<NF; i++) gsub(/^[ \t]+|[ \t]+$/, "", $i)
    if ($2 ~ /^c[0-9]+$/ && $4 == "") print $2
  }' claims.md > /tmp/.edu-empty-claims.$$
for f in essays/canonical/*.md; do
  case "$f" in */README.md) continue ;; esac   # README 不是三个形态之一
  used=$(awk -F'[][]' '/^claims:/ {gsub(/,/, " ", $2); print $2}' "$f")
  [ -z "$used" ] && { echo "  ⚠️ $f 没有 claims: —— 文书是从主张清单里选，不是发明主张"; continue; }
  bad=""
  for c in $used; do
    grep -qx "$c" /tmp/.edu-empty-claims.$$ && bad="$bad $c"
  done
  if [ -n "$bad" ]; then
    echo "  ✗ $f 引用了零素材主张:$bad"
  else
    echo "  ✓ $f — $(echo $used | tr ' ' ',')"
  fi
done
rm -f /tmp/.edu-empty-claims.$$

echo
echo "=== 素材篇数（🔴 参考信息，不是闸门）==="
# 🔴 本节此前写作「素材门槛（硬约束 3–5 条）」并对 n<3 报「未达标」——那是抄错的闸门。
#    #10 §2 判的是：硬约束是「不许有无素材支撑的主张」，单位是**主张**不是篇；
#    3–5 是经验参考值，只写 3 条主张的短文书不需要凑 5 个素材。
#    真正的闸门是上一节（成稿引用的主张必须有素材支撑），#27 已经加在这里了。
n=$(ls materials/m*.md 2>/dev/null | wc -l | tr -d ' ')
echo "  当前 $n 条（经验参考值 3–5；**不据此判定达标与否**）"

# ---------------------------------------------------------------------------
# 以下三节读的是同一个字段 verifiable_by（#38 定的三键之一），
# 因此一次加齐：分次加必然让三个视图各写一份「谁能证实」的解析，正是 #30 通则要防的分叉。
# ---------------------------------------------------------------------------

MAT=/tmp/.edu-materials.$$   # material_id|sensitive|verifiable_by|有无该键|文件名
CLM=/tmp/.edu-claims.$$      # claim_id|materials|voice|断言
ASG=/tmp/.edu-assign.$$      # recommender_id|claim_id
REC=/tmp/.edu-recs.$$        # recommender_id
trap 'rm -f "$MAT" "$CLM" "$ASG" "$REC"' EXIT INT TERM

: > "$MAT"
for f in materials/m*.md; do
  [ -f "$f" ] || continue
  awk -v file="$f" '
    /^---[ \t]*$/ { fm++; if (fm==2) exit; next }
    fm==1 {
      if ($0 ~ /^material_id:/)   { mid=$0; sub(/^material_id:[ \t]*/,   "", mid) }
      if ($0 ~ /^sensitive:/)     { sen=$0; sub(/^sensitive:[ \t]*/,     "", sen) }
      if ($0 ~ /^verifiable_by:/) { v=$0;   sub(/^verifiable_by:[ \t]*/, "", v)
                                    gsub(/[][,]/, " ", v); gsub(/  +/, " ", v)
                                    sub(/^ +/, "", v); sub(/ +$/, "", v); vb=v; has=1 }
    }
    END { printf "%s|%s|%s|%s|%s\n", mid, sen, vb, has+0, file }' "$f" >> "$MAT"
done

# claims.md 的四列，只认 claim_id 形如 cNN 的行（文件里另有两张说明用的表）
awk -F'|' '/^\|/ {
    for (i=2; i<NF; i++) gsub(/^[ \t]+|[ \t]+$/, "", $i)
    if ($2 ~ /^c[0-9]+$/) printf "%s|%s|%s|%s\n", $2, $4, $5, $3
  }' claims.md > "$CLM"

# recommenders.md 的候选人表（5 列 ⇒ NF==7）与「主张 → 推荐人分配」表（2 列 ⇒ NF==4）。
# 🔴 #49 删掉「能证实什么」列后候选人表从 6 列降到 5 列，NF 从 8 降到 7 —— `NF>=7` 恰好卡在边界，
#    余量为零。实测再删一列（4 列 ⇒ NF==6）：REC 变空，两条素材全部报「verifiable_by 悬空外键」
#    —— **响亮失败，不是静默失败**（不同于 #43 那颗大写 `R` 闸口地雷）。
#    根治要契约持有列 schema（§1.1 现在不持有）→ 已投递 #46 / #47 的契约追平线，本处不就地改。
awk -F'|' '/^\|/ {
    for (i=2; i<NF; i++) gsub(/^[ \t]+|[ \t]+$/, "", $i)
    if ($2 ~ /^r[0-9]+$/ && NF>=7) print $2
  }' recommenders.md > "$REC"
awk -F'|' '/^\|/ {
    for (i=2; i<NF; i++) gsub(/^[ \t]+|[ \t]+$/, "", $i)
    if (NF==4 && $2 ~ /^r[0-9]+$/ && $3 ~ /^c[0-9]+$/) printf "%s|%s\n", $2, $3
  }' recommenders.md > "$ASG"

echo
echo "=== 缺口三分类（缺素材 / 缺人 / 缺放行；CONTEXT.md「缺口」词条六类表的申请人侧前三类）==="
awk -F'|' -v MAT="$MAT" -v REC="$REC" '
  BEGIN {
    while ((getline m < MAT) > 0) { n=split(m, a, "|"); sen[a[1]]=a[2]; vb[a[1]]=a[3] }
    while ((getline r < REC) > 0) if (r != "") cand[++nc]=r
  }
  {
    cid=$1; mats=$2; voice=$3; text=$4
    if (mats == "") { printf "  🔴 缺素材   %s [voice=%s] %s\n", cid, voice, text; g1++; next }
    # 这条主张的全部候选证实人 = 其素材 verifiable_by 的并集
    who=""; release=0; clean=0
    k=split(mats, ms, " ")
    for (i=1; i<=k; i++) {
      v=vb[ms[i]]
      if (v == "") continue
      j=split(v, rs, " ")
      for (x=1; x<=j; x++) {
        if (!index(" " who " ", " " rs[x] " ")) who=who " " rs[x]
        if (sen[ms[i]] ~ /^no$/) clean=1; else release=1
      }
    }
    sub(/^ /, "", who)
    if (who == "")      { printf "  🟠 缺人     %s [voice=%s] %s — 有素材（%s），但没有任何候选人能证实\n", cid, voice, text, mats; g2++ }
    else if (!clean && release) { printf "  🟡 缺放行   %s [voice=%s] %s — 能证实的素材全是 sensitive=yes，需用户逐条放行\n", cid, voice, text; g3++ }
    else                { printf "  ✓  可支撑   %s [voice=%s] %s — 可证实人: %s\n", cid, voice, text, who; ok++ }
  }
  END {
    printf "  合计 %d 条主张：可支撑 %d ｜ 缺素材 %d ｜ 缺人 %d ｜ 缺放行 %d\n", ok+g1+g2+g3, ok+0, g1+0, g2+0, g3+0
    print  "  解法方向三者不同：缺素材 → 补素材；缺人 → 再找一位推荐人；缺放行 → 用户逐条放行（#17 成对确认）"
  }' "$CLM"

echo
echo "=== 覆盖缺口视图（#12 §10：哪些主张没有任何候选推荐人能证实）==="
# 它替代了被 #12 §10 否掉的「推荐人排序建议」——这是事实不是判断，且自然回答「该再找谁」。
awk -F'|' -v MAT="$MAT" '
  BEGIN { while ((getline m < MAT) > 0) { n=split(m, a, "|"); vb[a[1]]=a[3] } }
  {
    cid=$1; mats=$2; text=$4; who=""
    k=split(mats, ms, " ")
    for (i=1; i<=k; i++) if (vb[ms[i]] != "") who=who " " vb[ms[i]]
    if (who == "") { printf "  🔴 %s %s\n", cid, text; gap++ }
  }
  END { if (!gap) print "  ✓ 每条主张都至少有一位候选人能证实"
        else printf "  合计 %d 条主张无人可证 —— 这就是「该再找谁」的输入\n", gap }' "$CLM"

echo
echo "=== 🔴 pack 门槛（两条合取：(a) 他本人能证实 且 (b) 可进 pack）==="
# #12 §7 + #17 结案后修正。⚠️「已放行」不是落盘字段（#17 走会话内成对确认），
#    故 sensitive=yes 一律判成「缺放行」——保守方向，不会把未放行的敏感素材放进 pack。
if [ ! -s "$ASG" ]; then
  echo "  （「主张 → 推荐人分配」表当前为空，无行可判）"
else
  awk -F'|' -v MAT="$MAT" -v CLM="$CLM" '
    BEGIN {
      while ((getline m < MAT) > 0) { n=split(m, a, "|"); sen[a[1]]=a[2]; vb[a[1]]=a[3] }
      while ((getline c < CLM) > 0) { n=split(c, b, "|"); mats[b[1]]=b[2]; text[b[1]]=b[4] }
    }
    {
      rid=$1; cid=$2; pass=0; blocked=""
      k=split(mats[cid], ms, " ")
      for (i=1; i<=k; i++) {
        if (!index(" " vb[ms[i]] " ", " " rid " ")) continue      # (a) 不满足
        if (sen[ms[i]] ~ /^no$/) { pass=1; hit=ms[i]; break }     # (a)+(b) 同时满足
        blocked=blocked " " ms[i]                                  # (a) 满足、(b) 待放行
      }
      if (pass)            printf "  ✓ %s × %s — 素材 %s 同时满足 (a)(b)\n", rid, cid, hit
      else if (blocked!="") printf "  🟡 %s × %s — 素材%s 他能证实，但 sensitive=yes ⇒ 缺放行\n", rid, cid, blocked
      else if (mats[cid]=="") printf "  🔴 %s × %s — 零素材，两条合取都无从谈起 ⇒ 分配不出去\n", rid, cid
      else                 printf "  🔴 %s × %s — 有素材（%s），但没有一条他能证实 ⇒ 缺人\n", rid, cid, mats[cid]
    }' "$ASG"
fi
