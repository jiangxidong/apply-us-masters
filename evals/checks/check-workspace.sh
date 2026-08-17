#!/bin/bash
# evals/checks/check-workspace.sh — 工作区类检查的 runner（被测对象 = 某个工作区的文件内容）
# 用法：check-workspace.sh <CONTRACT_ROOT> <WORKSPACE_DIR> [check-name]
#   CONTRACT_ROOT = 含 CONTRACT.md 的目录（今天=某个 checkout 出 prototype/state-layer 的工作区）
#   WORKSPACE_DIR = 被测工作区（sample-workspace/ 或某条夹具）
#   check-name    = 可选，只跑这一条（夹具翻红用）；省略则跑全部十一条
# 规则原文不住这里——每条检查头上的指针才是唯一权威（docs/checks.md 只持名与指针，ADR 0016）。
# 已知限制（本次不修，对抗性复查记录）：CRLF/BOM 会造成假红（`sensitive: no`\r 之类的字面量比较对不上、
# BOM 会挂在 frontmatter 第一个键前面）；表头字面量匹配（`grep -n '^| 键 | ...'` 一类）对多余空白/换行是脆的。
# 两类都是 fails-closed（宁可漂移闸误报，不做更松的匹配去吞掉真正的破坏），故意留到下一轮再处理。
set -u
export LC_ALL=en_US.UTF-8   # 不靠继承：LC_ALL=C 下多字节处理静默失效（docs/checks.md 坑 5）

CONTRACT_ROOT="${1:-}"
WS="${2:-}"
ONLY="${3:-}"

if [ -z "${CONTRACT_ROOT}" ] || [ -z "${WS}" ]; then
  echo "🔴 用法：$0 <CONTRACT_ROOT> <WORKSPACE_DIR> [check-name]" >&2
  exit 2
fi

CONTRACT="${CONTRACT_ROOT}/CONTRACT.md"
if [ ! -f "${CONTRACT}" ]; then
  echo "🔴 ${CONTRACT} 不存在——CONTRACT_ROOT 给错了" >&2
  exit 2
fi

# 词表根 = 脚本自身所在树（main），不是 CONTRACT_ROOT。
# 裁定：state-layer 分支没有 CONTEXT.md（词汇表只住 main），「活读所跑分支契约」对
# safer 词表这条断言不可满足；双根（契约字面量读 CONTRACT_ROOT、词表读 main）是唯一
# 不硬编码的解——#76 结案评论详述。
GLOSSARY="$(cd "$(dirname "$0")/../.." && pwd)/CONTEXT.md"
if [ ! -f "${GLOSSARY}" ]; then
  echo "🔴 ${GLOSSARY} 不存在——脚本没有部署在含 CONTEXT.md 的树里" >&2
  exit 2
fi

VALID_CHECKS="pseudo-safer-excludes-safer material-keys-complete material-body-fixed-headings cite-url-has-no-ellipsis essay-cites-no-referee-claim section-prefix-match overlay-no-bare-lines subsection-under-program no-prebuilt-empty-section drafts-imply-consent season-stamp-matches-owners"
if [ -n "${ONLY}" ]; then
  ok=0
  for c in ${VALID_CHECKS}; do [ "${c}" = "${ONLY}" ] && ok=1; done
  if [ "${ok}" -ne 1 ]; then
    echo "🔴 未知检查名：${ONLY}（合法值：${VALID_CHECKS}）" >&2
    exit 2
  fi
fi

fails=0

# ══════════════════════════════════════════════════════════════════════════
# 字面量运行时提取（脚本零内联）——提取失败（计数不对/为空）一律 exit 2
# ══════════════════════════════════════════════════════════════════════════

# ── YES_SET：CONTRACT.md §4.6 表 `| 12 |` 且含 pseudo_safer 的行，取值域 cell 全部反引号 token ──
# 与 SAFER_SET 对称：不取「第一个」（枚举一重排就失明——F1），取全集，断言 `yes` ∈ 集合，
# 比较仍用字面量 `yes`（§4.6 第三条机械判别式写死的是 `pseudo_safer = yes`，不是「值域第一项」）。
yes_row="$(grep '^| 12 |' "${CONTRACT}" | grep 'pseudo_safer')"
yes_n="$(printf '%s\n' "${yes_row}" | grep -c '.')"
YES_SET=()
if [ "${yes_n}" -eq 1 ]; then
  while IFS= read -r tok; do YES_SET+=("${tok}"); done < <(printf '%s\n' "${yes_row}" | awk -F'|' '{print $4}' | grep -oE '`[^`]+`' | tr -d '`')
fi
if [ "${yes_n}" -ne 1 ] || [ "${#YES_SET[@]}" -eq 0 ]; then
  echo "🔴 字面量提取失败：YES_SET（CONTRACT.md §4.6 pseudo_safer 行命中 ${yes_n} 条，取到 ${#YES_SET[@]} 个 token）" >&2
  exit 2
fi
yes_ok=0
for y in "${YES_SET[@]}"; do [ "${y}" = "yes" ] && yes_ok=1; done
if [ "${yes_ok}" -ne 1 ]; then
  echo "🔴 契约漂移闸：yes 不在 CONTRACT.md §4.6 pseudo_safer 值域 YES_SET=[${YES_SET[*]}] 内——规则失去支点" >&2
  exit 2
fi
YES="yes"

# ── SAFER_SET：CONTEXT.md「分档」表（表头 `| 中文 | 标识符 | 断言的是 |` 后）第 2 列反引号 token 集合 ──
ctx_hdr_ln="$(grep -n '^| 中文 | 标识符 | 断言的是 |$' "${GLOSSARY}" | head -1 | cut -d: -f1)"
if [ -z "${ctx_hdr_ln}" ]; then
  echo "🔴 字面量提取失败：CONTEXT.md「分档」表表头未命中" >&2
  exit 2
fi
safer_start=$((ctx_hdr_ln + 2))
safer_rows="$(awk -v start="${safer_start}" 'NR>=start { if ($0 !~ /^\|/) exit; print }' "${GLOSSARY}")"
SAFER_SET=()
while IFS= read -r row; do
  [ -z "${row}" ] && continue
  tok="$(printf '%s\n' "${row}" | awk -F'|' '{print $3}' | grep -oE '`[^`]+`' | head -1 | tr -d '`')"
  [ -n "${tok}" ] && SAFER_SET+=("${tok}")
done <<< "${safer_rows}"
if [ "${#SAFER_SET[@]}" -eq 0 ]; then
  echo "🔴 字面量提取失败：SAFER_SET 为空（CONTEXT.md「分档」表解析失败）" >&2
  exit 2
fi
safer_ok=0
for s in "${SAFER_SET[@]}"; do [ "${s}" = "safer" ] && safer_ok=1; done
if [ "${safer_ok}" -ne 1 ]; then
  echo "🔴 词表漂移闸：safer 不在 CONTEXT.md「分档」表 SAFER_SET=[${SAFER_SET[*]}] 内" >&2
  exit 2
fi

# ── KEYS（3 个）：CONTRACT.md §1.1 三键表（表头 `| 键 | 值域 | 消费方 |` 后）首列反引号 token ──
keys_hdr_ln="$(grep -n '^| 键 | 值域 | 消费方 |$' "${CONTRACT}" | head -1 | cut -d: -f1)"
if [ -z "${keys_hdr_ln}" ]; then
  echo "🔴 字面量提取失败：CONTRACT.md 三键表表头未命中" >&2
  exit 2
fi
keys_start=$((keys_hdr_ln + 2))
keys_rows="$(awk -v start="${keys_start}" 'NR>=start { if ($0 !~ /^\|/) exit; print }' "${CONTRACT}")"
KEYS=()
while IFS= read -r row; do
  [ -z "${row}" ] && continue
  tok="$(printf '%s\n' "${row}" | awk -F'|' '{print $2}' | grep -oE '`[^`]+`' | head -1 | tr -d '`')"
  [ -n "${tok}" ] && KEYS+=("${tok}")
done <<< "${keys_rows}"
if [ "${#KEYS[@]}" -ne 3 ]; then
  echo "🔴 字面量提取失败：KEYS 应恰好 3 个，实得 ${#KEYS[@]} 个（[${KEYS[*]:-}]）" >&2
  exit 2
fi

# ── HEADINGS（3 个）：CONTRACT.md 含 `**正文的形状规则**` 那行里的反引号 `## …` token ──
h_row="$(grep '\*\*正文的形状规则\*\*' "${CONTRACT}")"
h_n="$(printf '%s\n' "${h_row}" | grep -c '.')"
HEADINGS=()
if [ "${h_n}" -eq 1 ]; then
  while IFS= read -r tok; do HEADINGS+=("${tok}"); done < <(printf '%s\n' "${h_row}" | grep -oE '`##[^`]*`' | tr -d '`')
fi
if [ "${h_n}" -ne 1 ] || [ "${#HEADINGS[@]}" -ne 3 ]; then
  echo "🔴 字面量提取失败：HEADINGS 应恰好 3 个（命中行数=${h_n}，取到 ${#HEADINGS[@]} 个）" >&2
  exit 2
fi

# ── VOICE_REFEREE：CONTRACT.md 含 `claims.md` 的四列 那段里 voice 的取值 token，断言 referee 在其中 ──
v_hdr_ln="$(grep -n '`claims.md` 的四列' "${CONTRACT}" | head -1 | cut -d: -f1)"
if [ -z "${v_hdr_ln}" ]; then
  echo "🔴 字面量提取失败：CONTRACT.md \`claims.md\` 的四列 段未命中" >&2
  exit 2
fi
v_window="$(sed -n "${v_hdr_ln},$((v_hdr_ln + 3))p" "${CONTRACT}" | tr '\n' ' ')"
v_cell="$(printf '%s' "${v_window}" | sed -E 's/.*`voice`（([^）]*)）.*/\1/')"
VOICE_TOKENS=()
while IFS= read -r tok; do VOICE_TOKENS+=("${tok}"); done < <(printf '%s\n' "${v_cell}" | grep -oE '`[^`]+`' | tr -d '`')
if [ "${#VOICE_TOKENS[@]}" -eq 0 ]; then
  echo "🔴 字面量提取失败：VOICE_TOKENS 为空（voice 取值解析失败）" >&2
  exit 2
fi
referee_ok=0
for t in "${VOICE_TOKENS[@]}"; do [ "${t}" = "referee" ] && referee_ok=1; done
if [ "${referee_ok}" -ne 1 ]; then
  echo "🔴 词表漂移闸：referee 不在 CONTRACT.md voice 取值 [${VOICE_TOKENS[*]}] 内" >&2
  exit 2
fi
VOICE_REFEREE="referee"

# ── SECLIST[]/OWNERLIST[]（并行索引数组——bash 3.2 无关联数组，见下方注）：
#    CONTRACT.md §1.2 十节归属表（表头含「法定节」&「owner 阶段」）第 3/5 列，
#    剥反引号/星号，owner 列另剥中文括注（（…）及其后）──
sec_hdr_ln="$(grep -n '法定节' "${CONTRACT}" | grep 'owner 阶段' | head -1 | cut -d: -f1)"
if [ -z "${sec_hdr_ln}" ]; then
  echo "🔴 字面量提取失败：CONTRACT.md §1.2 十节归属表表头未命中（含「法定节」&「owner 阶段」）" >&2
  exit 2
fi
sec_sep_ln=$((sec_hdr_ln + 1))
sec_sep="$(sed -n "${sec_sep_ln}p" "${CONTRACT}")"
# 分隔行判据取严：整行只能由 | - : 空格 构成，且至少含一个 -（与 awk 严版
# /^\|[ :-]*-/ 同强度）。旧版 '|'*'-'* 只要求行首 | 且任意位置含 -，数据行
# 「| 5 | append-only |」这类能穿过、被误判成分隔行。
sep_re='^\|[ :|-]*$'
if [[ ! "${sec_sep}" =~ ${sep_re} ]] || [[ "${sec_sep}" != *-* ]]; then
  echo "🔴 字面量提取失败：§1.2 表头下一行（第 ${sec_sep_ln} 行）不是分隔行——表头锚点可能命中了别处（坑 4：表头≠每一行）" >&2
  exit 2
fi
sec_start=$((sec_hdr_ln + 2))
sec_pairs="$(awk -v start="${sec_start}" '
  NR>=start {
    if ($0 !~ /^\|/) exit
    if ($0 ~ /^\|[-| ]+\|$/) next
    split($0, c, "|")
    sec=c[3]; own=c[5]
    gsub(/[`*]/,"",sec); gsub(/^[ \t]+/,"",sec); gsub(/[ \t]+$/,"",sec)
    gsub(/[`*]/,"",own); sub(/（.*/,"",own); gsub(/^[ \t]+/,"",own); gsub(/[ \t]+$/,"",own)
    if (length(sec)>0 && length(own)>0) print sec "\t" own
  }
' "${CONTRACT}")"
SECLIST=()
OWNERLIST=()
while IFS=$'\t' read -r sec own; do
  [ -z "${sec}" ] && continue
  SECLIST+=("${sec}")
  OWNERLIST+=("${own}")
done <<< "${sec_pairs}"
if [ "${#SECLIST[@]}" -eq 0 ]; then
  echo "🔴 字面量提取失败：SECLIST 为空（CONTRACT.md §1.2 归属表解析失败）" >&2
  exit 2
fi
referee_sec_ok=0
for s in "${SECLIST[@]}"; do [ "${s}" = "推荐信机制" ] && referee_sec_ok=1; done
if [ "${referee_sec_ok}" -ne 1 ]; then
  echo "🔴 契约漂移闸：「推荐信机制」不在 CONTRACT.md §1.2 归属表 SECLIST=[${SECLIST[*]}] 内——规则失去支点" >&2
  exit 2
fi
# 两两互为前缀检测（CONTRACT.md §1.2「词表内禁止任何两项互为前缀」）——
# 用 case/[ x = y ] 判前缀（对 CJK 安全，docs/checks.md 坑 6），不用 awk 的 ==/</。
n_sec="${#SECLIST[@]}"
i=0
while [ "${i}" -lt "${n_sec}" ]; do
  j=0
  while [ "${j}" -lt "${n_sec}" ]; do
    if [ "${i}" -ne "${j}" ]; then
      a="${SECLIST[$i]}"; b="${SECLIST[$j]}"
      case "${a}" in
        "${b}"*)
          echo "🔴 契约漂移闸：SECLIST 内两项互为前缀——「${b}」是「${a}」的前缀（ADR 0008 §1.2 禁止）" >&2
          exit 2
          ;;
      esac
    fi
    j=$((j + 1))
  done
  i=$((i + 1))
done
# 供 awk 消费的序列化形式（sec\towner，行分隔）——各检查函数用 -v 传入自己的 awk 调用，
# 在 awk 里重建关联数组（awk 数组是精确哈希，不经过 strcoll，CJK 键安全；坑 6 的注）。
SEC_SERIAL=""
for i in "${!SECLIST[@]}"; do SEC_SERIAL="${SEC_SERIAL}${SECLIST[$i]}"$'\t'"${OWNERLIST[$i]}"$'\n'; done
export SEC_SERIAL   # 经 ENVIRON 读入 awk，不用 -v——macOS awk 的 -v 解析器见到值里的换行会报
                     # 「newline in string」（已实测，坑同源但比坑 6/7 更窄：只咬多行 -v 赋值）

# ── OVERLAY：§1.2 含「也在封闭词表内」&「不带 owner」行的首个 `## …` token，剥 `## ` 前缀 ──
overlay_row="$(grep '也在封闭词表内' "${CONTRACT}" | grep '不带 owner')"
overlay_n="$(printf '%s\n' "${overlay_row}" | grep -c '.')"
if [ "${overlay_n}" -ne 1 ]; then
  echo "🔴 字面量提取失败：CONTRACT.md §1.2「也在封闭词表内」&「不带 owner」行命中 ${overlay_n} 条" >&2
  exit 2
fi
overlay_tok="$(printf '%s\n' "${overlay_row}" | grep -oE '`##[^`]*`' | head -1 | tr -d '`')"
case "${overlay_tok}" in
  '## '*) ;;
  *)
    echo "🔴 字面量提取失败：OVERLAY token「${overlay_tok}」不是「## 」开头" >&2
    exit 2
    ;;
esac
OVERLAY="${overlay_tok#"## "}"
if [ -z "${OVERLAY}" ]; then
  echo "🔴 字面量提取失败：OVERLAY 剥离「## 」前缀后为空" >&2
  exit 2
fi

# ── FOPATH[]/FOOWNER[]：CONTRACT.md §1.1 十四文件表（表头含「路径」&「owner 阶段」）
#    第 3 列首反引号 token（path）/ 第 6 列剥（…）与 —— 后半（owner）──
fo_hdr_ln="$(grep -n '路径' "${CONTRACT}" | grep 'owner 阶段' | head -1 | cut -d: -f1)"
if [ -z "${fo_hdr_ln}" ]; then
  echo "🔴 字面量提取失败：CONTRACT.md §1.1 十四文件表表头未命中（含「路径」&「owner 阶段」）" >&2
  exit 2
fi
fo_sep_ln=$((fo_hdr_ln + 1))
fo_sep="$(sed -n "${fo_sep_ln}p" "${CONTRACT}")"
# 分隔行判据取严：整行只能由 | - : 空格 构成，且至少含一个 -（与 awk 严版
# /^\|[ :-]*-/ 同强度）。旧版 '|'*'-'* 只要求行首 | 且任意位置含 -，数据行
# 「| 5 | append-only |」这类能穿过、被误判成分隔行。
sep_re='^\|[ :|-]*$'
if [[ ! "${fo_sep}" =~ ${sep_re} ]] || [[ "${fo_sep}" != *-* ]]; then
  echo "🔴 字面量提取失败：§1.1 表头下一行（第 ${fo_sep_ln} 行）不是分隔行——表头锚点可能命中了别处（坑 4）" >&2
  exit 2
fi
fo_start=$((fo_hdr_ln + 2))
fo_pairs="$(awk -v start="${fo_start}" '
  NR>=start {
    if ($0 !~ /^\|/) exit
    if ($0 ~ /^\|[-| ]+\|$/) next
    split($0, d, "|")
    fp=d[3]; fo=d[6]
    m=match(fp, /`[^`]+`/)
    if (m>0) { fp=substr(fp, RSTART+1, RLENGTH-2) } else { fp="" }
    gsub(/[`*]/,"",fo); sub(/（.*/,"",fo); sub(/——.*/,"",fo)
    gsub(/^[ \t]+/,"",fo); gsub(/[ \t]+$/,"",fo)
    if (length(fp)>0 && length(fo)>0) print fp "\t" fo
  }
' "${CONTRACT}")"
FOPATH=()
FOOWNER=()
while IFS=$'\t' read -r fp fo; do
  [ -z "${fp}" ] && continue
  FOPATH+=("${fp}")
  FOOWNER+=("${fo}")
done <<< "${fo_pairs}"
if [ "${#FOPATH[@]}" -eq 0 ]; then
  echo "🔴 字面量提取失败：FOPATH 为空（CONTRACT.md §1.1 十四文件表解析失败）" >&2
  exit 2
fi
progmd_ok=0
for p in "${FOPATH[@]}"; do [ "${p}" = "programs.md" ] && progmd_ok=1; done
if [ "${progmd_ok}" -ne 1 ]; then
  echo "🔴 契约漂移闸：programs.md 不在 CONTRACT.md §1.1 十四文件表 FOPATH=[${FOPATH[*]}] 内——规则失去支点" >&2
  exit 2
fi
FO_SERIAL=""
for i in "${!FOPATH[@]}"; do FO_SERIAL="${FO_SERIAL}${FOPATH[$i]}"$'\t'"${FOOWNER[$i]}"$'\n'; done
export FO_SERIAL   # 同上，经 ENVIRON 读入

# ── AUTH_BLOCK：§1.1 含「推荐人身份五块」行，括注按 `/` 分五块，断言「起草授权」∈其中 ──
auth_row="$(grep '推荐人身份五块' "${CONTRACT}")"
auth_n="$(printf '%s\n' "${auth_row}" | grep -c '.')"
if [ "${auth_n}" -ne 1 ]; then
  echo "🔴 字面量提取失败：CONTRACT.md §1.1「推荐人身份五块」行命中 ${auth_n} 条" >&2
  exit 2
fi
auth_paren="$(printf '%s\n' "${auth_row}" | sed -E 's/.*（([^）]*)）.*/\1/')"
AUTH_BLOCKS=()
while IFS= read -r tok; do
  tok="$(printf '%s' "${tok}" | sed -E 's/^[[:space:]]+|[[:space:]]+$//g')"
  [ -n "${tok}" ] && AUTH_BLOCKS+=("${tok}")
done < <(printf '%s\n' "${auth_paren}" | tr '/' '\n')
if [ "${#AUTH_BLOCKS[@]}" -eq 0 ]; then
  echo "🔴 字面量提取失败：AUTH_BLOCKS 为空（「推荐人身份五块」括注解析失败）" >&2
  exit 2
fi
auth_ok=0
for a in "${AUTH_BLOCKS[@]}"; do
  case "${a}" in
    起草授权*) auth_ok=1 ;;
  esac
done
if [ "${auth_ok}" -ne 1 ]; then
  echo "🔴 契约漂移闸：「起草授权」不在 CONTRACT.md §1.1「推荐人身份五块」括注 [${AUTH_BLOCKS[*]}] 内" >&2
  exit 2
fi
AUTH_BLOCK="起草授权"

# ══════════════════════════════════════════════════════════════════════════
# 十一条检查
# ══════════════════════════════════════════════════════════════════════════

# ── 1. pseudo-safer-excludes-safer ──────────────────────────────────────
# 规则原文：ADR 0015 决定「禁止共存」。
check_pseudo_safer_excludes_safer() {
  name="pseudo-safer-excludes-safer"
  target="${WS}/programs.md"
  if [ ! -f "${target}" ]; then
    echo "🔴 ${target} 不存在——检查目标文件缺失（硬失败，不是跳过）" >&2
    exit 2
  fi
  # 数据行判定改为「分隔行标志法」（F2）：不再靠 $2 是否形如 [A-Za-z0-9]--[A-Za-z0-9]——
  # 纯 CJK 的 program_key（如「北大--元培--计算机」）没有 ASCII 字符贴着 `--`，靠内容匹配会隐身。
  # 改成看见表头下方的分隔行（`|---|---|...`）就置 sep=1，此后行首为 `|` 的行一律算数据行。
  hits="$(awk -F'|' -v YES="${YES}" '
    /^\|[ :-]*-/ { sep=1; next }
    sep==1 && /^\|/ {
      tier=$7; ps=$13
      gsub(/^[ \t]+|[ \t]+$/, "", tier); gsub(/^[ \t]+|[ \t]+$/, "", ps)
      if (ps == YES && tier == "safer") print NR": tier="tier" pseudo_safer="ps
    }
  ' "${target}")"
  if [ -n "${hits}" ]; then
    printf '🔴 FAIL %s：pseudo_safer=%s 与 tier=safer 共存（ADR 0015 禁止共存）\n%s\n' "${name}" "${YES}" "${hits}"
    fails=$((fails + 1))
  else
    echo "✅ PASS ${name}（参照物：CONTRACT.md §4.6 pseudo_safer 行值域 YES_SET=[${YES_SET[*]}]，断言 yes∈其中［源 ${CONTRACT_ROOT}］＋ CONTEXT.md「分档」表 SAFER_SET 含 safer［源=main 词表］；夹具＝evals/fixtures/violations/workspace/${name}/）"
  fi
}

# ── 2. material-keys-complete ────────────────────────────────────────────
# 规则原文：CONTRACT.md §1.1「materials/*.md 的字段名单（v1 定稿）」frontmatter 三键表。
# 1:1 移植 derive-demo.sh（wt-sl 副本）L146-169 的判定逻辑，键名改用运行时提取的 KEYS。
check_material_keys_complete() {
  name="material-keys-complete"
  files=()
  while IFS= read -r -d '' f; do files+=("${f}"); done < <(find "${WS}/materials" -maxdepth 1 -name 'm*.md' -print0 2>/dev/null)
  if [ "${#files[@]}" -eq 0 ]; then
    echo "🔴 ${WS}/materials/m*.md 零命中——检查目标缺失（硬失败，不是跳过）" >&2
    exit 2
  fi

  # F3：verifiable_by 有键但值既不是 [...]（flow，可空）也不是同行标量（bare token，无 `[`）
  # 时——多半是 YAML block-list（键后另起几行 `- rNN`）——判 parse_ok=0，外层按此 fail closed，
  # 不再像旧逻辑那样把「解析不出内容」悄悄读成「空列表」而放行。
  mat_records=()
  for f in "${files[@]}"; do
    rec="$(awk -v k1="${KEYS[0]}" -v k2="${KEYS[1]}" -v k3="${KEYS[2]}" -v file="${f}" '
      /^---[ \t]*$/ { fm++; if (fm==2) exit; next }
      fm==1 {
        if ($0 ~ "^"k1":") { v=$0; sub("^"k1":[ \t]*","",v); mid=v }
        if ($0 ~ "^"k2":") { v=$0; sub("^"k2":[ \t]*","",v); sen=v }
        if ($0 ~ "^"k3":") {
          raw=$0; sub("^"k3":[ \t]*","",raw); sub(/[ \t\r]+$/,"",raw)
          has=1
          if (raw == "") {
            parse_ok=0
          } else if (raw ~ /^\[.*\]$/) {
            v=raw
            gsub(/[][,]/," ",v); gsub(/  +/," ",v); sub(/^ +/,"",v); sub(/ +$/,"",v)
            vb=v; parse_ok=1
          } else if (raw !~ /\[/) {
            vb=raw; parse_ok=1
          } else {
            parse_ok=0
          }
        }
      }
      END { printf "%s|%s|%s|%s|%s|%s", mid, sen, vb, has+0, file, parse_ok+0 }
    ' "${f}")"
    mat_records+=("${rec}")
  done

  # 外键子步是否需要 recommenders.md：任一素材的 verifiable_by 非空才需要。
  need_fk=0
  for rec in "${mat_records[@]}"; do
    IFS='|' read -r mid sen vb has file parse_ok <<< "${rec}"
    if [ "${has}" = "1" ] && [ "${parse_ok}" = "1" ] && [ -n "${vb}" ]; then need_fk=1; fi
  done
  rec_file="${WS}/recommenders.md"
  known_ids=()
  fk_note="（recommenders.md 存在，外键子步正常执行）"
  if [ "${need_fk}" -eq 1 ]; then
    if [ ! -f "${rec_file}" ]; then
      echo "🔴 ${rec_file} 不存在，但存在非空 verifiable_by——外键子步需要它（硬失败）" >&2
      exit 2
    fi
    while IFS= read -r rid; do known_ids+=("${rid}"); done < <(awk -F'|' '/^\|/ { for (i=2;i<NF;i++) gsub(/^[ \t]+|[ \t]+$/,"",$i); if ($2 ~ /^r[0-9]+$/ && NF>=7) print $2 }' "${rec_file}")
  else
    fk_note="（全部 verifiable_by 为空/缺键——外键子步跳过，说明：${rec_file} 是否存在与本条判定无关）"
  fi

  bad_lines=""
  nbad=0
  for rec in "${mat_records[@]}"; do
    IFS='|' read -r mid sen vb has file parse_ok <<< "${rec}"
    bad=""
    if [[ ! "${mid}" =~ ^m[0-9]+$ ]]; then
      bad="${bad} material_id 缺失或不是 mNN"
    else
      base="$(basename "${file}")"
      case "${base}" in
        "${mid}"-*) ;;
        *) bad="${bad} material_id 与文件名前缀不一致（id 要能靠 glob 解析）" ;;
      esac
    fi
    if [[ ! "${sen}" =~ ^(yes|no)$ ]]; then
      bad="${bad} sensitive 缺失或不是 ASCII 二元 yes/no"
    fi
    if [ "${has}" != "1" ]; then
      bad="${bad} 缺 verifiable_by 键（空列表要写成 []，不是不写）"
    elif [ "${parse_ok}" != "1" ]; then
      bad="${bad} verifiable_by 有键但值既不是 [...]（可空）也不是同行标量，检查解析不了（像是写成了 YAML block-list——按 §1.1 样例形态写）"
    elif [ -n "${vb}" ]; then
      for id in ${vb}; do
        found=0
        for k in "${known_ids[@]:-}"; do
          [ "${id}" = "${k}" ] && found=1 && break
        done
        [ "${found}" -eq 0 ] && bad="${bad} verifiable_by 悬空外键 ${id}"
      done
    fi
    if [ -n "${bad}" ]; then
      bad_lines="${bad_lines}${file} —${bad}
"
      nbad=$((nbad + 1))
    fi
  done

  if [ "${nbad}" -gt 0 ]; then
    printf '🔴 FAIL %s：\n%s' "${name}" "${bad_lines}"
    fails=$((fails + 1))
  else
    echo "✅ PASS ${name}（参照物：CONTRACT.md §1.1 frontmatter 三键表 KEYS=[${KEYS[0]},${KEYS[1]},${KEYS[2]}]［源 ${CONTRACT_ROOT}］${fk_note}；夹具＝evals/fixtures/violations/workspace/${name}/）"
  fi
}

# ── 3. material-body-fixed-headings ─────────────────────────────────────
# 规则原文：CONTRACT.md §1.1「正文的形状规则」。
# 1:1 移植 derive-demo.sh（wt-sl 副本）L171-188 的判定逻辑，标题改用运行时提取的 HEADINGS。
check_material_body_fixed_headings() {
  name="material-body-fixed-headings"
  files=()
  while IFS= read -r -d '' f; do files+=("${f}"); done < <(find "${WS}/materials" -maxdepth 1 -name 'm*.md' -print0 2>/dev/null)
  if [ "${#files[@]}" -eq 0 ]; then
    echo "🔴 ${WS}/materials/m*.md 零命中——检查目标缺失（硬失败，不是跳过）" >&2
    exit 2
  fi
  bad_lines=""
  nbad=0
  for f in "${files[@]}"; do
    miss=""
    for h in "${HEADINGS[@]}"; do
      grep -qxF "${h}" "${f}" || miss="${miss} \`${h}\`"
    done
    if [ -n "${miss}" ]; then
      bad_lines="${bad_lines}${f} 缺小标题:${miss}
"
      nbad=$((nbad + 1))
    fi
  done
  if [ "${nbad}" -gt 0 ]; then
    printf '🔴 FAIL %s：\n%s' "${name}" "${bad_lines}"
    fails=$((fails + 1))
  else
    echo "✅ PASS ${name}（参照物：CONTRACT.md「正文的形状规则」HEADINGS=[${HEADINGS[0]} / ${HEADINGS[1]} / ${HEADINGS[2]}]［源 ${CONTRACT_ROOT}］；夹具＝evals/fixtures/violations/workspace/${name}/）"
  fi
}

# ── 4. cite-url-has-no-ellipsis ─────────────────────────────────────────
# 规则原文：ADR 0007 补充（#63）。两个作用域写死（判据非契约字面量，是 #63 定的固定裁决）：
#   (a) channels/*.md 的顶层 bullet（^[-*] 起头——GFM 两种 bullet 记号等价，F4）首行，含 ✓ 且含 URL；
#   (b) programs.md 数据行 $10（evidence）trim 后以 ✓ 开头的 cell（数据行判定同 F2，分隔行标志法）。
# 裁定（#76 结案评论详述）：待核实后缀里的 URL 不在作用域——规则原文绑的是 `✓ <url>`，
# 「待核实」封闭后缀是历史观察值，不带 ✓，天然放行。
check_cite_url_has_no_ellipsis() {
  name="cite-url-has-no-ellipsis"
  chandir="${WS}/channels"
  prog="${WS}/programs.md"
  if [ ! -d "${chandir}" ]; then
    echo "🔴 ${chandir} 不存在——检查目标缺失（硬失败，不是跳过）" >&2
    exit 2
  fi
  if [ ! -f "${prog}" ]; then
    echo "🔴 ${prog} 不存在——检查目标缺失（硬失败，不是跳过）" >&2
    exit 2
  fi

  hits=""
  nhit=0

  for f in "${chandir}"/*.md; do
    [ -e "${f}" ] || continue
    while IFS=: read -r ln content; do
      case "${content}" in
        "✓"*|*"✓"*) ;;
        *) continue ;;
      esac
      url="$(printf '%s' "${content}" | grep -oE 'https?://[^ `]+' | head -1)"
      [ -z "${url}" ] && continue
      case "${url}" in
        *"…"*|*"..."*)
          hits="${hits}${f}:${ln}: ${url}
"
          nhit=$((nhit + 1))
          ;;
      esac
    done < <(grep -n '^[-*] ' "${f}")
  done

  while IFS= read -r row; do
    cell="$(printf '%s\n' "${row}" | awk -F'|' '{print $10}')"
    trimmed="$(printf '%s' "${cell}" | sed -E 's/^[[:space:]]+|[[:space:]]+$//g')"
    case "${trimmed}" in
      "✓"*)
        url="$(printf '%s' "${trimmed}" | grep -oE 'https?://[^ `]+' | head -1)"
        if [ -n "${url}" ]; then
          case "${url}" in
            *"…"*|*"..."*)
              hits="${hits}${prog}: ${url}
"
              nhit=$((nhit + 1))
              ;;
          esac
        fi
        ;;
    esac
  done < <(awk '
    /^\|[ :-]*-/ { sep=1; next }
    sep==1 && /^\|/ { print }
  ' "${prog}")

  if [ "${nhit}" -gt 0 ]; then
    printf '🔴 FAIL %s：URL 内含省略号（… 或 ...），共 %d 处\n%s' "${name}" "${nhit}" "${hits}"
    fails=$((fails + 1))
  else
    echo "✅ PASS ${name}（参照物：ADR 0007 补充／#63 两作用域裁决［契约外固定裁决，不随被测文件改动］；夹具＝evals/fixtures/violations/workspace/${name}/）"
  fi
}

# ── 5. essay-cites-no-referee-claim ─────────────────────────────────────
# 规则原文：CONTRACT.md §1.1 `claims.md` 四列段（#52 定禁令，#63 定被测对象）。
check_essay_cites_no_referee_claim() {
  name="essay-cites-no-referee-claim"
  claims_file="${WS}/claims.md"
  canon_dir="${WS}/essays/canonical"
  if [ ! -f "${claims_file}" ]; then
    echo "🔴 ${claims_file} 不存在——检查目标缺失（硬失败，不是跳过）" >&2
    exit 2
  fi
  if [ ! -d "${canon_dir}" ]; then
    echo "🔴 ${canon_dir} 不存在——检查目标缺失（硬失败，不是跳过）" >&2
    exit 2
  fi

  referee_ids=()
  while IFS= read -r cid; do referee_ids+=("${cid}"); done < <(awk -F'|' -v VR="${VOICE_REFEREE}" '
    /^\|/ {
      for (i=2;i<NF;i++) gsub(/^[ \t]+|[ \t]+$/,"",$i)
      if ($2 !~ /^c[0-9]+$/) next
      voice=$5
      if (voice == VR) print $2
    }
  ' "${claims_file}")

  hits=""
  nhit=0
  for f in "${canon_dir}"/*.md; do
    [ -e "${f}" ] || continue
    base="$(basename "${f}")"
    [ "${base}" = "README.md" ] && continue
    claims_line="$(awk '/^claims:/ {print; exit}' "${f}")"
    [ -z "${claims_line}" ] && continue
    # F3：claims: 键存在但不是同行 flow 形式（[...]，可空）时——多半是 YAML block-list
    # （键后另起几行 `- cNN`）——fail closed，不许像旧逻辑那样把「解析不出内容」悄悄读成
    #「没有 claims」而跳过整个文件（那样会把 block-list 里引用的 referee 主张放过）。
    case "${claims_line}" in
      *'['*']'*)
        used="$(printf '%s\n' "${claims_line}" | sed -E 's/^claims:[^[]*\[([^]]*)\].*/\1/' | tr ',' ' ')"
        ;;
      *)
        hits="${hits}${f} 的 claims 不是 flow 形式（[...]），检查解析不了——按 §1.1 样例形态写
"
        nhit=$((nhit + 1))
        continue
        ;;
    esac
    [ -z "${used}" ] && continue
    for c in ${used}; do
      for r in "${referee_ids[@]:-}"; do
        if [ "${c}" = "${r}" ]; then
          hits="${hits}${f} 引用了 voice=${VOICE_REFEREE} 的主张 ${c}
"
          nhit=$((nhit + 1))
        fi
      done
    done
  done

  if [ "${nhit}" -gt 0 ]; then
    printf '🔴 FAIL %s：\n%s' "${name}" "${hits}"
    fails=$((fails + 1))
  else
    echo "✅ PASS ${name}（参照物：CONTRACT.md \`claims.md\` 四列段 VOICE_REFEREE=${VOICE_REFEREE}［源 ${CONTRACT_ROOT}］；夹具＝evals/fixtures/violations/workspace/${name}/）"
  fi
}

# ── 6. section-prefix-match ──────────────────────────────────────────────
# 规则原文：CONTRACT.md §1.2（封闭词表＋剥离＋前缀匹配）。曾用号 0008 第 2 条／#14 G1
# （取强版：G1 无剥离步骤，样例上报 6 个假失败——本条必须带剥离）。
# 已声明边界：只扫 `##`/`####`（`###` 是 program_key，从来不是法定节名，坑 2）；
# `## 项目级差异` 自身（OVERLAY）是覆盖层标记，不参与前缀匹配，显式跳过。
check_section_prefix_match() {
  name="section-prefix-match"
  chandir="${WS}/channels"
  if [ ! -d "${chandir}" ]; then
    echo "🔴 ${chandir} 不存在——检查目标缺失（硬失败，不是跳过）" >&2
    exit 2
  fi
  hits=""
  nhit=0
  for f in "${chandir}"/*.md; do
    [ -e "${f}" ] || continue
    out="$(awk -v overlay="${OVERLAY}" '
      function eq(a,b) { return (length(a)==length(b) && index(a,b)==1) }
      BEGIN {
        secser = ENVIRON["SEC_SERIAL"]
        ns = split(secser, srows, "\n")
        for (i=1;i<=ns;i++) { if (srows[i]=="") continue; split(srows[i], p, "\t"); n++; SL[n]=p[1] }
      }
      /^## / || /^#### / {
        t=$0; sub(/^#+[ ]*/,"",t); gsub(/^[^一-龥A-Za-z0-9]+/,"",t)
        if (eq(substr(t,1,length(overlay)), overlay)) next
        hit=0
        for (i=1;i<=n;i++) { if (index(t,SL[i])==1) { hit=1; break } }
        if (!hit) print FNR"\t"t
      }
    ' "${f}")"
    if [ -n "${out}" ]; then
      while IFS=$'\t' read -r ln t; do
        [ -z "${ln}" ] && continue
        hits="${hits}${f}:${ln}: 节名「${t}」过不了封闭词表前缀匹配
"
        nhit=$((nhit + 1))
      done <<< "${out}"
    fi
  done
  if [ "${nhit}" -gt 0 ]; then
    printf '🔴 FAIL %s：\n%s' "${name}" "${hits}"
    fails=$((fails + 1))
  else
    echo "✅ PASS ${name}（参照物：CONTRACT.md §1.2 十节归属表 SECLIST=[${SECLIST[*]}]［源 ${CONTRACT_ROOT}］，剥离规则「先剥掉标题行首非汉字/拉丁/数字字符再前缀匹配」；OVERLAY=「${OVERLAY}」显式跳过；夹具＝evals/fixtures/violations/workspace/${name}/）"
  fi
}

# ── 7. overlay-no-bare-lines ─────────────────────────────────────────────
# 规则原文：CONTRACT.md §1.2 覆盖层四条（🔒「`### <program_key>` 之下的每一行必须落在
# 某个 `#### <法定节名>` 内；裸行非法」）。曾用号 0008 第 4 条（#28 换入）。
# 已声明边界：`## ` 直下、遇到第一个 `### ` 之前的行不判（那些行属于 `##` 本身，不在覆盖层内）；
# `> ` 引用行同样算「行」，不豁免（豁免属于「证据标记扫描」那条不同的规则，见 §4）；
# `####` 名字本身合不合法（在不在封闭词表内）归 section-prefix-match，本条不判。
check_overlay_no_bare_lines() {
  name="overlay-no-bare-lines"
  chandir="${WS}/channels"
  if [ ! -d "${chandir}" ]; then
    echo "🔴 ${chandir} 不存在——检查目标缺失（硬失败，不是跳过）" >&2
    exit 2
  fi
  hits=""
  nhit=0
  for f in "${chandir}"/*.md; do
    [ -e "${f}" ] || continue
    out="$(awk '
      /^## /  { in3=0; next }
      /^### / { in3=1; seen4=0; next }
      /^#### / { seen4=1; next }
      {
        if (in3 && !seen4) {
          line=$0; gsub(/^[ \t]+|[ \t]+$/,"",line)
          if (length(line)>0) print FNR"\t"line
        }
      }
    ' "${f}")"
    if [ -n "${out}" ]; then
      while IFS=$'\t' read -r ln line; do
        [ -z "${ln}" ] && continue
        hits="${hits}${f}:${ln}: 裸行落不到任何 \`####\`：${line}
"
        nhit=$((nhit + 1))
      done <<< "${out}"
    fi
  done
  if [ "${nhit}" -gt 0 ]; then
    printf '🔴 FAIL %s：\n%s' "${name}" "${hits}"
    fails=$((fails + 1))
  else
    echo "✅ PASS ${name}（参照物：CONTRACT.md §1.2「\`### <program_key>\` 之下的每一行必须落在某个 \`#### <法定节名>\` 内；裸行非法」［源 ${CONTRACT_ROOT}］；\`####\` 合法性归 section-prefix-match，不归本条；夹具＝evals/fixtures/violations/workspace/${name}/）"
  fi
}

# ── 8. subsection-under-program ──────────────────────────────────────────
# 规则原文：CONTRACT.md §1.2 ＋ `programs.md` 的 `program_key` 主键。曾用号 0008 第 6 条／
# #14 G2（取强版：不只要求 `####` 嵌在存在的 `###` 下，还要求该 `program_key` 在 `programs.md` 里存在）。
check_subsection_under_program() {
  name="subsection-under-program"
  chandir="${WS}/channels"
  progmd="${WS}/programs.md"
  if [ ! -d "${chandir}" ]; then
    echo "🔴 ${chandir} 不存在——检查目标缺失（硬失败，不是跳过）" >&2
    exit 2
  fi
  if [ ! -f "${progmd}" ]; then
    echo "🔴 ${progmd} 不存在——PROGKEYS 无法提取（硬失败，不是跳过）" >&2
    exit 2
  fi
  # PROGKEYS[]：${WS}/programs.md 数据行（分隔行标志法）第 2 列剥反引号。
  # 只在本检查里提取——它依赖 WS（被测工作区），不是 CONTRACT_ROOT，不进顶部共享提取。
  PROGKEYS=()
  while IFS= read -r k; do
    [ -n "${k}" ] && PROGKEYS+=("${k}")
  done < <(awk -F'|' '
    /^\|[ :-]*-/ { sep=1; next }
    sep==1 && /^\|/ { gsub(/^[ \t]+|[ \t]+$/,"",$2); print $2 }
  ' "${progmd}" | tr -d '`')
  if [ "${#PROGKEYS[@]}" -eq 0 ]; then
    echo "🔴 字面量提取失败：PROGKEYS 为空（${progmd} 数据行解析失败）" >&2
    exit 2
  fi
  pk_serial=""
  for k in "${PROGKEYS[@]}"; do pk_serial="${pk_serial}${k}"$'\n'; done
  export pk_serial

  hits=""
  nhit=0
  for f in "${chandir}"/*.md; do
    [ -e "${f}" ] || continue
    out="$(awk '
      BEGIN { pkser = ENVIRON["pk_serial"]; np = split(pkser, rows, "\n"); for (i=1;i<=np;i++) if (rows[i]!="") PK[rows[i]]=1 }
      /^## / { cur=""; next }
      /^### / {
        t=$0; sub(/^#+[ ]*/,"",t); gsub(/`/,"",t); gsub(/^[ \t]+|[ \t]+$/,"",t)
        cur=t
        if (!(t in PK)) print FNR"\t### key「"t"」不在 programs.md 的 program_key 集合内"
        next
      }
      /^#### / {
        if (cur == "") print FNR"\t#### 无 ### 上下文（裸挂在 ## 之下）"
        next
      }
    ' "${f}")"
    if [ -n "${out}" ]; then
      while IFS=$'\t' read -r ln msg; do
        [ -z "${ln}" ] && continue
        hits="${hits}${f}:${ln}: ${msg}
"
        nhit=$((nhit + 1))
      done <<< "${out}"
    fi
  done
  if [ "${nhit}" -gt 0 ]; then
    printf '🔴 FAIL %s：\n%s' "${name}" "${hits}"
    fails=$((fails + 1))
  else
    echo "✅ PASS ${name}（参照物：CONTRACT.md §1.2「\`####\` 嵌在存在的 \`###\` 下」［源 ${CONTRACT_ROOT}］＋ programs.md 的 program_key 主键 PROGKEYS=(${PROGKEYS[*]})［源 ${WS}］；夹具＝evals/fixtures/violations/workspace/${name}/）"
  fi
}

# ── 9. no-prebuilt-empty-section ─────────────────────────────────────────
# 规则原文：#23 否掉预建空节（「只建自己 owner 的节，不预建空节」——节的缺席本身是信息）。曾用号 #14 G3。
# 已声明边界：只扫 channels/；标题栈单趟扫描，`###`（program_key）不计入判空本身（它从来不是法定节，
# 坑 2），但仍进栈参与层级嵌套，且它的出现（连同任何更深标题）会把祖先标记为非空——
# 一个装着子结构的节不是「空节」。
check_no_prebuilt_empty_section() {
  name="no-prebuilt-empty-section"
  chandir="${WS}/channels"
  if [ ! -d "${chandir}" ]; then
    echo "🔴 ${chandir} 不存在——检查目标缺失（硬失败，不是跳过）" >&2
    exit 2
  fi
  hits=""
  nhit=0
  for f in "${chandir}"/*.md; do
    [ -e "${f}" ] || continue
    out="$(awk '
      function closeall(lvl,   i) {
        while (n>0 && stacklvl[n] >= lvl) {
          if (stackjudge[n] && !stackhas[n]) print stackline[n]"\t"stackname[n]
          n--
        }
      }
      /^## / {
        closeall(2)
        n++; stacklvl[n]=2; t=$0; sub(/^#+[ ]*/,"",t); stackname[n]=t; stackhas[n]=0; stackjudge[n]=1; stackline[n]=FNR
        next
      }
      /^### / {
        closeall(3)
        for (i=1;i<=n;i++) stackhas[i]=1
        n++; stacklvl[n]=3; t=$0; sub(/^#+[ ]*/,"",t); stackname[n]=t; stackhas[n]=0; stackjudge[n]=0; stackline[n]=FNR
        next
      }
      /^#### / {
        closeall(4)
        for (i=1;i<=n;i++) stackhas[i]=1
        n++; stacklvl[n]=4; t=$0; sub(/^#+[ ]*/,"",t); stackname[n]=t; stackhas[n]=0; stackjudge[n]=1; stackline[n]=FNR
        next
      }
      {
        line=$0; gsub(/^[ \t]+|[ \t]+$/,"",line)
        if (length(line)>0) { for (i=1;i<=n;i++) stackhas[i]=1 }
      }
      END { closeall(0) }
    ' "${f}")"
    if [ -n "${out}" ]; then
      while IFS=$'\t' read -r ln secname; do
        [ -z "${ln}" ] && continue
        hits="${hits}${f}:${ln}: 预建空节：${secname}
"
        nhit=$((nhit + 1))
      done <<< "${out}"
    fi
  done
  if [ "${nhit}" -gt 0 ]; then
    printf '🔴 FAIL %s：\n%s' "${name}" "${hits}"
    fails=$((fails + 1))
  else
    echo "✅ PASS ${name}（参照物：#23「只建自己 owner 的节，不预建空节」［契约外固定裁决，不随被测文件改动］；夹具＝evals/fixtures/violations/workspace/${name}/）"
  fi
}

# ── 10. drafts-imply-consent ─────────────────────────────────────────────
# 规则原文：#12 C 档前置（推荐人本人授权起草）。曾用号 0008 第 5 条／#14 E1
# （取强版：声明住 recommenders.md，两道闸——写入闸 + 存在性闸）。
# 已声明边界：写入闸（创建 drafts/<rid>.md 前必须先读到授权声明）是运行时纪律，靠 skill 措辞约束，
# 不可机械验证（无 commit range、无「这次写入属于哪个阶段」的元数据，同 ADR 0008 限定 2 claims.md
# append/rewrite 分工不进检查表的理由）；本条只执法**存在性闸**——目录存在但声明缺 / 声明与目录不对应
# → 报错。目标缺失的语义两类：`${WS}/recommenders/drafts` 不存在 → PASS（存在性闸空转，不是判过合规，
# 是无对象可判）；drafts/ 存在但 recommenders.md 不存在 → FAIL（不是 exit 2——这本身就是存在性闸要抓的
# 违规：目录物理存在，声明却读不到）。
check_drafts_imply_consent() {
  name="drafts-imply-consent"
  drafts="${WS}/recommenders/drafts"
  rec="${WS}/recommenders.md"

  if [ ! -d "${drafts}" ]; then
    echo "✅ PASS ${name}（参照物：CONTRACT.md §1.1「recommenders/drafts/ 什么时候才该存在」＋ recommenders.md「起草授权声明」块 AUTH_BLOCK=「${AUTH_BLOCK}」［源 ${CONTRACT_ROOT}］；${drafts} 不存在——存在性闸空转（无对象可判，不是查过判定合规）；夹具＝evals/fixtures/violations/workspace/${name}/）"
    return
  fi

  if [ ! -f "${rec}" ]; then
    printf '🔴 FAIL %s：%s 存在，但 %s 不存在——存在性闸判不了授权，目录的存在本身构成违规（不是检查器硬失败）\n' "${name}" "${drafts}" "${rec}"
    fails=$((fails + 1))
    return
  fi

  hdr_ln="$(awk -v pfx="${AUTH_BLOCK}" '
    /^## / {
      t=$0; sub(/^#+[ ]*/,"",t); gsub(/^[^一-龥A-Za-z0-9]+/,"",t)
      if (index(t,pfx)==1) { print FNR; exit }
    }
  ' "${rec}")"

  hits=""
  nhit=0
  VALID_RIDS=()

  if [ -z "${hdr_ln}" ]; then
    hits="${hits}${rec}：找不到以「${AUTH_BLOCK}」为前缀的节——授权表读不到
"
    nhit=$((nhit + 1))
  else
    pairs="$(awk -v start="${hdr_ln}" '
      NR==start { next }
      NR>start && /^## / { exit }
      NR>start { print }
    ' "${rec}" | awk -F'|' '
      /^\|[ :-]*-/ { sep=1; next }
      sep==1 && /^\|/ {
        rid=$2; dt=$3
        gsub(/^[ \t]+|[ \t]+$/,"",rid); gsub(/^[ \t]+|[ \t]+$/,"",dt)
        print rid "\t" dt
      }
    ')"
    while IFS=$'\t' read -r rid dt; do
      [ -z "${rid}" ] && continue
      if [ -z "${dt}" ]; then
        hits="${hits}${rec}：recommender_id=${rid} 无授权日期——声明无效
"
        nhit=$((nhit + 1))
      else
        VALID_RIDS+=("${rid}")
      fi
    done <<< "${pairs}"
  fi

  if [ "${#VALID_RIDS[@]}" -eq 0 ]; then
    hits="${hits}${drafts}：目录存在但授权表内无任何有效声明——存在性闸判违规（目录本身不该存在）
"
    nhit=$((nhit + 1))
  fi

  for df in "${drafts}"/*.md; do
    [ -e "${df}" ] || continue
    base="$(basename "${df}")"
    rid="${base%.md}"
    found=0
    for v in "${VALID_RIDS[@]:-}"; do [ "${rid}" = "${v}" ] && found=1; done
    if [ "${found}" -ne 1 ]; then
      hits="${hits}${df}：recommender_id=${rid} 不在有效授权声明集内
"
      nhit=$((nhit + 1))
    fi
  done

  if [ "${nhit}" -gt 0 ]; then
    printf '🔴 FAIL %s：\n%s' "${name}" "${hits}"
    fails=$((fails + 1))
  else
    echo "✅ PASS ${name}（参照物：CONTRACT.md §1.1「recommenders/drafts/ 什么时候才该存在」＋ recommenders.md「${AUTH_BLOCK}」块［源 ${CONTRACT_ROOT}］；${drafts} 存在且授权表内 ${#VALID_RIDS[@]} 条有效声明覆盖了 drafts/ 下的全部文件；夹具＝evals/fixtures/violations/workspace/${name}/）"
  fi
}

# ── 11. season-stamp-matches-owners ──────────────────────────────────────
# 规则原文：ADR 0008 限定 4。曾用号 0008 第 8 条（#37）。
# 实现体原住 packet 分支 trace-packet.sh 第 [5] 项，#89 同刀迁移进 evals/——算法 1:1 移植：
# CONTRACT.md §1.2/§1.1 的抽取不再由本函数二次解析，改用本脚本顶部的共享提取
# （SECLIST/OWNERLIST/OVERLAY/FOPATH/FOOWNER），序列化后传入本函数自己的 awk（awk 关联数组精确
# 哈希、不经过 strcoll，CJK 键安全）；原来的临时文件 `/tmp/_s5.$$` 改成 `out="$(awk …)"` 变量捕获，
# `VIOL=` 哨兵行提取違規数。
#
# 🔴 参照物为什么不是恒真的（ADR 0017 / #57）：本项比的是**同一个文件的 frontmatter 表 vs 它自己的
# 正文**，归属表只是把「节名 → owner」这一步翻译过来。因此归属表必须活读跑 CONTRACT_ROOT 自己的
# CONTRACT.md §1.2（本脚本顶部已按 CONTRACT_ROOT 提取），不得内嵌副本、不得跨分支取参照物——内嵌就
# 退化成「脚本和自己比」，跨分支取则是 ADR 0017 已经否掉的那个方向。改 §1.2 的归属，本项当场跟着变，
# 这就是它有信息的证据。
check_season_stamp_matches_owners() {
  name="season-stamp-matches-owners"

  targets=()
  for tgt in "${WS}"/channels/*.md "${WS}/programs.md"; do
    [ -f "${tgt}" ] && targets+=("${tgt}")
  done
  if [ "${#targets[@]}" -eq 0 ]; then
    echo "🔴 ${WS}/channels/*.md 与 ${WS}/programs.md 全缺——检查目标缺失（硬失败，不是跳过）" >&2
    exit 2
  fi

  apply="${WS}/apply.md"
  if [ ! -f "${apply}" ]; then
    echo "🔴 ${apply} 不存在——CUR_SEASON 无法提取（硬失败，不是跳过）" >&2
    exit 2
  fi
  CUR_SEASON="$(awk 'NR==1&&/^---$/{fm=1;next} fm&&/^---$/{exit} fm&&/^season:[ ]/{sub(/^season:[ ]*/,"");print;exit}' "${apply}")"
  if [ -z "${CUR_SEASON}" ]; then
    echo "🔴 ${apply} 里读不到 season 字段——CUR_SEASON 无法提取（硬失败，不是跳过）" >&2
    exit 2
  fi

  hits=""
  nhit=0
  lag_notes=""
  for tgt in "${targets[@]}"; do
    rel="${tgt#${WS}/}"
    out="$(awk -v cur="${CUR_SEASON}" -v overlay="${OVERLAY}" -v rel="${rel}" '
      function eq(a,b) { return (length(a)==length(b) && index(a,b)==1) }
      BEGIN {
        secser = ENVIRON["SEC_SERIAL"]; foser = ENVIRON["FO_SERIAL"]
        ns = split(secser, srows, "\n")
        for (i=1;i<=ns;i++) { if (srows[i]=="") continue; split(srows[i], p, "\t"); nsec++; SECLIST[nsec]=p[1]; OWNER[p[1]]=p[2] }
        nf = split(foser, frows, "\n")
        for (i=1;i<=nf;i++) { if (frows[i]=="") continue; split(frows[i], p, "\t"); FILEOWNER[p[1]]=p[2] }
      }
      FNR==1 { if ($0 ~ /^---$/) { infm=1; next } }
      infm {
        if ($0 ~ /^---$/) { infm=0; next }
        if ($0 ~ /^season:/)                   { fileseason=1; next }
        if ($0 ~ /^season_downgraded:[ \t]*$/) { hastab=1; instamp=1; next }
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
      /^## / || /^#### / {
        t=$0; sub(/^#+[ ]*/,"",t); gsub(/^[^一-龥A-Za-z0-9]+/,"",t)
        if (eq(substr(t,1,length(overlay)), overlay)) next
        hit=0
        for (i=1;i<=nsec;i++) {
          s=SECLIST[i]
          if (index(t,s)==1) { PRESENT[OWNER[s]]=1; hit=1; nhitloc++; break }
        }
        if (!hit) UNMATCHED[t]=1
      }
      END {
        # 🔴 标签用纯 ASCII（FAIL/INFO/LAG/OK/UNMATCHED），不用 emoji——awk 的 == 在两个
        # 非 ASCII 多字节串之间同样会被 strcoll 判相等（实测：LC_ALL=en_US.UTF-8 下
        # "🔴"=="✅" 为真），这是坑 6 的同一族坏，只是坑 6 记录的是纯中文，这里连 emoji 也中招。
        # 下面按 $1（纯 ASCII 标签）分流到 bash，bash 层再换成人读的符号。
        v=0
        if (nsec==0) { print "FAIL\t§1.2 归属表没解析出任何一行——表头变了？"; v++ }
        if (nhitloc==0) {
          if (rel in FILEOWNER) { PRESENT[FILEOWNER[rel]]=1
            print "INFO\t本路径不按节切，owner 取 §1.1 那一行：" FILEOWNER[rel] }
          else { print "FAIL\t§1.1 里查不到路径 " rel " 的 owner"; v++ }
        }
        if (!hastab) { print "FAIL\tfrontmatter 里没有 season_downgraded 表"; v++ }
        if (fileseason) { print "FAIL\t文件级 season 字段仍在——辖区路径上出现即违规（ADR 0008 限定 4）"; v++ }
        for (k in STAMP) if (!(k in PRESENT)) { print "FAIL\t有戳而无内容：" k "——预建空行"; v++ }
        for (o in PRESENT) if (!(o in STAMP)) { print "FAIL\t有内容而无戳：" o "——漏戳（建节即戳）"; v++ }
        lag=""
        for (k in STAMP) if (!eq(STAMP[k], cur)) lag = lag " " k "(" STAMP[k] ")"
        if (v==0) {
          nn=0; ks=""
          for (k in STAMP) { nn++; ks = ks " " k }
          print "OK\t键集合恰好等于有内容的 owner 集合（" nn " 行）：" ks
        }
        if (length(lag)>0) print "LAG\t落后于 " cur " 的 owner（不是违规，是待降级）：" lag
        for (u in UNMATCHED) print "UNMATCHED\t节名过不了封闭词表前缀匹配，无 owner 可推：[" u "]——归 section-prefix-match，不归本项"
        print "VIOL=" v
      }
    ' "${tgt}")"

    viol="$(printf '%s\n' "${out}" | awk -F= '/^VIOL=/{print $2; f=1} END{if(!f) print ""}')"
    case "${viol}" in
      ''|*[!0-9]*)
        echo "🔴 ${name} 检查器内部错误：${tgt} 的 awk 没有输出合法的 VIOL= 哨兵行（得到「${viol}」）——检查器硬失败" >&2
        exit 2
        ;;
    esac
    body="$(printf '%s\n' "${out}" | grep -v '^VIOL=')"
    fail_lines="$(printf '%s\n' "${body}" | awk -F'\t' '$1=="FAIL"{print $2}')"
    lag_lines="$(printf '%s\n' "${body}" | awk -F'\t' '$1=="LAG"{print $2}')"
    if [ -n "${fail_lines}" ]; then
      while IFS= read -r fl; do
        [ -z "${fl}" ] && continue
        hits="${hits}${rel}: ${fl}
"
      done <<< "${fail_lines}"
    fi
    if [ -n "${lag_lines}" ]; then
      while IFS= read -r ll; do
        [ -z "${ll}" ] && continue
        lag_notes="${lag_notes}${rel}: ${ll}
"
      done <<< "${lag_lines}"
    fi
    nhit=$((nhit + viol))
  done

  if [ "${nhit}" -gt 0 ]; then
    printf '🔴 FAIL %s：\n%s' "${name}" "${hits}"
    fails=$((fails + 1))
  else
    echo "✅ PASS ${name}（参照物：CONTRACT.md §1.2 十节归属表 + §1.1 十四文件表机械推出的 owner 集合［源 ${CONTRACT_ROOT}，不内嵌副本、不跨分支取参照物］；apply.md 的 CUR_SEASON=${CUR_SEASON}；夹具＝evals/fixtures/violations/workspace/${name}/）"
  fi
  if [ -n "${lag_notes}" ]; then
    printf '%s' "${lag_notes}"
  fi
}

# ══════════════════════════════════════════════════════════════════════════
if [ -z "${ONLY}" ] || [ "${ONLY}" = "pseudo-safer-excludes-safer" ]; then check_pseudo_safer_excludes_safer; fi
if [ -z "${ONLY}" ] || [ "${ONLY}" = "material-keys-complete" ]; then check_material_keys_complete; fi
if [ -z "${ONLY}" ] || [ "${ONLY}" = "material-body-fixed-headings" ]; then check_material_body_fixed_headings; fi
if [ -z "${ONLY}" ] || [ "${ONLY}" = "cite-url-has-no-ellipsis" ]; then check_cite_url_has_no_ellipsis; fi
if [ -z "${ONLY}" ] || [ "${ONLY}" = "essay-cites-no-referee-claim" ]; then check_essay_cites_no_referee_claim; fi
if [ -z "${ONLY}" ] || [ "${ONLY}" = "section-prefix-match" ]; then check_section_prefix_match; fi
if [ -z "${ONLY}" ] || [ "${ONLY}" = "overlay-no-bare-lines" ]; then check_overlay_no_bare_lines; fi
if [ -z "${ONLY}" ] || [ "${ONLY}" = "subsection-under-program" ]; then check_subsection_under_program; fi
if [ -z "${ONLY}" ] || [ "${ONLY}" = "no-prebuilt-empty-section" ]; then check_no_prebuilt_empty_section; fi
if [ -z "${ONLY}" ] || [ "${ONLY}" = "drafts-imply-consent" ]; then check_drafts_imply_consent; fi
if [ -z "${ONLY}" ] || [ "${ONLY}" = "season-stamp-matches-owners" ]; then check_season_stamp_matches_owners; fi

if [ "${fails}" -gt 0 ]; then
  echo "🔴 check-workspace：${fails} 条 FAIL（CONTRACT_ROOT=${CONTRACT_ROOT} WORKSPACE_DIR=${WS}）"
  exit 1
fi
echo "✅ check-workspace：已跑的检查全部通过（CONTRACT_ROOT=${CONTRACT_ROOT} WORKSPACE_DIR=${WS}）"
