#!/bin/sh
# 派生视图演示 —— 证明「待核实清单 / 完成度 / 闸口状态」可以机械算出，
# 不必落盘、不必让 LLM 每个会话重读一遍。这是 fork 1（TSV vs Markdown 表）的论据。
#
# ⚠️ 全程不用 `sort | uniq -c`：macOS 的 BSD uniq 会把不同的中文行合并计数
#    （`printf '冲刺\n匹配\n' | uniq -c` → `2 冲刺`）。计数一律走 awk 关联数组。
cd "$(dirname "$0")/sample-workspace" || exit 1
W=programs.tsv

echo "=== 列数完整性（TSV 的唯一脆弱点：改错会静默错位）==="
awk -F'\t' 'NR==1{n=NF} NF!=n{bad=1; print "  ✗ 第 "NR" 行 "NF" 列，应为 "n} END{if(!bad) print "  ✓ 全部 "NR" 行均为 "n" 列"}' $W

echo
echo "=== 待核实清单（自动汇出，不落盘）==="
awk -F'\t' 'NR>1 && $11 ~ /待核实/ {c++; print "  · "$2" — "$4} END{print "  合计 "c+0" 行"}' $W

echo
echo "=== 上季核过、本季尚未复核（换季降级留下的痕迹）==="
awk -F'\t' 'NR>1 && $11 ~ /核过/ {print "  · "$4"\n    "$11}' $W

echo
echo "=== 分档 / 状态统计（枚举列是 ASCII，中文标签在展示层）==="
awk -F'\t' 'NR>1{t[$6]++; s[$10]++} END{
  print "  分档:"; for(k in t) print "    "k": "t[k];
  print "  状态:"; for(k in s) print "    "k": "s[k]}' $W

echo
echo "=== 每个项目是否有对应的约束层文件 ==="
awk -F'\t' 'NR>1 {print $5}' $W | sort -u | while read -r k; do
  [ -f "channels/$k.md" ] && echo "  ✓ channels/$k.md" || echo "  ✗ 缺 channels/$k.md"
done

echo
echo "=== 🔴 推荐信闸口（未过闸不得进入任何涉及推荐人邮箱的步骤）==="
total=$(grep -c '^- \[.\] R' recommenders.md)
done_n=$(grep -c '^- \[x\] R' recommenders.md)
echo "  已确认 $done_n / $total"
[ "$done_n" -lt "$total" ] && echo "  🔴 未过闸 — 推荐信流程阻塞"

echo
echo "=== 素材门槛（硬约束 3–5 条）==="
n=$(ls essays/materials/*.md 2>/dev/null | grep -vc README)
echo "  当前 $n 条 / 门槛 3 条"
[ "$n" -lt 3 ] && echo "  ⚠️ 未达标"
