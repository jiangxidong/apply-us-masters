# 机械检查清单

本文件是**索引**。它持有的是「有哪些检查、它叫什么、被测对象是什么、规则原文在哪、跑在哪个夹具上」。

🔴 **它不复述规则。** 每条检查的规则只有一处权威，见「规则原文」列。本表里任何一句读起来像规则的话都是索引的措辞，**不是规则本身**——照它实现之前先点开指针读原文。判据见 [ADR 0016](adr/0016-the-checklist-holds-names-and-pointers.md)。

⚠️ **`prototypes/state-workspace-v0/` 整个目录住在未合并的 `prototype/state-layer` 分支**（`CONTRACT.md`、样例工作区、`derive-demo.sh`），本表指向它的链接与路径在 `main` 上一律解析不到。显式写出来好过假装，合并后自愈。⚠️ 而这份文档**会随 repo 分发到每个用户的磁盘上**（[ADR 0021](adr/0021-the-repo-root-is-the-plugin-root-for-both-runtimes.md)），也就是说这批死链是**发布出去的**。两个 prototype 分支的归宿因此不再只是内部整洁问题 → 见 [#64](https://github.com/jiangxidong/EduApplication/issues/64) 开出的那张票——同 [ADR 0011](adr/0011-the-glossary-defines-words-the-contract-holds-the-values.md) 对 `CONTEXT.md` 那个死链的处理。⚠️ 本节「已知的实现坑」里的取证也指着那个目录（第 7 条指 `derive-demo.sh`），同此。

## 怎么读这张表

**「被测对象」决定一切**：谁跑它、跑在哪个夹具上、它能宣布**谁**违规。它不是「读了哪些文件」——每条检查都可以把契约当参考数据去查，把它们分开的是**它能判谁违规**。
🔴 **判不了任何人违规的东西不是检查，不进本表。** 它是**派生视图**（每个取值都合法，只做分类）或**体检**（违规的不是工作区，是外部世界变了）。[#63](https://github.com/jiangxidong/EduApplication/issues/63) 用这条判掉两个候选：**缺口三分类**（`CONTEXT.md`「缺口」词条：现算现打、绝不落盘）与 **`✓` 链接体检**（[#14](https://github.com/jiangxidong/EduApplication/issues/14)：404 不算回归失败）。两者都不是欠账，**都不开票**（[ADR 0019](adr/0019-an-absence-needs-a-consumer-branch-not-a-registry.md) 甲类）。

| 被测对象 | 违规的是 | 谁跑 | 夹具 |
|---|---|---|---|
| `契约` | 状态层契约自己内部不自洽 | `evals/checks/check-docs.sh` | `evals/fixtures/violations/docs/` |
| `repo 文档` | 产品 repo 的文档（`CONTEXT.md` / `docs/adr/` / `skills/*/SKILL.md`） | 同上 | 同上 |
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
| `pseudo-safer-excludes-safer` | 工作区 | [ADR 0015](adr/0015-pseudo-safer-annotates-the-users-prior-not-the-tier.md) 决定「禁止共存」 |  — |
| `material-keys-complete` | 工作区 | `CONTRACT.md` §1.1「`materials/*.md` 的字段名单（v1 定稿）」的 frontmatter 三键表 |  — |
| `material-body-fixed-headings` | 工作区 | `CONTRACT.md` §1.1「正文的形状规则」 |  — |
| `cite-url-has-no-ellipsis` | 工作区 | [ADR 0007](adr/0007-a-checkmark-is-earned-by-a-fetch-not-by-a-capability.md) 补充（[#63](https://github.com/jiangxidong/EduApplication/issues/63)） |  — |
| `essay-cites-no-referee-claim` | 工作区 | `CONTRACT.md` §1.1 的 `claims.md` 四列段（[#52](https://github.com/jiangxidong/EduApplication/issues/52) 定禁令，[#63](https://github.com/jiangxidong/EduApplication/issues/63) 定被测对象） | [#52](https://github.com/jiangxidong/EduApplication/issues/52)「第五条」 |

**十八条。** 后五条由 [#63](https://github.com/jiangxidong/EduApplication/issues/63) 一次加入，**全部 `被测对象 = 工作区`**；⚠️ 它们的「曾用号」一律填 `—`，因为那五个序号是 #63 票面**今天新造的**，没有任何存量文档按序号引用过它们——本列只为**迁移**存在（见上）。唯一的例外是 `essay-cites-no-referee-claim`，[#52](https://github.com/jiangxidong/EduApplication/issues/52) 确实按「第五条」引用过它。别按任何一处写下的条数判断读没读全——ADR 0008 的条数在 2026-08-15 一天之内被改过四次（六 → 七 → 六 → 七 → 八），这正是本表存在的理由之一。

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

**手动，由改动规则的人跑。进 CI 的名单（[#75](https://github.com/jiangxidong/EduApplication/issues/75) 起不再为空）：`glossary-holds-no-owner`——`.github/workflows/checks.yml` 每次 push／PR 跑名单里的检查，并附带跑「夹具必须翻红」的反向断言。**

🔴 **这不是「暂不进」的又一次续期。** [#9](https://github.com/jiangxidong/EduApplication/issues/9) 定的是「**暂**不进 CI」，而这个「暂」已经被续期过三次且从未写下终止条件。[#63](https://github.com/jiangxidong/EduApplication/issues/63) 把它换成了判据（[ADR 0020](adr/0020-a-check-passes-through-four-places-in-order.md)）：

> 一条检查够格进 CI，当且仅当四条全满足：① **有实现体，且它住在 `evals/`**；② 配了至少一条 `evals/fixtures/violations/` 夹具，且**实测能让它翻红**（[ADR 0017](adr/0017-a-check-that-compares-against-a-forkable-copy-is-vacuous.md) 推论 2：全绿不是证据）；③ **不须联网、不须跑 agent**（[#14](https://github.com/jiangxidong/EduApplication/issues/14) 已判）；④ **说得出参照物在副本之外的什么地方**（ADR 0017 推论 1）。

**「第一条满足四项的检查落地那天，它自己就进 CI」已由 [#75](https://github.com/jiangxidong/EduApplication/issues/75) 兑现**：`glossary-holds-no-owner` 四项全过（① 实现体住 `evals/checks/check-docs.sh`；② 夹具在 `evals/fixtures/violations/docs/glossary-holds-no-owner/` 且实测翻红；③ 纯 awk，不联网不跑 agent；④ 参照物＝规则语句与夹具，均在被测文件之外——取证见 #75 结案评论）。其余十七条仍不满足 ①。

🔴 **它会失效，而且已经失效过一次。** #14 G1 与 ADR 0008 第 2 条分叉了 89 分钟没有任何人发现，靠的正是「有人会记得跑」。配一条纪律顶着：

> 凡改动 [ADR 0008](adr/0008-the-owner-binds-to-a-section-not-a-file.md)（owner 绑节不绑文件）／ [ADR 0010](adr/0010-personas-ignite-assertions-they-are-not-examples.md)（persona 点火断言）／ [ADR 0011](adr/0011-the-glossary-defines-words-the-contract-holds-the-values.md)（词汇表定义词、契约持值）／ [ADR 0016](adr/0016-the-checklist-holds-names-and-pointers.md)（清单只持名与指针）或 `CONTRACT.md` §0 / §1 / §4 的提交，**结案评论必须附上跑过的命令与它的输出**。

纪律不是执法，代价明写在 [ADR 0016](adr/0016-the-checklist-holds-names-and-pointers.md)。

## 🔴 已知的实现坑

**检查本身也会写错，已经八次**，其中五次是假阳性、三次是工具缺陷。每一条都要进 `evals/fixtures/violations/`。

1. **`grep` 命中文件名。** `grep -nE '^\|.*owner' CONTEXT.md` 命中了 `0008-the-owner-binds-to-a-section-not-a-file.md`（[#26](https://github.com/jiangxidong/EduApplication/issues/26)）。
2. **`###` 那一层是 `program_key`，从来不是法定节名。** 把它当节标题扫会误报三条（`check28.sh` 第一版，[#28](https://github.com/jiangxidong/EduApplication/issues/28)）。
3. **`### <program_key>` 带反引号。** 样例写的是 `` ### `columbia--seas--cs-ms` ``，比对 `programs.md` 前不剥反引号必假阳性（`subsection-under-program` 取强版后新增的坑）。
4. **表头 ≠ 每一行。** 只有紧跟 `|---|` 分隔行的那一行才是表头；逐行扫会把每个单元格都判成表头（本票现场撞出）。
5. **locale 静默失效。** `LC_ALL=C` 下 `gsub(/^[^一-龥A-Za-z0-9]+/,"",t)` 不剥 emoji，六个节照旧 FAIL 且不报任何错。检查脚本必须**显式**设 `LC_ALL=en_US.UTF-8`，不能靠继承环境（`CONTRACT.md` §4.5）。
6. 🔴 **awk 的 `==` 在两个中文串之间是坏的**（#14 实测，见下）。
7. 🔴 **`/bin/sh` 里 `$var` 紧邻多字节字符会被截断**（[#48](https://github.com/jiangxidong/EduApplication/issues/48) 实测，见下）。**没有任何 locale 能修**，与第 6 条不同源。
8. 🔴 **zsh 不对未加引号的参数展开做分词**（[#61](https://github.com/jiangxidong/EduApplication/issues/61) 普查第一版全灭于此，2026-08-15 复现）。`git grep <pat> ${BRANCHES}` 会把整串分支名当作**一个**不存在的 tree 传进去；配上 `2>/dev/null` 就是**静默零命中**。与第 6/7 条**不同源**——不坏在中文上，坏在「零命中」与「参数根本没生效」不可区分。
   ```
   $ zsh -c 'B="main prototype/state-layer"; set -- ${B}; echo $#'   → 1   # 🔴 整串一个参数
   $ bash -c 'B="main prototype/state-layer"; set -- ${B}; echo $#'  → 2   # ✅
   ```
   **写法**：用数组 `B=(main prototype/state-layer)` 配 `"${B[@]}"`，或显式 `setopt shwordsplit`。⚠️ **零命中一律先自证命令本身有效**（换一个必然命中的 pattern 跑一次），再下「仓库里没有」的结论。

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

### `/bin/sh` 里 `$var` 紧邻多字节字符会被截断——加花括号才对

macOS 的 `/bin/sh` 是 **GNU bash 3.2.57**（不是 dash）。双引号内 `$var` **紧接**一个多字节字符时，展开结果被截成一个替换字符：

```
h="## 我做了什么"
echo "[$h]"        → [## 我做了什么]     ✅ 单独展开正常
echo "[「$h」]"    → [「�]               🔴 后面紧跟「」」就坏
echo "[「${h}」]"  → [「## 我做了什么」]  ✅ 加花括号就对
echo "[$h 」]"     → [## 我做了什么 」]  ✅ 中间有空格也对
```

🔴 **与第 6 条不同源，`LC_ALL` 一个都救不了**（实测 `LC_ALL=en_US.UTF-8` 显式 `export` 进子 shell 后照旧坏，`LC_ALL=C` 同样坏）。第 6 条坏在 `strcoll` 没有汉字排序权重，这一条坏在 bash 3.2 的**参数展开边界识别**——它把紧随其后的多字节序列的首字节当成了变量名的一部分。

**失效形态是半静默的**：检查照常判定、退出码不变，**只有报错信息里的那个名字变成了乱码**——于是「哪一项缺了」这个信息丢了，而检查看起来是在正常工作的。`prototypes/state-workspace-v0/derive-demo.sh` 的三问形状检查上实地撞到。

**规则**：凡在 `sh` 脚本里把中文拼进字符串，**一律写 `${var}`**。中文只经过 `awk` / `grep` 不受影响（它们自己解析 UTF-8），这条只管 shell 自己的字符串拼接。

## 尚未实现

**`evals/` 骨架已由 [#75](https://github.com/jiangxidong/EduApplication/issues/75) 落地**：`evals/checks/check-docs.sh` 存在并实现了 `glossary-holds-no-owner` 一条；其余十七条（docs 类六条、工作区类的静态检查组）仍无实现体。**三个 persona 工作区同样不存在**——`工作区` 那行的三项夹具今天只有 `sample-workspace/` 有货（[#63](https://github.com/jiangxidong/EduApplication/issues/63) 逐 ref 复核，取证见该票）。本表落的是**决策**，脚本是实现。

⚠️ **`evals/` 与 `skills/` 的位置本身已不再是 fog**（[ADR 0021](adr/0021-the-repo-root-is-the-plugin-root-for-both-runtimes.md)，[#64](https://github.com/jiangxidong/EduApplication/issues/64)）：仓库根就是两个运行时的 plugin 根，顶层按「谁会读它」切。本表上面写死的 `evals/checks/` 与 `evals/fixtures/violations/{docs,workspace}/` **被该 ADR 照单收下，一个字未改**。仍然缺的只是脚本本身。

⚠️ **十八条里有两条已经有实现体，但它不在 `evals/` 里。** `material-keys-complete` 与 `material-body-fixed-headings` 今天由 `prototypes/state-workspace-v0/derive-demo.sh` 跑——那是**演示脚本**（它自陈「证明派生视图可以机械算出，不必落盘」），是**过渡期的实际 runner**，且在两个 prototype 分支上各有一份逐字副本。🔴 **`evals/` 建起来时，这两段从 `derive-demo.sh` 同刀删除**：[ADR 0016](adr/0016-the-checklist-holds-names-and-pointers.md) 已否掉「允许两份并存」，一条规则只有一处实现。

对**已有实现体**的检查，取证形态＝跑 `evals/checks/` 的 runner（CI 每次 push 也在跑）；对其余各条，仍是[「跑过的命令 ＋ 当时的输出」](https://github.com/jiangxidong/EduApplication/issues/35)贴在票的结案评论里——便宜且已经在用，代价是改了检查不会自动重跑。

**`evals/` 是「不流向用户的一切」，不只是测试数据**：检查脚本与违规夹具都住进去，白拿 [ADR 0010](adr/0010-personas-ignite-assertions-they-are-not-examples.md) 那条「任何 `SKILL.md` 不得引用 `evals/`」的红线，不必为「检查脚本不该被打包进 skill」另立第二条规矩。
