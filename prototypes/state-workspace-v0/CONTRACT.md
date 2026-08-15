# 状态层文件契约 v0（原型）

> **这是原型，不是定稿。** 服务于 [#4 状态层的文件契约长什么样](https://github.com/jiangxidong/EduApplication/issues/4)。
> 样例工作区见 `sample-workspace/`，里面填的是**虚构申请人 + 三所真实美国项目的真实约束**（取自 #6 的 303 行字段调研）。

---

## 0. 唯一权威路径（这一节是全文唯一声明工作区位置的地方）

> **工作区根 = 用户在会话开始时指定的那一个目录。产品不选路径，用户选。**
>
> 识别方式：该目录下存在 `apply.md`，且其 frontmatter 含 `workspace: edu-application`。
> 有 → 续上；没有 → 问用户「在这里初始化吗？」，同意后创建。
>
> **产品的任何文件、任何 SKILL.md、任何 reference 都不得再出现第二个路径字面量。**
> 所有位置一律表述为「工作区根下的 `xxx`」。

反面教材：`taught-master-applications-skill` 把工作区路径分叉成 `application-workspace/`、`.master-scout/`、
`~/Documents/授课硕申请系统/` 三套并存，SKILL.md 里两处各指定其中一套，全文无一句裁决。

**为什么不定固定路径**：用户可能已经有一个「申请」文件夹（网盘同步、iCloud、Obsidian vault）。
强行落在 `~/Documents/xxx` 会造成两套并存——这正是上面那个坑的成因。

---

## 1. 文件清单

| 路径 | 格式 | 真相源身份 | 写入归属（owner） |
|---|---|---|---|
| `apply.md` | frontmatter + 正文 | **工作区标识 + 申请季** | 冷启动阶段创建；此后**只有换季时**被改。⚠️ 不放完成度、不放待核实计数——那些是派生视图 |
| `profile.md` | frontmatter + 正文 | **申请人 canonical 事实** | 冷启动/画像阶段；其他阶段只读 |
| `programs.tsv` | TSV，11 列 | **项目池**（选校决策面） | 选校阶段；投递阶段只改 `status` 列 |
| `channels/<channel_key>.md` | Markdown | **约束层**（逐申请单元的 rendering rules） | 选校阶段落盘骨架，准备包阶段补全 |
| `essays/materials/*.md` | Markdown | **文书素材**（素材门槛在此判定） | 文书阶段 |
| `essays/canonical/*.md` | Markdown | **文书 canonical 渲染物**（当前版） | 文书阶段 |
| `essays/canonical/_versions/*.md` | Markdown | 历史版本，只增不改 | 文书阶段 |
| `documents/**` | 原始文件 | **材料 canonical**（信息量最大的一侧） | 材料阶段 |
| `recommenders.md` | Markdown | **推荐人 + 逐校机制状态**（红线区） | 推荐信阶段 |
| `packets/<program_key>/**` | 由 #8 定 | **可再生产物**，删了能重建 | 准备包阶段 |
| `log.md` | Markdown，append-only | **跨会话交接** | 每个阶段结束时追加 |

**不落盘的派生视图**（每次现算现打，绝不存文件）：
待核实清单、deadline 日历、完成度自检、每校材料缺口。

> 存一份就是第二个真相源。竞品坑 #9：合并单文件与散文件同时被安装 → 同一事实索引两遍，检索互相稀释。
> `euro-grad-apply` 的 README 自己推荐的安装路径就有这个坑。

---

## 2. 两层数据结构（直接落 #6 的 D.4 结论）

```
内容层（canonical）           约束层（rendering rules）        产物
profile.md                    channels/columbia-seas.md
essays/canonical/*     ──渲染──>  （字数/格式/合并/分辨率/     ──> packets/<program_key>/
documents/**                      冻结点/推荐信机制）
```

**核心原则**：**准备包不存「已经按某校要求做好的成品」，只存 canonical 内容 + 每校渲染规则。**

canonical 必须取**信息量更大的一侧**——降级可逆，升级不可逆：

| 内容 | canonical 存什么 | 为什么 |
|---|---|---|
| 成绩单扫描 | 高分辨率彩色，**逐页单文件** | 可降采样给 UIUC（<200dpi 灰度）、可合并给 Cornell；反过来都不行 |
| 文书 | 长文 + 250 词版 + **可拆短答题的要点** | UIUC 要的不是摘要，是 4×250 词短答题——形态不同，不能从长文自动截 |
| 学历 | 完整列表（含未毕业、辅修、交换） | 各校口径不同，多的能删，少的补不回来 |

---

## 3. 最小分叉粒度：项目，不是学校

#5 的结论：**美国最小分叉粒度是学院不是学校**（Columbia SEAS ≠ Columbia GSAS，政策与表单都不同）。
#6 进一步：UIUC 的 academic statement 字数「具体由项目定」——**项目级也有差异**。

因此两级键：

- **`program_key`** = `<school>--<college>--<program>`，例：`columbia--seas--cs-ms`
  → `programs.tsv` 的主键，`packets/` 的目录名
- **`channel_key`** = `<school>--<college>`，例：`columbia--seas`
  → `channels/` 的文件名。同一 channel 下多个项目共用 portal / 平台 / 申请费 / 上传规则。
  项目级差异写在该文件的 `## 项目级差异` 节。

**不按平台建适配层。** #6 D.3 证据六：Columbia SEAS 与 UIUC 同为 Slate，字段结构却迥异。
平台只决定**抓取方式**，不决定**字段契约**。

---

## 4. 证据标记与换季降级

**二元，`programs.tsv` 一列**（`evidence` 列）：

- `✓ <官网链接>` —— 该行**全部**事实都取自这一个 URL
- `待核实` —— 其余一切情况

**行级合取**：只要行内有一个事实没被那个 URL 覆盖，整行记 `待核实`。

> 🔴 **原型跑下来，这条规则造不出一条合法的 `✓` 行** —— deadline / 学费 / STEM 资格从来不在同一页上。
> 见 fork 3（含推荐方案）与 fork 3b。这是本原型最需要人拍板的地方。

**换季降级**（`apply.md` 的 `season` 一改就全表触发）：

```
✓ https://…/deadlines     →     待核实（2026fall 核过：https://…/deadlines）
```

标记状态仍是二元的（`待核实`），但**保留上季链接**——降级必须可逆。
抹掉链接就把「重新核实」变成「重新从零查」，违反 D.4 的方向性原则。

**标记不进散文。** 只出现在表格的 `evidence` 列与 `channels/` 的事实行首
（后者是对锁定决策的**扩展**，见 fork 3b —— 需要确认或驳回）。

---

## 4.5 🔴 中文值不能进被聚合的列（原型跑出来的实测发现）

macOS 自带的 **BSD `uniq` 会把不同的中文行合并计数**：

```sh
$ printf '冲刺\n匹配\n' | uniq -c
   2 冲刺          # ← 两个不同的值，被当成同一个
```

`LC_ALL=en_US.UTF-8` **不能修复**（已实测，macOS 26.5.2）。`sort` 本身正常，坏的是 `uniq`。

**因此两条硬规则：**

1. **`programs.tsv` 里任何会被统计的列（`tier` / `status`）只放 ASCII 枚举值。**
   `tier` = `reach` / `match` / `safer`，`status` = `considering` / `shortlist` / `applying` / `submitted` / …
   中文标签（冲刺 / 匹配 / safer）是**展示层**的事 —— 措辞归 [#11](https://github.com/jiangxidong/EduApplication/issues/11)。
   自由文本列（`school` / `program` / `evidence`）可以是中文，因为它们只被 `grep` / `awk` 正则匹配，不被聚合。

2. **任何派生视图的计数一律走 `awk` 关联数组，禁止 `sort | uniq -c`。**
   已实测正确：`awk '{c[$0]++} END{for(k in c) print c[k], k}'`、`grep -c`。

跑 `./derive-demo.sh` 可以复现全部派生视图。

---

## 5. 文书的两个正交轴

别塌成一维：

```
                 v1        v2        v3(当前)
long.md          ─────────────────────> essays/canonical/long.md
                 ↓ 存 _versions/
short-250.md     ─────────────────────> essays/canonical/short-250.md
points.md        ─────────────────────> essays/canonical/points.md
```

- **渲染物轴**：`long.md`（完整长文）/ `short-250.md`（250 词版）/ `points.md`（可拆短答题的要点）
  —— 三者不是同一篇的长短，是**三种形态**。Columbia 要长文，UIUC 要 4 道短答题，Cornell 要两篇独立文书。
- **版本轴**：当前版永远在稳定路径 `essays/canonical/<name>.md`（所以 rendering rules 可以直接引用）；
  开新版前先把当前版拷进 `_versions/<name>.vN.md`，然后原地改。

**不依赖 git 历史。** 版本是显式文件——用户可能根本不在 git 仓里跑这套东西。
（隐私 / `.gitignore` 的约定仍是地图上的 fog，本票不定。）

**#4 只定目录与命名。** 何时该开新版本、怎么对比两版 —— 归 [#10 文书的双模式与素材门槛怎么共存](https://github.com/jiangxidong/EduApplication/issues/10)。

---

## 6. 与相邻票的边界

| 票 | 它定什么 | #4 定什么 |
|---|---|---|
| [#11 选校推荐的输出契约](https://github.com/jiangxidong/EduApplication/issues/11) | `programs.tsv` 的**列清单**、分档措辞、假保底标注、匹配理由怎么写 | 文件路径、主键形态、`evidence` 列的落盘形态、换季语义 |
| [#8 网申准备包的交付形态](https://github.com/jiangxidong/EduApplication/issues/8) | `packets/<program_key>/` 里**装什么**、怎么用、完成度怎么自检 | 它落在哪、它是**可再生**的（删了能从 canonical + rules 重建） |
| [#10 文书双模式](https://github.com/jiangxidong/EduApplication/issues/10) | 何时开新版本、多版本怎么对比、素材门槛怎么判 | 三个渲染物文件名 + `_versions/` 命名约定 |
| [#9 skill 拆几个](https://github.com/jiangxidong/EduApplication/issues/9) | 阶段怎么切、路由怎么写 | **每个文件的 owner**（第 1 节表格最后一列）——这就是 skill 之间的交接面 |
| [#13 领域词汇表](https://github.com/jiangxidong/EduApplication/issues/13) | 「项目池」「待核实」「申请季」的精确定义 | 它们在文件里长什么样 |

---

## 7. 待人拍板的分叉

### fork 1 — `programs.tsv` 用 TSV 还是 Markdown 表？

| | TSV | Markdown 表 |
|---|---|---|
| 派生视图 | `awk -F'\t'` 一行算出待核实清单，**不用 LLM 过一遍** | 只能让 agent 读一遍再总结（每 session 花 token，且不保证一致） |
| 人读 | 需要在 Numbers/Excel 里开 | 编辑器里直接可读 |
| agent 原地改 | 列数固定，改错会静默错位 | Edit 工具改单行较稳 |
| 先例 | **本项目自己的 #6 调研就用 TSV**，Part D 的复用度统计是 awk 机械算出来的 | — |

原型按 **TSV** 做了，并用 `./derive-demo.sh` 跑通了全部派生视图。
理由：待核实汇总必须是机械的——靠 LLM 每次重算，就会出现「上次说 3 条待核实、这次说 5 条」。

代价有两条，都实测过：
- 人不好直接读（要在 Numbers/Excel 里开）
- **CJK 有坑**（见 4.5 节）：枚举列必须是 ASCII，计数必须绕开 `uniq`

**如果你更看重人读，这里要改。** 改成 Markdown 表的话，4.5 节的两条规则可以取消，但派生视图就得每次让 agent 读一遍。

### fork 2 — 派生视图真的一份都不存吗？

「不存」保证单一真相源，但代价是每次会话都要重算一遍完成度和待核实清单。
折中方案是存进 `_derived/`（文件头写「本文件自动生成，随时可删，勿手改」）。
原型按**完全不存**做了，因为竞品坑 #6 正是「Checked At 有字段无失效规则 → 上季打了勾的条目比没打勾的更危险」。

### fork 3 — 🔴 「二元 + 一列」的合取规则**造不出一条合法的 `✓` 行**（实测）

地图已锁定「二元，仅项目池表格一列」。原型的实现是**行级合取**：
行内全部事实取自同一个 URL 才给 `✓ <url>`，否则整行 `待核实`。

**然后样例里 0 行是 `✓`——不是因为没查，是因为按这条规则造不出来。**

看那条演示换季降级的 UIUC 行：

```
待核实（2026fall 核过：https://grad.illinois.edu/admissions/apply）
```

按合取规则，它上一季必须是 `✓ https://grad.illinois.edu/admissions/apply`，
即 **deadline + 学费 + STEM 资格三个事实全部来自那一个 apply 落地页**。这不成立——
deadline 在项目页、学费在 Bursar 页、STEM 资格在 DHS/项目 CIP code 页，**从来不在同一页上**。

**这就是判别式**：不是「字段多了才有问题」，是**按当前列集，合法的 `✓` 行根本不存在**。二选一：

- **(a) 砍到一个事实**：`programs.tsv` 的 evidence 列只担保 **deadline** 一项——
  它是最易变、后果最重、且地图的联网规则专门点名的那一项（「绝不凭记忆报 deadline」）。
  学费、门槛、STEM 资格全部下沉到 `channels/`，各带各的标记。
  **这是原型的推荐**：保住了「二元 + 一列」的字面锁定，代价是项目池表变窄（选校时要看两个文件）。
- **(b) 重开这条锁定决策**：允许 evidence 是逐事实的（每个事实一个标记），二元性保留但「一列」失效。

### fork 3b — `channels/*.md` 的逐行标记是对锁定决策的**扩展**，需要确认或驳回

地图锁的是「二元，**仅项目池表格一列**。标记不进散文」。
原型在三个 `channels/*.md` 里给**每条事实行**都加了 `✓ <url>` / `待核实`。

**这是扩展，不是实现**，所以显式浮出来：

> 提议把证据标记从「仅项目池一列」扩展到 `channels/` 的事实行。
> 理由：约束层的事实逐条取证于不同页面（平台一个页、上传规格一个页、推荐信机制一个页），
> 行级合取在项目池表里放不下——fork 3 就是这个矛盾的另一面，两者同一个根因。
> 标记仍是二元的、仍只出现在行首，**不进散文**。
>
> **请确认或驳回。** 驳回的话，`channels/` 里的取证状态就只能写成散文，
> 那么「哪些约束是查过的」将无法机械汇总。

### fork 4 — 目录名用英文还是中文？

原型用 **ASCII 路径 + 中文内容**。理由：地图已定「交互语言跟随用户」，中文目录名对英语用户是坏体验，且在 shell / 跨平台同步里易出问题。
代价：中文用户打开工作区看到的是 `channels/` `packets/` 而不是「约束层」「准备包」——`apply.md` 里给了对照表补救。
