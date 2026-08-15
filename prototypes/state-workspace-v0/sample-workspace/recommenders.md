# 推荐人（🔴 红线区）

> **AI 在本文件里只做两件事：整理素材、记录状态。**
> 不代填推荐人邮箱、不代提交、不代勾选导入、不以推荐人名义发任何邮件。

## 候选人

| id | 姓名（虚构） | 关系 | 能证实什么 | 已确认愿意写 | 联系方式在手 |
|---|---|---|---|---|---|
| r1 | 王教授 | 本科毕设导师 | 素材 02 的学术表现；毕设全过程 | ❌ **未确认** | 是 |
| r2 | 陈 leader | 现直属主管 | 素材 01 的三问全过程与结果数字 | ❌ **未确认** | 是 |
| r3 | 李老师 | 交换期间授课教师 | 素材 02 的课堂表现 | ❌ **未确认** | 否 |

**「推荐人能否证实这条主张？」是一列，不是一句提醒。** 写不进这一列的主张，不要写进推荐信素材包。

## 🔴 提交前人工确认闸口

> **必须由申请人本人向推荐人确认其愿意写，并在此打勾，agent 才允许进入任何涉及推荐人邮箱的步骤。**

- [ ] r1 已确认
- [ ] r2 已确认
- [ ] r3 已确认

**闸口未全部打勾 → 三校推荐信流程一律阻塞。**（当前打勾数跑 `../derive-demo.sh` 现算，不写在这里。）
这与官方指引方向一致（UCL 反复强调 `contact your nominated referee(s) before starting your application`）。

## 逐校机制状态（三校三种机制，不能一刀切）

| 项目 | 机制 | 风险类型 | 需要几封 | AI 停手在哪 |
|---|---|---|---|---|
| `columbia--seas--cs-ms` | 系统 → 推荐人，**填入即可能已发** | A 冒名发信 | 3 | 不填 `referee_*_email`；禁 Interfolio |
| `cornell--gradschool--cs-meng` | 系统 → 推荐人；接受 Interfolio | A 冒名发信 | 在读生 1 封，第 2 位官方允许填 `filler` | 不填邮箱；**`reference_delivery_method` 选错不可逆，不代选** |
| `uiuc--gradcollege--cs-msc` | 系统 → 推荐人；**可导入旧申请的信** | **B 冒名复用** | 待核实 | 不填邮箱；**不代勾 `reference_import_previous`**；不代勾 `ferpa_waiver_checkbox` |

## 主张 → 推荐人分配

> **每（推荐人 × 主张）一行，性质是判断、不是事实。** 「r2 讲工作、r1 讲毕设」是一次手写的持久判断，
> 删了推导不回来——[#12](https://github.com/jiangxidong/EduApplication/issues/12) §4「发现 2」认定它是
> support pack 里**唯一不可再生**的那一样。

**只有两列，两列都是主键**：`recommender_id` 引本文件的候选人表，`claim_id` 引 `claims.md`。

🔒 **不存第三列。** 断言原文在 `claims.md`、支撑素材在它的 `materials` 列、
「这条分配过不过得了 pack 门槛」是纯派生（#12 §7）——任何一样写进本表都是镜像，
撞 [ADR 0006](https://github.com/jiangxidong/EduApplication/blob/main/docs/adr/0006-claims-are-one-shared-truth-source.md)
与 [#30](https://github.com/jiangxidong/EduApplication/issues/30) 的通则「一条关系边只存在它那个已经落盘的消费端，两端都不存」。
**行的存在本身就是那个判断**，没有别的东西要存。

> 顺带的好处：本块因此**不依赖** [#49](https://github.com/jiangxidong/EduApplication/issues/49)
> 怎么判「能证实什么」那一列是不是镜像——两个取值都不改本表的形状。

| recommender_id | claim_id |
|---|---|
| r2 | c01 |

**为什么当前只有一行**（各条主张的素材与 `voice` 取值一律跑 `../derive-demo.sh` 现算，不复述在这里）：

- **零素材的主张分配不出去。** #12 §7 的 pack 门槛要求「分配给某位推荐人的每条主张，至少有一条他本人能证实
  且可进 pack 的素材」，零素材当场判不过。样例里那条 `voice = referee` 的主张正卡在这里——
  它是**唯一一条必须由推荐人说的主张**，而它恰恰分配不出去，`claims.md` 已把这记为**双重缺口**。
- 其余落在下面这个还没判的问题上。

🔴 **r1 与 r3 一行都没有，这是「待裁决」，不是「没有东西可以分给他们」**
→ [#52 「分配」的定义域没定：voice=self 的主张能不能分给推荐人](https://github.com/jiangxidong/EduApplication/issues/52)。
`voice` 若是硬闸，`voice = self` 的主张进不了任何 pack；若只是侧重提示，那两位推荐人就该有行。
两种读法都自洽，而**只写「两种读法下都成立的那一行」并不中立**——空行读起来就是前一种读法的结论。
**#52 判完回填本块。**

### pack 门槛与覆盖缺口现在算不出来（本票不就地补）

#12 §7 + [#17](https://github.com/jiangxidong/EduApplication/issues/17) 的 pack 门槛是**两条合取**：
**(a)** 他本人能证实，且 **(b)** 可进 pack（素材 `敏感 = no`，或 `敏感 = yes` 但用户已逐条放行）。

- **(b) 现在就能机械判**：`materials/*.md` 的 frontmatter 有 `敏感` 键。
- 🔴 **(a) 现在判不了**：可验证性只活在素材**正文的散文**里（`谁能证实：直属 leader（也是推荐人候选 R2）`）。
  [#38](https://github.com/jiangxidong/EduApplication/issues/38) 已裁定把它升成 frontmatter 的
  `verifiable_by`（`recommender_id` 列表），但**那一步还没落到本分支** →
  [#48](https://github.com/jiangxidong/EduApplication/issues/48)。
- #12 §10 的**覆盖缺口视图**（哪些主张没有任何候选推荐人能证实）依赖同一个字段，**一并算不出来**。

→ 缺的就是 `verifiable_by`。**不就地扩 `derive-demo.sh`**：#48 的清单里已经有「加字段完整性检查
（三键齐全 + `verifiable_by` 空态可现算成「缺人」缺口）」这一项，pack 门槛与覆盖缺口跟它一起加，
两个派生视图共用同一个字段，分两次加必然分叉。

## 起草授权声明

> 🔴 **本块是 `recommenders/drafts/<recommender_id>.md`（C 档推荐信草稿）的唯一前提。**
> 机制见文末「`recommenders/drafts/` 什么时候才该存在」——写入闸与存在性闸两道都拿本块当前提。

**每推荐人一行，性质是事实，必须带日期**（#12 §4）。日期是**取得授权那天**，不是写进本文件那天。
一行 = 一份已经取得的、来自推荐人本人的起草授权；行的存在与它的日期就是那条事实的全部。

| recommender_id | 授权日期 |
|---|---|

🔴 **空表是当前的正确状态，不是漏填。**

**没有声明就没有目录**：本表为空 ⇒ `recommenders/drafts/` 不该存在。
反过来，目录存在而本表里没有对应行 ⇒ 报错（存在性闸）。**目录的缺席本身是信息**，别当成漏填去补齐。

顺序上也轮不到它：授权在**提交前人工确认闸口之后**——三位候选人连「愿意写」都还没确认（闸口三个 ❌），
谈不上「授权申请人代为起草」。**不要在这里伪造一条授权来把表填满。**

## 提交事实

> 记录**已经发生的提交**，粒度是每（推荐人 × 项目），性质是事实、带日期（#12 §4）。
> 与地图 **Out of scope** 的「提交及其之后」**不冲突**：那条排除的是 **AI 的动作**
> （点提交、付申请费、代替用户登录、以推荐人名义发邀请），本块只是**记下用户自己已经做完的事**。

🔒 **只记「已提交」，不记「还差几封」**——[#4](https://github.com/jiangxidong/EduApplication/issues/4) 的判别式：
「r1 已于 2026-10-01 向 `columbia--seas--cs-ms` 提交」为保持为真**不需被改写** → 事实，落盘；
「还差 2 封」需被改写 → 镜像，**派生，不落盘**。

| recommender_id | program_key | 提交日期 |
|---|---|---|

🔴 **空表是当前的正确状态**：提交前人工确认闸口三个 ❌，三校推荐信流程整体阻塞，
不可能存在任何一次提交。

## AI 停手字段清单（全局）

`referee_*_email` / `referee_details` / `reference_import_previous` / `ferpa_waiver_checkbox` /
`reference_delivery_method` / `publication_verifier_email`

⚠️ 最后一个极易被漏：Columbia 的 Publications 项要求填**一位可证实参与的教授邮箱**——
这是同一份申请里的**第二个第三方邮箱字段**。

## 两个必须容忍的合法例外（否则会误判）

1. **Cornell + Interfolio**：官方指引就是把 Interfolio 生成的 custom document e-mail address
   填进推荐人邮箱栏。一律当真人邮箱拦截会在合法路径上误判。
2. **Cornell 占位值**：在读生只需 1 封，官方指引在第 2 位推荐人处 `enter a "filler"`。

## `recommenders/drafts/` 什么时候才该存在

`CONTRACT.md` §1.1 第 12 行的 `recommenders/drafts/<recommender_id>.md`（C 档推荐信草稿）
**受门控，不是默认存在的目录**：

> **没有推荐人本人的起草授权声明，这个目录就不该存在。**

授权声明落在本文件的「起草授权声明」块（**按名引用，不按序号**——序号会漂），两道闸都拿它当前提：

- **写入闸**（准备包阶段）：创建 `recommenders/drafts/<recommender_id>.md` 前，
  必须先读到该推荐人的授权声明；读不到就创建不了。
- **存在性闸**（入口阶段 / [#15](https://github.com/jiangxidong/EduApplication/issues/15)）：
  目录存在但本文件无对应授权声明 → **报错**。目录缺席时这道闸静默通过，是正确行为。

只做写入闸不够——它被设计成**文件系统层面物理可查**，只归 owner 自查就退回成「相信写它的人」。
**目录的缺席本身是信息**（还没有人授权起草），别当成漏填去补齐。

支持深度（support pack 还是草稿、中国场景下教授让学生自己起草怎么办、多封信如何差异化）
→ [#12 推荐信在 v1 里做到什么程度](https://github.com/jiangxidong/EduApplication/issues/12)。
