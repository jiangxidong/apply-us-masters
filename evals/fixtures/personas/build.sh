#!/bin/bash
# evals/fixtures/personas/build.sh —— 离线展开:共享源(_shared/) + 逐 persona 判断层 → 三个完整工作区。
# 用法:bash evals/fixtures/personas/build.sh
# 产物:evals/fixtures/_built/{p1-linxiaoyu,p2-kuazhuanye,p3-yongjuminshenfen}/(gitignored,不进仓库)
# 纯 bash/awk,不联网、不跑 agent。遵 docs/checks.md「已知的实现坑」:
#   显式 LC_ALL=en_US.UTF-8;awk 不用 ==/!=/< 比中文(program_key 是 ASCII,本脚本的哈希键安全);
#   变量插值一律 ${var};必须用 bash 跑(zsh 对未加引号的参数展开不分词)。
set -euo pipefail
export LC_ALL=en_US.UTF-8

if [ -z "${BASH_VERSION:-}" ]; then
  echo "🔴 本脚本必须用 bash 跑(zsh 对未加引号的参数展开不分词,docs/checks.md 坑 8):bash $0" >&2
  exit 2
fi

HERE="$(cd "$(dirname "$0")" && pwd)"
SHARED="${HERE}/_shared"
FACTS="${SHARED}/programs.facts.md"
OUT_ROOT="${HERE}/../_built"

if [ ! -f "${FACTS}" ]; then
  echo "🔴 ${FACTS} 不存在" >&2
  exit 2
fi

PERSONAS="p1-linxiaoyu p2-kuazhuanye p3-yongjuminshenfen"

build_programs_md() {
  persona="$1"
  src="$2"
  dst="$3"
  judg="${src}/programs.judgments.md"

  if [ ! -f "${judg}" ]; then
    echo "🔴 ${judg} 不存在" >&2
    exit 2
  fi

  # 序列化判断层(program_key\ttier\tstatus\ttier_basis\ttier_void_if\tpseudo_safer\tstatus_note,行分隔)——
  # 经 ENVIRON 传给下面的 awk,不用多行 -v(macOS awk 的 -v 解析器见到值里的换行会报错,
  # evals/checks/check-workspace.sh 顶部同一处坑的同一条规避)。
  JUDG_SERIAL="$(awk -F'|' '
    /^\|[ :-]*-/ { sep=1; next }
    sep==1 && /^\|/ {
      for (i=2;i<=8;i++) { gsub(/^[ \t]+|[ \t]+$/,"",$i) }
      print $2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8
    }
  ' "${judg}")"
  export JUDG_SERIAL

  {
    printf '%s\n' '---'
    printf '%s\n' 'season_downgraded:'
    printf '%s\n' '  选校: 2027fall'
    printf '%s\n' '---'
    printf '\n'
    printf '# 项目池(build.sh 从 _shared/programs.facts.md + %s/programs.judgments.md 拼接生成;改源文件后重新 build,勿手改本文件)\n' "${persona}"
    printf '\n'
    printf '%s\n' '| program_key | school | college | program | channel_key | tier | deadline | status | evidence | tier_basis | tier_void_if | pseudo_safer | status_note |'
    printf '%s\n' '|---|---|---|---|---|---|---|---|---|---|---|---|---|'
  } > "${dst}/programs.md"

  awk -F'|' '
    BEGIN {
      n = split(ENVIRON["JUDG_SERIAL"], rows, "\n")
      for (i = 1; i <= n; i++) {
        if (rows[i] == "") continue
        split(rows[i], c, "\t")
        JTIER[c[1]] = c[2]; JSTATUS[c[1]] = c[3]; JTB[c[1]] = c[4]
        JTV[c[1]] = c[5]; JPS[c[1]] = c[6]; JSN[c[1]] = c[7]
      }
    }
    /^\|[ :-]*-/ { sep = 1; next }
    sep == 1 && /^\|/ {
      pk = $2; sc = $3; co = $4; pr = $5; ck = $6; dl = $7; ev = $8
      gsub(/^[ \t]+|[ \t]+$/, "", pk)
      if (!(pk in JTIER)) {
        print "🔴 build.sh:program_key「" pk "」在 programs.judgments.md 里没有对应行" > "/dev/stderr"
        err = 1
        exit
      }
      printf "| %s | %s | %s | %s | %s | %s | %s | %s | %s | %s | %s | %s | %s |\n", \
        pk, sc, co, pr, ck, JTIER[pk], dl, JSTATUS[pk], ev, JTB[pk], JTV[pk], JPS[pk], JSN[pk]
    }
    END { if (err) exit 2 }
  ' "${FACTS}" >> "${dst}/programs.md"
}

rm -rf "${OUT_ROOT}"
mkdir -p "${OUT_ROOT}"

for persona in ${PERSONAS}; do
  src="${HERE}/${persona}"
  dst="${OUT_ROOT}/${persona}"

  if [ ! -d "${src}" ]; then
    echo "🔴 ${src} 不存在" >&2
    exit 2
  fi

  mkdir -p "${dst}"

  # channels/ 三 persona 逐字相同 —— 唯一权威副本是 _shared/channels/
  cp -R "${SHARED}/channels" "${dst}/channels"

  build_programs_md "${persona}" "${src}" "${dst}"

  # persona 自己的顶层文件
  for f in apply.md profile.md claims.md recommenders.md log.md; do
    if [ -f "${src}/${f}" ]; then
      cp "${src}/${f}" "${dst}/${f}"
    fi
  done

  # persona 自己的顶层目录(存在才拷 —— 不预建空目录:P2/P3 没有 recommenders/drafts/)
  for d in materials essays documents recommenders; do
    if [ -d "${src}/${d}" ]; then
      cp -R "${src}/${d}" "${dst}/${d}"
    fi
  done

  echo "✅ 已构建 ${dst}"
done

echo "✅ build.sh 完成:${PERSONAS}"
