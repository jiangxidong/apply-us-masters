# 仓库根就是两个运行时的 plugin 根，顶层目录按「谁会读它」切

- 状态：已接受
- 日期：2026-08-15
- 来源：[#64 发布形态](https://github.com/jiangxidong/EduApplication/issues/64)

## 背景

实现阶段第一件要知道的事是**目录建在哪**——`evals/`、`skills/`、任何 `SKILL.md` 在仓库里一行都没有（跨 8 个 ref 复核，零命中）。[#9](https://github.com/jiangxidong/EduApplication/issues/9) 已锁「四个 skill 是一个整体分发单元」，但把目录结构留给了发布形态这片 fog。

同时 [`docs/checks.md`](../checks.md) 已经**前向引用**了 `evals/checks/check-docs.sh` 与 `evals/fixtures/violations/{docs,workspace}/`——一份对不存在目录的规格。要么照它，要么显式推翻。

最自然的切法是**按内容类型**分目录（`skills/` 放 skill、`tests/` 放测试、`scripts/` 放脚本、`docs/` 放文档）。它撞两堵墙：[ADR 0016](0016-the-checklist-holds-names-and-pointers.md) 已经否掉过 `scripts/`／`tools/`（「那是红线管不到的新目录，还得再写第二条规矩去挡它」），而按类型切根本回答不了本产品最需要回答的那个问题——**哪些内容会被 agent 读到并照抄**。

## 决定

> **仓库根同时是 Claude Code plugin 根、Codex plugin 根与两边的 marketplace 根。顶层目录的切法判据是「谁会读它」，不是「它是什么」。**

四块，各有一条不可混用的判据：

| 顶层 | 谁读 | 红线 |
|---|---|---|
| `skills/` | **agent 读，且会照抄** | 只许引用**自己那个 skill 目录之内**的路径 |
| `evals/` | 谁都不读，只被跑 | 任何 `SKILL.md` 不得引用（[ADR 0010](0010-personas-ignite-assertions-they-are-not-examples.md)） |
| `docs/` | 人读 | 不被 agent 读 |
| 根文件 | 人读 ＋ 运行时读 manifest | — |

**第一约束是红线，不是运行时约定。** [ADR 0010](0010-personas-ignite-assertions-they-are-not-examples.md) 的流向红线（`evals/` → `SKILL.md` 禁流）唯一的执法形态是文本检查，而让它退化成一条 `grep -rn 'evals/' skills/` 的前提，是两者**各自是一个顶层目录、名字固定、不嵌套在对方里**。运行时恰好也要 `skills/` 在 plugin 根（Claude Code 的默认扫描目录就是 `skills/<name>/SKILL.md`；Codex plugin 同构），两个约束同向，白拿。

`docs/checks.md` 写死的 `evals/checks/` 与 `evals/fixtures/violations/{docs,workspace}/` **照单全收**。

## 三条推论

**① `skills/<name>/SKILL.md` 只许引用 `skills/<name>/` 之内的路径。** 比红线更强、更好查，且它挡的东西**在两个运行时上本来就已经不工作**：Claude Code 的 plugin 文档写着 "Copied plugins cannot reference files outside their directory. Paths that traverse outside the plugin root (such as `../shared-utils`) will not work after installation"，Codex 没有 `@import`（[codex#17401](https://github.com/openai/codex/issues/17401) 仍 OPEN）。这条不是新纪律，是把**已经不工作的东西**变成会报错的东西。它额外挡住 `docs/` 与 `CONTEXT.md`——那些是给人读的决策记录，进了 agent 上下文就会被当范本抄，与 ADR 0010「照抄它会不会出事」是同一台机器。

**② 因此 v1 不存在「共享 reference」这个物理形态。** [#9](https://github.com/jiangxidong/EduApplication/issues/9) §4 把无主的横切规则归给「共享 reference」，[#20](https://github.com/jiangxidong/EduApplication/issues/20) 又把取证红线放了进去。发布形态是第一次去看它怎么落地的地方，答案是**两个发布形态上都落不了地**（推论 ①）。清空之后，两条所谓无主的规则各自有归宿：取证红线 **#20 原判是「落在共享 reference **并且** 必须在每个 `SKILL.md` 正文里也写一遍」**（[#9](https://github.com/jiangxidong/EduApplication/issues/9) 上那条评论逐字如此）——本票删掉的是**文件那一半**，正文复述那一半**原样保留**，因此删除的代价为零；AI 政策档位是**两件东西没被拆开**——查找表与计算规则归 `pick-programs`（最早消费方），以档位为键的写作约束归 `write-essays`，跨 skill 传的是**算出来的那个值**（落工作区），不是那张表。

判别式可复用：**第二个消费方要的是「这张表」，还是「一条以这张表的输出为键的规则」？是后者 → 按消费方拆开，不共享文件。** 与 [ADR 0011](0011-the-glossary-defines-words-the-contract-holds-the-values.md)「词汇表定义词、契约持有取值」是同一刀。它也解释了当初为什么会判错：**一条规则显得无主，多半是因为它还没被拆开。**

**③ `evals/` 随 repo 分发到用户磁盘，这与 ADR 0016 不冲突——但只在两件事同时成立时。** [ADR 0016](0016-the-checklist-holds-names-and-pointers.md) 否掉过「打包进 skill、在用户机器上跑」（检查自己会写错已八次、绑 locale 且静默失效、写入后的审计救不了写入前的行为）。**分发不等于调用**：文件躺在磁盘上、且**没有任何路径通向执行它**，等价于「不在用户机器上跑」。两条：没有任何 `SKILL.md` 引用 `evals/`（红线 ＋ 推论 ①），且**安装说明里不出现任何跑 `evals/` 的命令**。

## 否决的四条

**`plugin/` 作子目录，让 `evals/` 不随分发下去。** [ADR 0010](0010-personas-ignite-assertions-they-are-not-examples.md) 明说「发布是安全的，因此应当发布——若改为不发布，MIT 开源发布的意义会打折，别人无法验证『3 档 dry-run 回归』这句验收标准」。且多一层就多一个「plugin 根 ≠ repo 根」的路径字面量，撞 `CONTRACT.md` §0。

**`scripts/` 或 `tools/` 放检查脚本。** [ADR 0016](0016-the-checklist-holds-names-and-pointers.md) 已判。

**`evals/` 进 `.gitignore`。** [ADR 0010](0010-personas-ignite-assertions-they-are-not-examples.md) 已判。

**按内容类型切顶层。** 它回答不了「哪些内容会被 agent 读到并照抄」，而那是本产品全部结构红线的共同判据。

## Consequences

**四个 skill 的目录名 = frontmatter `name`，在源树里一比一。** 竞品坑：`application-essay-skill` 的 repo 名讲 essay、frontmatter 却是 `graduate-application-research`，直接导致「帮我改 SOP」触发不到最有价值的文件（`docs/research/competitor-skills.md`）。⚠️ 这条**只管源树**——装出来叫什么由运行时的命名空间决定（Claude Code 是 `edu-application:<name>`），不归本条管。

**没有 reference 的 skill 不建 `references/`。** 承 [#23](https://github.com/jiangxidong/EduApplication/issues/23)「预建空节 = 失败」与 `CONTEXT.md` 槽位条「不预建空目录」：空目录把「没写」与「不需要」压成同一形态。

**红线的执法在 `skills/` 建起来之前是恒真的绿。** 空目录上 `grep -rn 'evals/' skills/` 必然零命中，那是**空的零，不是合规的零**——同 [ADR 0017](0017-a-check-that-compares-against-a-forkable-copy-is-vacuous.md) 那条「自相对的检查恒真」。第一张实现票跑它时必须先换一个必然命中的 pattern 自证命令有效（`docs/checks.md` 第 8 条）。

**位置可逆，判据不可逆。** 把 `evals/` 改名或搬家只要重扫引用；但「按谁会读它切」一旦成为判据，改判要重新审所有已经按它归位的内容——同 [ADR 0011](0011-the-glossary-defines-words-the-contract-holds-the-values.md) 与 [ADR 0016](0016-the-checklist-holds-names-and-pointers.md) 的自评。

**它不保证目录真的建起来。** 本条落的是决策，`skills/` 与 `evals/` 至今**一行都没有**。若始终不建，本条与 `docs/checks.md`、ADR 0010、ADR 0016 一起退化成第四份从未被执行过的散文。顶着它的只有验收标准里的 dry-run 回归。
