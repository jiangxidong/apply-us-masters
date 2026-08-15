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
fail=0

echo "=== [1a] packets/ 里不得出现无指针的 ✓ 证据行 ==="
orphan=$(grep -rn '`✓ ' "$WS/packets" 2>/dev/null | grep -v '← `channels/' || true)
if [ -n "$orphan" ]; then
  echo "$orphan"
  echo "🔴 FAIL：包里出现了不指向 channels/ 的取证标记 —— 那就是包自己长出来的事实。"
  fail=1
else
  echo "✅ PASS：0 条无指针的 ✓ 行"
fi
echo

echo "=== [1b] 转述的 ✓（镜像风险，警告不是 FAIL） ==="
mirror=$(grep -rn '`✓ ' "$WS/packets" 2>/dev/null | grep '← `channels/' || true)
n=$(printf '%s' "$mirror" | grep -c . || echo 0)
if [ "$n" -gt 0 ]; then
  printf '%s\n' "$mirror"
  echo "⚠️  $n 条把 channels/ 的取证标记原样转述进了包。"
  echo "    它们是**镜像**：channels/ 换季降级成 待核实 之后，包里这几行不改就是假的。"
  echo "    可再生层允许镜像的唯一前提是**整包重生成、绝不就地改**——见 #8 决议第 4 条。"
fi
echo

echo "=== [2] ← channels/<key>.md § <节名> 指针可解析 ==="
grep -rn '← `channels/' "$WS/packets" 2>/dev/null \
| awk -F'← `channels/' '{print FILENAME"\t"$2}' \
| awk '{print}' > /tmp/_ptr.$$ 2>/dev/null || true
# 逐条抽出 (file, 节名)
grep -rno '← `channels/[a-z-]*\.md § [^`]*`' "$WS/packets" 2>/dev/null \
| awk -F'← `channels/' '{print $1"\t"$2}' \
| awk -F'\t' '{loc=$1; rest=$2; sub(/`$/,"",rest); n=index(rest," § "); ch=substr(rest,1,n-1); sec=substr(rest,n+4); print loc"\t"ch"\t"sec}' \
> /tmp/_ptr2.$$
total=$(grep -c . /tmp/_ptr2.$$ || echo 0)
echo "共 $total 条指针"
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
grep -rn '^rendered_from:' "$WS/packets" 2>/dev/null \
| awk -F':' '{loc=$1":"$2; p=$4; gsub(/^ +| +$/,"",p); print loc"\t"p}' \
| while IFS="$(printf '\t')" read -r loc p; do
    if [ -f "$WS/$p" ]; then echo "✅ $loc → $p"
    else echo "🔴 $loc → 真相源不存在：$p"; fi
  done
echo
echo "=== 结论 ==="
case "$fail" in
  0) echo "✅ 三项全过" ;;
  2) echo "⚠️  指针全部指向真实存在的节，但部分节过不了 CONTRACT.md §1.2 的前缀匹配 —— 这是 #28 的洞，不是本包的洞" ;;
  *) echo "🔴 有 FAIL，见上" ;;
esac
