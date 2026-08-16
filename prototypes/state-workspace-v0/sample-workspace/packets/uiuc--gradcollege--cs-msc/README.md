---
program_key: uiuc--gradcollege--cs-msc
channel_key: uiuc--gradcollege
season: 2027fall
generated: 2026-08-15
source_fingerprint:
  apply.md: 1922655607-2813
  profile.md: 3301469396-2623
  programs.md: 3219980832-2660
  claims.md: 2294360780-5454
  recommenders.md: 3627732816-11901
  essays/canonical/long.md: 1603118701-364
  essays/canonical/points.md: 470119277-1264
  channels/uiuc--gradcollege.md: 669103378-18146
---

# 提交动线 — UIUC Master of Computer Science (MCS, Urbana-Champaign)

> 🔴 **整包重生成，绝不就地改**；`source_fingerprint` 是生成那一刻的源快照，进入准备包阶段先比对。
> 规则与 Cornell 包开头逐字相同。

> 🔴 **读法**：**本包只渲染本季（2027fall）已取证的约束。** 凡真相源里尚未取证的，在包里一律以 **⬜** 出现。
> 包里不出现 `✓`，也不出现「待核实」这四个字。每条学校约束带 `←` 指针；
> 渲染时缺一条约束不能就地补在这里（#23 §11.3）。跑 `../../trace-packet.sh` 机械检查。

> ⚠️ 上面 frontmatter 的 `season` 是**标签，不是判据**（`CONTRACT.md` §4）。判据是各真相源
> frontmatter 里 `season_downgraded` 的行与 `apply.md` 的 `season` 之差 —— 见文末「本季待复核」。

> **本包停在提交前。**

## 怎么用

电脑上左右并排：左边 portal，右边本文件，从上往下走。
标记：🟢 可直接粘贴 / 🛑 交还控制权 / ⬜ 缺 / ⛔ 本校明令不收。

## 🛑 本包的交还点（共 4 处）

| 段 | 为什么交还 | 不可逆？ |
|---|---|---|
| **1. 平台与账号** | 停手线动作类 ①「替用户登录」 | 否 |
| **6. References** | 停手线动作类 ⑥；🔴 含 `reference_import_previous` | 🔴 **是** |
| **8. Citizenship** | 停手线动作类 ②「上传敏感文件」（`documents/identity/` 禁读区） | 否（本季不适用） |
| **9. Submission** | 停手线动作类 ④⑤ | 部分——本校先提交后付费 |

🔴 **第 6 段在 portal 上排第 6，但它是本包唯一真正不可逆的一段**，时间上必须最先想清楚。

---

## 0. 冻结点 —— 🔴 与 Cornell 语义相反

- **先提交，后付费；逾期未付 → 退回未提交状态**
  ← `channels/uiuc--gradcollege.md § 冻结点`

本校的「提交」不是终点——**付款逾期会把你打回未提交**。
两校冻结点相反，是「提交前最后检查」必须逐校生成、不能写一套通用流程的直接证据。

---

## 1. 平台与账号 🛑

- 平台 = Slate（Technolutions） ← `channels/uiuc--gradcollege.md § 平台与账号`
- ⚠️ 与 Columbia SEAS 同为 Slate 但字段结构迥异 —— **不存在「Slate 适配层」** ← 同上
- ⬜ 注册表字段（登录墙后）

**🛑 注册 / 登录由你本人完成。**

---

## 2. Program 🟢

| portal 上的字段 | 你填什么 | 来源 |
|---|---|---|
| `Primary Program` | Master of Computer Science (MCS, Urbana-Champaign) | ← `programs.md:uiuc--gradcollege--cs-msc` |
| `Secondary Program` | —（本季只申一个） | ← `programs.md` 无第二行 UIUC |

🔴 **别写成 `MS in Computer Science`**：在 UIUC 那是 Thesis / Research 皆 Yes 的研究型硕士，
与本行是**两个不同的项目**（#55）。`program_key` 里的 `cs-msc` 是 Master of **C**omputer **S**cience 的 slug。

---

## 3. Transcripts 🟢 ⬜ —— 规格与 Cornell 方向相反（但不互斥）

**该校规格** ← `channels/uiuc--gradcollege.md § 材料上传`：

- 扫描 `at the lowest resolution that results in a legible document`，**建议 <200 dpi**；灰度或黑白最佳
- 格式 **PDF 或 Word**（canonical 仍存 PDF 更安全）
- ⬜ 单文件大小上限（未公开）
- 🔴 **文件内容须含申请人姓名与院校名** —— 是对**文件本身**的要求，不是文件名
- 🟢 **传完必须点 `view document` 自检可读性** —— 「传完就算完」在本校不成立。
  本校同时要求降到 <200dpi 灰度，正是最容易传出不可读件的那一档，自检不是可选步骤

| 要交的东西 | 从 canonical 怎么来 | 状态 |
|---|---|---|
| 本科成绩单 | `documents/transcript/<institution_id>/page-NN.pdf` → **降采样到 <200dpi 灰度** | ⬜ 目录为空 |
| 交换成绩单 | 同上 | ⬜ 同上 |
| **评分说明 / grading legend** | `documents/legend/<institution_id>.pdf`，**逐院校一份** | ⬜ ← `profile.md § 待补充的 canonical 事实` 第 1 项 |
| 学位证 | `documents/degree/<institution_id>.pdf` | ⬜ 条件必填（成绩单未载明学位时） |
| 翻译件 | `documents/translation/<institution_id>/` | ⬜ 目录为空 |

**同一份 canonical，这里降采样、Cornell 合并保清晰。**
⚠️ 这两条**并不互斥**（[#14](https://github.com/jiangxidong/EduApplication/issues/14) 更正）——
一份合并的灰度低分辨率 PDF 两校都收。canonical 存高分辨率彩色逐页单文件的理由是
**降级可逆、升级不可逆**，不是「一份成品满足不了两校」。
第 5 段那一对（Cornell 默认禁简历 vs UIUC 默认要简历）是**默认值相反**，也不是互斥——两边都带条件。

---

## 4. Statements 🟢 ⬜ —— 形态与 Cornell 完全不同

**该校规格** ← `channels/uiuc--gradcollege.md § 文书规格`：

- **Academic Statement**：500–1000 词，具体字数由项目定 → ⬜ 本项目字数
  ← `channels/uiuc--gradcollege.md § 项目级差异`
- **Personal Statement**：**不是一篇文章**，是 **4 道短答题 × 每题 250 词（2 必答 + 2 选答）**
  → ⬜ 哪 2 道必答 ← 同上

`essays/canonical/points.md` 的**一个 `##` = 一类短答题**，节标题是自由文本、不是封闭词表，
所以下表按**节标题**对位，不按编号——`P1`…`P4` 这套编号在 `points.md` 里已经不存在（#32）。

| portal 字段 | 交什么 | 状态 |
|---|---|---|
| `academic_statement` | `essays/academic-statement.md` | 🟢 已渲染（源 `essays/canonical/long.md` v1 裁到 1000 词内）⚠️ 上限待项目确认 |
| `personal_statement` 短答题 A | `essays/personal-statement-q1.md` | 🟢 已渲染（源 `points.md § 为什么读这个学位`） |
| `personal_statement` 短答题 B | `essays/personal-statement-q2.md` | 🟢 已渲染（源 `points.md § 个人背景 / 逆境`） |
| `personal_statement` 短答题 C | — | ⬜ `points.md § 多样性 / 贡献` 是空节 |
| `personal_statement` 短答题 D | — | ⬜ `points.md § 职业目标` 是空节 |

🔴 **两个空节不是文件缺失，是素材门槛未达标的正常体现。**
但本校 2 题选答——只有查清「哪 2 道必答」才知道这两个空是否致命。这条 ⬜ 优先级最高。
⚠️ 哪几节空着、缺的是什么，跑 `../../derive-demo.sh` 现算，本包不写计数。

⚠️ `essays/canonical/per-program/uiuc--gradcollege--cs-msc.md` 不存在 → why 段**警告放行**，不报错（#18）。

---

## 5. Resume 🟢 ⬜ —— 🔴 与 Cornell 正好相反

| portal 字段 | 交什么 | 状态 |
|---|---|---|
| `cv_upload` | `documents/cv/` | ⬜ 目录为空。**条件必填（多数项目要）** ← `channels/uiuc--gradcollege.md § 材料上传` |

**Cornell 那边是 ⛔ 明令不收**（含简历）。同一个槽位，两校一个必交一个禁交。
⚠️ 两边都带条件，**不要把它说成「互斥」**——正当性锚在**降级不可逆**，不锚在互斥断言。
默认值相反的那条记录只有一份，在 `channels/cornell--gradschool.md § 材料上传`，本包不复述。

---

## 6. References 🛑 —— 🔴 风险 B：冒名复用

**该校机制** ← `channels/uiuc--gradcollege.md § 推荐信机制`：

- 系统 → 推荐人；**推荐人信息必须在提交前填妥**，但不必等信到齐
- 大学层给的是「多数项目 3 封」，**具体几封由项目定** → ⬜ 本项目需要几封
  ← `channels/uiuc--gradcollege.md § 项目级差异`
- 🔴 **推荐人条目可增 / 可排除 / 可恢复，但排除有窗口**：信**一旦提交就排不掉**；
  排除过的人可以在 References 页点他的名字再点灰色 `Reinstate` 恢复。
  → 「填错了大不了删掉」这个直觉在本校**只在信到齐之前成立**

**🛑 停手字段**：

| portal 字段 | 为什么停手 |
|---|---|
| `referee_details` / `referee_*_email` | 停手线动作类 ⑥ |
| 🔴 `reference_import_previous` | **允许一键导入旧申请的推荐信，且导入后推荐人收不到任何通知**。官方硬性要求 `you must obtain explicit permission from the letter writer`。这是「只拦发信动作」的防护完全漏掉的一类风险 |
| `ferpa_waiver_checkbox` | 改动代价高，不代勾 |

🔴 **风险 B 是告知义务，不是闸口**（← [#12](https://github.com/jiangxidong/EduApplication/issues/12)）：
一键导入是官方合法功能，产品**不拦**，但必须告诉你「导入前你得先亲自拿到推荐人许可，因为他不会收到通知」。

⬜ **r1 / r2 / r3 当前都是「未确认」** ← `recommenders.md § 提交前人工确认闸口` → 本段阻塞。

---

## 7. Test Scores 🟢 ⬜

| portal 字段 | 你填什么 | 来源 |
|---|---|---|
| `test_scores_self_reported` | TOEFL iBT 102 / R28 L27 S22 W25 / 2025-12-06 | ← `profile.md § 英语` |
| GRE | 未考 —— 🟢 **本项目不要求** | ← `profile.md § GRE` ＋ `channels/uiuc--gradcollege.md § 项目级差异` |

⚠️ 本校是**自报分数**——自报值必须与官方送分一致，写错等于虚假陈述。
⚠️ 考期 **2025-12-06** 在 2026-01-21 之前，这份成绩按 **0–120 旧量表**读；本校对 2026-01-20 之后的成绩
换 4.0/5.0 制。**量表由考试日期决定**，改考期就得同时改分数形态（← `profile.md § 英语`，#56）。

---

## 8. Citizenship 🛑 —— 敏感文件上传

| portal 字段 | 状态 |
|---|---|
| `us_status_document_upload`（绿卡 / 庇护 / 难民 / 假释） | **本季不适用** —— `profile.md:citizenship = CN` |

**🛑 若将来适用**：这是 `documents/identity/` 槽位，**唯一禁读区**。
agent 只做存在性与规格检查（`ls` / `stat` / `file` / `pdfinfo`），**绝不打开内容**；
上传动作是停手线动作类 ②，由你本人做。

---

## 9. Submission 🛑 —— agent 到此为止

| portal 字段 | 为什么停手 |
|---|---|
| `application_fee_payment` | 停手线动作类 ④。⬜ 金额；**本校有多种免申请费路径** ← `channels/uiuc--gradcollege.md § 费用与资格` |
| `application_fee_waiver` | 需你本人陈述资格 |
| **点提交** | 停手线动作类 ⑤ |

⚠️ 本校**提交后仍要付费**，逾期退回未提交——提交不等于完事，把付款期限记进你自己的日历。

---

## 本次渲染发现的缺口（🔴 已转缺口清单，不在本包里补）

| 缺的约束 | 该落哪个节 | 该节 owner | 出处 |
|---|---|---|---|

🔴 **空表是本次重生成的正确结果，不是漏填。** 上一版列的四条（`view document` 自检 / 推荐人
Add-exclude-Reinstate / 需要几封 / 简历条件必填）已由 [#39](https://github.com/jiangxidong/EduApplication/issues/39)
全部回填进 `channels/uiuc--gradcollege.md` 的 `## 材料上传` 与 `## 推荐信机制`，
本次渲染在包外没有再长出任何一条 `channels/` 里没有的约束。
（这张表每次整包重生成时重算，所以它不会陈旧——规则 ① 是它合法的唯一前提。）

`institution_id` 无定义处的问题同 Cornell 包文末。

## 本季待复核（🔴 与上面那张表不是一回事）

按 `CONTRACT.md` §4：某个 owner 的 `season_downgraded` 行**落后于** `apply.md` 的 `season` 时，
它那几节的证据是上一季取的，本包里由它供着的断言必须渲染成**带上季链接的 ⬜**——不是裸 ⬜，
更不是原样断言。缺口表答「`channels/` 少了什么」，本表答「`channels/` 有的东西过没过期」，两件事。

| 落后的 owner | 它在本包里供着哪几段 | 落后到哪一季 |
|---|---|---|

🔴 **空表是本次重生成的正确结果。** `channels/uiuc--gradcollege.md` 的五行与 `programs.md` 的一行
`season_downgraded` **全部是 2027fall**，与 `apply.md` 的 `season` 齐平，没有任何 owner 落后。
机械凭据：`../../trace-packet.sh` 第 [5] 项对这两个文件都不打 ⏳ 行。
