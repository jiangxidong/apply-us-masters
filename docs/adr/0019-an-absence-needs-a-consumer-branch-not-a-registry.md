# ADR 0019 — 「声明了但没有现货」是三种缺陷，只有一种要补货

**日期**：2026-08-15 · **来源**：[#59](https://github.com/jiangxidong/EduApplication/issues/59)（由 [#44](https://github.com/jiangxidong/EduApplication/issues/44) 的第三问按宽口径毕业而来）

## Context

[#44](https://github.com/jiangxidong/EduApplication/issues/44) 按**窄口径**（指向 `channels/` 的悬空指派）答了「还有没有第二处」，收窄时撞见一处同形而更上一层的东西：ADR 0008 限定 1 自陈「『列』这个单元今天没有现货」。那不是「指了去处但去处不存在」，是「**指了一种切法但切法不存在**」。#59 接宽口径，普查全契约。

🔴 **普查第一步就把票面的起点判掉了**：`CONTRACT.md` **§4.6** 早已落盘、逐列列出 13 列，限定 1 那句「没有一处完整列举」写于它之前，已作废（本次一并更正，且限定 1 在 `main` 上有**三处**过期陈述，其中一处正是 `docs/checks.md` 为 `split-is-declared` 指的规则原文唯一权威——只改一处会留下自相矛盾的 ADR）。

普查结果：**甲 5 / 乙 8 / 丙 3**。

## Decision

### ① 判据：不看「缺的是什么」，看两问

判一处缺口属于哪类，**不看缺的是去处、切法还是检查**，看：

1. **缺席是不是合法状态？**
2. **消费方对缺席有没有一条已定义的行为？** —— 门槛是**分支**，不是一句注。

正例：`essays/canonical/per-program/` —— README 有一整节讲它，包 README 写着「why 段缺失 = 警告放行，不报错」。那是一条**分支**，所以它的缺席合法。

- **甲（合法缺席）**：两问皆是。**不动，一张票都不开。**
- **乙（措辞过期）**：现货其实有，是那句话没跟上。**就地改那句话。**
- **丙（真欠货）**：缺席不合法，或消费方无定义行为。**必须补货。**

🔴 **防蔓延闸——「已被承认的欠账」不是「合法的缺席」。** `evals/` 有 `docs/checks.md` 的「尚未实现」一节兜着，但「13 条检查一条都没跑过」**不是合法状态**：它是丙，只是有票。少这一句，任何人都能靠补一句「尚未实现」把丙洗成甲。这与 ADR 0008 拒绝把 `channels/` 定成「例外」是同一条理由：**没有判据的出口会蔓延。**

### ② 归宿：丙类只能进它自己的票；甲类一张票都不开

- **丙类**：**必须是独立票。** 挂在别人票的「顺带 / 连带改 / 本票捅出的新洞」里**等价于不登记**。
- **甲类**：不开票。开了就是第二份「已知欠账」清单——`docs/checks.md` 已经是一份，别造第二份。
- **乙类**：就地改那句话，不开票。

**取证是一组对照，变量只有「有没有自己的票」**：

| | 下落 |
|---|---|
| **有票的两处** | `evals/`（→ [#35](https://github.com/jiangxidong/EduApplication/issues/35) / [#57](https://github.com/jiangxidong/EduApplication/issues/57)）、`season_downgraded`（→ [#47](https://github.com/jiangxidong/EduApplication/issues/47)）—— **活着**，欠账可见可追 |
| **没票的一处** | `institution_id` 被 [#19](https://github.com/jiangxidong/EduApplication/issues/19) §3 / [#27](https://github.com/jiangxidong/EduApplication/issues/27) F 条 / [#8](https://github.com/jiangxidong/EduApplication/issues/8) 结案第 3 条**登记三次，全部随票关闭**。下落不取自票的记账，取自 `git show` 实测现货：`profile.md` 学历表**至今七列**，没有那一列，导致 §1.3 的四条 `documents/<槽位>/<institution_id>/` 路径在样例里**无从解析** |

**同一天的第二个实例**：[#28](https://github.com/jiangxidong/EduApplication/issues/28) 转给 [#27](https://github.com/jiangxidong/EduApplication/issues/27) 的两项补齐活，评论 `17:04` 才到、票 `15:43` 已关，#27 自己记着「没有人承接」。

🔴 **一次是巧合，两次是机制：欠账的寿命等于它所在那张票剩下的开票时间。**

### ③ 不做成检查

参照物（契约的声明）与被检对象（仓库的现货）**同处一棵可被同一次提交改写的树** → 正是 [ADR 0017](0017-a-check-that-compares-against-a-forkable-copy-is-vacuous.md) 判为恒真的形状。跨副本取参照物的三条路 ADR 0017 都已否掉。

**探针 ≠ 闸门。** [#61](https://github.com/jiangxidong/EduApplication/issues/61) 那条「唯一出现处是不是声明本身」的 `grep` 是**好用的发现手段**（#59 正是靠它捞出自己漏掉的第五项），但**补一个假消费点就全绿**，当不了保障。**写明于此，免得下一个 session 以为它被机械保护着。**

## Consequences

**一个复发形态值得点名：「给了计数，没有名单」。** 三次同形——限定 1 的「13 列」（已由 §4.6 修好）、`CONTRACT.md` §1.2 的「三张封闭词表」（实持一张）、§1.5 的「14 项派生视图」（其中数项只活在名单里，[#61](https://github.com/jiangxidong/EduApplication/issues/61) 已判入列判据）。**写计数比写名单便宜，而计数不会因为名单没跟上而报错。**

**为什么是新 ADR 而不是 ADR 0008 的限定 6**：本条管的是**契约的声明与仓库现货之间的关系**，横跨全契约；ADR 0008 管的是 owner 绑定的单位。形状上更近 [ADR 0017](0017-a-check-that-compares-against-a-forkable-copy-is-vacuous.md)（讲检查的有效性）而非 0008。

**作废条件**：① 若 `evals/` 建起来并给每条检查标注参照物来源（ADR 0017 的作废条件之一），决定 ③ 要重算；② 若普查的丙类从 1 涨到两位数，决定 ② 「只进自己的票」的成本假设不成立，需要重判。
