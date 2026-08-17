# 样例档案（persona）回归 fixture

**快照日期：2026-08-17。** 本目录下的一切——`profile.md` / `claims.md` / `materials/` / `essays/` /
`recommenders.md` / `documents/` 与三个新增渠道文件（`utdallas--ecs.md` / `northeastern--khoury.md` / `umich--rackham.md`）——
都是**某一时刻的状态快照**，不是现况。三所复用渠道（Columbia / Cornell / UIUC）沿用 `prototype/state-layer`
`sample-workspace/` 的既有 `✓` 事实（2026-08 取回），三所新增渠道的 `✓` 事实取自 `research/*` 分支的真实取回记录
（见下「播种来源」）。**这份 fixture 会随时间脱节——那是有意的**（[#14](https://github.com/jiangxidong/EduApplication/issues/14) §8）。

## 权威来源

- **[#14](https://github.com/jiangxidong/EduApplication/issues/14)**：八轴定义、三 persona 设定、6 项目共享池、英语成绩三值锁死、
  断言表 A–G、A6 季一致陷阱、G4 判别式、§6 共享事实层防镜像——本 fixture 结构与内容的唯一权威。
- **[#87](https://github.com/jiangxidong/EduApplication/issues/87)**：本票，AC 五条。
- **[ADR 0010](../../../docs/adr/0010-personas-ignite-assertions-they-are-not-examples.md)**：persona 准入判据（去掉一个轴，就有一条断言永不触发）、
  正向生成红线（写不出维度组合的档案 = 它来自某个真人）、单向阀（`工作区 → 产品 repo` 与 `repo → SKILL.md` 双向禁流）。
- **`CONTRACT.md`**（`prototype/state-layer` 分支 `prototypes/state-workspace-v0/CONTRACT.md`）：文件契约唯一权威，
  各机械检查的规则原文均指回这里，见 `docs/checks.md`。

## 目录结构

```
evals/fixtures/personas/
  README.md                 本文件
  assertions.md             断言 → 格清单（18 格逐格覆盖计数）
  build.sh                  纯 bash/awk 离线展开脚本
  _shared/
    channels/                六渠道文件，三 persona 逐字共享
    programs.facts.md         项目池事实层（7 列，三 persona 共享）
  p1-linxiaoyu/               P1 林小雨（完整 happy path）
  p2-kuazhuanye/               P2 跨专业应届（最弱信息态）
  p3-yongjuminshenfen/          P3 985 + 永久居民（一人点亮五档）
```

**构建产物**（`build.sh` 生成，`.gitignore` 已挡：`evals/fixtures/_built/`——**不是** `evals/fixtures/personas/_build/`。
底稿曾写错这个路径，核对 `.gitignore` 既有条目后以 `_built/` 为准）：

```
evals/fixtures/_built/
  p1-linxiaoyu/   channels/ + programs.md(拼接) + apply.md/profile.md/claims.md/materials/essays/recommenders.md/documents/log.md
  p2-kuazhuanye/
  p3-yongjuminshenfen/
```

## build 用法

```sh
bash evals/fixtures/personas/build.sh
```

**必须用 `bash` 跑**（`docs/checks.md` 已知实现坑 8：zsh 对未加引号的参数展开不分词）。
脚本纯离线：不联网、不跑 agent，只做文件拼接。跑完后对每个 `_built/<persona>/` 全量跑：

```sh
CONTRACT_ROOT=<prototype/state-layer 分支的 prototypes/state-workspace-v0 checkout>
bash evals/checks/check-workspace.sh "${CONTRACT_ROOT}" evals/fixtures/_built/p1-linxiaoyu
bash evals/checks/check-workspace.sh "${CONTRACT_ROOT}" evals/fixtures/_built/p2-kuazhuanye
bash evals/checks/check-workspace.sh "${CONTRACT_ROOT}" evals/fixtures/_built/p3-yongjuminshenfen
```

CI 已把这三行接进 `.github/workflows/checks.yml` 的 `check-workspace` job（build 在前、三个工作区各全量跑在后）。

## 为什么拆成 `_shared/` + 逐 persona 判断层

`channels/` 装的是**学校事实**，与申请人无关——三个 persona 的 `channels/` 逐字相同。`programs.md` 同理拆成两半：

- **事实层**（`_shared/programs.facts.md`，7 列：`program_key`/`school`/`college`/`program`/`channel_key`/`deadline`/`evidence`）——
  三 persona 共享，只写一份。
- **判断层**（各 persona 自己的 `programs.judgments.md`，6 列：`tier`/`status`/`tier_basis`/`tier_void_if`/`pseudo_safer`/`status_note`）——
  每人一份，随申请人变化。

`build.sh` 按 `program_key` 拼接成 `CONTRACT.md` §4.6 定义的完整 13 列 `programs.md`。
判别式就是产品自己那条：**「这行字为了保持为真，需不需要被改写？需要 → 它是镜像，不许存。」**
复制三份 `channels/` 里，第二三份完全是第一份的镜像——这个切法与产品「事实与判断物理分离」的核心设计恰好同构
（[#14](https://github.com/jiangxidong/EduApplication/issues/14) §6）。

🔒 **`pseudo_safer` 是纯项目属性、零申请人输入**（`CONTEXT.md`「伪保底」），三个 persona 在同一 `program_key` 上的取值因此**恒等**：
`columbia--seas--cs-ms` = `yes`（三档都是）、`cornell--gradschool--cs-meng` = `unknown`（三档都是，未两半评估）、
其余四校 = `no`（三档都是，均有真实硬性最低线，不是「名义低方向挤」的形态）。

## 轴值 × persona

| 轴 | P1 林小雨 | P2 跨专业应届 | P3 张明睿（永久居民） |
|---|---|---|---|
| `english_score_status` | `met`（TOEFL 102，达标擦 UIUC Full 103） | `not_taken`（未考） | `taken_below`（TOEFL 105，口语 20 < Cornell 单项线 22） |
| `claim_material_coverage` | `full` | `has_zero_material_claim`（`c03`） | `full` |
| `sensitive_material` | `none` | `present`（`m02` 家庭变故，`sensitive: yes`） | `none` |
| `education_entries` | `two`（本科 i1 + 台湾交换 i2） | `one` | `one` |
| `slot_completeness` | `complete` | `missing`（仅 `transcript/i1/`） | `complete` |
| `identity_slot_occupied` | `empty` | `empty` | `occupied`（绿卡） |
| `recommender_consent` | `c_tier`（r2 已授权起草） | `b_tier_only` | `b_tier_only` |
| `cross_major` | `no` | `yes` | `no` |

## 6 项目池 key 清单

| program_key | channel_key | 池内唯一点亮 |
|---|---|---|
| `uiuc--gradcollege--mcs` | `uiuc--gradcollege` | 唯一类型 A 第二条线（校级 3.0 → 项目级 recommended 3.2）→ 唯一能产出 `safer`；语言双门槛 |
| `cornell--gradschool--cs-meng` | `cornell--gradschool` | 唯一有语言小分（S/R/L/W 分列）→ 唯一干净的 `ineligible` 触发 |
| `columbia--seas--cs-ms` | `columbia--seas` | 唯一类型 B 措辞且无区间 → `match` 天花板；伪保底 `yes` |
| `utdallas--ecs--cs-ms` | `utdallas--ecs` | 唯一单线 → `reach` 是终态的检验点 |
| `northeastern--khoury--cs-ms` | `northeastern--khoury` | 无最低线、只有 `Recommended` 措辞 → `reach` 终态第二实例，成因不同 |
| `umich--rackham--cse-ms` | `umich--rackham` | 唯一有 AI 政策条款；其余事实几乎全 `待核实`——特性不是缺陷 |

⚠️ **`uiuc--gradcollege--mcs` 与 `prototype/state-layer` `sample-workspace/` 现存的 `uiuc--gradcollege--cs-msc` 不是同一个 key**。
三份调研（`research/portal-fields`、`research/country-delta`、`research/stem-cip`）里 UIUC 只有 **MCS**（Master of Computer Science）
一个项目，`cs-msc` 那个 key 整行查不到——[#14](https://github.com/jiangxidong/EduApplication/issues/14) §4 已判「样例工作区的
「UIUC CS MSc」必须换成「UIUC MCS」」。本 fixture 因此**不复用** sample 的 key 字面量，改用 `mcs`；
`_shared/channels/uiuc--gradcollege.md` 的项目级差异节、`programs.facts.md`、`p1-linxiaoyu/essays/canonical/per-program/` 的文件名
三处同步改用 `uiuc--gradcollege--mcs`，未把 `cs-msc` 留作**任何结构性 key**——`### \`uiuc--gradcollege--cs-msc\`` 标题、
`program_key` 表格行、文件名三处 `grep -rn` 均零命中；`cs-msc` 字面量只出现在本文件与渠道文件里**解释这条分歧**的散文中
（本段与 `_shared/channels/uiuc--gradcollege.md` 文件头各一处），那是分歧记录本身必须提到旧 key 才能成立，不是遗留。

## 播种来源

**uiuc / cornell / columbia**：`✓` 事实直接复用 `prototype/state-layer` 分支 `sample-workspace/channels/*.md` 现存内容
（commit `ee1c430` 所在树，2026-08 取自 #6 的 303 行字段调研），逐字未改；仅补充下列增量（均带独立 `✓`，不动原有行）：

**精确出处（新增 / 增强的 ✓ 行，逐条列出分支:文件）**：

| 渠道文件 | 新增/增强 ✓ 事实 | 分支:文件 |
|---|---|---|
| `columbia--seas.md` | 申请费 $85 | `research/country-delta` (`2f0ec27`) `:docs/research/country-delta-uk-us-au.md` |
| `columbia--seas.md` | CIP code「官网未列」（三页均取回，均无该事实） | `research/stem-cip` (`0c36952`) `:docs/research/stem-cip-designation.md` |
| `cornell--gradschool.md` | 语言小分 Speaking≥22/Reading≥20/Listening≥15/Writing≥20；IELTS≥7.0；Tier A/B | `research/country-delta` (`2f0ec27`) `:docs/research/country-delta-uk-us-au.md` |
| `cornell--gradschool.md` | 申请费 $105，国际生同价 | `research/country-delta` (`2f0ec27`) `:docs/research/country-delta-uk-us-au.md` |
| `cornell--gradschool.md` | CIP code「官网未列」 | `research/stem-cip` (`0c36952`) `:docs/research/stem-cip-designation.md` |
| `uiuc--gradcollege.md` | 申请费 $90，国际国内同价 | `research/country-delta` (`2f0ec27`) `:docs/research/country-delta-uk-us-au.md` |
| `uiuc--gradcollege.md` | CIP=11.0701，DHS STEM 名单命中（两处均取回） | `research/stem-cip` (`0c36952`) `:docs/research/stem-cip-designation.md` |

**utdallas--ecs.md**（全新渠道文件，**5 条 ✓ 事实行**）：全部取自 `research/country-delta` (`2f0ec27`)
`:docs/research/country-delta-uk-us-au.md`——GPA `3.0 or better is expected`（唯一线）、外部学历评估不接受、
本科学历认可口径、接受 Duolingo/PTE、申请费 $75；「同时申请上限」用**官网未列**后缀（该分支明确记「未找到」）；
CIP 与本校 AI 政策未被任一研究分支覆盖，如实写**无后缀**待核实。

**northeastern--khoury.md**（全新渠道文件，**7 条 ✓ 事实行**）：全部取自 `research/country-delta` (`2f0ec27`)
`:docs/research/country-delta-uk-us-au.md`——GPA 三条并列尺子、语言建议线（不 super-score）、不接受 Duolingo、
WES 不需要（自建 FCE）、固定截止+滚动出结果并存；「学历门槛」节内引用同校 **CoE**（另一学院，仅作学院级对照，非本渠道自身事实）
的 Duolingo 接受度真实 `✓`，明确标注为对照非本渠道数据；「同时申请上限」用**官网未列**后缀。

**umich--rackham.md**（全新渠道文件，**7 条 ✓ 事实行**，全部落在 `## AI 使用政策` 一节）：取自 `research/ai-policy` (`9c1989f`)
`:docs/research/ai-use-policy-uk-us-au.md` §2.2（Rackham GenAI 政策原文、attestation、五年禁申、SOP 页交叉引用）。
**其余六节（学历门槛/费用与资格/材料上传/推荐信机制/冻结点）全部无后缀 `待核实`**——四个研究分支均未覆盖，
这是特性不是缺陷（[#14](https://github.com/jiangxidong/EduApplication/issues/14) §4）。

## 已知的与 #14 底稿的分歧（如实记账）

- **UIUC key**：见上「6 项目池 key 清单」注。
- **B14（伪保底逃生舱「经验：」前缀）**：#14 原文的措辞已被 [ADR 0015](../../../docs/adr/0015-pseudo-safer-annotates-the-users-prior-not-the-tier.md)
  推翻——「经验：」逃生舱已删除。本 fixture 按 ADR 0015 现行规则落地（两半各自要求可链接 `✓` 事实），
  见 `assertions.md` B14 行的说明，已在票内如实报告，未擅自改写 #14 原文。
- **UT Dallas 平台 / Northeastern 平台**：两校底层申请系统厂商未被任何研究分支确认，`platform:` frontmatter 字段
  如实写 `待核实`（不是留空，也不是编一个）。

## 自查

- `grep -rn '### \`uiuc--gradcollege--cs-msc\`'` 与 `grep -rn '| uiuc--gradcollege--cs-msc |'` 全树零命中（UIUC 旧 key 未留任何结构性用法；
  `cs-msc` 字面量仅出现在解释分歧的两处散文里，见上「6 项目池 key 清单」注）
- `grep -rn 'personas' skills/` 零命中（先对本文件跑同 pattern 自证非零——本文件路径与目录名多处含 `personas` 字样，自证有效）
