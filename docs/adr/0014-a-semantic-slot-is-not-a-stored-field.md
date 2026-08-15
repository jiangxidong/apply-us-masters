# 语义槽位不是落盘字段

[#10](https://github.com/jiangxidong/EduApplication/issues/10) 定了素材的六个字段（`时间/场景` · `我的具体动作` · `结果或转折` · `可验证性` · `已用于` · `原始出处`），[#17](https://github.com/jiangxidong/EduApplication/issues/17) 加了 `敏感`。而 `prototype/state-layer` 上的样例 `materials/*.md`，frontmatter 里躺着的是另一套：`material_id` / `type` / `usable_for` / `concrete`。

**两套零交集。** 三问在样例里是正文散文，`可验证性` 是正文一行「谁能证实」。[#27](https://github.com/jiangxidong/EduApplication/issues/27) 逐字段核过一遍，得出的结论是「七字段实缺三个」——**它把 frontmatter 现有的键当成了通往 #10 那份名单的进度**。这个读法有一个从未被写下来的前提：那六个是要变成键的。

前提不成立。两套词汇不是同一件事的两个版本，是**两层**：#10 的六个回答「一条素材必须答什么」，frontmatter 的键回答「脚本能读到什么」。把它们摆成竞争关系，问「哪一套是 schema」，问题本身就是错的——[#38](https://github.com/jiangxidong/EduApplication/issues/38) 的题面正是这么问的。

## 决定

**语义槽位与落盘字段是两层，界线是消费方判据：有落盘消费方的进 frontmatter，其余留正文。**

进了 frontmatter 的值一律 ASCII（遵 §4.5）——但这是**格式约束，不是准入判据**。准入只看一条：**有没有一个已经落盘的东西在读它。**

判据不是新发明。它是 [ADR 0008](0008-the-owner-binds-to-a-section-not-a-file.md) 判 owner 归属那条（「谁的决策依赖它，谁负责取证落盘」）的同一台机器，换一个对象用——那边判「这条事实归谁写」，这边判「这条信息该不该有键」。[ADR 0011](0011-the-glossary-defines-words-the-contract-holds-the-values.md) 已经把它抬到过 repo 文档上，这是第三次。

## 被否掉的两条

**「可聚合判据」：会被跨文件聚合、比对的进 frontmatter。** 它最贴近 §4.5 那条实测坑（中文进被聚合的列会让 `uniq` 数错、`sort -u` 丢行），读起来像是同一条规则的自然延伸。但它放行 `type: 工作项目`——那个键从来没有人聚合过，它只是**看起来可以被**聚合。**「能被聚合」不等于「有人聚合」**，而一个没有消费者的键必然漂移：没人读，就没人在它写错时发现。这正是 [#26](https://github.com/jiangxidong/EduApplication/issues/26) 杀掉 `决定` 列、[#21](https://github.com/jiangxidong/EduApplication/issues/21) 拒绝「造一个没有任何消费者的产物」的同一条。

**「二元 / 枚举判据」：取值是封闭词表的进 frontmatter，自由散文留正文。** 它有一个漂亮的副产品——把「值是不是 ASCII」和「该不该是键」合成一条规则。但它同样放行 `type`，且反向会误杀：`verifiable_by` 存的是一个**开放**的 `recommender_id` 列表，按这条判据它进不了 frontmatter，而它恰恰是 [#12](https://github.com/jiangxidong/EduApplication/issues/12) pack 门槛第一条合取的判定本体。降级为格式约束保留。

## Consequences

**v1 的 frontmatter 是三个键**：`material_id` / `sensitive` / `verifiable_by`。名单本身归状态层契约（ADR 0011），这里只记判据。

🔴 **「消费方」含两种，两种都算数——不写清楚，这条判据会当场杀掉 `sensitive`。**

| 键 | 消费方 | 哪一种 |
|---|---|---|
| `material_id` | `claims.md` 的 `materials` 列（跨文件 id 引用）、`derive-demo.sh` 的两个派生视图 | **已实现**：现在就有代码在读 |
| `sensitive` | #12 pack 门槛两条合取的第二条 | **契约已定、尚未实现**：pack 本身是 #12 的派生视图，v1 还没写 |
| `verifiable_by` | #12 pack 门槛两条合取的第一条；`recommenders.md` 据它选人 | 同上 |

判据要的是**「有一个已落盘的东西在读它」**，其中「已落盘」修饰的是**消费方本身**（那条门槛写在契约里、是可执行的规则），不是「已经有跑起来的代码」。按后一种读法，`sensitive` 与 `verifiable_by` 当场出局——而它们恰恰是 #12 门槛两条合取的判定本体。**没有消费方**（`type`）与**消费方尚未实现**（`sensitive`）是两回事。

⚠️ 但这条放宽有它自己的滑坡：「将来会有人读」不是消费方。分界是**那个消费方已经被某张票判定下来、写进了契约**——`usable_for` 过不了这一关，没有任何一条已定的规则读它。

**三个键被删掉，理由各不相同——这是判据在切真关节的证据。**

- **`type`**（`工作项目` / `学术经历`）：零消费方，且是唯一一个中文值的键。分类的实际承载者是 `claims.md`——素材是按**主张**被选中的，从来不是按类型。
- **`usable_for`**（`[academic-sop, personal-statement, cv]`）：**两条判据都判它出局，理由不同。** 消费方判据：选材路径是「主张 → 素材」，它不在任何一条决策链上。镜像判别式：文书类型清单逐渠道住在 `channels/` 的「文书规格」，一所学校新增一类文书，这份清单为保持为真就得被改写，**而源在别处**——满足镜像的完整定义（含 [#30](https://github.com/jiangxidong/EduApplication/issues/30) 补的前提句「镜像的前提是别处有源」）。
- **`concrete: true`**：它为保持为真必须在正文三问被改写时跟着改，**而源就在同一个文件的正文里**。它是镜像，也是 #30 明令的「可再生缓存」。

**正文的「不能用在哪」留下，`usable_for` 删掉——同一个判断的正反两面，留判断那一面。** 样例 01 里两者并存（frontmatter 一份正面清单，正文一行 `不要用在「为什么选这所学校」`）。删掉的那半是镜像，留下的那半不是：`不要用在「为什么选这所学校」` 的源不在任何别处，它就是关于这条素材本身的一条判断，与 `tier_basis`、「主张 → 推荐人分配」同类，走 #30 那句前提句放行。

**「具体」的判定权从文件回到采集现场。** 删掉 `concrete` 之后，三问只剩正文，因此定了一条**形状规则**（三个固定小标题）好让 [#14](https://github.com/jiangxidong/EduApplication/issues/14) 的回归检查项至少能断言形状。⚠️ 但要明说这条规则**只判形状、判不了内容**——三个小标题齐全而底下写的是感想，脚本一样放行。**判「具体」的是采集时的 agent，不是 CI**（与 #14 已定的「G 组纯 `awk`/`grep` 可判、其余须跑 agent」一致）。

**`可验证性` 从散文升成字段，`敏感` 从中文键改成 ASCII 键——两处都是落盘形态变了，决策没变。** #12 判的是「这个人能证实它」是 pack 门槛的判定本体，#17 判的是「每条素材带敏感标记、二元、agent 提议用户可下调」;两票都没有一个字判过落盘形态。⚠️ 键名从 `敏感` 改成 `sensitive` 的理由是 §4.5 那条坑读窄了：`uniq` 数错、`sort -u` 丢行是「中文内容撞 shell 工具」，脚本 `grep '^敏感:'` 时**已经在中文上做匹配**，对键和对值同样成立。

**`verifiable_by` 存 `recommender_id` 列表，附带一条硬后果**：「谁能证实」被限制成必须先是 `recommenders.md` 里的一个候选人。样例 02 的「授课教师李老师（**联系方式不在手**）」正卡在这里——这人能证实，但联系不上。判定是**这恰好对**：联系不上是 `recommenders.md` 的状态，不是素材的属性；素材侧只答「哪个候选人在场」。而一条谁都证实不了的自学项目素材写成 `verifiable_by: []`，正文照旧可以写「无人可证」——它仍是合格的文书素材（`CONTEXT.md` 已锁），只是进不了 pack。**空列表 = #12 的「缺人」缺口**，与 `claims.md` 的 `materials` 空 = 缺素材完全同构。

**`material_id` 补进主键表，五个变六个。** 它是一条**已经落盘的跨文件引用**（`claims.md` 的 `materials` 列存的就是它），而此前它不在契约的主键名单里——唯一一条跨文件 id 引用没有权威定义。风格同时对齐 `claim_id`：`01` → `m01`，并进文件名（`m01-<中文短名>.md`）。**id 进文件名才能靠 glob 解析引用**，否则每次解析都要打开全部素材文件读 frontmatter，而 `敏感` / `identity` 那条线的整个设计前提就是「agent 少读文件」。

**反悔代价中等偏低。** 名单本身可逆（加回一个键是一次编辑），难回头的是判据——它一旦成为判「该不该有键」的机器，别处的 frontmatter（`essays/canonical/*.md`、`apply.md`、`profile.md`）都该按它重扫一遍。**这次没有重扫**，只裁了 `materials/`。

**顺带修掉一处抄错的已锁决策。** `materials/README.md` 写着「素材门槛（地图已锁定的质量硬约束）：**3–5 个具体素材**」，而 #10 早就判了「单位是**主张**不是篇数；3–5 个是参考值，不是闸门」。样例把被降级的参考值当成硬约束写了进去，`derive-demo.sh` 的篇数计数照着它来——真正的闸门（进了成稿的主张是否都有素材支撑）#27 已经加在脚本里了，所以这是把假闸门降级，不是补新闸门。

## 后续

🔴 **`verifiable_by` 让一条两端都存的边显形了。** 样例 `recommenders.md` 的「能证实什么」列写的是「素材 01 的三问全过程与结果数字」「素材 02 的学术表现」——**那和 `verifiable_by` 是同一条边的两端**，撞 [#30](https://github.com/jiangxidong/EduApplication/issues/30) 的通则「一条关系边只存在它那个已经落盘的消费端，两端都不存」。

这条边在本 ADR 之前就是两端都有的（素材那端只是散文：`谁能证实：直属 leader（也是推荐人候选 R2）`），**把它变成字段不是病因，是显影剂**。哪一端留、`CONTEXT.md` 那句「『这个人能证实什么』是推荐人的属性，与素材的可验证性**配对使用**」要不要改，归 [#49](https://github.com/jiangxidong/EduApplication/issues/49)——本 ADR 不就地拍板。
