# 主张集（虚构申请人「周悦悦」，`synthetic: true`）

**一条主张 = 申请人希望招生官相信的、关于他自己的一句断言。**
判别式：它必须**能被**一条具体素材支撑或证伪——「能被」，不是「现在有」。

**全局只有这一个主张集合**，文书线与推荐信线都从它取。见
[ADR 0006](../../../../docs/adr/0006-claims-are-one-shared-truth-source.md)、
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
| c01 | 我用自学的方式把 Python 基础用到了一个真实的小项目里，跨专业不等于零基础 | m01 | self |
| c02 | 家庭变故没有打断我的学业规划，反而让我更早确定了转专业的方向 | m02 | self |
| c03 | 我在陌生领域的自学能力经得起检验 | | self |

**C 组断言的落点**：`c03` 的 `materials` 为空——这是**骨架路径**的第一现场：
它合法地待在这张表里、进不了任何 `essays/canonical/*.md` 的 `claims:`，
是 [#21](https://github.com/jiangxidong/EduApplication/issues/21) 那对**极易写反**的断言的落点——
**全局集允许零素材主张，且它必须出现在缺口清单里，不得被判为不合格**（[#14](https://github.com/jiangxidong/EduApplication/issues/14) C2）。

## `materials` 为空是什么意思

**空 = 缺素材缺口，不是「不合格的主张」。** `c03` 是 `voice = self` 的零素材主张：等着采素材，
合法地待在表里，进不了成稿——**它进不了成稿是因为零素材，不是因为 `voice = self`**。

## 敏感素材的引用纪律

`c02` 支撑素材 `m02` 的 frontmatter `sensitive: yes`——引用前必须先过「原文 → 拟用表述」逐条确认这道停手点
（见 `materials/m02-家庭变故与转专业决心.md`）；本 fixture 是静态快照，**不模拟该停手点之后的行为**，
只记录 `sensitive: yes` 这个二元标记本身，判定停手是否发生归 agent 级断言（见 `../assertions.md` D2）。

## 两阶段写

`claims.md` 是**冷启动 / 画像**阶段落初稿的、**文书**阶段打磨的。按行单向移交，不按文件。
