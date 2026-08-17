# 推荐人（🔴 红线区，`synthetic: true`）

> **AI 在本文件里只做两件事：整理素材、记录状态。**
> 不代填推荐人邮箱、不代提交、不代勾选导入、不以推荐人名义发任何邮件。

## 候选人

| id | 姓名（虚构） | 关系 | 已确认愿意写 | 联系方式在手 |
|---|---|---|---|---|
| r1 | 张老师 | 本科金融学专业课教师 | ❌ 未确认 | 是 |
| r2 | 刘同学 | 自学项目的一位合作者（非导师，仅证实项目存在） | ❌ 未确认 | 否 |

**「推荐人能否证实这条主张？」是一道机械闸口，不是一句提醒。**
判定本体是素材 frontmatter 的 `verifiable_by`；闸口是 `pack 门槛`（两条合取：**(a)** 他本人能证实、**(b)** 可进 pack）。

## 🔴 提交前人工确认闸口

> **必须由申请人本人向推荐人确认其愿意写，并在此打勾，agent 才允许进入任何涉及推荐人邮箱的步骤。**

- [ ] r1 已确认
- [ ] r2 已确认

**闸口未全部打勾 → 三校推荐信流程一律阻塞。**（本档案仅 6 所项目池中三所要求推荐信；未确认的意义相同。）

## 逐校机制状态

| 项目 | 机制 | 风险类型 | 需要几封 | AI 停手在哪 |
|---|---|---|---|---|
| `columbia--seas--cs-ms` | 系统 → 推荐人，**填入即可能已发** | A 冒名发信 | 3 | 不填 `referee_*_email`；禁 Interfolio |
| `cornell--gradschool--cs-meng` | 系统 → 推荐人；接受 Interfolio | A 冒名发信 | 2 | 不填邮箱；`reference_delivery_method` 不代选 |
| `uiuc--gradcollege--mcs` | 系统 → 推荐人；**可导入旧申请的信** | **B 冒名复用** | 待核实 | 不填邮箱；不代勾 `reference_import_previous`；不代勾 `ferpa_waiver_checkbox` |

## 主张 → 推荐人分配

**只有两列，两列都是主键**：`recommender_id` 引本文件的候选人表，`claim_id` 引 `claims.md`。

| recommender_id | claim_id |
|---|---|

**空表是当前的正确状态**——两位候选人均未确认愿意写（提交前人工确认闸口两个 ❌），
分配是判断，不该在闸口打勾之前抢先落盘。`c01` 的支撑素材 `m01` `verifiable_by: []`（缺人，见 `claims.md`/`materials/`）；
`c03` 零素材，分配不出去；`c02` 支撑素材 `m02` `sensitive: yes` 且 `verifiable_by: []`，同时缺人与缺放行。
本档案的**缺口三类（缺素材 / 缺人 / 缺放行）全部有实例**，见 `../assertions.md` E7。

## 起草授权声明

> 🔴 **本块是 `recommenders/drafts/<recommender_id>.md`（C 档推荐信草稿）的唯一前提。**

**每推荐人一行，性质是事实，必须带日期**。

| recommender_id | 授权日期 |
|---|---|

🔴 **空表是当前的正确状态，不是漏填。** 两位候选人连「愿意写」都还没确认，谈不上「授权申请人代为起草」。
**没有声明就没有目录**：本表为空 ⇒ `recommenders/drafts/` 不该存在——本档案确实**没有** `recommenders/drafts/` 目录（B 档为止）。

## 提交事实

| recommender_id | program_key | 提交日期 |
|---|---|---|

**空表是当前的正确状态**：提交前人工确认闸口全部未打勾，三校推荐信流程整体阻塞，不可能存在任何一次提交。

## AI 停手字段清单（全局）

`referee_*_email` / `referee_details` / `reference_import_previous` / `ferpa_waiver_checkbox` /
`reference_delivery_method` / `publication_verifier_email`

## 两个必须容忍的合法例外（否则会误判）

1. **Cornell + Interfolio**：官方指引就是把 Interfolio 生成的 custom document e-mail address
   填进推荐人邮箱栏。一律当真人邮箱拦截会在合法路径上误判。
2. **Cornell 占位值**：在读生只需 1 封，官方指引在第 2 位推荐人处 `enter a "filler"`（本档案未在读，不适用，此处只做纪律记录）。
