# `safer` 由项目公布的第二条线定义，不由产品定义余量

[`0004`](0004-tiers-are-anchored-on-published-hard-requirements.md) 把 `safer` 定义为「你**明显超过**公开写明的硬门槛」，但没有定义「明显」。[#16](https://github.com/jiangxidong/EduApplication/issues/16) §5 把池子的真实分布确定为「绝大多数 `reach`、少量 `safer`」之后，分档唯一有决策价值的一刀**完全落在 `reach` / `safer` 的边界上**——而这条边界就是「明显」这两个字。

最自然的补法是给产品定一个数值余量（「GPA ≥ 门槛 + 0.3 算 `safer`」）。它撞两堵墙：一是它就是 `0004` 明确拒绝过的**概率带换了个马甲**；二是「超过 3.0 多少才算明显」在只公布下限、不公布分布的美国常态下**根本没有参照物**——跟门槛比是同义反复，跟录取群体比又需要 class profile，而那正是 `match` 的条件。

决定：**`safer` 的标定权交给学校，不留在产品。** `safer` 要求申请人跨过该项目**自己公布的第二条线**——最低线之外的第二个公开数字，形态为「更高的软门槛」（`recommended` / `preferred` / `expected` / GRE waiver 门槛 / conditional admission 分界）或「录取群体分布的**区间上界**」。项目只公布一条线时，**没有第二条线可跨，`reach` 就是它能得到的终态**。

先修的前提：`0004` 的「拒你的主要原因会是**竞争**」与「风险**不是你的条件**」在一种合理读法下**根本不分离**——若「竞争」指名额、口味、运气（外生），则 `reach` 已经蕴含了 `safer` 的断言。故取「竞争 = 别的申请人比你更强」这一读法并写进词汇表。这也解释了 #16 §3 的信号白名单里为什么找不到能区分两档的信号：当时**没有东西可区分**。

## Consequences

**「明显」这个词从产品里消失。** 跨过第二条线是**一条可链接的 `✓` 事实**，原样通过 [`0005`](0005-basis-points-at-an-existing-checked-fact.md) 的准入测试——不新增标记、不加列、不动 schema，也不在「绝不输出录取概率」这条红线上开洞。同一台机器顺带把「擦线」从主观形容词变成可机械判断的谓词（该维度有第二条线且没跨过），否则它就是「明显」的同一个病。

**`safer` 成为项目属性先行的判断。** 项目不公布第二条线，任何申请人在它这里都拿不到 `safer`，与他多强无关。这把用户的挫败感导向正确的地方——不是你不够好，是它不说。代价是 `safer` 比 #16 §5 预计的更罕见：**五所样本里 `safer` 产出为零**——公布区间的一个都没有，而唯一一条压在最低线之上的第二条线（Graduate College 3.0 之上的 Siebel School `recommended 3.2`）经 [#45](https://github.com/jiangxidong/EduApplication/issues/45) 真取回后被学校自己的 FAQ 判为类型 B 的单个均值（`Our website states the average GPA of admitted students. It is not a minimum.`），无离散度 ⇒ 同样不判 `safer`。这个稀缺是**诚实的**——美国 coursework master 对一个满足门槛的申请人本来就大多是 `reach`。

**`match` 反而比 #16 §5 预计的常见。** `"Successful applicants typically have a GPA of 3.5 or higher"`（Columbia CS）这类**录取结果下界**在美国比 `middle 50%` 区间常见得多，而跨过它只证明「你和大多数被录的人一样」——那逐字是 `match` 的定义。#16 §5 的分布描述随之修订。

**「第二条线查不到」不进缺口清单。** 它与 class profile 性质不同：class profile 是「学校可能有但没登出来」，第二条线是**查得到就有、查不到就是真没有**，问 admissions 也不会得到「我们的建议 GPA 是多少」。放进 #16 §8 的任一栏都会在用户待办上挂一项**永远勾不掉**的事，正是那一节明确要禁的东西。它并入已有的 `reach` 终态话术。

**副作用：`ineligible` 因此成为必需的第五档。** `safer` 的判据是一个合取（全部维度达标 + 至少一个跨过第二条线 + 无维度擦线），把「未达标」写成判据的一部分之后，`0004` 的四档**全部以「满足硬门槛」为前提**这个洞才暴露出来——「查到 GPA 最低 3.0、你 2.7」无处安放。它不能塞进 `undecided`（那会让 [#11](https://github.com/jiangxidong/EduApplication/issues/11) 的机械判别式「`tier_basis` 空 ⇒ `undecided`」当场矛盾，因为未达标的行 `tier_basis` 恰恰填得满），也不能走 `status=dropped`（[`0002`](0002-one-program-pool-one-status-axis.md) 定 `status` 是用户对项目做什么，硬申差 0.3 的项目是合法选择）。

**新增的机械可校验规则只有一条**：`tier = ineligible` ⇒ `tier_basis` 非空。`safer` 的核心判据「至少点名一条第二条线事实」**无法机械校验**——判断 `recommended 3.2` 是不是第二条线、是类型 A 还是 B，都是语义地读 `channels/`。沿用 #16 §4 的诚实态度，不假装它能。
