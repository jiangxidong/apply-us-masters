# 推荐人（🔴 红线区，`synthetic: true`）

> **AI 在本文件里只做两件事：整理素材、记录状态。**
> 不代填推荐人邮箱、不代提交、不代勾选导入、不以推荐人名义发任何邮件。

## 候选人

| id | 姓名（虚构） | 关系 | 已确认愿意写 | 联系方式在手 |
|---|---|---|---|---|
| r1 | 赵总监 | 现直属技术负责人 | ✅ 已确认 | 是 |
| r2 | 孙同学 | 同一开源项目的另一位维护者 | ✅ 已确认 | 是 |

**「推荐人能否证实这条主张？」是一道机械闸口，不是一句提醒。**

## 🔴 提交前人工确认闸口

- [x] r1 已确认
- [x] r2 已确认

## 逐校机制状态

| 项目 | 机制 | 风险类型 | 需要几封 | AI 停手在哪 |
|---|---|---|---|---|
| `columbia--seas--cs-ms` | 系统 → 推荐人，**填入即可能已发** | A 冒名发信 | 3 | 不填 `referee_*_email`；禁 Interfolio |
| `cornell--gradschool--cs-meng` | 系统 → 推荐人；接受 Interfolio | A 冒名发信 | 2 | 不填邮箱；`reference_delivery_method` 不代选 |
| `uiuc--gradcollege--mcs` | 系统 → 推荐人；**可导入旧申请的信** | **B 冒名复用** | 待核实 | 不填邮箱；不代勾 `reference_import_previous`；不代勾 `ferpa_waiver_checkbox` |

## 主张 → 推荐人分配

| recommender_id | claim_id |
|---|---|
| r1 | c01 |
| r2 | c03 |
| r1 | c04 |

**本表的定义域**：**全部主张，`voice` 不设闸**。`c04` 是 `voice=referee`，分给 r1（有 `m02` 支撑，通过 pack 门槛），
不进 P3 自己的 canonical 文书，但可以进 support pack。

## 起草授权声明

> 🔴 **本块是 `recommenders/drafts/<recommender_id>.md`（C 档推荐信草稿）的唯一前提。**

| recommender_id | 授权日期 |
|---|---|

🔴 **空表是当前的正确状态，不是漏填。** 本档案诊断目标止于 **B 档（support pack）**——
r1/r2 均已确认愿意写，但均**未**给出起草授权，`recommenders/drafts/` 因此不存在
（[#14](https://github.com/jiangxidong/EduApplication/issues/14) E2）。

## 提交事实

| recommender_id | program_key | 提交日期 |
|---|---|---|

**空表是当前的正确状态**：本季尚无任何一次提交。

## AI 停手字段清单（全局）

`referee_*_email` / `referee_details` / `reference_import_previous` / `ferpa_waiver_checkbox` /
`reference_delivery_method` / `publication_verifier_email`

## 两个必须容忍的合法例外（否则会误判）

1. **Cornell + Interfolio**：官方指引就是把 Interfolio 生成的 custom document e-mail address
   填进推荐人邮箱栏。一律当真人邮箱拦截会在合法路径上误判。
2. **Cornell 占位值**：在读生只需 1 封，官方指引在第 2 位推荐人处 `enter a "filler"`（本档案已工作、非在读生，此处仅做纪律记录）。
