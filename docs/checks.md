# 机械检查清单

本文件是**索引**。它持有的是「有哪些检查、它叫什么、被测对象是什么、规则原文在哪、跑在哪个夹具上」。

🔴 **它不复述规则。** 每条检查的规则只有一处权威，见「规则原文」列。本表里任何一句读起来像规则的话都是索引的措辞，**不是规则本身**——照它实现之前先点开指针读原文。判据见 [ADR 0016](adr/0016-the-checklist-holds-names-and-pointers.md)。

⚠️ **`CONTRACT.md` 住在未合并的 `prototype/state-layer` 分支**（`prototypes/state-workspace-v0/CONTRACT.md`），本表指向它的链接在 `main` 上解析不到。显式写出来好过假装，合并后自愈——同 [ADR 0011](adr/0011-the-glossary-defines-words-the-contract-holds-the-values.md) 对 `CONTEXT.md` 那个死链的处理。

## 怎么读这张表

**「被测对象」决定一切**：谁跑它、跑在哪个夹具上、它能宣布**谁**违规。它不是「读了哪些文件」——每条检查都可以把契约当参考数据去查，把它们分开的是**它能判谁违规**。

| 被测对象 | 违规的是 | 谁跑 | 夹具 |
|---|---|---|---|
| `契约` | 状态层契约自己内部不自洽 | `evals/checks/check-docs.sh` | `evals/fixtures/violations/docs/` |
| `repo 文档` | 产品 repo 的文档（`CONTEXT.md` / `docs/adr/` / 将来的 `SKILL.md`） | 同上 | 同上 |
| `工作区` | 某个工作区的文件内容 | 回归套件的静态检查组 | `sample-workspace/` ＋ 三个 persona 工作区 ＋ `evals/fixtures/violations/workspace/` |

**「曾用号」列只为迁移存在**：旧文档里写着「孤儿检查第 N 条」或「#14 G1」时用它换算成短名。它记的是历史，**不随规则改动而改写**，所以它不是镜像。

## 清单

| 短名 | 被测对象 | 规则原文（唯一权威） | 曾用号 |
|---|---|---|---|
| `path-resolves-to-owner` | 契约 | `CONTRACT.md` §1.4（混合规则）＋ [ADR 0008](adr/0008-the-owner-binds-to-a-section-not-a-file.md) 限定 3（`append-only` 辖区） | 0008 第 1 条（#25 改写） |
| `vocab-item-one-stage` | 契约 | `CONTRACT.md` §1.2 的十节归属表 | 0008 第 3 条 |
| `split-is-declared` | 契约 | [ADR 0008](adr/0008-the-owner-binds-to-a-section-not-a-file.md) 限定 1 的防蔓延闸 | 0008 第 7 条（#25） |
| `glossary-holds-no-owner` | repo 文档 | [ADR 0011](adr/0011-the-glossary-defines-words-the-contract-holds-the-values.md) 决定 ①② | 0011 想要的「第 7 条」 |
| `citation-is-partial` | repo 文档 | [ADR 0011](adr/0011-the-glossary-defines-words-the-contract-holds-the-values.md) 「引用配额」 | 0011 想要的「第 8 条」 |
| `no-second-path-literal` | repo 文档 | `CONTRACT.md` §0 ＋ [ADR 0008](adr/0008-the-owner-binds-to-a-section-not-a-file.md) Consequences「归属表搬走」段 | #14 F4 |
| `skills-never-cite-evals` | repo 文档 | [ADR 0010](adr/0010-personas-ignite-assertions-they-are-not-examples.md) 流向红线 | #14 G5 |
| `section-prefix-match` | 工作区 | `CONTRACT.md` §1.2（封闭词表＋剥离＋前缀匹配） | 0008 第 2 条 ／ #14 G1 |
| `overlay-no-bare-lines` | 工作区 | `CONTRACT.md` §1.2 覆盖层四条 | 0008 第 4 条（#28 换入） |
| `subsection-under-program` | 工作区 | `CONTRACT.md` §1.2 ＋ `programs.md` 的 `program_key` 主键 | 0008 第 6 条 ／ #14 G2 |
| `no-prebuilt-empty-section` | 工作区 | [#23](https://github.com/jiangxidong/EduApplication/issues/23) 否掉预建空节 | #14 G3 |
| `drafts-imply-consent` | 工作区 | [#12](https://github.com/jiangxidong/EduApplication/issues/12) C 档前置（推荐人本人授权起草） | 0008 第 5 条 ／ #14 E1 |
| `season-stamp-matches-owners` | 工作区 | [ADR 0008](adr/0008-the-owner-binds-to-a-section-not-a-file.md) 限定 4 | 0008 第 8 条（#37） |

**十三条。** 别按任何一处写下的条数判断读没读全——ADR 0008 的条数在 2026-08-15 一天之内被改过四次（六 → 七 → 六 → 七 → 八），这正是本表存在的理由之一。

### 三处两份表述不一致，一律取强的那份

合并时旧的弱表述作废，已在 [ADR 0008](adr/0008-the-owner-binds-to-a-section-not-a-file.md) 就地标明，免得下一个人照旧文实现出个弱检查。

| 短名 | 弱的那份 | 取的那份 |
|---|---|---|
| `section-prefix-match` | #14 G1（**无剥离步骤**，实测在样例上报 6 个假失败） | 0008 第 2 条（#28 加了剥离） |
| `subsection-under-program` | 0008 第 6 条（只要求 `###` 存在） | #14 G2（并要求该 key 在 `programs.md` 里存在） |
| `drafts-imply-consent` | 0008 第 5 条（只说「蕴含授权声明」） | #14 E1（指明声明住 `recommenders.md`，两道闸） |

## 命名判据

**只给会被别处引用的检查起短名。** 序号坏在**跨文档引用**——三张票各按序号说话，两小时内出了两个「第 7 条」、两个「第 8 条」。只在表内出现、没有任何 ADR / 契约 / 票引用它的条目（#14 的 `D1..D11`、`T1..T10`）留着序号一分钱不花。

**新增一条检查时**：先问它会不会被表外引用。会 → 起短名进本表；不会 → 留在它自己那张表里。

## 触发

**手动，由改动规则的人跑。** 不进 CI——[#9](https://github.com/jiangxidong/EduApplication/issues/9) 定的是「暂不进 CI」，而「哪些检查项进 CI」是地图 **Not yet specified** 里「知识时效性运维」那一片的事，本表不越界。

🔴 **它会失效，而且已经失效过一次。** #14 G1 与 ADR 0008 第 2 条分叉了 89 分钟没有任何人发现，靠的正是「有人会记得跑」。配一条纪律顶着：

> 凡改动 [ADR 0008](adr/0008-the-owner-binds-to-a-section-not-a-file.md) ／ [ADR 0010](adr/0010-personas-ignite-assertions-they-are-not-examples.md) ／ [ADR 0011](adr/0011-the-glossary-defines-words-the-contract-holds-the-values.md) ／ [ADR 0016](adr/0016-the-checklist-holds-names-and-pointers.md) 或 `CONTRACT.md` §0 / §1 / §4 的提交，**结案评论必须附上跑过的命令与它的输出**。

纪律不是执法，代价明写在 [ADR 0016](adr/0016-the-checklist-holds-names-and-pointers.md)。

## 🔴 已知的实现坑

**检查本身也会写错，已经六次**，其中五次是假阳性、一次是工具缺陷。每一条都要进 `evals/fixtures/violations/`。

1. **`grep` 命中文件名。** `grep -nE '^\|.*owner' CONTEXT.md` 命中了 `0008-the-owner-binds-to-a-section-not-a-file.md`（[#26](https://github.com/jiangxidong/EduApplication/issues/26)）。
2. **`###` 那一层是 `program_key`，从来不是法定节名。** 把它当节标题扫会误报三条（`check28.sh` 第一版，[#28](https://github.com/jiangxidong/EduApplication/issues/28)）。
3. **`### <program_key>` 带反引号。** 样例写的是 `` ### `columbia--seas--cs-ms` ``，比对 `programs.md` 前不剥反引号必假阳性（`subsection-under-program` 取强版后新增的坑）。
4. **表头 ≠ 每一行。** 只有紧跟 `|---|` 分隔行的那一行才是表头；逐行扫会把每个单元格都判成表头（本票现场撞出）。
5. **locale 静默失效。** `LC_ALL=C` 下 `gsub(/^[^一-龥A-Za-z0-9]+/,"",t)` 不剥 emoji，六个节照旧 FAIL 且不报任何错。检查脚本必须**显式**设 `LC_ALL=en_US.UTF-8`，不能靠继承环境（`CONTRACT.md` §4.5）。
6. 🔴 **awk 的 `==` 在两个中文串之间是坏的**（本票实测，见下）。

### awk 的 `==` 不能用来比中文——`CONTRACT.md` §4.5 那句「awk 正常」是错的

`awk version 20200816`（macOS 26.5.2，本机无 `gawk`），`LC_ALL=en_US.UTF-8`：

```
"硬约束" == "冻结点"   → 1      # 🔴 期望 0
"中文"   == "阶段"     → 1      # 🔴 期望 0
"中文"   != "阶段"     → 0      # 🔴 期望 1
"中文"   <  "阶段"     → 0      # 🔴 两串被判为相等
"中文"   == "owner"    → 0      # ✅ 一侧含 ASCII 就正常
"abc"    == "def"      → 0      # ✅
index("中文","阶段")   → 0      # ✅ index 正常
"中文" ~ /^阶段$/      → 0      # ✅ 正则正常
```

**成因与 §4.5 已记的 `uniq` / `sort -u` 是同一个**：`en_US.UTF-8` 下汉字没有排序权重，`strcoll` 对任意两个纯中文串返回 0，于是「比较相等」这一族全部失灵。§4.5 把病灶记成「两个 BSD 工具坏了」并写下「`sort`、`grep`、`awk` 都正常」——**`awk` 那半是错的**，坏的不是工具是比较本身，awk 的 `==` / `!=` / `<` 同样中招。

🔴 **没有任何一个 locale 能让两件事同时对**（实测）：

| | `==` 比中文 | `gsub` 剥 emoji 前缀 |
|---|---|---|
| `LC_ALL=C` | ✅ 对 | ❌ 剥不掉（`[??? 硬约束]`） |
| `LC_ALL=en_US.UTF-8` | ❌ 错 | ✅ 对 |

**所以规则是**：保持 `LC_ALL=en_US.UTF-8`（剥离步骤必须要它），并**禁止用 `==` / `!=` / `<` 比较中文串**。相等判断走 `index(a,b)==1 && length(a)==length(b)` 或正则 `~ /^…$/`，两者实测正确；`grep` 与 shell 的 `[ x = y ]` 也正确。

## 尚未实现

**一行代码都还没有。** `evals/checks/check-docs.sh` 与 `evals/fixtures/violations/` 都不存在，回归套件的静态检查组也不存在（`evals/` 整个目录尚未建立）。本表落的是**决策**，脚本是实现。

在 `evals/` 建起来之前，本表的取证形态是[「跑过的命令 ＋ 当时的输出」](https://github.com/jiangxidong/EduApplication/issues/35)贴在票的结案评论里——便宜且已经在用，代价是改了检查不会自动重跑。

**`evals/` 是「不流向用户的一切」，不只是测试数据**：检查脚本与违规夹具都住进去，白拿 [ADR 0010](adr/0010-personas-ignite-assertions-they-are-not-examples.md) 那条「任何 `SKILL.md` 不得引用 `evals/`」的红线，不必为「检查脚本不该被打包进 skill」另立第二条规矩。
