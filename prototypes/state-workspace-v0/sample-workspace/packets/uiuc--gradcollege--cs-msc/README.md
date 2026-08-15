---
program_key: uiuc--gradcollege--cs-msc
channel_key: uiuc--gradcollege
season: 2027fall
generated: 2026-08-15
---

# 提交动线 — UIUC MS in Computer Science

> 🔴 **这一层可再生**，规则同 Cornell 包的开头。**本文件里不允许出现任何别处没有的事实**（#23 §11.2）；
> 渲染时缺一条约束**不能就地补在这里**（#23 §11.3）。跑 `../../trace-packet.sh` 机械检查。

> **本包停在提交前。**

状态标记同 Cornell 包：🟢 可直接粘贴 / 🛑 交还控制权 / ⬜ 缺 / ⛔ 本校明令不收。

---

## 0. 冻结点 —— 🔴 与 Cornell 语义相反

- **先提交，后付费；逾期未付 → 退回未提交状态**
  ← `channels/uiuc--gradcollege.md § 冻结点`（`✓ https://grad.illinois.edu/admissions/apply`）

所以本校的「提交」不是终点 —— **付款逾期会把你打回未提交**。
两校冻结点相反，是「提交前最后检查」必须逐校生成、不能写一套通用流程的直接证据。

---

## 1. 平台与账号 🛑

- 平台 = Slate（Technolutions） ← `channels/uiuc--gradcollege.md § 平台与账号`（`✓`）
- ⚠️ 与 Columbia SEAS 同为 Slate 但字段结构迥异 —— **不存在「Slate 适配层」** ← 同上
- 注册表字段 ⬜ `待核实`（登录墙后）

**🛑 注册 / 登录由你本人完成**（停手线动作类第 1 条）。

---

## 2. Program 🟢

| portal 上的字段 | 你填什么 | 来源 |
|---|---|---|
| `Primary Program` | MS in Computer Science | ← `programs.md:uiuc--gradcollege--cs-msc` |
| `Secondary Program` | —（本季只申一个） | ← 用户决定，`programs.md` 无第二行 UIUC |

---

## 3. Transcripts 🟢 ⬜ —— 🔴 规格与 Cornell 物理互斥

**该校规格**（← `channels/uiuc--gradcollege.md § 材料上传`）：

- 扫描 `at the lowest resolution that results in a legible document`，**建议 <200 dpi**；灰度或黑白最佳 `✓`
- 格式 **PDF 或 Word** `✓`（canonical 仍存 PDF 更安全）
- 单文件大小上限 ⬜ `待核实`（未公开）
- 🔴 **文件内容须含申请人姓名与院校名** —— 是对**文件本身**的要求，不是文件名 `✓`

| 要交的东西 | 从 canonical 怎么来 | 状态 |
|---|---|---|
| 本科成绩单 | `documents/transcript/<institution_id>/page-NN.pdf` → **降采样到 <200dpi 灰度** | ⬜ 缺（目录为空；`institution_id` 无定义处，见文末） |
| 交换成绩单 | 同上 | ⬜ 缺 |
| **评分说明 / grading legend** | `documents/legend/<institution_id>.pdf`，**逐院校一份** | ⬜ 缺 ← `profile.md § 待补充的 canonical 事实` 第 1 项 |
| 学位证 | `documents/degree/<institution_id>.pdf` | ⬜ 条件必填（成绩单未载明学位时） |
| 翻译件 | `documents/translation/<institution_id>/` | ⬜ 缺 |

🔴 **同一份 canonical，这里降采样、Cornell 合并保清晰 —— 一份成品不可能同时满足两校。**
这就是 `packets/` 只放渲染物、真相留在 `documents/` 的全部理由。

---

## 4. Statements 🟢 ⬜ —— 形态与 Cornell 完全不同

**该校规格**（← `channels/uiuc--gradcollege.md § 文书规格`，`✓`）：

- **Academic Statement**：500–1000 词，具体字数由项目定 → ⬜ 本项目字数 `待核实`
  ← `channels/ § 项目级差异 → uiuc--gradcollege--cs-msc`
- **Personal Statement**：**不是一篇文章**，是 **4 道短答题 × 每题 250 词（2 必答 + 2 选答）**
  → ⬜ 哪 2 道必答 `待核实` ← 同上

| portal 字段 | 交什么 | 状态 |
|---|---|---|
| `academic_statement` | `essays/academic-statement.md` | 🟢 已渲染（源 `essays/canonical/long.md` v1 裁到 1000 词内）⚠️ 上限待项目确认 |
| `personal_statement` Q1 | `essays/personal-statement-q1.md` | 🟢 已渲染（源 `points.md` P1） |
| `personal_statement` Q2 | `essays/personal-statement-q2.md` | 🟢 已渲染（源 `points.md` P2） |
| `personal_statement` Q3 | — | ⬜ 缺（`points.md` P3 待补 —— 素材不足） |
| `personal_statement` Q4 | — | ⬜ 缺（`points.md` P4 待补） |

🔴 **P3 / P4 空着不是文件缺失，是素材门槛未达标的正常体现。**
但本校 2 题选答 —— 只有查清「哪 2 道必答」才知道 Q3/Q4 的空是否致命。这条 `待核实` 优先级最高。

⚠️ `essays/canonical/per-program/uiuc--gradcollege--cs-msc.md` 不存在 → why 段**警告放行**，不报错（#18）。

---

## 5. Resume 🟢 —— 🔴 与 Cornell 正好相反

| portal 字段 | 交什么 | 状态 |
|---|---|---|
| `cv_upload` | `documents/cv/` | ⬜ 缺（目录为空）。条件必填（多数项目要）← `#6 字段表 cv_upload` |

**Cornell 那边是 ⛔ 明令不收**（含简历）。同一个槽位，两校一个必交一个禁交。

---

## 6. References 🛑 —— 风险 B：冒名复用

**该校机制**（← `channels/uiuc--gradcollege.md § 推荐信机制`）：

- 系统 → 推荐人；**推荐人信息必须在提交前填妥**，但不必等信到齐 `✓`
- 需要几封 ⬜ `待核实`（`#6` 字段表记「多数项目 3 封」）

**🛑 停手字段**：

| portal 字段 | 为什么停手 |
|---|---|
| `referee_details` / `referee_*_email` | 停手线动作类第 6 条 |
| 🔴 `reference_import_previous` | **允许一键导入旧申请的推荐信，且导入后推荐人收不到任何通知**。官方硬性要求 `you must obtain explicit permission from the letter writer` `✓`。这是「只拦发信动作」的防护完全漏掉的一类风险 |
| `ferpa_waiver_checkbox` | 改动代价高，不代勾 |

🔴 **风险 B 是告知义务，不是闸口**（← [#12](https://github.com/jiangxidong/EduApplication/issues/12)）：
一键导入是官方合法功能，产品**不拦**，但必须告诉你「导入前你得先亲自拿到推荐人许可，因为他不会收到通知」。

⬜ **R1 / R2 / R3 当前都是「未确认」** ← `recommenders.md § 提交前人工确认闸口` → 本段阻塞。

---

## 7. Test Scores 🟢

| portal 字段 | 你填什么 | 来源 |
|---|---|---|
| `test_scores_self_reported` | TOEFL iBT 102 / R28 L27 S22 W25 / 2026-05-16 | ← `profile.md § 英语` |
| GRE | 未考 | ← `profile.md § GRE`。⬜ 本项目是否要求 `待核实` |

⚠️ 本校是**自报分数**，与 Columbia 同 —— 自报值必须与官方送分一致，写错等于虚假陈述。

---

## 8. Citizenship 🛑 —— 敏感文件上传

| portal 字段 | 状态 |
|---|---|
| `us_status_document_upload`（绿卡 / 庇护 / 难民 / 假释） | **不适用** —— `profile.md:citizenship = CN`，无美国身份 |

**🛑 若将来适用**：这是 `documents/identity/` 槽位，**唯一禁读区**。
agent 只做存在性与规格检查（`ls` / `stat` / `file` / `pdfinfo`），**绝不打开内容**；
上传动作是停手线动作类第 2 条，由你本人做。

---

## 9. Submission 🛑 —— agent 到此为止

| portal 字段 | 为什么停手 |
|---|---|
| `application_fee_payment` | 停手线动作类第 4 条。⬜ 金额 `待核实`；**本校有多种免申请费路径** ← `channels/ § 费用与资格` |
| `application_fee_waiver` | 需你本人陈述资格 |
| **点提交** | 停手线动作类第 5 条 |

⚠️ 本校**提交后仍要付费**，逾期退回未提交 —— 提交不等于完事，把付款期限记进你自己的日历。

---

## 本次渲染发现的缺口（🔴 必须回 `channels/`）

| 缺的约束 | 该落哪个节 | 该节 owner | 出处 |
|---|---|---|---|
| 上传后须用 `view document` 自检可读性 | `## 材料上传` | 材料 | #6 `upload_legibility_self_check` |
| 推荐人条目可 Add / exclude / Reinstate | `## 推荐信机制` | 推荐信 | #6 `reference_edit_controls` |
| 需要几封推荐信（多数项目 3 封） | `## 推荐信机制` | 推荐信 | #6 `referee_details` |

`institution_id` 无定义处的问题同 Cornell 包文末。
