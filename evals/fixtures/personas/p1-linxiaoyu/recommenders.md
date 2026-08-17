# 推荐人（🔴 红线区，`synthetic: true`）

> **AI 在本文件里只做两件事：整理素材、记录状态。**
> 不代填推荐人邮箱、不代提交、不代勾选导入、不以推荐人名义发任何邮件。

## 候选人

| id | 姓名（虚构） | 关系 | 已确认愿意写 | 联系方式在手 |
|---|---|---|---|---|
| r1 | 王教授 | 本科毕设导师 | ❌ 未确认 | 是 |
| r2 | 陈 leader | 现直属主管 | ✅ **已确认** | 是 |
| r3 | 李老师 | 交换期间授课教师 | ❌ 未确认 | 否 |

**「推荐人能否证实这条主张？」是一道机械闸口，不是一句提醒。**
判定本体是素材 frontmatter 的 `verifiable_by`；闸口是 `pack 门槛`（两条合取：**(a)** 他本人能证实、**(b)** 可进 pack）。

🔴 **本表不设「能证实什么」列**——它是素材 `verifiable_by` 的反向投影，源在素材侧 ⇒ 镜像。

## 🔴 提交前人工确认闸口

> **必须由申请人本人向推荐人确认其愿意写，并在此打勾，agent 才允许进入任何涉及推荐人邮箱的步骤。**

- [ ] r1 已确认
- [x] r2 已确认
- [ ] r3 已确认

**闸口未全部打勾 → 三校推荐信流程一律阻塞。**

## 逐校机制状态

| 项目 | 机制 | 风险类型 | 需要几封 | AI 停手在哪 |
|---|---|---|---|---|
| `columbia--seas--cs-ms` | 系统 → 推荐人，**填入即可能已发** | A 冒名发信 | 3 | 不填 `referee_*_email`；禁 Interfolio |
| `cornell--gradschool--cs-meng` | 系统 → 推荐人；接受 Interfolio | A 冒名发信 | 在读生 1 封，第 2 位官方允许填 `filler` | 不填邮箱；`reference_delivery_method` 不代选 |
| `uiuc--gradcollege--mcs` | 系统 → 推荐人；**可导入旧申请的信** | **B 冒名复用** | 待核实 | 不填邮箱；不代勾 `reference_import_previous`；不代勾 `ferpa_waiver_checkbox` |

## 主张 → 推荐人分配

**只有两列，两列都是主键**：`recommender_id` 引本文件的候选人表，`claim_id` 引 `claims.md`。

🔒 **不存第三列。** 断言原文在 `claims.md`、支撑素材在它的 `materials` 列、
「这条分配过不过得了 pack 门槛」是纯派生——任何一样写进本表都是镜像。

| recommender_id | claim_id |
|---|---|
| r2 | c01 |
| r1 | c03 |
| r3 | c03 |

**本表的定义域**：**全部主张，`voice` 不设闸**。`referee` 禁的是「申请人自述」，不禁止推荐人佐证任何一条。

**没有行的那几条，理由各不相同、都不是定义域**：

- **零素材的主张分配不出去**（`c04`：`voice=referee` 且 `materials` 为空，双重缺口，见 `claims.md`）。
- **有一条主张门槛全过却没有行**——分配是**判断**，机械可行 ≠ 用户就该这么分。

## 起草授权声明

> 🔴 **本块是 `recommenders/drafts/<recommender_id>.md`（C 档推荐信草稿）的唯一前提。**
> 两道闸都拿本块当前提：**写入闸**（创建 `recommenders/drafts/<recommender_id>.md` 前必须先读到授权声明）+
> **存在性闸**（目录存在但声明缺 → 报错）。

**每推荐人一行，性质是事实，必须带日期**——取得授权那天，不是写进本文件那天。

| recommender_id | 授权日期 |
|---|---|
| r2 | 2026-08-16 |

**顺序上说得通**：r2 是候选人表里唯一「已确认愿意写」的一位（提交前人工确认闸口 r2 已打勾），
本档案诊断目标是完整 happy path，因此在 r2 这一行走完了「愿意写 → 起草授权」两步。
r1 / r3 尚未确认愿意写，本表因此不给他们造一行——**不要在这里伪造一条授权来把表填满**。

## 提交事实

> 记录**已经发生的提交**，粒度是每（推荐人 × 项目），性质是事实、带日期。

| recommender_id | program_key | 提交日期 |
|---|---|---|

**空表是当前的正确状态**：三所项目均未进入 `submitted` 状态，谈不上任何一次提交。

## AI 停手字段清单（全局）

`referee_*_email` / `referee_details` / `reference_import_previous` / `ferpa_waiver_checkbox` /
`reference_delivery_method` / `publication_verifier_email`

## 两个必须容忍的合法例外（否则会误判）

1. **Cornell + Interfolio**：官方指引就是把 Interfolio 生成的 custom document e-mail address
   填进推荐人邮箱栏。一律当真人邮箱拦截会在合法路径上误判。
2. **Cornell 占位值**：在读生只需 1 封，官方指引在第 2 位推荐人处 `enter a "filler"`。

## `recommenders/drafts/` 什么时候才该存在

**没有推荐人本人的起草授权声明，这个目录就不该存在。** 本档案 r2 已有授权声明，
`recommenders/drafts/r2.md` 因此合法存在（契约见 `prototype/state-layer` 分支 `CONTRACT.md` §1.1 第 12 行）。
