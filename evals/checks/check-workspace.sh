#!/bin/bash
# evals/checks/check-workspace.sh — 工作区类检查的 runner（被测对象 = 某个工作区的文件内容）
# 用法：check-workspace.sh <CONTRACT_ROOT> <WORKSPACE_DIR> [check-name]
#   CONTRACT_ROOT = 含 CONTRACT.md 的目录（今天=某个 checkout 出 prototype/state-layer 的工作区）
#   WORKSPACE_DIR = 被测工作区（sample-workspace/ 或某条夹具）
#   check-name    = 可选，只跑这一条（夹具翻红用）；省略则跑全部五条
# 规则原文不住这里——每条检查头上的指针才是唯一权威（docs/checks.md 只持名与指针，ADR 0016）。
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

VALID_CHECKS="pseudo-safer-excludes-safer material-keys-complete material-body-fixed-headings cite-url-has-no-ellipsis essay-cites-no-referee-claim"
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

# ── YES：CONTRACT.md §4.6 表 `| 12 |` 且含 pseudo_safer 的行，取值域 cell 第一个反引号 token ──
yes_row="$(grep '^| 12 |' "${CONTRACT}" | grep 'pseudo_safer')"
yes_n="$(printf '%s\n' "${yes_row}" | grep -c '.')"
YES=""
if [ "${yes_n}" -eq 1 ]; then
  YES="$(printf '%s\n' "${yes_row}" | awk -F'|' '{print $4}' | grep -oE '`[^`]+`' | head -1 | tr -d '`')"
fi
if [ "${yes_n}" -ne 1 ] || [ -z "${YES}" ]; then
  echo "🔴 字面量提取失败：YES（CONTRACT.md §4.6 pseudo_safer 行命中 ${yes_n} 条，取值='${YES}'）" >&2
  exit 2
fi

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

# ══════════════════════════════════════════════════════════════════════════
# 五条检查
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
  hits="$(awk -F'|' -v YES="${YES}" '
    /^\|/ && $2 ~ /[A-Za-z0-9]--[A-Za-z0-9]/ {
      tier=$7; ps=$13
      gsub(/^[ \t]+|[ \t]+$/, "", tier); gsub(/^[ \t]+|[ \t]+$/, "", ps)
      if (ps == YES && tier == "safer") print NR": tier="tier" pseudo_safer="ps
    }
  ' "${target}")"
  if [ -n "${hits}" ]; then
    printf '🔴 FAIL %s：pseudo_safer=%s 与 tier=safer 共存（ADR 0015 禁止共存）\n%s\n' "${name}" "${YES}" "${hits}"
    fails=$((fails + 1))
  else
    echo "✅ PASS ${name}（参照物：CONTRACT.md §4.6 pseudo_safer 行取值 YES=${YES}［源 ${CONTRACT_ROOT}］＋ CONTEXT.md「分档」表 SAFER_SET 含 safer［源=main 词表］；夹具＝evals/fixtures/violations/workspace/${name}/）"
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

  mat_records=()
  for f in "${files[@]}"; do
    rec="$(awk -v k1="${KEYS[0]}" -v k2="${KEYS[1]}" -v k3="${KEYS[2]}" -v file="${f}" '
      /^---[ \t]*$/ { fm++; if (fm==2) exit; next }
      fm==1 {
        if ($0 ~ "^"k1":") { v=$0; sub("^"k1":[ \t]*","",v); mid=v }
        if ($0 ~ "^"k2":") { v=$0; sub("^"k2":[ \t]*","",v); sen=v }
        if ($0 ~ "^"k3":") {
          v=$0; sub("^"k3":[ \t]*","",v)
          gsub(/[][,]/," ",v); gsub(/  +/," ",v); sub(/^ +/,"",v); sub(/ +$/,"",v)
          vb=v; has=1
        }
      }
      END { printf "%s|%s|%s|%s|%s", mid, sen, vb, has+0, file }
    ' "${f}")"
    mat_records+=("${rec}")
  done

  # 外键子步是否需要 recommenders.md：任一素材的 verifiable_by 非空才需要。
  need_fk=0
  for rec in "${mat_records[@]}"; do
    IFS='|' read -r mid sen vb has file <<< "${rec}"
    if [ "${has}" = "1" ] && [ -n "${vb}" ]; then need_fk=1; fi
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
    IFS='|' read -r mid sen vb has file <<< "${rec}"
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
#   (a) channels/*.md 的顶层 bullet（^- 起头）首行，含 ✓ 且含 URL；
#   (b) programs.md 数据行 $10（evidence）trim 后以 ✓ 开头的 cell。
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
    done < <(grep -n '^- ' "${f}")
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
  done < <(awk -F'|' '/^\|/ && $2 ~ /[A-Za-z0-9]--[A-Za-z0-9]/' "${prog}")

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
    used="$(awk -F'[][]' '/^claims:/ {gsub(/,/," ",$2); print $2}' "${f}")"
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

# ══════════════════════════════════════════════════════════════════════════
if [ -z "${ONLY}" ] || [ "${ONLY}" = "pseudo-safer-excludes-safer" ]; then check_pseudo_safer_excludes_safer; fi
if [ -z "${ONLY}" ] || [ "${ONLY}" = "material-keys-complete" ]; then check_material_keys_complete; fi
if [ -z "${ONLY}" ] || [ "${ONLY}" = "material-body-fixed-headings" ]; then check_material_body_fixed_headings; fi
if [ -z "${ONLY}" ] || [ "${ONLY}" = "cite-url-has-no-ellipsis" ]; then check_cite_url_has_no_ellipsis; fi
if [ -z "${ONLY}" ] || [ "${ONLY}" = "essay-cites-no-referee-claim" ]; then check_essay_cites_no_referee_claim; fi

if [ "${fails}" -gt 0 ]; then
  echo "🔴 check-workspace：${fails} 条 FAIL（CONTRACT_ROOT=${CONTRACT_ROOT} WORKSPACE_DIR=${WS}）"
  exit 1
fi
echo "✅ check-workspace：已跑的检查全部通过（CONTRACT_ROOT=${CONTRACT_ROOT} WORKSPACE_DIR=${WS}）"
