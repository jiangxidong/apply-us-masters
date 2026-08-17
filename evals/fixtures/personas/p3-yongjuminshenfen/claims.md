# 主张集（虚构申请人「张明睿」，`synthetic: true`）

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
| c01 | 我独立重构过一个高并发服务的核心模块，并把延迟降到原来的三分之一 | m01 | both |
| c02 | 我在项目里主动补上了系统性能测试这个团队一直缺失的环节 | m01 | self |
| c03 | 我持续参与开源项目并从 issue 报告者做到了模块维护者 | m02 | both |
| c04 | 我的技术判断力在同龄工程师里属于前列 | m02 | referee |

**本档案诊断目标 = 全素材覆盖**：四条主张**没有一条零素材**（对照 P1 的 `c04`/`c05`、P2 的 `c03` 均有零素材实例）——
`c04` 虽是 `voice=referee`，但**有** `m02` 支撑，不是双重缺口，只是不该出现在申请人自述的 canonical 文书里
（`essay-cites-no-referee-claim` 机械执法）。

## 两阶段写

`claims.md` 是**冷启动 / 画像**阶段落初稿的、**文书**阶段打磨的。按行单向移交，不按文件。
