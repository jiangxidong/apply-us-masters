# 状态层文件契约 v0（原型）

> ⚠️ **边界按范围拆，不按文件拆**（[ADR 0011](../../docs/adr/0011-the-glossary-defines-words-the-contract-holds-the-values.md)）：
> **词的定义**（词的含义、中文名 ↔ ASCII 标识符、词与词的边界）以 `main` 分支的 [`CONTEXT.md`](../../CONTEXT.md) 为准
> （[#13](https://github.com/jiangxidong/EduApplication/issues/13) 已定稿）；
> **v1 的取值与归属**（有哪些文件、哪些节、哪些槽位，各归哪个阶段，长在什么路径上）以**本文件**为准。
> 原来这里写的是「本文件与之冲突处一律以 `CONTEXT.md` 为准」——那句话与 §1「本表是唯一一张归属表」互相指对方，
> 读到哪份都能自证，[#26](https://github.com/jiangxidong/EduApplication/issues/26) 拆掉了这个环。
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
> ✅ **「唯一」现在是现状，不再只是决议**（[#26](https://github.com/jiangxidong/EduApplication/issues/26) /
> [ADR 0011](../../docs/adr/0011-the-glossary-defines-words-the-contract-holds-the-values.md)）。
> `main` 上的 `CONTEXT.md` 曾存了第二份完整十节表（含 owner 列，#23 落盘时自己写的），已删除——
> 词表本身、owner 列、排序与写入规则**整个归本节**，`CONTEXT.md` 的「节」词条只留机制（什么是节 / 封闭词表 /
> 禁止互为前缀 / 前缀匹配）。指针环按**范围**拆：**词的定义以 `CONTEXT.md` 为准，v1 的取值与归属以本文件为准。**
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
| 3 | `programs.md` | frontmatter（`season_downgraded`，见 §4）＋ Markdown 表，**13 列**（逐列 schema 见 **§4.6**） | **项目池**（选校决策面） | **选校**（**全部 13 列，含 `status`，无例外**——见 §1.5 注 ①） |
| 4 | `claims.md` | Markdown 表，4 列 | **主张集**（全局唯一，文书与推荐信共用） | 🔴 **按行单向移交**：**冷启动 / 画像**只 append 新行，**文书**此后全权（见下） |
| 5 | `channels/<channel_key>.md` | frontmatter（`season_downgraded`，见 §4）＋ Markdown，**分节** | **约束层**（逐申请渠道的 rendering rules） | 🔴 **按节归属，见 §1.2**（5 个阶段 owner） |
| 6 | `materials/*.md` | frontmatter **三键** `material_id` / `sensitive` / `verifiable_by` ＋ 正文（形状规则见下，**一律列名不计数**） | **文书素材**（素材门槛在此判定）；推荐信线是第二个消费方，**只读** | **文书**（见 §1.5 注 ②） |
| 7 | `essays/canonical/*.md` | Markdown + frontmatter **二键**（名单见下） | **文书 canonical**（当前版，三个形态） | **文书** |
| 8 | `essays/canonical/per-program/<program_key>.md` | frontmatter + 散文 | **逐项目 why-this-program 内容**（不可再生） | **文书**（按 §1.4 前缀继承） |
| 9 | `essays/canonical/_versions/*.md` | Markdown | 历史版本，只增不改 | **文书** |
| 10 | `documents/<槽位>/…` | 原始文件 | **材料 canonical**（信息量最大的一侧），**七槽位见 §1.3** | **材料** |
| 11 | `recommenders.md` | Markdown | **推荐人身份五块**（候选 / 逐校机制 / 分配 / 起草授权 / 提交事实，红线区） | **推荐信** |
| 12 | `recommenders/drafts/<recommender_id>.md` | Markdown | **C 档推荐信草稿**（🔴 受起草授权声明门控） | **准备包**（新增顶层路径，按 §1.4 显式指派） |
| 13 | `packets/<program_key>/**` | 由 [#8](https://github.com/jiangxidong/EduApplication/issues/8) 定 | **可再生产物**，删了能重建 | **准备包** |
| 14 | `log.md` | Markdown，append-only | **跨会话交接** | `append-only` —— **不在 owner 辖区**（[ADR 0008](../../docs/adr/0008-the-owner-binds-to-a-section-not-a-file.md) 限定 3，见 §1.5 注 ③） |

**六个主键**，全部 ASCII（遵 §4.5）：`program_key` / `channel_key` / `recommender_id`（`r1`…）/
`institution_id`（定义权在 `profile.md`，`documents/` 只引用）/ `claim_id`（`c01`…）/
`material_id`（`m01`…，[#38](https://github.com/jiangxidong/EduApplication/issues/38) 补入）。

> `material_id` 是一条**早就落盘的跨文件引用**（`claims.md` 的 `materials` 列存的就是它），此前却不在本名单里——
> 唯一一条没有权威定义的跨文件 id。风格对齐 `claim_id`，并**进文件名**（`m01-<中文短名>.md`）：
> **id 进文件名，引用才能靠 glob 解析**，否则每次解析都要打开全部素材文件读 frontmatter，
> 而 `sensitive` / `documents/` 禁读区那条线的整个设计前提就是「agent 少读文件」。

#### `materials/*.md` 的字段名单（v1 定稿）

🔴 **一律列名，不写「N 字段」**（[#30](https://github.com/jiangxidong/EduApplication/issues/30)）——
「六字段 / 七字段」曾在三处票面上并存三种计数，正是 [#24](https://github.com/jiangxidong/EduApplication/issues/24)
在文件上杀掉的那个病（「表的行数就是文件数，任何文件都不带序号」）。

**准入判据 = 消费方**（[ADR 0014 语义槽位不是落盘字段](../../docs/adr/0014-a-semantic-slot-is-not-a-stored-field.md)，
[#38](https://github.com/jiangxidong/EduApplication/issues/38)）：**有落盘消费方的进 frontmatter，其余留正文。**
进了 frontmatter 的值一律 ASCII，但那是**格式约束、不是准入判据**（§4.5）。
判据本身不是新发明——它是 [ADR 0008](../../docs/adr/0008-the-owner-binds-to-a-section-not-a-file.md) 判 owner 归属
那台机器换个对象用，[ADR 0011](../../docs/adr/0011-the-glossary-defines-words-the-contract-holds-the-values.md) 已抬用过一次。

**frontmatter 三键**：

| 键 | 值域 | 消费方 |
|---|---|---|
| `material_id` | ASCII 主键 `m01`…，**并进文件名** | `claims.md` 的 `materials` 列（跨文件 id 引用）；`derive-demo.sh` 的派生视图 |
| `sensitive` | ASCII 二元 `yes` / `no`（遵 §4.5） | [#12](https://github.com/jiangxidong/EduApplication/issues/12) pack 门槛两条合取的**第二条**——敏感素材**默认不进给第三方的包**（[#17](https://github.com/jiangxidong/EduApplication/issues/17)） |
| `verifiable_by` | `recommender_id` 列表（引 `recommenders.md` 的候选人表），可空 | pack 门槛两条合取的**第一条**；`recommenders.md` 据它选人。**空 = #12 的「缺人」缺口** |

🔴 **`敏感` → `sensitive` 只改落盘形态，#17 的决策一个字没变**（仍是「带标记 / 二元 / 用户可下调」）。
§4.5 那条坑此前被读窄了：`uniq` 数错 / `sort -u` 丢行是「中文内容撞 shell 工具」，
而脚本 `grep '^敏感:'` 时**已经在中文上做匹配**，对键和对值同样成立。

🔴 **`verifiable_by` 是「可验证性」从散文升上来的**，不是新字段。#12 把可验证性定成 pack 门槛的**判定本体**，
判定本体停在正文散文里等于门槛不可执行。**空列表 = 缺人缺口**，与 `claims.md` 的 `materials` 空 = 缺素材缺口完全同构。
硬后果一并接受：「谁能证实」被限制成**必须先是一个推荐人候选**。样例 m02 的「李老师（联系方式不在手）」正卡在这——
**这恰好对**：联系不上是 `recommenders.md` 的状态，不是素材的属性。一条谁都证实不了的素材写 `verifiable_by: []`，
它**仍是合格文书素材，只是进不了 pack**（#12 结案后修正 §3：可验证性在文书线是独立属性，在推荐信线是判定本体）。

🔴 **「消费方尚未实现」≠「没有消费方」。** `material_id` 有跑起来的读者；`sensitive` 与 `verifiable_by` 的消费方是
#12 的 pack 门槛——**契约已定，实现落在 `derive-demo.sh`**。下一个 session 照字面套判据会当场杀掉 `sensitive`，
所以这条分界写在这里。而**「将来会有人读」不算消费方**——`usable_for` 因此仍然出局。

**三个键删掉，理由各不相同**（这是判据在切真关节，不是一刀切）：

| 键 | 出局的理由 |
|---|---|
| `type`（`工作项目` / `学术经历`） | **零消费方**，且是唯一一个中文值的键。分类的实际承载者是 `claims.md`——素材是按**主张**被选中的，从来不是按类型 |
| `usable_for` | **两条判据各判它出局一次**：消费方判据——选材路径是「主张 → 素材」，它不在任何决策链上；镜像判别式——文书类型清单逐渠道住在 `channels/` 的「文书规格」，**源在别处**（满足 #30 补完前提句后的完整定义） |
| `concrete: true` | 它为保持为真必须跟着同一文件的正文改，**源就在正文里** → 镜像，且是 #30 明令的「可再生缓存」 |

另有 `已用于` **确定不在名单内**（#30 裁决，见下）。

**正文的形状规则**：三问写成**三个固定小标题** —— `## 时间` / `## 我做了什么` / `## 结果`。

> 🔴 **只判形状，判不了内容。** 三个标题齐全而底下写的是感想，脚本一样放行。
> **判「具体」的是采集时的 agent，不是脚本**——与 [#14](https://github.com/jiangxidong/EduApplication/issues/14) 已定的
> 「纯 `awk`/`grep` 可判的归静态检查组、其余须跑 agent」一致。删掉 `concrete` 之后三问只剩正文，
> 这条规则存在的全部理由就是让 #14 的检查项**至少能断言形状**。

⚠️ **正文的「不能用在哪」留下**（样例 m01 有）。它和 `usable_for` 是同一判断的正反两面，但**只有一面是镜像**：
`不要用在「为什么选这所学校」` 的源不在任何别处，与 `tier_basis`、「主张 → 推荐人分配」同类，走 #30 那句前提句放行。
**留判断那一面。**

🔴 **正文不写「谁能证实」**（[#49](https://github.com/jiangxidong/EduApplication/issues/49) 已判）。
它与 frontmatter 的 `verifiable_by` 覆盖同一条边的同一端，且逐段都是镜像：id 镜同文件的 frontmatter，
「直属 leader」这类称谓镜 `recommenders.md` 的姓名/关系列，「能证实同期的学术表现」镜本文件正文的三问。
与 `concrete: true` 同形——**源就在同一个文件里**。
`recommenders.md` 的「能证实什么」列同判、已删（[ADR 0006](../../docs/adr/0006-claims-are-one-shared-truth-source.md) 补充（#49））。
**可验证性只有一个落盘处：frontmatter 的 `verifiable_by`。**

🔴 **推荐信阶段对 `materials/` 只读，不写**（[#25](https://github.com/jiangxidong/EduApplication/issues/25)）。
`verifiable_by` 由**文书阶段在素材采集时**填；推荐信阶段**读**它去选人，产出的「主张 → 推荐人分配」落
`recommenders.md`，**不回写这里**。`sensitive` 同理：文书阶段采集时判定，推荐信阶段读它决定进不进 pack。
**消费不产生写入权**（§1.4 的归属判据原话是「后到者只读」）。

✅ **`programs.md` 的 13 列已在样例里落全**（[#31](https://github.com/jiangxidong/EduApplication/issues/31)）。逐列 schema 见 **§4.6**。

> 本处旧版写着两条**错的**断言，读到引用它的地方请以此为准：
> ① 「样例里一条 `✓` 事实都没有」——不成立，三个 `channels/` 文件共 **40 条 `✓ <url>` 事实行**（#31 落盘时的数）。
> 真实约束窄得多：**承载分档的 `✓` 只有 UIUC 一条**（研究生院对中国申请人的 B Average / 80%），
> 于是 [ADR 0005](../../docs/adr/0005-basis-points-at-an-existing-checked-fact.md) 的准入测试对 UIUC 行当场就过，Columbia / Cornell 两行过不了。
> ⚠️ **上面这句「只有 UIUC 一条」已被 [#45](https://github.com/jiangxidong/EduApplication/issues/45) 推翻**（2026-08-15）：
> 两次真取回后 Columbia 也有了承载分档的 `✓`（`no minimum GPA … typically 3.5 or higher`），准入测试对它同样过了，
> 该行 `undecided → reach`；`✓` 事实行总数也从 40 涨到 **50**。**这一格记的是当时的取证，数字会随取证增长——
> 别把它当现行断言引用**（同 `log.md` 历史观察值的豁免形状）。
> ② 「`derive-demo.sh` 的列数完整性检查断言 9 列」——不成立。它是**自相对**的（`if(!n) n=NF`，表头定基准），
> 9 是**打印出来的**不是断言的；判断层四列**追加在末尾**后它自动打印 13，**脚本一行都没改**。

**`claims.md` 的四列**：`claim_id` / 断言（中文自由文本，禁 `|`）/ `materials`（支撑素材 id 列表，空格分隔；
**空 = 缺素材缺口**）/ `voice`（`self` / `referee` / `both`）。
「哪篇文书用了哪些主张」这条边**只存在消费端**：`essays/canonical/*.md` 的 frontmatter 写 `claims: [c01, c03]`，
`claims.md` **不设 `used_in` 列**（两端都存必漂移）。见 [ADR 0006](../../docs/adr/0006-claims-are-one-shared-truth-source.md)。
🔴 **`voice` 是文书线的闸，不是推荐信线的闸**（[#52](https://github.com/jiangxidong/EduApplication/issues/52)）。
`referee` 禁的是「申请人自述」（比较性断言自夸失礼）；**没有任何取值禁止把一条主张分配给推荐人**。
`recommenders.md` 的「主张 → 推荐人分配」**定义域 = 全部主张**，能不能分由 #12 §7 的 pack 门槛
按证据逐条判（`verifiable_by` 含该 `recommender_id` ∧ `sensitive = no`），不由 `voice` 判。
两者不同轴：`voice` 判**叙述位置**，分配判**证实能力**——让文书线的一个枚举值单方面决定推荐信线的内容，
撞 [ADR 0006](../../docs/adr/0006-claims-are-one-shared-truth-source.md)「主张集全局唯一、两条线**共用**」。
⚠️ **`voice` 因此两条线各有一个消费方**：文书线是「这条主张由谁来说」，
推荐信线是 `claims.md` 那条「`voice = referee` 的零素材主张 = **双重缺口**」的分类依据。
🔒 **文书线那道闸的被测对象是 `essays/canonical/*.md` 的 `claims:`**（[#63](https://github.com/jiangxidong/EduApplication/issues/63)）。
`claims:` 记的是「这篇引用了哪些主张」，而禁令说的是「申请人自述」——两者在 canonical 层**重合**：
canonical 文书**整篇都是申请人的声音**（[ADR 0006](../../docs/adr/0006-claims-are-one-shared-truth-source.md)：
「文书是申请人自述主张，推荐信是第三方佐证同一批主张」），文书里不存在第三方在说话的位置。
**被 `claims:` 引用即被自述。**

规则因此是：**`essays/canonical/*.md` 的 `claims:` 里不得出现 `voice = referee` 的 `claim_id`。**
`both` 与 `self` 一律放行（`both` 的语义明写允许自述）；`essays/canonical/README.md` 不是三个形态之一，不在作用域内。
`voice` 的值**现读 `claims.md`**，不许在别处存第二份主张表。

⚠️ **本条不动禁令本身**（[#52](https://github.com/jiangxidong/EduApplication/issues/52) 已锁），只定它读什么。
机械化见 `essay-cites-no-referee-claim`（[`docs/checks.md`](../../docs/checks.md)）——清单只持名与指针，本节是规则原文的唯一权威。
🔴 落地时**必须一并落 violation fixture**：样例当前不违反，直接落地就是 #52 点名的**空闸**
（[ADR 0017](../../docs/adr/0017-a-check-that-compares-against-a-forkable-copy-is-vacuous.md) 推论 2：全绿不是证据）。

🔴 **`essays/canonical/*.md` 的正文不设结构契约**（[#32](https://github.com/jiangxidong/EduApplication/issues/32)）。
上表第 7 行此前只规定了「Markdown + frontmatter」，正文一个字没管；这条空白现在是**有意的**，不是漏掉的。
三个形态统一为「frontmatter + 散文」**一种**写法，没有任何 `render_form` 需要破例——
正文就是文书本身，措辞是手艺，不存在唯一正确取值（§1.5 判别式的限定句）。逐形态「长什么样」的说明留在
`essays/canonical/README.md`，那是**说明不是契约**。

**唯一一条正文规则是否定式**：正文里**若**出现引用其它真相源主键的表格，
该表只许存主键与本文件自己的判断，**不得复述被引对象的内容**。

> 由 `points.md` 那张 `| # | 论点 | 素材 | 可回答哪类题 |` 表逼出来。`论点` 是 `claims.md` 的 `断言`、
> `素材` 是它的 `materials`，两列都是镜像——**且样例里已经实地漂开**：c02 的
> 「我的工程经验本身暴露了我**缺系统性的分布式系统训练**」在表里成了「我的工程经验暴露了**系统性训练的缺口**」，
> 「分布式系统」这个限定丢了。
>
> 删到只剩 `claim_id` 一列仍不干净：它与 frontmatter 的 `claims:` **互为镜像**，
> 而**分配能算出集合、集合算不出分配**——两处存必有一处是投影。#32 因此整张表删掉，改四个 `###` 分节：
> **节标题 = 题类**（自由文本，非封闭词表，故按 §4.5 可用中文），**空节 = 这类题还没东西写**，那就是缺口本身。
> 边只留在 frontmatter 的 `claims:` 一处，机械读者（`derive-demo.sh`）三个形态一视同仁。
>
> ⚠️ **本票只裁了正文，没有重扫 frontmatter。** [ADR 0014](../../docs/adr/0014-a-semantic-slot-is-not-a-stored-field.md)
> 的消费方判据自己写着「别处的 frontmatter（`essays/canonical/*.md`、`apply.md`、`profile.md`）都该按它重扫一遍，
> **这次没有重扫**」。
> ✅ **[#50](https://github.com/jiangxidong/EduApplication/issues/50) 已重扫**：六键降为**二键**（`version` / `claims`），名单见下。

#### `essays/canonical/*.md` 的 frontmatter 名单（v1 定稿）

| 键 | 取值 | 消费方 |
|---|---|---|
| `version` | 整数 | `packets/<program_key>/essays/*.md` 的 `source_version:`（**已落盘**，见 `prototype/application-packet` 里带 `source_version:` 的三个渲染物——那是**产物侧**的渲染物，不是这三个形态） |
| `claims` | `claim_id` 列表 | `derive-demo.sh` 的两个派生视图；这条边**只存这一处**（[ADR 0006](../../docs/adr/0006-claims-are-one-shared-truth-source.md)、[#32](https://github.com/jiangxidong/EduApplication/issues/32)） |

**删掉的四个键，理由各不相同**（[#50](https://github.com/jiangxidong/EduApplication/issues/50)）：

- `word_count` —— 零消费方；源就在同一文件的正文里，改一版即假；且它是**当前状态**，不是契约。
- `target` —— 与 [ADR 0014](../../docs/adr/0014-a-semantic-slot-is-not-a-stored-field.md) 判 `usable_for` 出局的同一条：文书规格**逐渠道**住 `channels/`，源在别处 ⇒ 镜像。且样例里已经漂了——Columbia 的「250–1000 词，**超出不罚**」在 `target:` 里丢掉了那个限定。
- `render_form` —— 键值 ≡ 文件名去掉 `.md`，三篇实测全等。**形态由文件名承载**（§5）。
- `supersedes` —— 零消费方；`_versions/README.md` 自陈它是「这个目录为空」的另一面。

🔴 **`version` 险些被这次重扫杀掉，救它的是跨分支 grep。** 它的消费方**落在另一个分支的已落盘产物上**。重扫一律跨分支查：同 `sensitive` 那条「消费方**尚未实现** ≠ 没有消费方」，本条是「消费方**不在本分支** ≠ 没有消费方」。

🔴 **本名单只管三个形态**（`long.md` / `short-250.md` / `points.md`）。`essays/canonical/README.md` 与 `_versions/README.md` **不是形态**、没有 frontmatter，不受本名单约束——键名单挂在 `essays/canonical/*.md` 这个 glob 上，而那个 glob 字面上罩住了两个 README。`materials/*.md` 的名单有同一个洞（`materials/README.md`），两处读法一并按此定死。

🔴 **写入权按「行」单向移交**（[#25](https://github.com/jiangxidong/EduApplication/issues/25)，[ADR 0008](../../docs/adr/0008-the-owner-binds-to-a-section-not-a-file.md) 限定 2）——
**冷启动 / 画像**：只 append 新行，写 `claim_id` / `断言` / `voice`，`materials` 留空
（[#21](https://github.com/jiangxidong/EduApplication/issues/21) 已定「全局集里允许零素材主张，那正是缺口本身」）；**从不改已有行**。
**文书**：此后这一行的全部写入权归它（改措辞、填 `materials`、调 `voice`）；**从不 append**
（#21 已定「文书从『发明主张』改为『从主张清单里选』」）。

移交发生在**行诞生的那一刻**，方向不可逆，因此任一时刻每行仍只有一个写入者。
🔴 #23 说它「与 `channels/` 完全同构」是**错的**——`channels/` 按节切（封闭词表），它按**生命周期两端**切，
那正是 ADR 0008 §3 否决掉的**时序判据**；救它的是限定 2 的移交闸门，不是那句同构。
⚠️ 这条**不进孤儿检查脚本**：验它要 commit range，而工作区不是 git 仓库，没有 diff 可跑，
也没有「这次写入属于哪个阶段」这项元数据。它是**写给 skill 的行为规则**，靠本段措辞约束，不靠脚本。

🔴 **`已用于` 已删**（[#30](https://github.com/jiangxidong/EduApplication/issues/30) 裁决，[ADR 0006](../../docs/adr/0006-claims-are-one-shared-truth-source.md) 补充节）。
通则：**一条关系边只存在它那个已经落盘的消费端，两端都不存。** 素材侧因此不设 `已用于`，同 `claims.md` 不设 `used_in`。

两个用途都不需要它：**防跨推荐人雷同**的轴是**主张**不是素材（#12 §5 自己写着「直接分素材是分错了层」），
边已落在 `recommenders.md` 的「主张 → 推荐人分配」上；**防跨校开头雷同**在架构上不成立——
#10 §8 定了跨校 canonical + delta 且 delta 只剩 `why this program`，开头段属于 canonical、**跨校本来就是同一份**，
「前 3 校都拿 X 素材开头」是设计的必然结果不是缺陷。**不新增任何派生视图，也不留可再生缓存**
（`packets/` 的可再生豁免建立在「没人从它读回去」上，索引不满足这个前提）。

另注：frontmatter 的 `usable_for`（可以用在哪类文书）与被删掉的 `已用于`（实际用过哪几篇）**是两回事，不是前者顶替了后者**。
✅ **`usable_for` 自身也已出局**（[#38](https://github.com/jiangxidong/EduApplication/issues/38)）：文书类型清单逐渠道住在
`channels/` 的 `文书规格`，**源在别处** ⇒ 过不了镜像判别式；同时它也过不了消费方判据（选材路径是「主张 → 素材」，
它不在任何决策链上）。**两条判据各判它出局一次**，逐键理由见上面 §1.1 的字段名单。

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

🔴 **行首标记不封词表。** 本契约**实持一张**封闭词表——法定节名；`待核实` 后缀归 [ADR 0001](../../docs/adr/0001-evidence-stays-binary-with-a-closed-suffix.md)（全表在 `CONTEXT.md`「证据」），`tier` 归 `CONTEXT.md`「分档」（[#26](https://github.com/jiangxidong/EduApplication/issues/26) / [ADR 0011](../../docs/adr/0011-the-glossary-defines-words-the-contract-holds-the-values.md) 已判，§4.5 与 §4.6 第 6 行都已自陈）。**别再写「三张」这个计数**（[#59](https://github.com/jiangxidong/EduApplication/issues/59)）。三者都是因为**要被机械汇总**才封的；
行首标记不参与任何汇总，是纯装饰。封表买不到任何机械能力，只换来一个维护面：谁哪天写了 `🚨`，检查当场 FAIL。

**节序自由。** 原「节按上表顺序排列」**已取消**（[#28](https://github.com/jiangxidong/EduApplication/issues/28)），
那条按节序排列的机械检查随之删除。它买到的只是 diff 稳定与阅读可预期，**不定任何 owner**；代价却有两层：
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
这条规则对应机械检查 `overlay-no-bare-lines`；
⚠️ [#25](https://github.com/jiangxidong/EduApplication/issues/25) 随后新增 `split-is-declared`。
两条检查各自的规则原文、被测对象与曾用号，见 [`docs/checks.md`](../../docs/checks.md)——
清单只持名与指针（[ADR 0016](../../docs/adr/0016-the-checklist-holds-names-and-pointers.md)），本节不数条数、不复述规则文本。

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

🔒 **`费用与资格` 收两类：申请季要付的钱（申请费及其减免），与项目自身的资格属性（CIP 分类、STEM 指定）。二者都由选校消费，owner 不变。**
这句是 [ADR 0008 限定 5](../../docs/adr/0008-the-owner-binds-to-a-section-not-a-file.md) 要求的「范围话」的**第一个实例**——限定 5 规定：
援引「现有单元都收不下」来给封闭词表加项时，每一个「收不下」必须引用一句**写下来的**范围话。**以后会被援引，措辞别改写。**
⚠️ **粒度是项目级**：CIP 与 `program_key` 两头对不上（[#34](https://github.com/jiangxidong/EduApplication/issues/34) 已查实），
所以它的家是覆盖层 `## 项目级差异` → `### <program_key>` → `#### 费用与资格`，**不是渠道层的 `## 费用与资格`**（[ADR 0018](../../docs/adr/0018-a-global-lookup-table-stays-out-of-the-workspace.md)）。
> 🔒 **`学历门槛` 收「学校公布的、施加在申请人身上的准入线」这一整类，连同读懂这条线所必需的一切**：学历本身（本科院校层级、学位与成绩单的认证与评估、成绩换算口径）、GPA 线、以及标化考试线（GRE，与 TOEFL ／ IELTS ／ Duolingo 等语言成绩）。**同收**：这条线的**档位结构**（多档时每一档的名字与取值）、**量表口径**（成绩日期与量表切换）、**未达标的后果与授予方式**（入学后补课、逐案裁量、限制性录取算不算真实的录取路径），以及**「本项目适用哪一档」这类尚未取证的问题**。判据是这条事实描述的是「**申请人要达到什么、达不到会怎样**」，不是「这个项目是什么」。它们同由选校的分档决策消费（[ADR 0004](../../docs/adr/0004-tiers-are-anchored-on-published-hard-requirements.md) 把分档锚在**硬门槛**上，而 `CONTEXT.md`「硬门槛」词条把「语言分下限」与「是否要 GRE」逐字列进硬门槛的定义；分档机制见 `CONTEXT.md`「第二条线」「擦线」），owner 不变。
> ⚠️ **`英语门槛` 这个词不进任何词表，也不作废。** 它照旧可以出现在标题的**自由后缀**里、出现在正文里；被禁的只有「让它顶在标题最前面充当节名」。

🔒 **`项目内容` 收 why 段要引用的具名事实：课程号、教授、实验室、中心、项目特有课程结构。** 由文书消费，owner 不变。
（这句原住 `CONTEXT.md`「项目内容」词条，[#79](https://github.com/jiangxidong/EduApplication/issues/79) 按 ADR 0011 决定 ② 搬来；词条保留词的内涵，不再持枚举。措辞逐字未动（#65 曾逐字援引），本句同受上方「以后会被援引，措辞别改写」纪律。）

🔒 **范围话（「`X` 收……」句）的唯一居所是本节。** 词汇表定义词、不持范围——两处住必成镜像（ADR 0011）。（#79）

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
> 🔴 **这里原本写着一句 ✅：「前缀匹配已按上面的剥离规则在三个样例文件的全部 `##` 标题上实测通过。」它是假的。**
> [#65](https://github.com/jiangxidong/EduApplication/issues/65) 在 `prototype/state-layer` 与 `prototype/application-packet` **两棵树各实测一遍**：按它自己的限定（只数 `##`）就已经假了（`## 英语门槛 —— 🔴 两档，且 2026-01-20 起换了量表` 当场 FAIL）；连 `####` 一起数是 **38 个标题 / 5 条 FAIL**（`英语门槛` ×2、`学位形态` ×3）。
> 此前「样例全部过得了前缀匹配」那句断言在 #23 结论 / #24 票面 / 本节验收注 / #27 末段**四处被转述、四处都错**
> ——六个节 FAIL，坏在 `🔴 ` 顶在节名**之前**；四处现已全部更正。**本行是第五处。**
> 🔴 **判据没有第二次让步**：`🔴` 前置是全 repo 的书写习惯，`git grep '^#\+ *[🔴⚠️🔒]'` 命中 9 处，**本契约自己占 3 处**；剥离规则原样保留。
> **#65 的修法是改夹具、不动词表**：`英语门槛` 两处标题降为正文行并入 `学历门槛`；三处 `#### 学位形态` 按用途分流并入 `#### 费用与资格` 与 `#### 项目内容`。改后**两棵树都是 `FAIL = 0`，而封闭词表一项没加**——见 [ADR `0022`](../../docs/adr/0022-a-name-outside-the-vocabulary-is-not-a-reason-to-add-one.md)。
> ⚠️ **本行记的是一次取证，不是一条现行断言。** 夹具再改一次它就可能再翻——**要用就重跑，别再转述**。
>
> ⏳ **覆盖层的 9 行占位行尚未按上面的 `####` 规则整理**，归 [#27](https://github.com/jiangxidong/EduApplication/issues/27)；
> 每行挂哪个 `####` 已由 [#28 的结案评论](https://github.com/jiangxidong/EduApplication/issues/28) 定死，**照抄即可，不必再判**。

### 1.3 `documents/` 的七个槽位

> 🔒 **本节是「槽位 → 目录形状 / 逐院校 / 敏感级」的唯一权威**（ADR 0011）。`CONTEXT.md` 的「槽位」词条只留
> **中文 ↔ 标识符**两列——那是「三重身份」总则的内容，不随路径结构变；这三维随路径结构变，是镜像。

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
**契约里出现的每个路径都能解析到一个 owner 阶段（自身或祖先目录）**；标记 `append-only` 的路径视为已解析，
见 [ADR 0008](../../docs/adr/0008-the-owner-binds-to-a-section-not-a-file.md) 限定 3，本节不复述。
这条的机械检查叫 `path-resolves-to-owner`（[`docs/checks.md`](../../docs/checks.md)）。

### 1.5 §1 合并时转出的四处裁决（**全部已结**）

[#24](https://github.com/jiangxidong/EduApplication/issues/24) 的边界是**只合并、不做新决策**。合并现场查出四处需要裁决，原样保留并转票：
①②③ → [#25](https://github.com/jiangxidong/EduApplication/issues/25)，④ → [#26](https://github.com/jiangxidong/EduApplication/issues/26)。四处现已全部裁完——**本节只留审计线索，答案住在它指的地方，不在这里。**

① **`programs.md` 的 `status` 列** → 归**选校**，全部 13 列无例外（#25）。
🔴 **「投递」不是一个阶段，也不需要是**：`applying → submitted` 这一跳**产品一个动作都没有**——「点提交」在停手线上、
「提交及其之后」在地图 Out of scope 里。`submitted` 是**用户报告的一件已发生的事**，产品只负责记账。
`status` 是池子的状态轴（[ADR 0002](../../docs/adr/0002-one-program-pool-one-status-axis.md)），而池子是**选校的决策面**。
代价是一次 skill 跳转：用户在 `assemble-packet` 里说「我投了 Columbia」时，agent **不得就地写**，须转到 `pick-programs`。
**否决行级移交**（拍板那刻把该行交给准备包）——它在**反悔**上破：`applying` 退回 `shortlist` / `dropped` 之后，
按「不可回流」这一行永远归准备包，池子里会出现一个「`shortlist` 但选校阶段不能动」的行。→ §1.1 第 3 行

② **`materials/*.md` 的 owner** → **单 owner = 文书**，推荐信阶段**只读**（#25）。
按 §1.4 的消费方判据这里根本没有分叉——「多个阶段消费时归**最早**的，**后到者只读**」，**消费从来不产生写入权**。
#12 的「推荐信线是第二个消费方」是**对的事实、错的推论**：它只支撑「`materials/` 不该住在 `essays/` 下」，不支撑写入权。
实地核查过，`materials/` 里没有任何一条只有推荐信阶段才能产出的事实。→ §1.1 第 6 行与其下的说明

③ **`log.md` 由每个阶段追加** → **不是破例，规则管不到它**（#25，[ADR 0008](../../docs/adr/0008-the-owner-binds-to-a-section-not-a-file.md) 限定 3）。
owner 只管**会被改写**的内容：ADR 0008 防的是**责任漂移**，而漂移必须**经由改写**发生；
append-only 且从不被改写的内容里没有「保持为真」这项责任，也就没有可漂移的对象。
这条推理本文早就在用（见下方镜像豁免：「`log.md` 从不被改写，所以它记的是历史观察值不是镜像」）。
附带解释了样例里明摆着的一件事：**它的分段单位是「会话」不是「阶段」**，而一个会话可以跨多个阶段——
按原规则这当场违规，按限定 3 **分段单位根本不参与判定**。
owner 列因此填封闭标记 **`append-only`**，**不能留空**（留空正是机械检查 `path-resolves-to-owner`
（见 [`docs/checks.md`](../../docs/checks.md)，[ADR 0008](../../docs/adr/0008-the-owner-binds-to-a-section-not-a-file.md) 限定 3）要抓的形态）。
**否决 `所有阶段` 这个 owner 值**：它把「无 owner」改写成「owner = 全体」，字面过检查，
但这个值一旦存在就是**没有判据的万能出口**。→ §1.1 第 14 行

④ ~~**§1.2 这张十节表本身存了两份**~~ — **已结**（[#26](https://github.com/jiangxidong/EduApplication/issues/26) /
[ADR 0011](../../docs/adr/0011-the-glossary-defines-words-the-contract-holds-the-values.md)）。
`CONTEXT.md` 那份已删；判据是**镜像判别式 + 消费方判据**（见 ADR 0011），本节是唯一权威。
连带落位的还有两处：`documents/` 七槽位**拆列**——中文 ↔ 标识符留 `CONTEXT.md`，目录形状 / 逐院校 / 敏感级归 §1.3；
`tier` 五档**方向相反**，归 `CONTEXT.md`（五个档各自就是词），§4.5 只留规则与举例。

---

**不落盘的派生视图**（每次现算现打，绝不存文件）：
待核实清单、缺口清单、deadline 日历、完成度自检、每校材料缺口、推荐信闸口、素材门槛、
选校清单、投递名单、**「主张 → 支撑素材」对照表**、**推荐人 support pack**（每**推荐人**一份，不跟 `program_key` 走，
因此**不落 `packets/`**）、**推荐人覆盖缺口**、**pack 门槛**、**请求推荐邮件草稿**（一次性、发出即完成、不迭代）、
**STEM 资格**（拿本项目的 CIP code 对照 DHS STEM 名单**现算**；工作区里只落 CIP code，见 [ADR 0018](../../docs/adr/0018-a-global-lookup-table-stays-out-of-the-workspace.md)）。

🔴 **入列判据是三条合取，不是「它像不像一张视图」**（[#61](https://github.com/jiangxidong/EduApplication/issues/61)）：
**产品会产出它 ∧ 每次现算 ∧ 绝不存文件。** 名单里混着**清单**、**判断闸口**、**一次性产物**三种形态，那是**有意的**，不是待清理的杂质。
⚠️ 一道闸口**本身是一条规则、要落盘**；派生的是它的**判定结果**（「这道闸现在过没过」）——名单里的闸口类条目指的是后者。
⚠️ 因此**「它不像一张视图」不构成删项理由**。要删一项，得证明它不满足上面三条合取，或 v1 根本不产出它。

> 存一份就是第二个真相源。竞品坑 #9：合并单文件与散文件同时被安装 → 同一事实索引两遍，检索互相稀释。
> `euro-grad-apply` 的 README 自己推荐的安装路径就有这个坑。

**判别式**（这一条能一刀切开所有边界情形）：
> **这行字为了保持为真，需不需要被改写？需要 → 它是镜像，删掉；不需要 → 它是事实，留着。**

> 🔴 **补一句前提**（来自 [#12](https://github.com/jiangxidong/EduApplication/issues/12)）：
> **「镜像」的前提是别处有源；没有源的可变内容是判断，不是镜像。**
> `recommenders.md` 的「主张 → 推荐人分配」会被改写，但它不是任何别处内容的镜像——它就是真相源。
> 同 [#11](https://github.com/jiangxidong/EduApplication/issues/11) 的 `tier_basis`：**判断必须落盘**，否则跨会话失效。

> 🔴 **再补一句限定**（[#32](https://github.com/jiangxidong/EduApplication/issues/32)）：
> **镜像 ⇔ 这段内容存在一个唯一正确的取值，而那个取值在工作区内的别处。**
> 少了这句，判别式对 `essays/canonical/` 是**逐字自毁**的——canonical 文书本来就是「把主张写成人话」的产物，
> `long.md` 的正文整篇都在复述 `claims.md` 的主张，措辞一改「就得跟着改」，按字面读它整篇是镜像，该删。
> 散文没有唯一正确取值（措辞是手艺）；表格单元格有（`论点` 那一格的正确取值就是 `claims.md` 里那一格的字符串）。
>
> ⚠️ **不要把这条读成「散文豁免」。** 紧接着下面那句「任何文件都不写当前状态」禁的正是散文
> （「不写素材几条、不写闸口几比几」）。切口开在**有没有唯一正确取值**上，不开在体裁上。
> **「工作区内」同样是限定的一部分**：`✓ <url>` 指向站外，站外页面不是工作区的真相源，不进这条判据。
>
> **自测**：两个 agent 各写一遍，差异算 bug 还是算文风？**算 bug ⇒ 是镜像。**

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
- **学费、门槛、CIP 分类、申请费全部下沉到 `channels/<channel_key>.md`**，各带各的行首标记
  （🔴 落进去的是 **CIP code**，不是 STEM 结论——STEM 资格是派生视图，见 [ADR 0018](../../docs/adr/0018-a-global-lookup-table-stays-out-of-the-workspace.md) 与 §1.5）
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

🔒 **`channels/` 的 bullet 分两类，判据是「校方那边有没有一个答案」**（[#50](https://github.com/jiangxidong/EduApplication/issues/50)）：

- **事实行** —— 断言「校方那边有一个答案」，**必带证据标记**（`✓ <url>` 或 `待核实`）。
- **判断行** —— 本工作区自己的推论 / 渲染配方，**顶层 `- → ` 起头、不带任何标记**。现货：Columbia 与 Cornell 的 `- → 渲染来源` 行。

🔴 **切口切在「顶层 bullet 的首行」，不切在「有没有 `→`」。** `→` 在样例里绝大多数是**事实行下面的缩进续行**（三个 channel 文件共 8 条），那些续行的标记在**上一行**，本来就不该自带；按「`→` 开头」写会把 Cornell 那条「→ 涂黑要在**扫描之前**做」当场判成不合规，而它是对的。**缩进续行不独立分类，随它所属的那条 bullet**；`> ` 引用块照旧走本节上文的「标记不进散文」。

🔴 **两个错误答案各错在哪**：给判断行打 `✓` 是**凭空造出处**（[ADR 0007](../../docs/adr/0007-a-checkmark-is-earned-by-a-fetch-not-by-a-capability.md) 与停手线取证类）；给它打 `待核实` 会造出一个**永远核不掉的条目**去污染待核实清单——原因后缀那张表（[ADR 0001](../../docs/adr/0001-evidence-stays-binary-with-a-closed-suffix.md)）**四项全都假定校方那边有答案**。

**不为它新增机械检查**，理由同 §1.2 拒绝为「同一条事实」加检查。
⚠️ **这句的「它」是事实行 / 判断行的分类，不是 `✓` 那一行的写法。** `✓ <url>` 的 URL 必须是可直接取回的端点（不得含省略号），那条**有**字面判据、已机械化为 `cite-url-has-no-ellipsis`，规则原文见 [ADR 0007](../../docs/adr/0007-a-checkmark-is-earned-by-a-fetch-not-by-a-capability.md) 补充（[#63](https://github.com/jiangxidong/EduApplication/issues/63)）。

### 换季降级（**惰性执行**，不是全表触发）

```
✓ https://…/deadlines     →     待核实（2026fall 核过：https://…/deadlines）
```

标记状态仍是二元的（`待核实`），但**保留上季链接**——降级必须可逆。
抹掉链接就把「重新核实」变成「重新从零查」，违反 D.4 的方向性原则。

🔴 **执行方式是惰性的，不是一改 `season` 就全表触发**（[#23](https://github.com/jiangxidong/EduApplication/issues/23)）。
全表触发构成**跨 owner 的写** —— `programs.md` 与 `channels/` 的十个节分属三个阶段，没有任何一个阶段有权改别人的节。

> 换季**只改 `apply.md` 的 `season`**。各阶段**下次进入时**按该文件 frontmatter 的 **`season_downgraded`**
> 表比对**自己那一行**，落后于当前 `season` 才就地降级**自己 owner 的节**，并把自己那一行重戳成当前 `season`。
> 派生视图渲染时按**该条事实所属 owner 的那一行**比对，不等即视为待核实。

未被访问的节保持上季标记 —— **比假装重查过更诚实**。

#### 🔒 季度戳绑 owner，不绑文件（[ADR 0008](../../docs/adr/0008-the-owner-binds-to-a-section-not-a-file.md) 限定 4 / [#37](https://github.com/jiangxidong/EduApplication/issues/37)）

原先的**文件级 `season` 字段已删除**。一个 `channels/*.md` 有五个阶段 owner，选校先进来、降完自己那几节、
把文件级 `season` 刷成本季之后，**文书再进来就不匹配失败，永远不降自己那两节**——陈旧因此不是一个会关闭的窗口，
而是被第一个进来的阶段**永久掩盖**。这是本契约把 owner 从「文件」翻到「节」（§1.2）时漏掉的同一个范畴错误。

**形态**（本节是它的唯一权威）：frontmatter 里一张 `season_downgraded` **块表**，键取自
[`CONTEXT.md`](../../CONTEXT.md)「阶段」的封闭词表，值是该 owner **最后一次完成降级**的申请季：

```yaml
season_downgraded:
  选校: 2027fall
  文书: 2027fall
  材料: 2027fall
  推荐信: 2027fall
  准备包: 2027fall
```

🔒 **辖区 = 承载证据标记（`✓` / `待核实`）的路径**，当前恰好两类：`channels/<channel_key>.md` 与 `programs.md`。
`programs.md` 因此**新建 frontmatter**——它此前一行 frontmatter 都没有，惰性降级在它身上**根本无法执行**，
而 `deadline` 的取证状态恰恰只住在它的 `evidence` 列；表里只有一行（`选校`）。
**不为单 owner 文件开「用标量」的第二条判据**：检查脚本要为两种形态各写一遍，
而「今天只有一个 owner」不是可以刻进契约的性质。

🔴 **`apply.md` 的 `season` 不在辖区内，不删。** 它不承载任何证据标记，它是全工作区**唯一的参照点**——
上面那句「换季只改 `apply.md` 的 `season`」与 §1.1 第 1 行「此后只有换季时改 `season`」都拿它当主语。
`packets/<program_key>/README.md` 的 `season` 同理保留：包里零证据标记（`packets/README.md` 规则 ②），
那一格是**标签，不是判据**；判据是 `season_downgraded` 的行与 `apply.md` 的 `season` 之差。

**这张表不是镜像。** 它记的是「某个 owner 在哪一季对自己辖区做完了降级」，是历史观察值，
同 `log.md` 与 `source_fingerprint` 的豁免（§1.5 / ADR 0008 限定 3 的同一条推理：它从不为了保持为真而被改写）。

🔴 **建节即戳，降级即戳。** 一个 owner 在某文件里**落下第一个节的同时**就戳上当季，此后每次降级重戳。
选校在 2027fall 新建 `channels/x.md` 并当场取证打 `✓`，若不同时写 `season_downgraded` 的 `选校` 行，
那批**刚刚取回的**事实会立刻被判成陈旧——最新鲜的证据当成最陈旧的。

🔴 **缺行 = 该 owner 在本文件里没有内容，不是陈旧。** 「建节即戳」使**有内容 ⟺ 有行**，
所以缺行只能读作「它一个节都没落过」——没有节，就没有要渲染的东西，也就无所谓陈不陈旧。
⚠️ **这一条曾被写反过一版**（「缺行 = 陈旧」），在**首季工作区**上当场破：首季根本没有上一季，
那个「上季核过」的链接不存在。作废理由全文见 ADR 0008 限定 4，**本节与它冲突时以 ADR 为准**。
fail-safe 由下面那条机械检查守，**不由「缺行」的读法守**：漏戳会被判成违规，而不是被静默读成本季。

**机械检查 `season-stamp-matches-owners`**（名与指针见 [`docs/checks.md`](../../docs/checks.md)，规则原文即 ADR 0008 限定 4）：
`season_downgraded` 的键必须**恰好等于「在该文件里实际有内容的 owner」集合**——该集合由**文件内容 ＋ §1.2 归属表**
机械推出（逐节剥离前缀匹配到法定节名，再查 owner），**不是照抄契约的 owner 名单**。
🔒 **不按节切的路径（当前只有 `programs.md`，它的结构单元是列、§1.5 注 ① 判它单 owner），owner 取 §1.1 那一行**；
按节切的路径（`channels/<channel_key>.md`）走上面那条前缀匹配。两条都活读本文件，检查不为任一形态内嵌常量。
**有内容而无戳 = 违规**；**有戳而无内容 = 违规**（预建空行，同 §1.2 否掉的预建空节）。
**文件级 `season` 字段出现在辖区路径上即违规。**
实现体是 `trace-packet.sh` 的第 [5] 项（只活在 `prototype/application-packet`，不在 CI，同 `packets/README.md` 末节）。
⚠️ 它**必须活读跑它那棵树自己的本文件 §1.2**，不得内嵌一份归属表副本，也不得跨分支取参照物——
两者都会把它变成 [ADR 0017](../../docs/adr/0017-a-check-that-compares-against-a-forkable-copy-is-vacuous.md) 意义上的恒真检查。

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
`sort`（单纯排序）、`grep` 都正常；**`awk` 只坏在比较上**——解析、`index`、正则、数组下标都对，
但 `==` / `!=` / `<` 对两个纯中文串同样中招，成因与 `uniq` / `sort -u` 同源（见下方 `==` 缺陷那条）。

> **注意这与格式无关。** 这两个工具对 Markdown 表和 TSV 一样坏，awk **解析**两者一样好。
> CJK 不是选格式的判别式，只是「用不用 `uniq` / `sort -u`」与「能不能用 `==` 比较」的判别式。

🔒 **反过来，`awk` 的字符类只在 UTF-8 locale 下才对——这一条是可修的，且必须修**
（2026-08-15 实测，`awk version 20200816`，本机无 `gawk`）。以 §1.2 的节名剥离规则 `gsub(/^[^一-龥A-Za-z0-9]+/,"",t)` 为例：

```sh
LC_ALL=en_US.UTF-8   →  [推荐信机制 —— 风险 A：冒名发信]        # ✅ 🔴 / ⚠️ / 🔒 / 全角空格 / ** 全剥干净
LC_ALL=C             →  [<3 个乱码字节> 推荐信机制 —— 风险 A…]  # ❌ emoji 原样留下，六个节照旧 FAIL
```

**检查脚本必须显式设 `LC_ALL=en_US.UTF-8`，不能靠继承环境**——它的失效形态是**静默**的，
跟 `sort -u` 丢行一样没有任何迹象。

🔴 **同一个 UTF-8 locale 换来另一个坏：`awk` 的 `==` / `!=` / `<` 不能比中文串**
（2026-08-15 实测，`awk version 20200816`，`LC_ALL=en_US.UTF-8`）：

```sh
$ awk 'BEGIN{ print ("硬约束" == "冻结点") }'
1        # 🔴 期望 0——两个不同的纯中文串被判为相等
$ awk 'BEGIN{ print ("中文" != "阶段") }'
0        # 🔴 期望 1
$ awk 'BEGIN{ print ("中文" < "阶段") }'
0        # 🔴 两串被判相等，< 同样中招
$ awk 'BEGIN{ print (index("中文","阶段")==1) }'
0        # ✅ index 正常
$ awk 'BEGIN{ print ("中文" ~ /^阶段$/) }'
0        # ✅ 正则正常
```

成因与 `uniq` / `sort -u` 同源：该 locale 下汉字没有排序权重，`strcoll` 对任意两个纯中文串返回 0，
「比较相等」这一族（`==` / `!=` / `<`）因此整体失灵；`index` 与正则不经过 `strcoll`，不受影响。
**禁用与替代写法落成下方硬规则 4，本处不复述。**

⚠️ **上面三条要摆在一起读**，才是「BSD + CJK」的完整判据；拆开会让人以为设了 locale 就万事大吉，
**而且没有任何一个 locale 能同时救两件事**：

| | `uniq` / `sort -u` 去重 | `gsub` 剥 emoji 前缀 | `awk` 的 `==` 比中文 |
|---|---|---|---|
| `LC_ALL=C` | ❌ 坏（不可修，只能绕开） | ❌ 剥不掉 | ✅ 对 |
| `LC_ALL=en_US.UTF-8` | ❌ 同样坏 | ✅ 对 | ❌ 错 |

**结论**：保持 `LC_ALL=en_US.UTF-8`（§1.2 的剥离步骤必须要它），去重永远绕开 `uniq` / `sort -u`
（走下方硬规则 2），相等判断永远绕开 `==` / `!=` / `<`（走 `index` 或正则，下方新增硬规则 4）。
三条防线互不替代，缺一个都不叫「设了 locale 就没事」。

**因此：**

1. **`programs.md` 里任何会被统计的列（`tier` / `status`）只放 ASCII 枚举值。**
   `tier` 取 `reach` / `safer` / … （**五档**），`status` 取 `considering` / `submitted` / … ——
   **完整枚举与每一档在断言什么，归 [`CONTEXT.md`](../../CONTEXT.md) 的「分档」「状态」词条**，本节不复述。
   中文标签是**展示层**的事，措辞归 [#11](https://github.com/jiangxidong/EduApplication/issues/11)。

   > ⚠️ 这里**故意只举两个值、不写全**——写全了本节就变成第二个权威，而 `tier` 的方向与归属表相反：
   > owner 是契约的内容，而 `reach` / `safer` **各自就是词**（[ADR 0011](../../docs/adr/0011-the-glossary-defines-words-the-contract-holds-the-values.md)）。
   >
   > 唯一留在本文件的 `tier` 规则，是它作为**落盘约束**的那一条：**`tier = ineligible` ⇒ `tier_basis` 非空**
   > （[#22](https://github.com/jiangxidong/EduApplication/issues/22)）。`tier_void_if` 列**语义不变**（它本就中性，不区分方向）。
   > `undecided` 与 `ineligible` 的切分是**词的含义**，见「分档」词条。
   自由文本列（`school` / `program` / `evidence`）可以是中文，因为它们只被 `grep` / `awk` 正则匹配，不被聚合。

🔴 **无 `考试日期` 的分数不得参与门槛比较**（[#72](https://github.com/jiangxidong/EduApplication/issues/72)）。`profile.md` 成绩表的 `考试日期` 列**必填**；`tier_basis` ／ `tier_void_if` 引用标化分数时，该分数必须能在 `profile.md` 成绩表解析到带考期的行——
量表由考试日期决定、跨量表比较非法，`考试日期` 是比较的**前提字段**（语义见 `CONTEXT.md`「分数量表」，#56）。
量表本身**不落盘**：它是「这所学校怎么读这个分数」的函数（同词条「不外推到考试机构」），`profile.md` 侧存一个量表值连唯一正确取值都没有——从考期现推。

2. **禁止 `uniq` 与 `sort -u`。** 计数走 `awk '{c[$0]++} END{for(k in c) print c[k], k}'`，
   去重走 `awk '!s[$0]++'`，两者均已实测在中文下正确；`grep -c` 也正常。

3. **`programs.md` 的单元格内禁止出现 `|`。** 转义的 `\|` 仍会被 `awk -F'|'` 切开（已实测）。
   需要写散文的内容一律进 `channels/` —— 这条对 [#11](https://github.com/jiangxidong/EduApplication/issues/11) 尤其要紧，
   它会加「匹配理由」这类自由文本列，那正是 `|` 最可能出现的地方。

4. **禁止用 `==` / `!=` / `<` 比较中文串。** 相等判断走 `index(a,b)==1 && length(a)==length(b)`
   或正则 `~ /^…$/`；`grep` 与 shell 的 `[ x = y ]` 不受影响。数组下标（`s[$0]`）走精确哈希、
   不经过 `strcoll`，不在此列——硬规则 2 的 `!s[$0]++` / `c[$0]++` 不用改。

**解析约定**：Markdown 表用 `awk -F'|'` 解析，前导 `|` 会产生一个空的 `$1`，**第 N 列是 `$(N+1)`**。

跑 `./derive-demo.sh` 可以复现其中大部分派生视图（**不是全部**——`deadline 日历` / `完成度自检` / `每校材料缺口` / `请求推荐邮件草稿` 在脚本的 14 个小节里没有任何对应，[#59](https://github.com/jiangxidong/EduApplication/issues/59) 实测）。

---

## 4.6 `programs.md` 的 13 列（**唯一完整列举处**）

**13 = [#4](https://github.com/jiangxidong/EduApplication/issues/4) 的 9 列 + [#11](https://github.com/jiangxidong/EduApplication/issues/11) 的判断层 4 列。**
本表存在的直接原因是 [ADR 0008](../../docs/adr/0008-the-owner-binds-to-a-section-not-a-file.md) 限定 1：
owner 的绑定单位是「该文件格式自己的结构单元」，**表格的结构单元是列**，而切法**必须来自契约里预先声明、脚本能枚举的结构**。
在本节落盘之前全仓库只有「13 列」这个**计数**，没有名单——「表格切列」因此是纸面机制。现在它有货了。

⚠️ 有名单**不等于**本文件按列分 owner：[#25](https://github.com/jiangxidong/EduApplication/issues/25) 已判 `programs.md` 是**单 owner = 选校、全部 13 列含 `status` 无例外**（§1.5 注 ①）。本节是**声明**，不是切分。

| # | 列 | 值域 | 被 `evidence` 担保 | 被聚合 |
|---|---|---|---|---|
| 1 | `program_key` | ASCII，`<school>--<college>--<program>` | ❌ | ❌（主键，被 `grep` / join） |
| 2 | `school` | 自由文本，可中文 | ❌ | ❌ |
| 3 | `college` | 自由文本，可中文 | ❌ | ❌ |
| 4 | `program` | 自由文本，可中文 | ❌ | ❌ |
| 5 | `channel_key` | ASCII，外键 → `channels/<channel_key>.md` | ❌ | ❌（被 join） |
| 6 | `tier` | ASCII 枚举，**取值全表在 `CONTEXT.md`「分档」** | ❌ 永不担保（判断） | ✅ |
| 7 | `deadline` | 日期，或 `待核实`（可带 [ADR 0001](../../docs/adr/0001-evidence-stays-binary-with-a-closed-suffix.md) 的封闭后缀） | ✅ **唯一被担保的一列** | ❌ |
| 8 | `status` | ASCII 枚举，**取值全表在 `CONTEXT.md`「状态」** | ❌ | ✅ |
| 9 | `evidence` | `✓ <url>` / `待核实`（可带封闭后缀）—— 它**自己就是**标记 | — | ❌（被 `grep` 匹配） |
| 10 | `tier_basis` | 一句话，禁 `\|`，禁换行 | ❌ | ❌ |
| 11 | `tier_void_if` | 一句话，禁 `\|`，禁换行 | ❌ | ❌ |
| 12 | `pseudo_safer` | ASCII `yes` / `no` / `unknown`，语义见 `CONTEXT.md`「伪保底」 | ❌ | ✅ |
| 13 | `status_note` | 一句话，禁 `\|`，禁换行；`status=dropped` 时**必填** | ❌ | ❌ |

🔴 **列序是契约的一部分，不只是排版。** 判断层四列**追加在末尾**，因此 §4.5 解析约定下的
`$7` = `tier`、`$9` = `status`、`$10` = `evidence` **在 9 列时代与 13 列时代取值相同**——
`derive-demo.sh` 补列后零改动即是这条的实测收据。**新增列一律追加在末尾**，不得插在中间。

🔴 **写不满的自由文本列留真空格，不填占位符。** `无` / `N/A` / `—` 都会让「这一格有没有值」从
一个 `$10 == ""` 的机械判断退化成语义判断，而 `tier_basis` 空与非空**正是一条机械判别式的输入**
（`tier_basis` 空 ⇒ `tier` 必须是 `undecided`）。空格不影响 `awk` 的 `NF` 计数（已实测）。

⚠️ **`pseudo_safer` 判不出来时填 `unknown`，不填 `no`**（[ADR 0015](../../docs/adr/0015-pseudo-safer-annotates-the-users-prior-not-the-tier.md)）。
`no` 断言「**已看过两半信号并判定为否**」；默认值是 `unknown`，把没看过的行填 `no` 会让这一列当场作废。
伪保底的两半（名义门槛低 / 方向极挤）**各自要有 `channels/` 里一条 `✓` 事实行**，
**不复用 `tier_basis` / `tier_void_if`**——ADR 0015 推翻了 #11「复用」那半句，它的作废条件**不落盘**（可从两条 `✓` 现算）。

🔴 **第三条机械判别式**：`pseudo_safer = yes` ⇒ **`tier ≠ safer`**（ADR 0015）。
伪保底纠正的是**用户的先验**，不是产品的分档——让它推翻一个由第二条线得来的 `safer`，
正是 [ADR 0009](../../docs/adr/0009-safer-is-defined-by-the-programs-second-published-line.md) 把标定权交给学校时堵上的洞。

## 5. 文书的两个正交轴

别塌成一维：

```
                 v1        v2        v3(当前)
long.md          ─────────────────────> essays/canonical/long.md
                 ↓ 存 _versions/
short-250.md     ─────────────────────> essays/canonical/short-250.md
points.md        ─────────────────────> essays/canonical/points.md
```

- **形态轴**：`long.md`（完整长文）/ `short-250.md`（250 词版）/ `points.md`（可拆短答题的要点）
  —— 三者不是同一篇的长短，是**三种形态**（「形态」的定义见 `CONTEXT.md` 词条；[ADR 0011](../../docs/adr/0011-the-glossary-defines-words-the-contract-holds-the-values.md)：词的定义归词表，取值归契约）。Columbia 要长文，UIUC 要 4 道短答题，Cornell 要两篇独立文书。
  🔴 **形态由文件名承载**（`long.md` / `short-250.md` / `points.md`），**frontmatter 不另存形态键**——文件名即形态标识（[#50](https://github.com/jiangxidong/EduApplication/issues/50)）。
  🔴 **这根轴此前叫「渲染物轴」，[#73](https://github.com/jiangxidong/EduApplication/issues/73) 改名为「形态轴」**（[ADR 0023](../../docs/adr/0023-the-sense-that-fails-the-words-own-test-gives-up-the-name.md)）。理由：这三个写法住在 §2 那张图**渲染箭头的左边**（canonical，真相源），而「渲染物」按字面是箭头**右边**的产物——那一侧的用法（§1.1 `version` 行、§1.3 `cv/`、§2 两处）**一个字未改，仍是「渲染物」**。⚠️ 旧票与 `log.md` 里的「渲染物」凡指这三个写法的，读作「形态」；照字面读会**静默**落到另一义上。
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
| [#10 文书双模式](https://github.com/jiangxidong/EduApplication/issues/10) | 何时开新版本、多版本怎么对比、素材门槛怎么判 | 三个形态的文件名 + `_versions/` 命名约定 |
| [#9 skill 拆几个](https://github.com/jiangxidong/EduApplication/issues/9) | **阶段 → skill** 的映射（#23 修订后：#9 的表里**不再出现任何路径字面量**） | **路径 / 节 → 阶段**（§1.1 与 §1.2）——归属表，这就是阶段之间的交接面。🔒 #23 定它「唯一」，[#26](https://github.com/jiangxidong/EduApplication/issues/26) 之后**现状也是唯一**（`CONTEXT.md` 那份已删），见 §1.5 ④ |
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
