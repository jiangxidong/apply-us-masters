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
| `materials` | ASCII id 列表，空格分隔 | 支撑素材的 `material_id`。**空 = 缺素材缺口** |
| `voice` | ASCII 枚举 | `self` / `referee` / `both`——这条主张适合由谁陈述 |

🔒 **「谁能证实」不设列**——可验证性是**素材**的独立属性（`materials/*.md` 的第四字段）。
主张层再存一遍就是第二真相源。[#12](https://github.com/jiangxidong/EduApplication/issues/12) 的 pack 门槛是纯派生：
顺 `materials` 列跳到素材，读素材的可验证性。

🔒 **不设 `used_in` 列**——「哪篇文书用了哪些主张」这条边只存在**消费端**：
`essays/canonical/*.md` 的 frontmatter 写 `claims: [c01, c03]`。两端都存必漂移。

## 主张

| claim_id | 断言 | materials | voice |
|---|---|---|---|
| c01 | 我在真实生产系统里定位过瓶颈并把它改掉，不是只会读架构文章 | 01 | both |
| c02 | 我的工程经验本身暴露了我缺系统性的分布式系统训练 | 01 | self |
| c03 | 我有一套把陌生学术环境拆成可执行步骤的具体方法 | 02 | self |
| c04 | 我的工程判断力在同届工程师里属于前列 | | referee |
| c05 | 我抗压能力强 | | self |

## 这张表在演示什么

**`materials` 为空 = 缺素材缺口**，这是本表最该演示的东西，全填满的样例演示不了它。

- **c04** 是**双重缺口**：既没有素材支撑，`voice` 又是 `referee`——比较性/评价性断言申请人自己写进文书是失礼的，
  只能由推荐人说。而 #12 的 pack 门槛要求「分配给某位推荐人的每条主张，至少有一条**他本人能证实**的素材」，
  c04 现在一条都没有，**分配不出去**。
- **c05** 是判别式第四行的现场版：「我抗压能力强」**是**主张（它可被素材支撑），
  只是现在没有——那正是缺口，不是「不合格的主张」。

**素材门槛的作用域是「进了成稿的主张」，不是全局集**（[#21](https://github.com/jiangxidong/EduApplication/issues/21) 对 [#10](https://github.com/jiangxidong/EduApplication/issues/10) 的第三处修订）。
所以 c04 / c05 合法地待在这张表里，但**进不了任何成稿**——三篇 canonical 的 frontmatter 都没有引用它们。
校验跑 `../derive-demo.sh` 现算，**不写在这里**。

## 两阶段写

`claims.md` 是**冷启动 / 画像**阶段落初稿（「先抽后问」读简历时顺带抽）、**文书**阶段打磨的。
它与 `channels/`（选校落骨架、准备包补全）同构，是「唯一写入者必须按节/阶段定义、不能按文件」
（[ADR 0008](https://github.com/jiangxidong/EduApplication/blob/main/docs/adr/0008-the-owner-binds-to-a-section-not-a-file.md)）的第二个实例。
