# 主张集（虚构申请人「林小雨」）

**一条主张 = 申请人希望招生官相信的、关于他自己的一句断言。**
判别式：它必须**能被**一条具体素材支撑或证伪——「能被」，不是「现在有」。
「我想读 CS 硕士」是**意图**不是主张；「贵校 X 教授的实验室做 Y」是**学校事实**，走证据标记那条线。

**全局只有这一个主张集合**，文书线与推荐信线都从它取：
**文书是申请人自述主张，推荐信是第三方佐证同一批主张**。
见 [ADR 0006](https://github.com/jiangxidong/EduApplication/blob/main/docs/adr/0006-claims-are-one-shared-truth-source.md)、
[#21](https://github.com/jiangxidong/EduApplication/issues/21)。

## 四列

| 列 | 类型 | 说明 |
|---|---|---|
| `claim_id` | ASCII 主键 | 形如 `c01`。**不用语义 slug**——措辞会被文书打磨反复改写，slug 会立刻和断言漂开 |
| 断言 | 中文自由文本 | 一句话。**禁止出现竖线字符**（`CONTRACT.md` §4.5：转义的竖线仍会被 `awk -F` 切开） |
| `materials` | ASCII id 列表，空格分隔 | 支撑素材的 `material_id`（形如 `m01`，并进素材文件名）。**空 = 缺素材缺口** |
| `voice` | ASCII 枚举 | `self` / `referee` / `both`——这条主张适合由谁陈述 |

🔒 **`voice` 是文书线的闸，不是推荐信线的闸**（[#52](https://github.com/jiangxidong/EduApplication/issues/52)）。
`referee` 禁的是「申请人自述」——比较性、评价性断言自己写进文书是失礼的。
**没有任何 `voice` 取值禁止把一条主张分配给推荐人**：`recommenders.md` 的「主张 → 推荐人分配」
定义域是**全部主张**，能不能分由 pack 门槛按证据逐条判（他有没有一条能证实且可进 pack 的素材）。
两者不同轴——`voice` 判**叙述位置**，分配判**证实能力**。
⚠️ **`voice` 两条线各有一个消费方，不搬走**：文书线是「这条主张由谁来说」；
推荐信线是下面那条「`voice = referee` 的零素材主张 = **双重缺口**」的分类依据。
🔒 **「谁能证实」不设列**——可验证性是**素材**的独立属性，落在 `materials/*.md` 的 frontmatter `verifiable_by`
（[#38](https://github.com/jiangxidong/EduApplication/issues/38)；**列名不计数**，[#30](https://github.com/jiangxidong/EduApplication/issues/30)）。
主张层再存一遍就是第二真相源。[#12](https://github.com/jiangxidong/EduApplication/issues/12) 的 pack 门槛是纯派生：
顺 `materials` 列跳到素材，读它的 `verifiable_by` 与 `sensitive`。

🔒 **不设 `used_in` 列**——「哪篇文书用了哪些主张」这条边只存在**消费端**：
`essays/canonical/*.md` 的 frontmatter 写 `claims: [c01, c03]`。两端都存必漂移。

## 主张

| claim_id | 断言 | materials | voice |
|---|---|---|---|
| c01 | 我在真实生产系统里定位过瓶颈并把它改掉，不是只会读架构文章 | m01 | both |
| c02 | 我的工程经验本身暴露了我缺系统性的分布式系统训练 | m01 | self |
| c03 | 我有一套把陌生学术环境拆成可执行步骤的具体方法 | m02 | self |
| c04 | 我的工程判断力在同届工程师里属于前列 | | referee |
| c05 | 我抗压能力强 | | self |

## `materials` 为空是什么意思

**空 = 缺素材缺口，不是「不合格的主张」。** 判别式说的是这条断言**能被**素材支撑或证伪，
不是「现在有」——把「现在有没有」写进判别式，缺口视图就没有对象可指。
一张全填满的主张表**演示不了缺口**，而缺口正是产品最该暴露的东西。

零素材主张有两种成因，处置不同：

- **`voice = self` 的零素材主张**：等着采素材。它合法地待在表里，进不了成稿。
  ⚠️ 它进不了成稿是因为**零素材**，不是因为 `voice = self`——`voice` 不拦分配（#52），
  拦它的是 pack 门槛的零素材那一条。
- **`voice = referee` 的零素材主张**：**双重缺口**。比较性/评价性断言申请人自己写进文书是失礼的，
  只能由推荐人说；而 #12 的 pack 门槛（#17 结案后修正为**两条合取**）要求「分配给某位推荐人的每条主张，
  至少有一条素材同时满足 **(a)** `verifiable_by` 含该 `recommender_id`、且 **(b)** `sensitive = no`
  （或 `yes` 但用户已逐条放行）」，零素材 ⇒ **两条都无从谈起、分配不出去**。补素材与选推荐人两件事都还没做。

**素材门槛的作用域是「进了成稿的主张」，不是全局集**
（[#21](https://github.com/jiangxidong/EduApplication/issues/21) 对 [#10](https://github.com/jiangxidong/EduApplication/issues/10) 的第三处修订）：
全局集允许零素材主张，**任何 `essays/canonical/*.md` 的 `claims:` 都不许引用它们**。
哪几条为空、哪篇引用了什么，跑 `../derive-demo.sh` 现算，**不写在这里**。

## 两阶段写

`claims.md` 是**冷启动 / 画像**阶段落初稿（「先抽后问」读简历时顺带抽）、**文书**阶段打磨的。
它与 `channels/`（选校落骨架、准备包补全）同构，是「唯一写入者必须按节/阶段定义、不能按文件」
（[ADR 0008](https://github.com/jiangxidong/EduApplication/blob/main/docs/adr/0008-the-owner-binds-to-a-section-not-a-file.md)）的第二个实例。
