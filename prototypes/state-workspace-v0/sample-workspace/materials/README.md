# 文书素材库

**字段一律列名，不写「N 字段」**（[#30](https://github.com/jiangxidong/EduApplication/issues/30)）——
「六字段 / 七字段」曾并存三种计数。下面两张表分别回答**存了什么**与**要答什么**，
它们**不是同一件事的两个版本，是两层**（[ADR 0014 语义槽位不是落盘字段](https://github.com/jiangxidong/EduApplication/blob/main/docs/adr/0014-a-semantic-slot-is-not-a-stored-field.md)，[#38](https://github.com/jiangxidong/EduApplication/issues/38)）。

## ① frontmatter 的三个键，各自的消费方

**准入判据 = 消费方**：有落盘消费方的进 frontmatter，其余留正文。进了 frontmatter 的值一律 ASCII，
但那是**格式约束、不是准入判据**（`CONTRACT.md` §4.5）。

| 键 | 值域 | 消费方 |
|---|---|---|
| `material_id` | ASCII 主键，形如 `m01`，**并进文件名** | `claims.md` 的 `materials` 列；`../derive-demo.sh` 的派生视图 |
| `sensitive` | ASCII 二元 `yes` / `no` | [#12](https://github.com/jiangxidong/EduApplication/issues/12) pack 门槛两条合取的**第二条**（[#17](https://github.com/jiangxidong/EduApplication/issues/17)：给推荐人的包里敏感素材默认不进） |
| `verifiable_by` | `recommender_id` 列表，引 `../recommenders.md` 的候选人表 | pack 门槛两条合取的**第一条**；`recommenders.md` 据它选人；**空 = 缺人缺口** |

**id 进文件名，引用才能靠 glob 解析** —— 否则每次解析 `claims.md` 的 `materials` 列都要打开全部素材文件读
frontmatter，而 `sensitive` 那条线的整个设计前提就是「agent 少读文件」。

🔴 **`sensitive` 与 `verifiable_by` 的消费方是「已定但尚未实现」，不是「没有」。** pack 门槛在 #12 的契约里定死了，
实现落在 `../derive-demo.sh` 的派生视图上。**「没有消费方」（被删掉的 `type`）≠「消费方尚未实现」**；
而「将来可能会有人读」不算消费方——照字面套判据会当场杀掉 `sensitive`。

## ② #10 的六个语义字段落在哪

语义槽位回答「一条素材必须答什么」，frontmatter 回答「脚本能读到什么」，**两者不竞争**。

| 语义字段 | 落在哪 |
|---|---|
| 时间/场景 | 正文小标题 `## 时间` |
| 我的具体动作 | 正文小标题 `## 我做了什么` |
| 结果或转折 | 正文小标题 `## 结果` |
| 可验证性 | frontmatter `verifiable_by`（**已从散文升级**：判定本体停在散文里等于 pack 门槛不可执行） |
| 原始出处 | 正文「原始出处」 |
| 敏感 | frontmatter `sensitive` |

### 正文的形状规则

三问写成**三个固定小标题**：`## 时间` / `## 我做了什么` / `## 结果`。

🔴 **只判形状，判不了内容。** 三个标题齐全而底下写的是感想，脚本一样放行。
**判「具体」的是采集时的 agent，不是脚本**（与 [#14](https://github.com/jiangxidong/EduApplication/issues/14) 已定的
「纯 `awk`/`grep` 可判的归静态检查组、其余须跑 agent」一致）。

## 删掉的四个键，理由各不相同

| 键 | 出局的理由 |
|---|---|
| `已用于` | [#30](https://github.com/jiangxidong/EduApplication/issues/30) 裁决：**一条关系边只存在它那个已经落盘的消费端，两端都不存**。防跨推荐人雷同的轴是**主张**不是素材（边在 `../recommenders.md` 的分配上）；防跨校开头雷同在架构上不成立 |
| `type`（`工作项目` / `学术经历`） | **零消费方**，且是唯一一个中文值的键。分类的实际承载者是 `../claims.md`——素材是按**主张**被选中的，从来不是按类型 |
| `usable_for` | **两条判据各判它出局一次**：消费方判据——选材路径是「主张 → 素材」，它不在任何决策链上；镜像判别式——文书类型清单逐渠道住在 `../channels/` 的「文书规格」，**源在别处** |
| `concrete: true` | 它为保持为真必须跟着同一文件的正文改，**源就在正文里** → 镜像，且是 #30 明令的「可再生缓存」 |

⚠️ **正文的「不能用在哪」留下**（m01 有）。它和 `usable_for` 是同一判断的正反两面，但**只有一面是镜像**：
`不要用在「为什么选这所学校」` 的源不在任何别处，与 `tier_basis`、「主张 → 推荐人分配」同类。**留判断那一面。**

⚠️ 正文的「谁能证实」与 frontmatter 的 `verifiable_by` 覆盖同一条边的同一端。**是不是镜像本票不判**——
判据与 `../recommenders.md` 的「能证实什么」列是同一条 → [#49](https://github.com/jiangxidong/EduApplication/issues/49)。
**机械读者一律读 frontmatter。**

## 素材门槛

🔴 **门槛的单位是「主张」，不是「篇」**（[#10](https://github.com/jiangxidong/EduApplication/issues/10) §2）：

> 硬约束是「**不许有无素材支撑的主张**」。**3–5 这个数字是经验参考值，不是闸门**——
> 只写 3 条主张的短文书不需要凑 5 个素材。

⚠️ 本文件此前把 3–5 写成「地图已锁定的质量硬约束」，**那是抄错**，已改。真正的闸门（进了成稿的主张是否都有素材支撑）
在 `../derive-demo.sh` 里，`../claims.md` 也写着「素材门槛的作用域是**进了成稿的主张**，不是全局集」
（[#21](https://github.com/jiangxidong/EduApplication/issues/21)）。`derive-demo.sh` 里的篇数计数因此是**参考信息，不是闸口**。

「具体」的判据是**三问**（什么时候 / 你做了什么动作 / 结果是什么），落点见上面的形状规则。

⚠️ **「谁能证实」不在充分度判据里**（[#13](https://github.com/jiangxidong/EduApplication/issues/13) 定稿）——
可验证性**在文书线是独立属性、不参与充分度判定；在推荐信线是判定本体**（#12 结案后修正 §3）。
一条 `verifiable_by: []` 的自学项目素材**是合格的文书素材，同时不是合格的 pack 素材**——两条判据各自成立，不互相覆盖。

当前条数、缺口三分类与 pack 门槛：跑 `../derive-demo.sh` 现算。**不写在这里** —— 写下来就要靠改写维持为真。

判定与采集方式（访谈式、批量问、可跳过已知项）归
[#10 文书的双模式与素材门槛怎么共存](https://github.com/jiangxidong/EduApplication/issues/10)。
本票（#4）只定素材落在哪、以什么结构落。
