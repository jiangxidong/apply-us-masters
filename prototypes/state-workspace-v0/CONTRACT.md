# 状态层文件契约 v0（原型）

> ⚠️ **术语以 main 分支的 `CONTEXT.md` 为准**（[#13](https://github.com/jiangxidong/EduApplication/issues/13) 已定稿）。本文件与之冲突处一律以 `CONTEXT.md` 为准。
>
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
| `programs.md` | Markdown 表，9 列 | **项目池**（选校决策面） | 选校阶段；投递阶段只改 `status` 列 |
| `channels/<channel_key>.md` | Markdown | **约束层**（逐申请渠道的 rendering rules） | 选校阶段落盘骨架，准备包阶段补全 |
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

**判别式**（这一条能一刀切开所有边界情形）：
> **这行字为了保持为真，需不需要被改写？需要 → 它是镜像，删掉；不需要 → 它是事实，留着。**

所以工作区里**任何文件都不写「当前状态」**——不写素材几条、不写闸口几比几、不写目录空不空。

**唯一豁免：`log.md`。** 它 append-only 且每段带日期，**从不被改写**，
所以它记的是「2026-08-15 那天观察到素材 2 条」这个**历史观察值**，不是镜像。
历史观察值不会失真，镜像会。

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
  → `programs.md` 的主键，`packets/` 的目录名
- **`channel_key`** = `<school>--<college>`，例：`columbia--seas`
  → `channels/` 的文件名。同一 channel 下多个项目共用 portal / 平台 / 申请费 / 上传规则。
  项目级差异写在该文件的 `## 项目级差异` 节。

**不按平台建适配层。** #6 D.3 证据六：Columbia SEAS 与 UIUC 同为 Slate，字段结构却迥异。
平台只决定**抓取方式**，不决定**字段契约**。

---

## 4. 证据标记与换季降级

**二元，`programs.md` 一列**（`evidence` 列）：

- `✓ <官网链接>` —— **deadline 取自这个 URL**
- `待核实` —— 其余一切情况

### 🔒 evidence 列**只担保 deadline**（2026-08-15 决议）

原型跑下来，「行内全部事实取自同一个 URL」的合取规则**造不出一条合法的 `✓` 行**：
deadline 在项目页、学费在 Bursar 页、STEM 资格在 CIP code 对照的 DHS 清单上，**从来不在同一页**。

因此：

- `evidence` 列只对 **deadline** 一项负责 —— 它最易变、后果最重，
  且地图的联网规则专门点名它（「绝不凭记忆报 deadline」）
- **学费、门槛、STEM 资格、申请费全部下沉到 `channels/<channel_key>.md`**，各带各的行首标记
- **[#11](https://github.com/jiangxidong/EduApplication/issues/11) 之后往 `programs.md` 加多少列都可以，
  但加的列一律不被 `evidence` 担保。** 新列若需要取证状态，就下沉到 `channels/`

代价：选校时要看两个文件。收益：`✓` 有确切含义，`待核实` 不再退化成常量。

### 🔒 `channels/` 的事实行首也带标记（2026-08-15 决议，对地图锁定决策的扩展）

地图原文锁的是「二元，**仅项目池表格一列**」。现扩展为：

> **二元，项目池表格一列 + `channels/` 的事实行首。标记仍不进散文。**

理由即上一节：约束层的事实逐条取证于不同页面，行级合取在项目池表里放不下。
不扩展的话，`channels/` 的取证状态只能写成散文，
「哪些约束是查过的、哪些是推定的」将无法机械汇总 ——
Columbia SEAS 那条「AI 政策未查到，暂按 GSAS 从严」就没法被自动提醒。

### 换季降级（`apply.md` 的 `season` 一改就全表触发）

```
✓ https://…/deadlines     →     待核实（2026fall 核过：https://…/deadlines）
```

标记状态仍是二元的（`待核实`），但**保留上季链接**——降级必须可逆。
抹掉链接就把「重新核实」变成「重新从零查」，违反 D.4 的方向性原则。

---

## 4.5 🔴 中文值不能进被聚合的列（原型跑出来的实测发现）

**两个 BSD 工具在中文下是坏的**（已实测，macOS 26.5.2；`LC_ALL=en_US.UTF-8` 都修不好）：

```sh
$ printf '冲刺\n匹配\n' | uniq -c
   2 冲刺                    # 两个不同的值被合并计数

$ printf '冲刺\n匹配\n保底\n' | sort -u
冲刺                         # 🔴 更严重：三个不同的值直接丢成一个
```

坏的是**去重比较**：`uniq` 数错，`sort -u` **丢行**（后者更危险，因为没有任何迹象）。
`sort`（单纯排序）、`grep`、`awk` 都正常。

> **注意这与格式无关。** 这两个工具对 Markdown 表和 TSV 一样坏，awk 对两者一样好。
> CJK 不是选格式的判别式，只是「用不用 `uniq` / `sort -u`」的判别式。

**因此两条硬规则：**

1. **`programs.md` 里任何会被统计的列（`tier` / `status`）只放 ASCII 枚举值。**
   `tier` = `reach` / `match` / `safer`，`status` = `considering` / `shortlist` / `applying` / `submitted` / …
   中文标签（冲刺 / 匹配 / safer）是**展示层**的事 —— 措辞归 [#11](https://github.com/jiangxidong/EduApplication/issues/11)。
   自由文本列（`school` / `program` / `evidence`）可以是中文，因为它们只被 `grep` / `awk` 正则匹配，不被聚合。

2. **禁止 `uniq` 与 `sort -u`。** 计数走 `awk '{c[$0]++} END{for(k in c) print c[k], k}'`，
   去重走 `awk '!s[$0]++'`，两者均已实测在中文下正确；`grep -c` 也正常。

3. **`programs.md` 的单元格内禁止出现 `|`。** 转义的 `\|` 仍会被 `awk -F'|'` 切开（已实测）。
   需要写散文的内容一律进 `channels/` —— 这条对 [#11](https://github.com/jiangxidong/EduApplication/issues/11) 尤其要紧，
   它会加「匹配理由」这类自由文本列，那正是 `|` 最可能出现的地方。

**解析约定**：Markdown 表用 `awk -F'|'` 解析，前导 `|` 会产生一个空的 `$1`，**第 N 列是 `$(N+1)`**。

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
| [#11 选校推荐的输出契约](https://github.com/jiangxidong/EduApplication/issues/11) | `programs.md` 的**列清单**、分档措辞、假保底标注、匹配理由怎么写。⚠️ 加的列一律不被 `evidence` 担保（§4） | 文件路径、主键形态、`evidence` 只担保 deadline、换季语义 |
| [#8 网申准备包的交付形态](https://github.com/jiangxidong/EduApplication/issues/8) | `packets/<program_key>/` 里**装什么**、怎么用、完成度怎么自检 | 它落在哪、它是**可再生**的（删了能从 canonical + rules 重建） |
| [#10 文书双模式](https://github.com/jiangxidong/EduApplication/issues/10) | 何时开新版本、多版本怎么对比、素材门槛怎么判 | 三个渲染物文件名 + `_versions/` 命名约定 |
| [#9 skill 拆几个](https://github.com/jiangxidong/EduApplication/issues/9) | 阶段怎么切、路由怎么写 | **每个文件的 owner**（第 1 节表格最后一列）——这就是 skill 之间的交接面 |
| [#13 领域词汇表](https://github.com/jiangxidong/EduApplication/issues/13) | 「项目池」「待核实」「申请季」的精确定义 | 它们在文件里长什么样 |

---

## 7. 已决议的分叉（2026-08-15）

四个分叉都已拍板，**全部落在原型的推荐上**。

| # | 分叉 | 决议 | 依据 |
|---|---|---|---|
| 1 | 项目池格式 | **Markdown 表**（`programs.md`）<br>*2026-08-15 改判，原判 TSV* | 原判的理由「Markdown 只能让 agent 读一遍再总结」**是错的** —— `awk -F'\|'` 连带对齐空格的表都解析得干净，列数校验一样能做，TSV 的唯一卖点不存在。剩下真正区分的三点里两点指向 Markdown：**渲染**（工作区其余 10 个文件全是 Markdown，且定路径时的理由就是「用户可能放 Obsidian 里」）、**agent 原地改**（TSV 列错位是静默的）。代价是单元格禁止出现 `\|`，见 §4.5 |
| 2 | 派生视图落不落盘 | **完全不落盘** | 存一份就是第二个真相源。竞品坑：`Checked At` 有字段无失效规则 → 上季打了勾的条目比没打勾的更危险 |
| 3 | 「二元 + 一列」怎么办 | **evidence 只担保 deadline** | 合取规则造不出合法的 `✓` 行（见 §4） |
| 3b | `channels/` 逐行标记 | **确认扩展** | 不扩展则约束层的取证状态无法机械汇总（见 §4） |
| 4 | 目录名语言 | **ASCII 路径 + 中文内容** | 地图已定「交互语言跟随用户」，中文目录名对英语用户是坏体验，且在 shell / 跨平台同步里易出问题。`apply.md` 里给了中文对照表补救。**未单独征询，如有异议可随时推翻** |

分叉 1 与 2 的完整取舍论证见本文件的 git 历史（commit `prototype: 状态层工作区 v0`）。
