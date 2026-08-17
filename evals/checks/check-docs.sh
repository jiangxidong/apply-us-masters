#!/bin/bash
# evals/checks/check-docs.sh — docs 类检查的 runner（被测对象 = 契约 / repo 文档）
# 用法：check-docs.sh <CONTRACT_ROOT> <TARGET_ROOT> [check-name]
#   CONTRACT_ROOT = 含 CONTRACT.md 的目录（今天=某个 checkout 出 prototype/state-layer 的工作区）
#   TARGET_ROOT   = 被测对象所在目录（真目标=main 仓库根；契约类夹具测把它设成 "."，
#                   文档类夹具测把它设成对应的 evals/fixtures/violations/docs/<短名>/）
#   check-name    = 可选，只跑这一条（夹具翻红用）；省略则跑全部七条
# 规则原文不住这里——每条检查头上的指针才是唯一权威（docs/checks.md 只持名与指针，ADR 0016）。
#
# 🔴 三参弃单参兼容垫片：单参兼容 = 制度化空的零（#88 票面原话）。旧的单参用法直接报用法错误。
#
# 🔴 与 check-workspace.sh 的一处结构性不同：本脚本的「契约类」检查（path-resolves-to-owner /
# vocab-item-one-stage / split-is-declared）红测时 CONTRACT_ROOT 传的是一份「极小形状」夹具，
# 不是真契约；「文档类」检查（glossary-holds-no-owner / citation-is-partial / no-second-path-literal /
# skills-never-cite-evals）红测时 TARGET_ROOT 传的是夹具，CONTRACT_ROOT 才是真契约。
# 两侧夹具都不保证对方那个根下的文件存在，因此文件存在性判断一律放进各检查函数内部，
# 不放在脚本顶部统一判——顶部统一判会让 ONLY 模式下没被测到的那一侧目录缺文件时直接 exit 2，
# 与「ONLY 设定时只要求该检查目标文件存在」（#88 票面）矛盾。
set -u
export LC_ALL=en_US.UTF-8   # 不靠继承：LC_ALL=C 下多字节处理静默失效（docs/checks.md 坑 5）

CONTRACT_ROOT="${1:-}"
TARGET_ROOT="${2:-}"
ONLY="${3:-}"

if [ -z "${CONTRACT_ROOT}" ] || [ -z "${TARGET_ROOT}" ]; then
  echo "🔴 用法：$0 <CONTRACT_ROOT> <TARGET_ROOT> [check-name]" >&2
  exit 2
fi

# 部署树（脚本自身所在的树，不是 CONTRACT_ROOT / TARGET_ROOT）——同 check-workspace.sh 的
# GLOSSARY 惯例：词表类字面量（STAGES、split-is-declared 的 DECLARED_CUTS、skills-never-cite-evals
# 的自证①）活读脚本自己部署的那棵树，不因命令行传参而变，runner 必须住 evals/checks/。
SELFROOT="$(cd "$(dirname "$0")/../.." && pwd)"
DEPLOY_CTX="${SELFROOT}/CONTEXT.md"
if [ ! -f "${DEPLOY_CTX}" ]; then
  echo "🔴 ${DEPLOY_CTX} 不存在——脚本没有部署在含 CONTEXT.md 的树里" >&2
  exit 2
fi

VALID_CHECKS="path-resolves-to-owner vocab-item-one-stage split-is-declared glossary-holds-no-owner citation-is-partial no-second-path-literal skills-never-cite-evals"
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
# STAGES[]：部署树 CONTEXT.md「阶段」词条（`^\*\*阶段\*\* — \`stage\`` 行下一行，
# 「：」与第一个「。」之间按「 / 」切）。三条契约类检查共用；恒读部署树，与传参无关，
# 因此可以放顶层无条件提取（不会像 CONTRACT_ROOT 下的字面量那样在契约类夹具红测时读到
# 「极小形状」夹具而抽不出——部署树的 CONTEXT.md 永远是真的那份）。
# ══════════════════════════════════════════════════════════════════════════
stage_hdr_ln="$(grep -n '^\*\*阶段\*\* — `stage`$' "${DEPLOY_CTX}" | head -1 | cut -d: -f1)"
if [ -z "${stage_hdr_ln}" ]; then
  echo "🔴 字面量提取失败：${DEPLOY_CTX}「阶段」词条未命中" >&2
  exit 2
fi
stage_line="$(sed -n "$((stage_hdr_ln + 1))p" "${DEPLOY_CTX}")"
stage_seg="$(printf '%s\n' "${stage_line}" | sed -E 's/^[^：]*：//; s/。.*$//')"
STAGES=()
while IFS= read -r tok; do
  tok="$(printf '%s' "${tok}" | sed -E 's/^[[:space:]]+//; s/[[:space:]]+$//')"
  [ -n "${tok}" ] && STAGES+=("${tok}")
done < <(printf '%s\n' "${stage_seg}" | tr '/' '\n')
if [ "${#STAGES[@]}" -ne 7 ]; then
  echo "🔴 字面量提取失败：STAGES 应恰好 7 个，实得 ${#STAGES[@]} 个（[${STAGES[*]:-}]）" >&2
  exit 2
fi
stage_ok=0
for s in "${STAGES[@]}"; do [ "${s}" = "选校" ] && stage_ok=1; done
if [ "${stage_ok}" -ne 1 ]; then
  echo "🔴 词表漂移闸：选校 不在 STAGES=[${STAGES[*]}] 内——规则失去支点" >&2
  exit 2
fi

# ══════════════════════════════════════════════════════════════════════════
# 共享辅助函数（不在顶层无条件调用——它们读 CONTRACT_ROOT/CONTRACT.md，而契约类检查的
# CONTRACT_ROOT 在红测时是一份「极小形状」夹具，不保证含另一条检查要用的表；
# 因此各检查函数各自按需调用，不搬进顶层共享提取）
# ══════════════════════════════════════════════════════════════════════════

# extract_fopath <contract-file> —— 填充全局数组 FOPATH[]/FOOWNER[]：CONTRACT.md §1.1
# 十四文件表（表头含「路径」&「owner 阶段」）第 3 列首反引号 token（path）/ 第 6 列剥
# （…）与 —— 后半（owner）。刻意不过滤 owner 为空的行——path-resolves-to-owner 的爪 1
# 正要抓 owner 空的那一行（fixture 里的 notes.md）。
extract_fopath() {
  contract="$1"
  FOPATH=()
  FOOWNER=()
  fo_hdr_ln="$(grep -n '路径' "${contract}" | grep 'owner 阶段' | head -1 | cut -d: -f1)"
  if [ -z "${fo_hdr_ln}" ]; then
    echo "🔴 字面量提取失败：${contract} §1.1 文件表表头未命中（含「路径」&「owner 阶段」）" >&2
    exit 2
  fi
  fo_sep_ln=$((fo_hdr_ln + 1))
  fo_sep="$(sed -n "${fo_sep_ln}p" "${contract}")"
  case "${fo_sep}" in
    '|'*'-'*) ;;
    *)
      echo "🔴 字面量提取失败：${contract} 第 ${fo_sep_ln} 行不是分隔行——表头锚点可能命中了别处（坑 4）" >&2
      exit 2
      ;;
  esac
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
      if (length(fp)>0) print fp "\t" fo
    }
  ' "${contract}")"
  while IFS=$'\t' read -r fp fo; do
    [ -z "${fp}" ] && continue
    FOPATH+=("${fp}")
    FOOWNER+=("${fo}")
  done <<< "${fo_pairs}"
  if [ "${#FOPATH[@]}" -eq 0 ]; then
    echo "🔴 字面量提取失败：${contract} §1.1 文件表解析出 0 行" >&2
    exit 2
  fi
}

# ══════════════════════════════════════════════════════════════════════════
# 七条检查
# ══════════════════════════════════════════════════════════════════════════

# ── 1. path-resolves-to-owner（契约）───────────────────────────────────────
# 规则原文：CONTRACT.md §1.4（混合规则）＋ ADR 0008 限定 3（`append-only` 辖区）。
#
# 爪 1 —— §1.1 owner cell 解析。三条合法解析形态：
#   (a) 含 `append-only`（ADR 0008 限定 3 的封闭标记）；
#   (b) 含某个 STAGES token（自身阶段直接持有）；
#   (c) 含「按节归属」（§1.4：已有目录内新增自动继承祖先 owner——`channels/<channel_key>.md`
#       这一行本身就是「委托给 §1.2 归属表」的祖先声明，由 vocab-item-one-stage 另行校验
#       §1.2 内每个节各自恰好落 1 个 STAGES token；本条不重复验证同一信息）。
#   🔴 设计底稿原定爪 1 只认 (a)(b) 两种形态——实现前人核 §1.1 十四行发现第 5 行
#   `channels/<channel_key>.md` 的 owner cell 剥离后是「🔴 按节归属，见 §1.2」，不含任何
#   STAGES token 也不是 append-only，naive 规则下会对真契约整行翻红。逐条人读判定：这不是
#   契约违规——§1.4 原文「已有目录内新增 → 自动继承最近祖先目录的 owner」本就允许这种委托
#   写法，且 §1.2 归属表恰是这五个节 owner 的权威来源。这是设计底稿转述与 §1.4 原文的落差，
#   不是真契约的问题，故补分支 (c) 而不是让检查对真契约翻红。
#   空 cell / 字面量「所有阶段」= FAIL（ADR 0008 §1.5 注③：「所有阶段」是没有判据的万能出口）。
#
# 爪 2 —— 全文反引号路径候选扫描。候选 = 含 `/`、不含 `://`、不以 `../` `./` `/` 开头、
# charset 只含 CJK/ASCII 字母数字与 `/._-<>*…`（排除正则/awk 代码片段误入候选池，
# 如 `gsub(/^[^一-龥A-Za-z0-9]+/,"",t)`、`~ /^…$/`）。
# 扫描范围只从 `## 1. ` 起（§1）——§0「唯一权威路径」段的「反面教材」三字面量
# （`application-workspace/`、`.master-scout/`、`~/Documents/授课硕申请系统/`）引用的是
# 别的产品的坏路径，不是本契约自己的路径，把它们纳入候选会被当成「找不到 owner」误报；
# no-second-path-literal 对 docs/adr/ 的范围裁决是同一条纪律（#42 补节④）。
# 排除前缀（结构性或惯例性，理由各自见此）：
#   docs/ evals/ skills/ prototypes/ research/ .github/ .claude-plugin/ .codex-plugin/
#     .agents/ —— 仓库顶层目录，不是工作区路径（ADR 0021「谁读它」切法）；
#   sample-workspace/ —— 样例工作区，是产物不是契约路径；
#   prototype/（单数）—— git 分支命名惯例（如 `prototype/state-layer`），与 prototypes/
#     （复数，仓库目录）字面不同，同样与 owner 表无关。
# 排除字面量（逐条人核取自本票 TDD 干跑，非结构性、各自独立理由）：
#   N/A —— §4.6「写不满的自由文本列留真空格」句里的占位符举例（无 / N/A / —），不是路径；
#   unsorted/ —— §1.3「否掉 unsorted/」，是明确否决、永不创建的假想目录，不是需要 owner 的路径。
# 归一化：§1.1 每条路径截到第一个模板/glob 段（含 `<`、`*`、`…`）之前得到前缀规则
# （自动派生，覆盖设计底稿手写的 5 条——干跑发现 `materials/README.md` 一类候选按底稿
# 手写的 5 条会漏判，`materials/*.md` 同样需要截出 `materials/` 前缀，改自动派生后一并覆盖）。
# 另补 3 条人核别名（§1.1 原文多处省略祖先前缀）：
#   _versions/ —— 别名 essays/canonical/_versions/（§5「_versions/README.md」
#     「_versions/<name>.vN.md」等多处在「essays/canonical/」语境已确立后省略祖先前缀）；
#   cv/ identity/ —— documents/<槽位>/… 的槽位子目录别名（§1.3 树状图；行内
#     「§1.3 `cv/`」句自陈出处）。
# 解析 ⇔ 全等 §1.1 路径，或候选是某条派生前缀/别名的祖先-或-自身，或候选（以 `/` 结尾时）
# 本身是某条 §1.1 路径的祖先目录——最宽的一条分支，专为裸引用 `essays/` 而设：
# §1.1 第 433 行「它只支撑『`materials/` 不该住在 `essays/` 下』」用 `essays/` 泛指
# essays/canonical/ 整个家族（本契约不存在任何 essays/canonical/ 之外的 essays/* 声明路径），
# 是全文唯一一处比派生前缀更「浅」的合法候选，其余情形都落在派生前缀/别名两条分支内。
# 失败 = FAIL；候选 <5 = exit 2（提取机制活性自证）。
check_path_resolves_to_owner() {
  name="path-resolves-to-owner"
  contract="${CONTRACT_ROOT}/CONTRACT.md"
  if [ ! -f "${contract}" ]; then
    echo "🔴 ${contract} 不存在——CONTRACT_ROOT 给错了" >&2
    exit 2
  fi
  extract_fopath "${contract}"

  hits=""
  nhit=0

  # 爪 1
  for i in "${!FOPATH[@]}"; do
    path="${FOPATH[$i]}"
    owner="${FOOWNER[$i]}"
    resolved=0
    if [ -z "${owner}" ] || [ "${owner}" = "所有阶段" ]; then
      resolved=0
    elif printf '%s' "${owner}" | grep -qF -- 'append-only'; then
      resolved=1
    elif printf '%s' "${owner}" | grep -qF -- '按节归属'; then
      resolved=1
    else
      for tok in "${STAGES[@]}"; do
        if printf '%s' "${owner}" | grep -qF -- "${tok}"; then
          resolved=1
          break
        fi
      done
    fi
    if [ "${resolved}" -ne 1 ]; then
      hits="${hits}§1.1: 路径「${path}」owner 列「${owner}」解析不出 STAGES token / append-only / 按节归属委托
"
      nhit=$((nhit + 1))
    fi
  done

  # 爪 2
  sec1_ln="$(grep -n '^## 1\. ' "${contract}" | head -1 | cut -d: -f1)"
  if [ -z "${sec1_ln}" ]; then
    echo "🔴 字面量提取失败：${contract} 找不到「## 1. 」起始的 §1 标题——候选扫描范围无法界定" >&2
    exit 2
  fi

  EXCLUDED_PREFIXES="docs/ evals/ skills/ prototypes/ research/ sample-workspace/ .github/ .claude-plugin/ .codex-plugin/ .agents/ prototype/"
  EXCLUDED_LITERALS="N/A unsorted/"

  RESOLVE_PREFIXES=()
  for fp in "${FOPATH[@]}"; do
    if [[ "${fp}" == *"<"* || "${fp}" == *"*"* || "${fp}" == *"…"* ]]; then
      prefix="$(printf '%s' "${fp}" | awk -F'/' '{
        out=""
        for (i=1;i<NF+1;i++) { if ($i ~ /[<*…]/) break; out = out $i "/" }
        print out
      }')"
      [ -n "${prefix}" ] && RESOLVE_PREFIXES+=("${prefix}")
    fi
  done
  RESOLVE_PREFIXES+=("_versions/" "cv/" "identity/")

  candidates="$(awk -v start="${sec1_ln}" -F'`' '
    NR>=start {
      if ($0 ~ /^```/) next
      for (i=2; i<=NF; i+=2) {
        tok = $i
        if (index(tok, "/") == 0) continue
        if (index(tok, "://") > 0) continue
        if (substr(tok,1,3) == "../" || substr(tok,1,2) == "./" || substr(tok,1,1) == "/") continue
        t2 = tok
        gsub(/[一-龥A-Za-z0-9\/._<>*…-]/, "", t2)
        if (length(t2) > 0) continue
        print tok
      }
    }
  ' "${contract}" | sort -u)"

  ncand="$(printf '%s\n' "${candidates}" | grep -c '.')"
  if [ "${ncand}" -lt 5 ]; then
    echo "🔴 ${name} 候选提取异常：${contract} §1 起全文候选 token 仅 ${ncand} 个（应 ≥5，提取机制本身活性自证）——检查器硬失败" >&2
    exit 2
  fi

  while IFS= read -r tok; do
    [ -z "${tok}" ] && continue

    excluded=0
    for p in ${EXCLUDED_PREFIXES}; do
      case "${tok}" in "${p}"*) excluded=1 ;; esac
    done
    for p in ${EXCLUDED_LITERALS}; do
      [ "${tok}" = "${p}" ] && excluded=1
    done
    [ "${excluded}" -eq 1 ] && continue

    resolved=0
    for ep in "${FOPATH[@]}"; do
      [ "${tok}" = "${ep}" ] && resolved=1 && break
    done
    if [ "${resolved}" -ne 1 ]; then
      for rp in "${RESOLVE_PREFIXES[@]}"; do
        case "${tok}" in "${rp}"*) resolved=1 && break ;; esac
      done
    fi
    if [ "${resolved}" -ne 1 ]; then
      case "${tok}" in
        */)
          for ep in "${FOPATH[@]}"; do
            case "${ep}" in "${tok}"*) resolved=1 && break ;; esac
          done
          ;;
      esac
    fi

    if [ "${resolved}" -ne 1 ]; then
      hits="${hits}§1+: 反引号路径候选「${tok}」解析不到 §1.1 任何声明路径（全等/前缀/祖先）
"
      nhit=$((nhit + 1))
    fi
  done <<< "${candidates}"

  if [ "${nhit}" -gt 0 ]; then
    printf '🔴 FAIL %s：\n%s' "${name}" "${hits}"
    fails=$((fails + 1))
  else
    echo "✅ PASS ${name}（参照物：STAGES=[${STAGES[*]}]［源部署树 ${DEPLOY_CTX}］＋ CONTRACT.md §1.1 十四文件表 FOPATH/FOOWNER（${#FOPATH[@]} 行，候选 ${ncand} 个，均解析）［源 ${CONTRACT_ROOT}］；夹具＝evals/fixtures/violations/docs/${name}/）"
  fi
}

# ── 2. vocab-item-one-stage（契约）─────────────────────────────────────────
# 规则原文：CONTRACT.md §1.2 的十节归属表。
# 已声明边界：只看第 5 格（owner 阶段列），不看第 4 格（消费列——行 1「平台与账号」、
# 行 5「AI 使用政策」在第 4 格都写着两个阶段，「谁的决策依赖它」允许多消费方，本条判据不
# 是它；owner 阶段列才是「唯一写入者」判据本体）。节名去重后逐节判——覆盖层等原因造成
# 同名节多次出现时不重复计违规。
check_vocab_item_one_stage() {
  name="vocab-item-one-stage"
  contract="${CONTRACT_ROOT}/CONTRACT.md"
  if [ ! -f "${contract}" ]; then
    echo "🔴 ${contract} 不存在——CONTRACT_ROOT 给错了" >&2
    exit 2
  fi
  sec_hdr_ln="$(grep -n '法定节' "${contract}" | grep 'owner 阶段' | head -1 | cut -d: -f1)"
  if [ -z "${sec_hdr_ln}" ]; then
    echo "🔴 字面量提取失败：${contract} §1.2 十节归属表表头未命中（含「法定节」&「owner 阶段」）" >&2
    exit 2
  fi
  sec_sep_ln=$((sec_hdr_ln + 1))
  sec_sep="$(sed -n "${sec_sep_ln}p" "${contract}")"
  case "${sec_sep}" in
    '|'*'-'*) ;;
    *)
      echo "🔴 字面量提取失败：${contract} 第 ${sec_sep_ln} 行不是分隔行——表头锚点可能命中了别处（坑 4）" >&2
      exit 2
      ;;
  esac
  sec_start=$((sec_hdr_ln + 2))
  rows="$(awk -v start="${sec_start}" '
    NR>=start {
      if ($0 !~ /^\|/) exit
      if ($0 ~ /^\|[-| ]+\|$/) next
      split($0, c, "|")
      sec=c[3]; own=c[5]
      gsub(/[`*]/,"",sec); gsub(/^[ \t]+/,"",sec); gsub(/[ \t]+$/,"",sec)
      gsub(/[`*]/,"",own); sub(/（.*/,"",own); gsub(/^[ \t]+/,"",own); gsub(/[ \t]+$/,"",own)
      if (length(sec)>0) print sec "\t" own
    }
  ' "${contract}")"

  hits=""
  nhit=0
  nrow=0
  seen_secs=""
  while IFS=$'\t' read -r sec own; do
    [ -z "${sec}" ] && continue
    case "${seen_secs}" in
      *"|${sec}|"*) continue ;;
    esac
    seen_secs="${seen_secs}|${sec}|"
    nrow=$((nrow + 1))
    n=0
    for tok in "${STAGES[@]}"; do
      if printf '%s' "${own}" | grep -qF -- "${tok}"; then
        n=$((n + 1))
      fi
    done
    if [ "${n}" -ne 1 ]; then
      hits="${hits}§1.2: 节「${sec}」owner 列「${own}」命中 ${n} 个 STAGES token（应恰 1）
"
      nhit=$((nhit + 1))
    fi
  done <<< "${rows}"

  if [ "${nrow}" -eq 0 ]; then
    echo "🔴 字面量提取失败：${contract} §1.2 归属表解析出 0 行" >&2
    exit 2
  fi

  if [ "${nhit}" -gt 0 ]; then
    printf '🔴 FAIL %s：\n%s' "${name}" "${hits}"
    fails=$((fails + 1))
  else
    echo "✅ PASS ${name}（参照物：STAGES=[${STAGES[*]}]［源部署树 ${DEPLOY_CTX}］＋ CONTRACT.md §1.2 十节归属表 owner 列（${nrow} 节，去重后）［源 ${CONTRACT_ROOT}］；不看第 4 格消费列；夹具＝evals/fixtures/violations/docs/${name}/）"
  fi
}

# ── 3. split-is-declared（契约）────────────────────────────────────────────
# 规则原文：ADR 0008 限定 1 的防蔓延闸。
# DECLARED_CUTS：部署树 ADR 0008（grep 含「已声明的切法有」或「合法切法有」行 head -1，
# 「：」后按「、」切，各段首反引号 token）。闸：恰 3 且 `claims.md` ∈。
# 多写入者行判据：owner cell 含「按节」/「按行」/「按列」，或折叠后 ≥2 个不同 STAGES 单元
# （「冷启动 / 画像」连体折叠为一单元——不折叠会让 profile.md 假阳性：它的 owner cell 是
# 「冷启动 / 画像；其他阶段只读」，字面两个 STAGES token 但契约把它当单 owner 处理；
# claims.md 因另含「文书」，折叠后仍是 2 个不同单元，正确判多写）。
# 多写路径须落 DECLARED_CUTS（全等或以某条 cut 为前缀）。
check_split_is_declared() {
  name="split-is-declared"
  contract="${CONTRACT_ROOT}/CONTRACT.md"
  if [ ! -f "${contract}" ]; then
    echo "🔴 ${contract} 不存在——CONTRACT_ROOT 给错了" >&2
    exit 2
  fi
  extract_fopath "${contract}"

  adr8="${SELFROOT}/docs/adr/0008-the-owner-binds-to-a-section-not-a-file.md"
  if [ ! -f "${adr8}" ]; then
    echo "🔴 ${adr8} 不存在——DECLARED_CUTS 无法提取" >&2
    exit 2
  fi
  cuts_line="$(grep '已声明的切法有\|合法切法有' "${adr8}" | head -1)"
  if [ -z "${cuts_line}" ]; then
    echo "🔴 字面量提取失败：${adr8}「已声明的切法有」/「合法切法有」行未命中" >&2
    exit 2
  fi
  cuts_seg="$(printf '%s\n' "${cuts_line}" | sed -E 's/^[^：]*：//')"
  DECLARED_CUTS=()
  while IFS= read -r part; do
    tok="$(printf '%s\n' "${part}" | grep -oE '`[^`]+`' | head -1 | tr -d '`')"
    [ -n "${tok}" ] && DECLARED_CUTS+=("${tok}")
  done < <(printf '%s\n' "${cuts_seg}" | sed 's/、/\n/g')
  if [ "${#DECLARED_CUTS[@]}" -ne 3 ]; then
    echo "🔴 字面量提取失败：DECLARED_CUTS 应恰好 3 个，实得 ${#DECLARED_CUTS[@]} 个（[${DECLARED_CUTS[*]:-}]）" >&2
    exit 2
  fi
  cuts_ok=0
  for c in "${DECLARED_CUTS[@]}"; do [ "${c}" = "claims.md" ] && cuts_ok=1; done
  if [ "${cuts_ok}" -ne 1 ]; then
    echo "🔴 词表漂移闸：claims.md 不在 DECLARED_CUTS=[${DECLARED_CUTS[*]}] 内——规则失去支点" >&2
    exit 2
  fi

  hits=""
  nhit=0
  for i in "${!FOPATH[@]}"; do
    path="${FOPATH[$i]}"
    owner="${FOOWNER[$i]}"
    is_multi=0
    if printf '%s' "${owner}" | grep -qE '按节|按行|按列'; then
      is_multi=1
    fi
    units=""
    for tok in "${STAGES[@]}"; do
      if printf '%s' "${owner}" | grep -qF -- "${tok}"; then
        folded="${tok}"
        case "${tok}" in
          冷启动|画像) folded="冷启动／画像" ;;
        esac
        case "${units}" in
          *"|${folded}|"*) ;;
          *) units="${units}|${folded}|" ;;
        esac
      fi
    done
    npipes="$(printf '%s' "${units}" | tr -dc '|' | wc -c)"
    nunits=$((npipes / 2))
    if [ "${nunits}" -ge 2 ]; then is_multi=1; fi

    if [ "${is_multi}" -eq 1 ]; then
      ok=0
      for cut in "${DECLARED_CUTS[@]}"; do
        if [ "${path}" = "${cut}" ]; then ok=1; break; fi
        case "${path}" in "${cut}"*) ok=1 && break ;; esac
      done
      if [ "${ok}" -ne 1 ]; then
        hits="${hits}§1.1: 多写入者路径「${path}」（owner「${owner}」）未落 DECLARED_CUTS=[${DECLARED_CUTS[*]}]
"
        nhit=$((nhit + 1))
      fi
    fi
  done

  if [ "${nhit}" -gt 0 ]; then
    printf '🔴 FAIL %s：\n%s' "${name}" "${hits}"
    fails=$((fails + 1))
  else
    echo "✅ PASS ${name}（参照物：ADR 0008 限定 1「已声明的切法有三种」DECLARED_CUTS=[${DECLARED_CUTS[*]}]［源部署树 ${adr8}］＋ CONTRACT.md §1.1 owner 列［源 ${CONTRACT_ROOT}］；「冷启动 / 画像」折叠为一单元；夹具＝evals/fixtures/violations/docs/${name}/）"
  fi
}

# ── 4. glossary-holds-no-owner（repo 文档）─────────────────────────────────
# 规则原文：ADR 0011 决定 ①② 及其 Consequences 的机械形态句。
# 三参改造：被测对象从命令行单参 TARGET_ROOT 改读 ${TARGET_ROOT}/CONTEXT.md；判定逻辑
# 1:1 保留（#75 落地版），未改一行。
# 只扫真表头（紧跟 |---| 分隔行的那一行——坑 4）；中文比较不用 awk ==（坑 6），用 ~ 做包含匹配。
# 已知边界（本次不修）：列名同义词、全角变体不在 ADR 0011 锁定的机械形态内；无分隔行的管道块
# 不是 GFM 表格，不在「列」的定义内。
check_glossary_holds_no_owner() {
  name="glossary-holds-no-owner"
  ctx="${TARGET_ROOT}/CONTEXT.md"
  if [ ! -f "${ctx}" ]; then
    echo "🔴 ${ctx} 不存在——TARGET_ROOT 给错了" >&2
    exit 2
  fi
  hits="$(awk '
    prev != "" && /^[ ]*\|[[:space:] :|-]*-/ {
      if (prev ~ /[Oo][Ww][Nn][Ee][Rr]/ || prev ~ /阶段/) print pn": "prev
    }
    { prev = $0; pn = NR }
  ' "${ctx}")"
  if [ -n "${hits}" ]; then
    printf '🔴 FAIL %s：表头出现 owner／阶段列（归属住契约，不住词汇表）\n%s\n' "${name}" "${hits}"
    fails=$((fails+1))
  else
    echo "✅ PASS ${name}（参照物：ADR 0011 决定 ①② 的规则语句 ＋ evals/fixtures/violations/docs/${name}/ 的翻红夹具，均不随被测文件一起改动；被测＝${ctx}［源 ${TARGET_ROOT}］）"
  fi
}

# ── 5. citation-is-partial（repo 文档，双根）───────────────────────────────
# 规则原文：ADR 0011「引用配额」＋ #42 补节⑤（精确机械形态）。
# ${CONTRACT_ROOT}/CONTRACT.md 定位「不落盘的派生视图」段（至空行）；清洗：循环 gsub 删中文
# 括号旁注、剥 **、按「、」切、trim、去尾「。」→ ITEMS。闸：≥10 且「待核实清单」∈、
# 「STEM 资格」∈。${TARGET_ROOT}/CONTEXT.md 切「派生视图」词条正文（下一 `**词条** — ` 行前）；
# 切不出 = exit 2。逐项 grep -F 全名，命中 = FAIL。今日真目标应绿（三反例不在名单内，#42 已验证）。
check_citation_is_partial() {
  name="citation-is-partial"
  contract="${CONTRACT_ROOT}/CONTRACT.md"
  ctx="${TARGET_ROOT}/CONTEXT.md"
  if [ ! -f "${contract}" ]; then
    echo "🔴 ${contract} 不存在——CONTRACT_ROOT 给错了" >&2
    exit 2
  fi
  if [ ! -f "${ctx}" ]; then
    echo "🔴 ${ctx} 不存在——TARGET_ROOT 给错了" >&2
    exit 2
  fi

  blk_ln="$(grep -n '^\*\*不落盘的派生视图\*\*' "${contract}" | head -1 | cut -d: -f1)"
  if [ -z "${blk_ln}" ]; then
    echo "🔴 字面量提取失败：${contract}「不落盘的派生视图」段未命中" >&2
    exit 2
  fi
  end_ln="$(awk -v start="${blk_ln}" 'NR>start && $0 ~ /^[ \t]*$/ {print NR; exit}' "${contract}")"
  if [ -z "${end_ln}" ]; then
    echo "🔴 字面量提取失败：${contract}「不落盘的派生视图」段收不到空行" >&2
    exit 2
  fi
  block="$(sed -n "${blk_ln},$((end_ln - 1))p" "${contract}" | tr '\n' ' ')"
  cleaned="$(printf '%s' "${block}" | sed -E 's/\*\*不落盘的派生视图\*\*//')"
  for _pass in 1 2 3; do
    cleaned="$(printf '%s' "${cleaned}" | sed -E 's/（[^（）]*）//g')"
  done
  cleaned="$(printf '%s' "${cleaned}" | sed -E 's/\*\*//g')"
  cleaned="$(printf '%s' "${cleaned}" | sed -E 's/^[^：]*：//')"

  ITEMS=()
  while IFS= read -r item; do
    item="$(printf '%s' "${item}" | sed -E 's/^[[:space:]]+//; s/[[:space:]]+$//; s/。$//')"
    [ -n "${item}" ] && ITEMS+=("${item}")
  done < <(printf '%s\n' "${cleaned}" | sed 's/、/\n/g')

  if [ "${#ITEMS[@]}" -lt 10 ]; then
    echo "🔴 字面量提取失败：ITEMS 应 ≥10 个，实得 ${#ITEMS[@]} 个（[${ITEMS[*]:-}]）" >&2
    exit 2
  fi
  dcq_ok=0
  stem_ok=0
  for it in "${ITEMS[@]}"; do
    [ "${it}" = "待核实清单" ] && dcq_ok=1
    [ "${it}" = "STEM 资格" ] && stem_ok=1
  done
  if [ "${dcq_ok}" -ne 1 ] || [ "${stem_ok}" -ne 1 ]; then
    echo "🔴 契约漂移闸：待核实清单/STEM 资格 不在 CONTRACT.md「不落盘的派生视图」ITEMS=[${ITEMS[*]}] 内——规则失去支点" >&2
    exit 2
  fi

  hdr_ln="$(grep -n '^\*\*派生视图\*\* — ' "${ctx}" | head -1 | cut -d: -f1)"
  if [ -z "${hdr_ln}" ]; then
    echo "🔴 ${ctx}「派生视图」词条未命中——TARGET_ROOT 给错了或词条缺失" >&2
    exit 2
  fi
  body_end_ln="$(awk -v start="${hdr_ln}" 'NR>start && /^\*\*[^*]+\*\* — /{print NR; exit}' "${ctx}")"
  if [ -z "${body_end_ln}" ]; then
    echo "🔴 ${ctx}「派生视图」词条切不出下一词条边界——正文范围无法界定" >&2
    exit 2
  fi
  body="$(sed -n "${hdr_ln},$((body_end_ln - 1))p" "${ctx}")"

  hits=""
  nhit=0
  for it in "${ITEMS[@]}"; do
    if printf '%s' "${body}" | grep -qF -- "${it}"; then
      hits="${hits}${ctx}「派生视图」词条正文命中 CONTRACT.md §1.5 名单项「${it}」——引用配额判据禁止全枚举（ADR 0011 #42 补节）
"
      nhit=$((nhit + 1))
    fi
  done

  if [ "${nhit}" -gt 0 ]; then
    printf '🔴 FAIL %s：\n%s' "${name}" "${hits}"
    fails=$((fails + 1))
  else
    echo "✅ PASS ${name}（参照物：CONTRACT.md §1.5「不落盘的派生视图」ITEMS（${#ITEMS[@]} 项）［源 ${CONTRACT_ROOT}］；被测＝${ctx}「派生视图」词条正文［源 ${TARGET_ROOT}］；夹具＝evals/fixtures/violations/docs/${name}/）"
  fi
}

# ── 6. no-second-path-literal（repo 文档）──────────────────────────────────
# 规则原文：CONTRACT.md §0 ＋ ADR 0008 Consequences「归属表搬走」段。曾用号 #14 F4。
# 爪 1：${TARGET_ROOT}/CONTEXT.md ＋ skills/ 全树禁闭集 pattern。四条固定裁决（契约里没有
# 「用户本机绝对路径」这句话的权威住所，无处可活读，故硬写死——逐条理由见此）：
#   ~/ /Users/ /home/ $HOME ${HOME}（花括号变体，$HOME 与 ${HOME} 是同一变量的两种写法，
#     bare 形式抓不住花括号形式）—— 用户本机绝对路径的写法（§0「唯一权威路径」判据的反面）。
# 另 3 条活读 ${CONTRACT_ROOT}/CONTRACT.md §0「反面教材：」行（跨行收两行，取该行全部
# 以 `/` 结尾的反引号 token）——不内嵌复刻（ADR 0017 自相对形状 / #88 AC ①）：这三个字面量
# 本身就是 §0「反面教材」段点名的坏设计（`taught-master-applications-skill` 的
# `application-workspace/`、`.master-scout/`、`~/Documents/授课硕申请系统/`），该段文字
# 一旦改写，本条的抓取面必须跟着变，硬编码会让抓取面悄悄过期。闸：恰 3 且
# `application-workspace/` ∈ 集合。
# 范围裁决：docs/adr/ 不在辖区——取证记录合法引用反面教材，同 #42 补节④同一纪律。
# 爪 2：CONTEXT.md「skill」词条正文零含 / 或 .md 结尾的反引号 token。
check_no_second_path_literal() {
  name="no-second-path-literal"
  contract="${CONTRACT_ROOT}/CONTRACT.md"
  ctx="${TARGET_ROOT}/CONTEXT.md"
  if [ ! -f "${contract}" ]; then
    echo "🔴 ${contract} 不存在——CONTRACT_ROOT 给错了" >&2
    exit 2
  fi
  if [ ! -f "${ctx}" ]; then
    echo "🔴 ${ctx} 不存在——TARGET_ROOT 给错了" >&2
    exit 2
  fi

  neg_ln="$(grep -n '反面教材' "${contract}" | head -1 | cut -d: -f1)"
  if [ -z "${neg_ln}" ]; then
    echo "🔴 字面量提取失败：${contract}「反面教材」行未命中" >&2
    exit 2
  fi
  neg_block="$(sed -n "${neg_ln},$((neg_ln + 1))p" "${contract}")"
  LITERAL3=()
  while IFS= read -r tok; do
    case "${tok}" in */) LITERAL3+=("${tok}") ;; esac
  done < <(printf '%s\n' "${neg_block}" | grep -oE '`[^`]+`' | tr -d '`')
  if [ "${#LITERAL3[@]}" -ne 3 ]; then
    echo "🔴 字面量提取失败：LITERAL3 应恰好 3 个，实得 ${#LITERAL3[@]} 个（[${LITERAL3[*]:-}]）" >&2
    exit 2
  fi
  lit3_ok=0
  for l in "${LITERAL3[@]}"; do [ "${l}" = "application-workspace/" ] && lit3_ok=1; done
  if [ "${lit3_ok}" -ne 1 ]; then
    echo "🔴 契约漂移闸：application-workspace/ 不在 ${contract}「反面教材」LITERAL3=[${LITERAL3[*]}] 内——规则失去支点" >&2
    exit 2
  fi

  PATTERNS=("~/" "/Users/" "/home/" '$HOME' '${HOME}' "${LITERAL3[0]}" "${LITERAL3[1]}" "${LITERAL3[2]}")
  scan_targets=("${ctx}")
  if [ -d "${TARGET_ROOT}/skills" ]; then
    while IFS= read -r -d '' f; do scan_targets+=("${f}"); done < <(find "${TARGET_ROOT}/skills" -type f -print0)
  fi

  hits=""
  nhit=0
  for p in "${PATTERNS[@]}"; do
    for f in "${scan_targets[@]}"; do
      while IFS=: read -r ln content; do
        [ -z "${ln}" ] && continue
        hits="${hits}${f}:${ln}: 命中封闭 pattern「${p}」——第二个路径字面量（CONTRACT.md §0）
"
        nhit=$((nhit + 1))
      done < <(grep -nF -- "${p}" "${f}" 2>/dev/null)
    done
  done

  hdr_ln="$(grep -n '^\*\*skill\*\* — ' "${ctx}" | head -1 | cut -d: -f1)"
  if [ -z "${hdr_ln}" ]; then
    echo "🔴 ${ctx}「skill」词条未命中——TARGET_ROOT 给错了或词条缺失" >&2
    exit 2
  fi
  body_end_ln="$(awk -v start="${hdr_ln}" 'NR>start && /^\*\*[^*]+\*\* — /{print NR; exit}' "${ctx}")"
  if [ -z "${body_end_ln}" ]; then
    echo "🔴 ${ctx}「skill」词条切不出下一词条边界" >&2
    exit 2
  fi
  body="$(sed -n "${hdr_ln},$((body_end_ln - 1))p" "${ctx}")"
  while IFS= read -r tok; do
    [ -z "${tok}" ] && continue
    case "${tok}" in
      *"/"*|*".md")
        hits="${hits}${ctx}「skill」词条正文含带 / 或 .md 结尾的反引号 token「${tok}」——路径字面量只许住状态层契约
"
        nhit=$((nhit + 1))
        ;;
    esac
  done < <(printf '%s\n' "${body}" | grep -oE '`[^`]+`' | tr -d '`')

  if [ "${nhit}" -gt 0 ]; then
    printf '🔴 FAIL %s：\n%s' "${name}" "${hits}"
    fails=$((fails + 1))
  else
    echo "✅ PASS ${name}（参照物：四条本机绝对路径写法［契约外固定裁决，不随被测文件改动］＋ CONTRACT.md §0「反面教材」LITERAL3=[${LITERAL3[*]}]［源 ${CONTRACT_ROOT}］；被测＝${ctx}＋${TARGET_ROOT}/skills/ 全树［源 ${TARGET_ROOT}］；docs/adr/ 不在辖区；夹具＝evals/fixtures/violations/docs/${name}/）"
  fi
}

# ── 7. skills-never-cite-evals（repo 文档）─────────────────────────────────
# 规则原文：ADR 0010 流向红线。曾用号 #14 G5。
# 自证一：grep -c 'evals/' ${SELFROOT}/docs/checks.md ≥1，失败 = exit 2。
# 自证二：${TARGET_ROOT}/skills/ 存在且 SKILL.md ≥1，否则 exit 2——「空的零不是合规的零」
# （ADR 0021：skills/ 建起来之前 grep 零命中是恒真的绿，不是合规的绿）。
# 执法：grep -rn 'evals/' ${TARGET_ROOT}/skills/ 全树非空 = FAIL，逐条报（比 ADR 0010 红线宽——
# skills/ 内任何文件都被 agent 读走，本条头注释声明加严）。README 在仓库根天然不在辖区
# （本条只扫 ${TARGET_ROOT}/skills/ 之内）。
check_skills_never_cite_evals() {
  name="skills-never-cite-evals"
  checksmd="${SELFROOT}/docs/checks.md"

  n1="$(grep -c 'evals/' "${checksmd}" 2>/dev/null || true)"
  n1="${n1:-0}"
  if [ "${n1}" -lt 1 ]; then
    echo "🔴 自证失败：'evals/' 在 ${checksmd} 命中 ${n1} 次（应 ≥1）——pattern 本身失效，检查器硬失败" >&2
    exit 2
  fi

  skdir="${TARGET_ROOT}/skills"
  n2=0
  if [ -d "${skdir}" ]; then
    n2="$(find "${skdir}" -name 'SKILL.md' | grep -c '.' || true)"
    n2="${n2:-0}"
  fi
  if [ "${n2}" -lt 1 ]; then
    echo "🔴 ${skdir} 不存在或零个 SKILL.md——空的零不是合规的零（ADR 0021），检查器硬失败" >&2
    exit 2
  fi

  hits=""
  nhit=0
  while IFS=: read -r f ln content; do
    [ -z "${f}" ] && continue
    hits="${hits}${f}:${ln}: 出现 evals/ 引用（ADR 0010 流向红线：任何 SKILL.md 不得引用 evals/）
"
    nhit=$((nhit + 1))
  done < <(grep -rn 'evals/' "${skdir}" 2>/dev/null)

  if [ "${nhit}" -gt 0 ]; then
    printf '🔴 FAIL %s：\n%s' "${name}" "${hits}"
    fails=$((fails + 1))
  else
    echo "✅ PASS ${name}（参照物：ADR 0010 流向红线［契约外固定裁决，不随被测文件改动］；自证① 'evals/' 在 docs/checks.md 命中 ${n1} 次［源部署树 ${SELFROOT}］自证② ${skdir} 含 ${n2} 个 SKILL.md［源 ${TARGET_ROOT}］；夹具＝evals/fixtures/violations/docs/${name}/）"
  fi
}

# ══════════════════════════════════════════════════════════════════════════
if [ -z "${ONLY}" ] || [ "${ONLY}" = "path-resolves-to-owner" ]; then check_path_resolves_to_owner; fi
if [ -z "${ONLY}" ] || [ "${ONLY}" = "vocab-item-one-stage" ]; then check_vocab_item_one_stage; fi
if [ -z "${ONLY}" ] || [ "${ONLY}" = "split-is-declared" ]; then check_split_is_declared; fi
if [ -z "${ONLY}" ] || [ "${ONLY}" = "glossary-holds-no-owner" ]; then check_glossary_holds_no_owner; fi
if [ -z "${ONLY}" ] || [ "${ONLY}" = "citation-is-partial" ]; then check_citation_is_partial; fi
if [ -z "${ONLY}" ] || [ "${ONLY}" = "no-second-path-literal" ]; then check_no_second_path_literal; fi
if [ -z "${ONLY}" ] || [ "${ONLY}" = "skills-never-cite-evals" ]; then check_skills_never_cite_evals; fi

if [ "${fails}" -gt 0 ]; then
  echo "🔴 check-docs：${fails} 条 FAIL（CONTRACT_ROOT=${CONTRACT_ROOT} TARGET_ROOT=${TARGET_ROOT}）"
  exit 1
fi
echo "✅ check-docs：已跑的检查全部通过（CONTRACT_ROOT=${CONTRACT_ROOT} TARGET_ROOT=${TARGET_ROOT}）"
