# 切片判据：学位名不是判据，判据是项目页上「thesis 是否 required」那一句

- 状态：已接受
- 日期：2026-08-16
- 来源：[#78](https://github.com/jiangxidong/EduApplication/issues/78)（判据由 [#55](https://github.com/jiangxidong/EduApplication/issues/55) 立、[#65](https://github.com/jiangxidong/EduApplication/issues/65) 迁位取证；本条给它权威住所）

## 背景

产品切片是「美国授课型硕士（coursework / taught master）」，这条边界在美国比英澳模糊、常由院系而非学校定义（地图 fog 原片）。三个数据点（#55 取回，取证注块住三个 channel 的 `#### 费用与资格`）：

- 同一所学校的两个学位分居两侧：UIUC `MCS` = coursework-only；`MS in CS` = Thesis Yes / Research Yes。
- 同一个学位名在两所学校分属两侧：`MS in Computer Science` 在 UIUC 是研究型，在 Columbia 是 30 学分授课型（thesis 是十条 pathway 之一，还须受邀）。
- Cornell `MEng` 恰好是 coursework（`coursework with a capstone project`）——成立是因为**页上写了**。

在本条之前，这条判据只活在三处样例注块与两张已关闭的票里——没有权威住所，正是 [ADR 0019](0019-an-absence-needs-a-consumer-branch-not-a-registry.md) 丙类的形状（消费方＝选校建行时的切片判定，对判据缺席无已定义行为）。

## 决定

**切片归属只看项目页上「thesis 是否 required」那一句；学位名（`MS` / `MEng` / `MCS` / …）不是判据。**

- 它是一条**逐项目、需取回一句话**的事实；**建行那一刻由采集的 agent 判一次**（纯 `awk` 判不了的须跑 agent，[#14](https://github.com/jiangxidong/EduApplication/issues/14) 已判）。
- 切片判定位住 `channels/<channel_key>.md` 覆盖层的 `#### 费用与资格`（[ADR 0008](0008-the-owner-binds-to-a-section-not-a-file.md) 的 #65 修订已裁「切片判定位」，本条不重判归属）。
- **不进 `programs.md` 的列**：那会是一列永远为 `yes` 的死列——切片外的项目根本不该建行。推论：**那句话没取回、切片归属未判的项目不建行**（不是新规则，是上一句的直接推论）。

## 被否掉的

**按学位名／学位类型的印象判**（「MEng 通常是 coursework」）。三个数据点里两个直接证伪；#55 明令禁止。代价查实：印象判会把 UIUC 的 `MS in CS`（研究型）错放进池子，或把 Columbia 的同名学位错排除在外——错的方向都直指「该不该在池子里」，比 `tier` 错档更重。

## Consequences

- 判据原文从此住本条。三个 channel 的取证注块与 #55／#65 结案评论是**应用与取证**，不是权威——照旧，不回改（两个 prototype 分支共 6 处注块 + 2 处 README 行，#78 落盘时实测）。
- 地图 fog「coursework 与 research/thesis 的边界」到此**全部毕业**：判据（#55）＋ 取证（三 channel）＋ 权威住所（本条）。
- 词汇表不加词条：#65 已按 [ADR 0022](0022-a-name-outside-the-vocabulary-is-not-a-reason-to-add-one.md) 判过，本条维持——「切片」在正文里是普通词，不是要定义的领域概念。
- 反向代价：低——判据若被推翻，改的是本条与注块的引用，池子成员按新判据重扫一遍即可；真正贵的是当初取证那三页，已付。
