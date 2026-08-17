# 主张集（虚构申请人「林小雨」，`synthetic: true`）

**一条主张 = 申请人希望招生官相信的、关于他自己的一句断言。**
判别式：它必须**能被**一条具体素材支撑或证伪——「能被」，不是「现在有」。

**全局只有这一个主张集合**，文书线与推荐信线都从它取：
**文书是申请人自述主张，推荐信是第三方佐证同一批主张**。
见 [ADR 0006](../../../../docs/adr/0006-claims-are-one-shared-truth-source.md)、
[#21](https://github.com/jiangxidong/EduApplication/issues/21)。

## 四列

| 列 | 类型 | 说明 |
|---|---|---|
| `claim_id` | ASCII 主键 | 形如 `c01` |
| 断言 | 中文自由文本 | 一句话。**禁止出现竖线字符** |
| `materials` | ASCII id 列表，空格分隔 | 支撑素材的 `material_id`。**空 = 缺素材缺口** |
| `voice` | ASCII 枚举 | `self` / `referee` / `both`——这条主张适合由谁陈述 |

## 主张

| claim_id | 断言 | materials | voice |
|---|---|---|---|
| c01 | 我在真实生产系统里定位过瓶颈并把它改掉，不是只会读架构文章 | m01 | both |
| c02 | 我的工程经验本身暴露了我缺系统性的分布式系统训练 | m01 | self |
| c03 | 我有一套把陌生学术环境拆成可执行步骤的具体方法 | m02 | self |
| c04 | 我的工程判断力在同届工程师里属于前列 | | referee |
| c05 | 我抗压能力强 | | self |

**C4 断言的落点**：`c04` 的 `voice=referee` 且 `materials` 为空——它**不该出现在**任何 `essays/canonical/*.md` 的
`claims:` 里（`essay-cites-no-referee-claim` 机械执法），也**不该被判成「文书漏用了这条主张」**——
零素材主张的处置在 `voice=self`（等采集）与 `voice=referee`（双重缺口）之间不同，见下节。

## `materials` 为空是什么意思

**空 = 缺素材缺口，不是「不合格的主张」。**

- **`voice = self` 的零素材主张**（`c05`）：等着采素材。它合法地待在表里，进不了成稿。
- **`voice = referee` 的零素材主张**（`c04`）：**双重缺口**——比较性/评价性断言只能由推荐人说，
  而 pack 门槛要求分配给某推荐人的每条主张至少有一条他能证实且可进 pack 的素材，零素材两条都无从谈起。

**素材门槛的作用域是「进了成稿的主张」，不是全局集**（[#21](https://github.com/jiangxidong/EduApplication/issues/21)）：
全局集允许零素材主张，`essays/canonical/*.md` 的 `claims:` 不许引用它们。

## 两阶段写

`claims.md` 是**冷启动 / 画像**阶段落初稿的、**文书**阶段打磨的。按行单向移交，不按文件。
