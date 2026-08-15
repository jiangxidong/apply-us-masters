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

## 1. 文件清单与归属

> 🔒 **这应当是全产品唯一一张「路径 / 节 → 阶段」表**（[#23](https://github.com/jiangxidong/EduApplication/issues/23) §7，
> [ADR 0008](../../docs/adr/0008-the-owner-binds-to-a-section-not-a-file.md)）。
> [#9](https://github.com/jiangxidong/EduApplication/issues/9) 的表已降级为「阶段 → skill」映射、**不再出现任何路径字面量**；
> 按 #23 的原话，`CONTEXT.md` 只定义词、不承载表。
>
> ⚠️ **但此刻事实并非如此**：`main` 上的 `CONTEXT.md`（317 行起）也存了一份完整的十节表，含 owner 列——
> #23 落盘时自己写的。「唯一」现在是**决议**，不是**现状**。
> 转 [#26](https://github.com/jiangxidong/EduApplication/issues/26) 裁决，本次合并不就地拍板（见 §1.5 ④）。
>
> **owner 列一律填阶段，不填 skill。** 七个阶段：**冷启动 / 画像 / 选校 / 文书 / 材料 / 推荐信 / 准备包**
> （见 [`CONTEXT.md`](../../CONTEXT.md) 的「阶段」词条）。`材料` / `推荐信` / `准备包` 眼下同属 `assemble-packet`，
> 但填 skill 会让这张表在重拆 skill 时失效——而绑阶段的全部意义就是那时它一行不动。

### 1.1 十四个文件

> 🔴 **下表的 `#` 是行号，不是文件的编号。任何文件都不带序号，「第 N 个文件」这种说法一律作废。**
> [#18](https://github.com/jiangxidong/EduApplication/issues/18) 与 [#12](https://github.com/jiangxidong/EduApplication/issues/12)
> 都自称「第 12 个文件」而两者都不是——序号排的是「谁先被想到」，那个顺序没人维护得了，**它本身就是漂移机制**。
> 两票里的那句措辞就此作废（原文留在已关闭的票上，读到时以本表为准），**此后引用文件一律用路径**。

| # | 路径 | 格式 | 真相源身份 | owner 阶段 |
|---|---|---|---|---|
| 1 | `apply.md` | frontmatter + 正文 | **工作区标识 + 申请季** | **冷启动**（创建）；此后**只有换季时**改 `season`。⚠️ 不放完成度、不放待核实计数——那些是派生视图 |
| 2 | `profile.md` | frontmatter + 正文 | **申请人 canonical 事实**；学历条目是 `institution_id` 的**定义处** | **冷启动 / 画像**；其他阶段只读 |
| 3 | `programs.md` | Markdown 表，**13 列**（🔴 样例只有 9 列，见下） | **项目池**（选校决策面） | **选校** ⚠️ `status` 列的写入权见 §1.5 注 ① |
| 4 | `claims.md` | Markdown 表，4 列 | **主张集**（全局唯一，文书与推荐信共用） | 🔴 **两阶段写**：**冷启动 / 画像**落初稿，**文书**打磨 |
| 5 | `channels/<channel_key>.md` | Markdown，**分节** | **约束层**（逐申请渠道的 rendering rules） | 🔴 **按节归属，见 §1.2**（5 个阶段 owner） |
| 6 | `materials/*.md` | Markdown，**七字段** | **文书素材**（素材门槛在此判定）；推荐信线是第二个消费方 | **文书**（+ 推荐信？见 §1.5 注 ②） |
| 7 | `essays/canonical/*.md` | Markdown + frontmatter | **文书 canonical 渲染物**（当前版） | **文书** |
| 8 | `essays/canonical/per-program/<program_key>.md` | frontmatter + 散文 | **逐项目 why-this-program 内容**（不可再生） | **文书**（按 §1.4 前缀继承） |
| 9 | `essays/canonical/_versions/*.md` | Markdown | 历史版本，只增不改 | **文书** |
| 10 | `documents/<槽位>/…` | 原始文件 | **材料 canonical**（信息量最大的一侧），**七槽位见 §1.3** | **材料** |
| 11 | `recommenders.md` | Markdown | **推荐人身份五块**（候选 / 逐校机制 / 分配 / 起草授权 / 提交事实，红线区） | **推荐信** |
| 12 | `recommenders/drafts/<recommender_id>.md` | Markdown | **C 档推荐信草稿**（🔴 受起草授权声明门控） | **准备包**（新增顶层路径，按 §1.4 显式指派） |
| 13 | `packets/<program_key>/**` | 由 [#8](https://github.com/jiangxidong/EduApplication/issues/8) 定 | **可再生产物**，删了能重建 | **准备包** |
| 14 | `log.md` | Markdown，append-only | **跨会话交接** | 每个阶段结束时追加（见 §1.5 注 ③） |

**五个主键**，全部 ASCII（遵 §4.5）：`program_key` / `channel_key` / `recommender_id`（`r1`…）/
`institution_id`（定义权在 `profile.md`，`documents/` 只引用）/ `claim_id`（`c01`…）。

**`materials/*.md` 的七字段**：#10 定的六字段外，[#17](https://github.com/jiangxidong/EduApplication/issues/17)
加第七个 `敏感`，**ASCII 二元 `yes` / `no`**（遵 §4.5）。敏感素材**默认不进给第三方的包**——
这是 #12 的 pack 门槛两条合取里的第二条（第一条是「这个人能证实它」）。

🔴 **`programs.md` 的 13 列在样例里只落了 9 列**——`tier_basis` / `tier_void_if` / `pseudo_safer`
（[#11](https://github.com/jiangxidong/EduApplication/issues/11) 在 #4 的 9 列上加的判断层）不在 `sample-workspace/programs.md` 里。
**这一处不能照抄补齐**：样例里一条 `✓` 事实都没有，填 `tier_basis` 撞
[ADR 0005](../../docs/adr/0005-basis-points-at-an-existing-checked-fact.md)，留空则按 #11 的机械规则三行都得改成 `undecided`。
→ [#31](https://github.com/jiangxidong/EduApplication/issues/31) 裁决。`derive-demo.sh` 的列数完整性检查现断言 9 列，跟着一起改。

**`claims.md` 的四列**：`claim_id` / 断言（中文自由文本，禁 `|`）/ `materials`（支撑素材 id 列表，空格分隔；
**空 = 缺素材缺口**）/ `voice`（`self` / `referee` / `both`）。
「哪篇文书用了哪些主张」这条边**只存在消费端**：`essays/canonical/*.md` 的 frontmatter 写 `claims: [c01, c03]`，
`claims.md` **不设 `used_in` 列**（两端都存必漂移）。见 [ADR 0006](../../docs/adr/0006-claims-are-one-shared-truth-source.md)。

🔴 **七字段里的 `已用于` 在样例里有意留空**——它每写一篇文书就要被改写一次，按 §1.5 的镜像判别式该杀，
但 #10 给了它一字段两用途。是删是留 → [#30](https://github.com/jiangxidong/EduApplication/issues/30) 裁决。
另注：frontmatter 的 `usable_for`（可以用在哪类文书，是判断）**不是**「已用于」（实际用过哪几篇，是事实），两者不能互相顶替。

**`recommenders/drafts/` 的门控**：没有推荐人本人的起草授权声明，**这个目录就不该存在**。两道闸：
**写入闸**（准备包阶段，创建前必须先读到 `recommenders.md` 里的授权声明）+
**存在性闸**（入口阶段 / [#15](https://github.com/jiangxidong/EduApplication/issues/15)，发现目录存在但无授权声明 → 报错）。
只做写入闸不够——[#12](https://github.com/jiangxidong/EduApplication/issues/12) 把它设计成「文件系统层面物理可查」，
只归 owner 自查就退回成「相信写它的人」。

### 1.2 `channels/<channel_key>.md` 的十个法定节

一个文件有几个写入者**不需要辩护**；需要辩护的只有**一个节两个写入者**与**一条事实没有写入者**，且都禁止（ADR 0008）。
归属判据是**消费方**：哪个阶段的决策依赖这条事实，哪个阶段就负责取证并落盘；多个阶段消费时归**最早**的，后到者只读。

| 序 | 法定节 | 谁的决策依赖它 | owner 阶段 |
|---|---|---|---|
| 1 | `平台与账号` | 选校（能不能申）+ 准备包（建号） | **选校**（最早） |
| 2 | `硬约束` | 选校 | **选校** |
| 3 | `学历门槛` | 选校（分档锚点，ADR 0004） | **选校** |
| 4 | `费用与资格` | 选校 | **选校** |
| 5 | `AI 使用政策` | 选校（算最严档位）+ 文书 | **选校**（最早） |
| 6 | `项目内容` | 文书（why 段的具名事实） | **文书** |
| 7 | `文书规格` | 文书（含 why 段的拼接配方） | **文书** |
| 8 | `材料上传` | 材料 | **材料** |
| 9 | `推荐信机制` | 推荐信 | **推荐信** |
| 10 | `冻结点` | 准备包 | **准备包** |

**节名取自上面这张封闭词表。匹配前，先剥掉标题行首所有不是汉字 / 拉丁字母 / 数字的字符，再做前缀匹配。**

`## 🔴 推荐信机制 —— 风险 A：冒名发信` 合法，剥掉 `🔴 ` 后匹配到 `推荐信机制`；
`## 材料上传 —— ⚠️ 与 Cornell 直接冲突` 合法，匹配到 `材料上传`。
词表内**禁止任何两项互为前缀**（现有十项两两都不互为前缀）。参考实现——🔴 **必须在 UTF-8 locale 下跑，见 §4.5**：

```sh
LC_ALL=en_US.UTF-8 awk '/^#{2,4} /{ t=$0
  sub(/^#+[ ]*/,"",t); gsub(/^[^一-龥A-Za-z0-9]+/,"",t); print t }'
```

**为什么前缀受限而后缀自由，剥离又不破坏它。** 后缀是**跨渠道冲突的现场记录**，它天然会提到别的节名
（`## 冻结点 —— 与材料上传冲突`），所以判据**不能**是「标题包含某个词表项」——那会当场双命中。
节名因此必须**锚定在头部**。剥离只放行行首那一串**非文字**装饰（`🔴` / `⚠️` / `🔒` / 全角空格 / `**` / `——`），
锚点一步不动：`## ⚠️ 与 Cornell 冲突 —— 材料上传` 剥离后仍以 `与` 开头，**照旧 FAIL**——这正是要保住的。

🔴 **行首标记不封词表。** 本契约的三张封闭词表（法定节名 / `待核实` 后缀 / `tier`）都是因为**要被机械汇总**才封的；
行首标记不参与任何汇总，是纯装饰。封表买不到任何机械能力，只换来一个维护面：谁哪天写了 `🚨`，检查当场 FAIL。

**节序自由。** 原「节按上表顺序排列」**已取消**（[#28](https://github.com/jiangxidong/EduApplication/issues/28)），
孤儿检查第 4 条随之删除。它买到的只是 diff 稳定与阅读可预期，**不定任何 owner**；代价却有两层：
一是禁掉「把该渠道最扎人的节顶到最前」——三个样例**一致自发**这么做（Columbia 的 `硬约束`、Cornell 与 UIUC 的 `冻结点` 都在第二位）；
二是更硬的一条——**排序要求插入而不是追加**：文书阶段后来落 `## 项目内容`（第 6）得插进选校的 `硬约束`（2）与准备包的 `材料上传`（8）之间，
等于要求 owner 在**别人的节中间**落笔。追加只碰文件尾，插入要重写文件中段。
→ 建议（**非强制**）：把该渠道最扎人的节放在最前。

**`## 项目级差异` 也在封闭词表内，但不带 owner**——它是**覆盖层，不是第 11 个类别**。
结构 `## 项目级差异` → `### <program_key>` → `#### <法定节名>`，归属规则一条：**同名节同一 owner，不论层级**
（前缀匹配天然递归到 `####`）。🔴 机械检查必须为它开一个显式分支，否则每个 channel 文件都会被判成无主节。

🔒 **`### <program_key>` 之下的每一行必须落在某个 `#### <法定节名>` 内；裸行非法**（#28）。
覆盖层不带 owner，owner 由 `####` 经前缀匹配递归决定——裸行因此 = **一条事实找不到写入者**，
是 ADR 0008 两条禁止里的第二条。这**不与「不预建空节」冲突**：一个装着 `待核实 GRE 是否要求` 的 `#### 学历门槛`
不是空节，那正是「待核实后缀」存在的形态；「不预建空节」禁的是**空**节。
孤儿检查为此加一条——删掉节序那条之后，**仍是六条**。

🔒 **`####` 的合法性只由封闭词表决定，与同名 `##` 是否存在无关。** Columbia 与 Cornell 都没有 `## 学历门槛`（缺席即信息），
但 GRE 要求本就是**项目级**事实——同一个 Graduate School 下不同项目口径不同，覆盖层是它唯一正确的家。
「覆盖层」这个名字容易被读成「必须有东西可覆盖」，**不是**。

🔒 **`deadline` 不进 `channels/`。** 它的取证状态住 `programs.md` 的 `evidence` 列（§4），覆盖层里再写一份就是第三份副本。
取证**方法**（「Cornell MEng 有多轮，需查当季轮次表」）不是取证**状态**——它住 `evidence` 列的 `待核实（口径不清）` 后缀，
[ADR 0001](../../docs/adr/0001-evidence-stays-binary-with-a-closed-suffix.md) 的封闭词表已经有这个位置。

🔒 **费用类事实的唯一去处是 `费用与资格`，`硬约束` 不收。** `硬约束` 装的是「每学期只能申 1 个项目」
「禁止本人以外代交」这类流程性限制。⚠️ 样例 Columbia 现有一条 `待核实 申请费金额与减免条件` 在两节里**逐字各一份**：
两节同属选校 owner，**不触发**「一个节两个写入者」，但正是 ADR 0008 瞄准的**责任漂移**。
删 `硬约束` 那一份，归 [#27](https://github.com/jiangxidong/EduApplication/issues/27)。
**不为它新增检查**——「同一条事实」在 `待核实` 自由文本上没有机械判据，要抓它得先把事实行也塞进封闭词表，
那是拿一条大得多的规则去换一个人眼已经抓到的重复。

**只建自己 owner 的节，不预建空节。** 节的**缺席本身是信息**（该渠道没有这类特殊约束）；
预建会把「没查」与「不存在」压成同一形态，而区分这两者正是「待核实后缀」存在的全部意义。

⚠️ **机械检查判结构，不判「谁写的」。** 「`###` 之下每行必须落在某个 `####` 内」是**结构**规则；
**谁有权写那个 `####`** 由唯一写入者规则管，两条不耦合。这是必要的分开——UIUC 覆盖层的 `Academic Statement 字数`
归 `#### 文书规格`（owner = **文书**），而它是**选校**期发现的：「发现缺口的人」与「有权记下缺口的人」本就不是同一个。
真实运行时的答案是**认下**：占位行也是写，选校发现了也不落盘，缺席即「没查」，等文书阶段自己去查。
而 `sample-workspace/` 是 [ADR 0010](../../docs/adr/0010-personas-ignite-assertions-they-are-not-examples.md) 的**点火器**、
是人手搭的夹具、不是某次真实运行的痕迹，**只需过结构那一关**。

> ⚠️ 样例 `sample-workspace/channels/*.md` 里 UIUC 有 `学历门槛` 而另两校没有、Columbia 有 `硬约束` 而另两校没有，
> **是有意的**，验收时别当成漏填去补齐。
>
> ✅ **前缀匹配已按上面的剥离规则在三个样例文件的全部 `##` 标题上实测通过。**
> 此前「样例全部过得了前缀匹配」那句断言在 #23 结论 / #24 票面 / 本节验收注 / #27 末段**四处被转述、四处都错**
> ——六个节 FAIL，坏在 `🔴 ` 顶在节名**之前**；四处现已全部更正。
> 🔴 **这次是判据让步，不是样例让步**：`🔴` 前置是全 repo 的书写习惯，
> `git grep '^#\+ *[🔴⚠️🔒]'` 命中 9 处，**本契约自己占 3 处**。
>
> ⏳ **覆盖层的 9 行占位行尚未按上面的 `####` 规则整理**，归 [#27](https://github.com/jiangxidong/EduApplication/issues/27)；
> 每行挂哪个 `####` 已由 [#28 的结案评论](https://github.com/jiangxidong/EduApplication/issues/28) 定死，**照抄即可，不必再判**。

### 1.3 `documents/` 的七个槽位

**一个槽位 = 一个一级目录 = 一个敏感级。** 目录形状取「按槽位分层、院校在下」——
反过来会让「槽位自带敏感级」当场失效（得下钻一层才知道能不能读）。

```
documents/
  transcript/<institution_id>/page-NN.pdf   高分辨率彩色、逐页单文件
  legend/<institution_id>.pdf               评分说明；UIUC 必填且逐院校，必须能独立取出
  degree/<institution_id>.pdf               学位证 / 毕业证
  translation/<institution_id>/…            翻译件；公证 / 认证等级记在文件旁的 .md
  english/                                  语言成绩；送分状态记在 profile.md
  cv/                                       简历——canonical 不是渲染物（排版措辞从 profile.md 重建不出来）
  identity/                                 🔴 唯一禁读槽位
```

**分槽位必须是路径级**：agent 得在**读之前**就知道该不该读，而内容类型只有读了才知道。
`identity/` 是禁读区——**只做存在性与规格检查，绝不让任何内容进上下文**（允许 `ls` / `stat` / `file` / `pdfinfo`
这类只碰元数据的操作；禁止 Read 读 PDF·图片、`pdftotext`、OCR、截图、缩略图）。
🔴 **判据是「读了也没用」，不是「敏感」**：成绩单**不进**禁读区——算 GPA、填学历列表都得读内容。
Cornell 的 SSN 涂黑要求因此落成「**落槽位时**提醒」，不是「不读」——凡提醒能提前到打开文件之前，就必须提前，
因为误读不可补救（内容会落进运行时的会话记录，那是工作区之外、产品删不掉的第二份副本）。

**槽位不带规格维**：规格逐渠道（Cornell 要合并清晰 / UIUC 要 <200dpi 灰度，物理上互斥），槽位跨渠道，
维度不对齐——规格一律住 `channels/` 的 `材料上传`。文件**自身**属性（翻译件是否公证）仍记在旁边的 `.md`，
它答的是「这是什么」，不是「学校要什么」。

**槽位清单是产品侧常量**（单向阀：repo → 工作区可以流，反向绝不），不落工作区、不建空目录。

**兜底**：不属于任何槽位的文件**留在原地 + 记进 `log.md`**（唯一的镜像豁免——它是历史观察值），
只列名、不打开，归类前按最严处理。否掉 `unsorted/`（位置断言分类 = 镜像）与「每次重问」。

### 1.4 后续新增路径如何获得 owner

**混合规则**（[#23](https://github.com/jiangxidong/EduApplication/issues/23) §7.1）：

- **已有目录内新增** → 自动继承**最近祖先目录**的 owner（`essays/canonical/per-program/` 因此自动归文书阶段）
- **新增顶层路径** → **必须显式指派，并在同一次提交更新本表**（`recommenders/drafts/` 走这条）

纯「每次都显式指派」不够：它把责任全押在写票的人身上，而 #12 与 #18 各漏过一次。所以规则配机械执法——
孤儿检查脚本的第 1 条就是「契约里出现的每个路径都能解析到一个 owner 阶段（自身或祖先目录）」。

### 1.5 待裁决（本次合并**不就地拍板**）

[#24](https://github.com/jiangxidong/EduApplication/issues/24) 的边界是**只合并、不做新决策**。合并现场查出四处需要裁决，
原样保留并转票：①②③ → [#25](https://github.com/jiangxidong/EduApplication/issues/25)，④ → [#26](https://github.com/jiangxidong/EduApplication/issues/26)。

前三处的共性：分支上的原表写于 ADR 0008 之前，与「节粒度 + 七阶段」对不上。

① **`programs.md` 的 `status` 列**：原表写「投递阶段只改 `status` 列」，但**「投递」不是七个阶段之一**
（`CONTEXT.md` 里「投递名单」是不落盘的派生视图）。而 `applying → submitted` 这一跳物理上发生在准备包阶段之后。

② **`materials/*.md` 的 owner**：#12 的回填写的是「文书阶段 **+** 推荐信阶段」两个 owner，
但 #23 只审查并认可了两个多写入者文件（`channels/` 与 `claims.md`），`materials/` 是**未经审查的第三个**。

③ **`log.md` 由每个阶段追加**：字面上撞「一个不含节结构的文件有且只有一个阶段可以写它」。
它 append-only、从不被改写，大概率是正当豁免——但豁免没被写下来过。

④ **§1.2 这张十节表本身存了两份**：`main` 的 `CONTEXT.md`（317 行起）与本节各一份，
而 #23 §7 的原话是「唯一一张」且「`CONTEXT.md` 只定义词，不承载表」——**决议与它自己的落盘不一致**。
横跨 `main` 与 `prototype/state-layer` 两个分支，哪边就地拍板都会静默覆盖一条已锁决议。→ #26

---

**不落盘的派生视图**（每次现算现打，绝不存文件）：
待核实清单、缺口清单、deadline 日历、完成度自检、每校材料缺口、推荐信闸口、素材门槛、
选校清单、投递名单、**「主张 → 支撑素材」对照表**、**推荐人 support pack**（每**推荐人**一份，不跟 `program_key` 走，
因此**不落 `packets/`**）、**推荐人覆盖缺口**、**pack 门槛**、**请求推荐邮件草稿**（一次性、发出即完成、不迭代）。

> 存一份就是第二个真相源。竞品坑 #9：合并单文件与散文件同时被安装 → 同一事实索引两遍，检索互相稀释。
> `euro-grad-apply` 的 README 自己推荐的安装路径就有这个坑。

**判别式**（这一条能一刀切开所有边界情形）：
> **这行字为了保持为真，需不需要被改写？需要 → 它是镜像，删掉；不需要 → 它是事实，留着。**

> 🔴 **补一句前提**（来自 [#12](https://github.com/jiangxidong/EduApplication/issues/12)）：
> **「镜像」的前提是别处有源；没有源的可变内容是判断，不是镜像。**
> `recommenders.md` 的「主张 → 推荐人分配」会被改写，但它不是任何别处内容的镜像——它就是真相源。
> 同 [#11](https://github.com/jiangxidong/EduApplication/issues/11) 的 `tier_basis`：**判断必须落盘**，否则跨会话失效。

所以工作区里**任何文件都不写「当前状态」**——不写素材几条、不写闸口几比几、不写目录空不空。

**唯一豁免：`log.md`。** 它 append-only 且每段带日期，**从不被改写**，
所以它记的是「2026-08-15 那天观察到素材 2 条」这个**历史观察值**，不是镜像。
历史观察值不会失真，镜像会。

> 🔴 **但 append-only 对隐私是最坏形态**（[#17](https://github.com/jiangxidong/EduApplication/issues/17)）。
> append-only **不软化**（软化了它就不可信），规则改在写入侧：
> **`log.md` 只记动作与指针，绝不记内容。** 写「2026-08-15 采集素材 2 条 → `materials/`」，不写素材本身；
> 写「确认了 Columbia 的成绩单合并要求」，不写成绩单上的数字。与上面的镜像判别式同源。

---

## 2. 两层数据结构（直接落 #6 的 D.4 结论）

```
内容层（canonical）                  约束层（rendering rules）              产物
profile.md                           channels/<channel_key>.md
claims.md                            ├ 平台与账号 / 硬约束 / 学历门槛
materials/*                          ├ 费用与资格 / AI 使用政策
essays/canonical/*          ──渲染──> ├ 项目内容 / 文书规格            ──> packets/<program_key>/
essays/canonical/per-program/*       ├ 材料上传 / 推荐信机制
documents/**（七槽位）                └ 冻结点
recommenders.md                        ＋ ## 项目级差异（覆盖层）
```

⚠️ `recommenders/drafts/` **不在这张图里** —— 草稿是迭代物，用户会改、推荐人会回改，不是任何东西的渲染物。
同理 support pack 是渲染物但**每推荐人一份**（不跟 `program_key` 走），所以**不落 `packets/`**，
`packets/` 的可再生源清单因此**维持原样、不含 `recommenders.md`**。

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

### 换季降级（**惰性执行**，不是全表触发）

```
✓ https://…/deadlines     →     待核实（2026fall 核过：https://…/deadlines）
```

标记状态仍是二元的（`待核实`），但**保留上季链接**——降级必须可逆。
抹掉链接就把「重新核实」变成「重新从零查」，违反 D.4 的方向性原则。

🔴 **执行方式是惰性的，不是一改 `season` 就全表触发**（[#23](https://github.com/jiangxidong/EduApplication/issues/23)）。
全表触发构成**跨 owner 的写** —— `programs.md` 与 `channels/` 的十个节分属三个阶段，没有任何一个阶段有权改别人的节。

> 换季**只改 `apply.md` 的 `season`**。各阶段**下次进入时**按文件 frontmatter 的 `season` 比对，
> 就地降级**自己 owner 的节**，并同步该文件的 `season`。派生视图渲染时按 `season` 比对，不等即视为待核实。

`channels/*.md` 的 frontmatter **已有 `season` 字段**（样例是 `season: 2027fall`），无需新增。
未被访问的节保持上季标记 —— **比假装重查过更诚实**。

🔴 **换季只做证据降级与状态回退，不触发任何清理，不提示删除任何文件**（[#17](https://github.com/jiangxidong/EduApplication/issues/17)）。
换季是**二申路径**，是申请季**初**的动作；清理服务的是申请完就走的人，那个人永远不会换季。
清理的主触发是用户显式的「申请季收尾」动作，与本节无关。

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

🔒 **反过来，`awk` 的字符类只在 UTF-8 locale 下才对——这一条是可修的，且必须修**
（2026-08-15 实测，`awk version 20200816`，本机无 `gawk`）。以 §1.2 的节名剥离规则 `gsub(/^[^一-龥A-Za-z0-9]+/,"",t)` 为例：

```sh
LC_ALL=en_US.UTF-8   →  [推荐信机制 —— 风险 A：冒名发信]        # ✅ 🔴 / ⚠️ / 🔒 / 全角空格 / ** 全剥干净
LC_ALL=C             →  [<3 个乱码字节> 推荐信机制 —— 风险 A…]  # ❌ emoji 原样留下，六个节照旧 FAIL
```

**检查脚本必须显式设 `LC_ALL=en_US.UTF-8`，不能靠继承环境**——它的失效形态是**静默**的，
跟 `sort -u` 丢行一样没有任何迹象。

⚠️ **上下两条要摆在一起读**，才是「BSD + CJK」的完整判据；拆开会让人以为设了 locale 就万事大吉：
**`uniq` / `sort -u` 在任何 locale 下都坏（不可修，只能绕开）；`awk` 只在 UTF-8 locale 下才对（可修，且必须修）。**

**因此两条硬规则：**

1. **`programs.md` 里任何会被统计的列（`tier` / `status`）只放 ASCII 枚举值。**
   `tier` = `reach` / `match` / `safer` / `undecided` / `ineligible`（**五档**，[#22](https://github.com/jiangxidong/EduApplication/issues/22) 补上最后一档），
   `status` = `considering` / `shortlist` / `applying` / `submitted` / `dropped` / …
   中文标签（冲刺 / 匹配 / 较稳 / 待判 / 未达门槛）是**展示层**的事 —— 措辞归 [#11](https://github.com/jiangxidong/EduApplication/issues/11)。

   > `ineligible` = 该项目**全部公开维度中至少一个已取证未达标**。与 `undecided` 的切分必须跟着枚举一起落，否则必混：
   > **「还没考托福」= `undecided`**（不知道是否满足）；**「考了 95、要求 100」= `ineligible`**（知道不满足）。
   > 它不能塞进 `undecided`（#11 的机械判别式是「`tier_basis` 空 ⇒ 必须 `undecided`」，而未达标的行 `tier_basis` 恰恰填得满），
   > 也不能走 `status=dropped`（[ADR 0002](../../docs/adr/0002-one-program-pool-one-status-axis.md)：`status` 是**用户对项目做什么**，硬申一个差 0.3 的项目是合法选择）。
   > 唯一新增的机械规则：**`tier = ineligible` ⇒ `tier_basis` 非空**。`tier_void_if` 列**语义不变**（它本就中性，不区分方向）。
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
| [#9 skill 拆几个](https://github.com/jiangxidong/EduApplication/issues/9) | **阶段 → skill** 的映射（#23 修订后：#9 的表里**不再出现任何路径字面量**） | **路径 / 节 → 阶段**（§1.1 与 §1.2）——归属表，这就是阶段之间的交接面。⚠️ #23 定它「唯一」，但现状是两份，见 §1.5 ④ |
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
