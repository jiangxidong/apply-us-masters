# 伪保底标注的是用户的先验，不是产品的分档

> 本 ADR 由 [#36 词汇表欠账：伪保底 / `pseudo_safer` 是落盘列却无词条](https://github.com/jiangxidong/EduApplication/issues/36) 拟定并当场落盘。
> #36 立票时是一张纯回填的 `wayfinder:task`，其闸门跳闸后原地改判为 `wayfinder:grilling`——回填一个词条的前提是它有定义，而这里没有。

[`0009`](0009-safer-is-defined-by-the-programs-second-published-line.md) 把 `safer` 的标定权从产品交给学校：
项目不公布**第二条线**，任何申请人在它这里都拿不到 `safer`，与你多强无关。

而 `pseudo_safer` 是 [#11](https://github.com/jiangxidong/EduApplication/issues/11) 对着**旧** `safer`（产品自己估余量）定的一列，
`0009` 通篇未提它——它的「明确不碰的」清单点名了 [#16](https://github.com/jiangxidong/EduApplication/issues/16) 五节、
[#4](https://github.com/jiangxidong/EduApplication/issues/4) 的列、证据二元、[`0001`](0001-evidence-stays-binary-with-a-closed-suffix.md)，**唯独没有伪保底**。
不是被裁掉，是被漏掉。于是这一列在契约里活着、在词汇表里不存在，同时被两个新词条（「依据」「作废条件」）和 [`0005`](0005-basis-points-at-an-existing-checked-fact.md) 末句当承重物引用。

要判的是同一件事的两副面孔：**一行能不能同时是 `tier=safer` 和 `pseudo_safer=yes`？**

| | 后果 |
|---|---|
| **允许共存** | 顾问经验可以推翻学校公布的线——`0009` 刚堵上的洞从后门打开 |
| **已被吸收** | `reach` 终态已使「假的保底」在机械上产不出来，这一列作废 |
| **禁止共存** | 伪保底只出现在非 `safer` 行上，它纠正的是**用户的先验**，不是产品的分档 |

「允许共存」这条支路在美国**不是空的**：UIUC MCS 公布 `recommended 3.2/4.0 or higher`（类型 A），
一个 GPA 3.8 的申请人按 `0009` 的合取判据能拿到 `safer`，而它是全美最挤的 CS 硕之一。

## 决定

**禁止共存：`pseudo_safer = yes` ⇒ `tier ≠ safer`。**

`tier` 与伪保底回答的不是同一个问题。`tier` 回答「**按项目公布的条件线**，你的被拒风险落在哪」；
伪保底回答「这个项目在**公布的线之外**（排名、名气、名义门槛）看起来像不像保底」。
后者从来不是前者的一个修正项，所以它既不进分档表的格，也不进 `tier_basis`。

三条随之定死：

1. **伪保底的两半（名义门槛低 / 方向极挤）各自要有 `channels/` 里一条 `✓` 事实行**，
   不复用 `tier_basis` / `tier_void_if`（**推翻** #11 第三次更正的「复用」那半句，及其括号里的理由「伪保底本质就是分档判断的一部分」）。
2. **[`0005`](0005-basis-points-at-an-existing-checked-fact.md) 末句那条 `经验：` 例外删除。**
   `tier_basis` 里从此不存在任何零出处从句。
3. **`no` = 已看过两半信号并判定为否**，默认值是 `unknown`。

## Consequences

**零出处的口子关掉了，代价是丢掉一部分学校不明说的挤。** 接受——这个口子是欧陆样本（euro-grad-apply 点名 TU Eindhoven CS / KU Leuven AI，全篇零出处）的产物，
本图收窄为只做美国后它跟着出范围；而美国学校常常自己把话写出来：
Columbia CS MS 在同一句里既写 `no minimum GPA` 又写 `the program is highly selective`，
两半各带各的 `✓`，原样通过 [`0005`](0005-basis-points-at-an-existing-checked-fact.md) 的准入测试。
留着它，伪保底就会是整个产品里唯一一处「无出处也能落盘的断言」。

**伪保底的作废条件不落盘。** 它由两条 `✓` 事实支撑，任一条变了就重判——沿用「缺口」那条已锁定的判别式：
可从真相源现算的东西不存，落盘的必然腐烂。代价是 `CONTEXT.md`「作废条件」词条里那句
「它在 `safer` 行**与 `pseudo_safer=yes` 行**上做真功」（[#29](https://github.com/jiangxidong/EduApplication/issues/29) 当天刚落）要改掉。

**伪保底不参与失效传播。** 两半都在项目侧、零申请人输入，
所以 #16 §7 链一（GPA / 本科院校 / 语言分变更 → 只降引用了该字段的行）永不触发它。
它与 `safer` 同属项目属性先行，方向相反：`safer` 由项目**公布了第二条线**给出，
伪保底由项目**没有第二条线却又极挤**这个组合给出。

**这一列一行数据都还没有**（`prototype/state-layer` 的 `CONTRACT.md:93`：13 列在样例里只落了 9 列），
所以现在钉死语义是零迁移成本的——这也是不把它拖成一张独立票的理由。

**没碰 schema。** 值域、列的存废归 #11 / #4；本 ADR 只定义这一列**断言什么**。
