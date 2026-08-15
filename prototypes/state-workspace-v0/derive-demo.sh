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
  case "$f" in */README.md) continue ;; esac   # README 不是渲染物
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
echo "=== 素材门槛（硬约束 3–5 条）==="
n=$(ls materials/*.md 2>/dev/null | grep -vc README)
echo "  当前 $n 条 / 门槛 3 条"
[ "$n" -lt 3 ] && echo "  ⚠️ 未达标"
