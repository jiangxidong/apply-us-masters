#!/bin/bash
# evals/checks/check-docs.sh — docs 类检查的 runner（被测对象 = 契约 / repo 文档）
# 用法：check-docs.sh <TARGET_ROOT>
# 规则原文不住这里——每条检查头上的指针才是唯一权威（docs/checks.md 只持名与指针，ADR 0016）。
set -u
export LC_ALL=en_US.UTF-8   # 不靠继承：LC_ALL=C 下多字节处理静默失效（docs/checks.md 坑 5）

root="${1:-}"
if [ -z "${root}" ]; then
  echo "🔴 用法：$0 <TARGET_ROOT>（不给默认值——main 上有一棵陈旧的空样例树，默认值会静默扫空）" >&2
  exit 2
fi
ctx="${root}/CONTEXT.md"
if [ ! -f "${ctx}" ]; then
  echo "🔴 ${ctx} 不存在——TARGET_ROOT 给错了" >&2
  exit 2
fi

fails=0

# ── glossary-holds-no-owner ──────────────────────────────────────────────
# 规则原文（唯一权威）：ADR 0011 决定 ①② 及其 Consequences 的机械形态句。
# 只扫真表头（紧跟 |---| 分隔行的那一行——docs/checks.md 坑 4：表头 ≠ 每一行）；
# 词条散文里的「唯一写入者」「阶段」是合法词，不扫散文。
# 中文比较不用 awk ==（坑 6），用 ~ 做包含匹配。
hits="$(awk '
  prev != "" && /^\|[[:space:] :|-]*-/ {
    if (prev ~ /[Oo][Ww][Nn][Ee][Rr]/ || prev ~ /阶段/) print pn": "prev
  }
  { prev = $0; pn = NR }
' "${ctx}")"
if [ -n "${hits}" ]; then
  printf '🔴 FAIL glossary-holds-no-owner：表头出现 owner／阶段列（归属住契约，不住词汇表）\n%s\n' "${hits}"
  fails=$((fails+1))
else
  echo "✅ PASS glossary-holds-no-owner（参照物：ADR 0011 决定 ①② 的规则语句 ＋ evals/fixtures/violations/docs/glossary-holds-no-owner/ 的翻红夹具，均不随被测文件一起改动）"
fi

# ─────────────────────────────────────────────────────────────────────────
if [ "${fails}" -gt 0 ]; then
  echo "🔴 check-docs：${fails} 条 FAIL（TARGET_ROOT=${root}）"
  exit 1
fi
echo "✅ check-docs：已实现的检查全部通过（TARGET_ROOT=${root}）"
