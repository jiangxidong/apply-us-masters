# 文书素材库

**字段一律列名，不写「N 字段」**（[#30](https://github.com/jiangxidong/EduApplication/issues/30)）——
「六字段 / 七字段」曾并存三种计数。下表是 [#10](https://github.com/jiangxidong/EduApplication/issues/10)
的语义字段与本样例实际落点的对照：

| 字段 | 落在哪 |
|---|---|
| 时间/场景 | 正文「具体」列表 |
| 我的具体动作 | 正文「具体」列表 |
| 结果或转折 | 正文「具体」列表 |
| 可验证性 | 正文「谁能证实」 |
| 原始出处 | 正文「原始出处」 |
| `敏感` | frontmatter，**ASCII 二元 `yes` / `no`**（会被聚合的值只放 ASCII，[#17](https://github.com/jiangxidong/EduApplication/issues/17)） |

🔴 **`已用于` 已删**（#30 裁决）：一条关系边只存在它那个已经落盘的消费端，两端都不存。
防跨推荐人雷同的轴是**主张**不是素材（边在 `recommenders.md` 的分配上）；
防跨校开头雷同在架构上不成立（canonical 跨校共用，开头本来就是同一份）。
frontmatter 的 `usable_for` 说的是「可以用在哪类文书」，与被删掉的「已用于」不是一回事——
**不是前者顶替了后者**。

⚠️ **本表只覆盖 #10 那一套词汇。** frontmatter 上还有 `material_id` / `type` / `usable_for`
三个键不在表内，`concrete` 也只在下面的素材门槛处被顺带提到。**哪一套是 schema、`usable_for`
自身过不过得了镜像判别式** → [#38](https://github.com/jiangxidong/EduApplication/issues/38)，样例**不就地拍板**。

**素材门槛**（地图已锁定的质量硬约束）：**3–5 个具体素材**。
「具体」的判据是**三问**（什么时候 / 你做了什么动作 / 结果是什么），见每个素材文件的 frontmatter `concrete` 字段与正文。

⚠️ **「谁能证实」不在判据里**（[#13](https://github.com/jiangxidong/EduApplication/issues/13) 定稿）——可验证性是素材的**独立属性**，供 `recommenders.md` 选人用。
无人可证的自学项目、个人作品**照样是合格素材**，把它塞进判据会把它们错判为不合格。

当前条数与是否达标：跑 `../derive-demo.sh` 现算。**不写在这里** —— 写下来就要靠改写维持为真。

判定与采集方式（访谈式、批量问、可跳过已知项）归
[#10 文书的双模式与素材门槛怎么共存](https://github.com/jiangxidong/EduApplication/issues/10)。
本票（#4）只定素材落在哪、以什么结构落。
