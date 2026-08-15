---
program_key: cornell--gradschool--cs-meng
channel_key: cornell--gradschool
season: 2027fall
generated: 2026-08-15
---

# 提交动线 — Cornell MEng in Computer Science

> 🔴 **这一层可再生。** 删掉整个 `packets/`，agent 能从 `profile.md` + `claims.md` + `essays/canonical/` +
> `documents/` + `channels/cornell--gradschool.md` 重建。
> **本文件里不允许出现任何别处没有的事实**（[#23](https://github.com/jiangxidong/EduApplication/issues/23) §11.2）。
> 每一条学校约束都带 `←` 指针指回真相源；渲染时发现缺一条约束，**不能就地补在这里**，
> 必须回 `channels/` 的对应节，那一节不归准备包阶段就转缺口清单（#23 §11.3）。
> 跑 `../../trace-packet.sh` 机械检查全部指针。

> **本包停在提交前。** 最后一段是「你自己点提交」，agent 不越过它。

## 怎么用

从上往下走，每段的标题带一个状态标记：

| 标记 | 含义 |
|---|---|
| 🟢 | **可直接粘贴** —— 答案已备好，左表右列抄进 portal |
| 🛑 | **交还控制权** —— 停手线字段。agent 只说该做什么，**不给可粘贴的值**，这一段由你亲手做 |
| ⬜ | **缺** —— 现在没有答案，括号里是缺的原因与下一步 |
| ⛔ | **本校明令不收** —— 别交，交了违规 |

⚠️ **这里不写「已完成 12/17」这类计数。** 那是镜像，靠改写才能维持为真（`CONTRACT.md` §1 判别式）。
空位就是 `⬜`，数一下就知道，跑 `../../derive-demo.sh` 也能现算。

---

## 0. 冻结点 —— 🔴 先读这一段再动手

- **付费 = 提交的最后一步；付费或提交 waiver 之后完全不能再改**
  ← `channels/cornell--gradschool.md § 冻结点`（`✓ https://gradschool.cornell.edu/admissions/apply/`）

**这一校没有「提交后再补」的窗口**，所以下面每一段的 `⬜` 都必须在走到第 7 段之前清掉。
（对照：UIUC 是先提交后付费，语义相反 —— 见 `packets/uiuc--gradcollege--cs-msc/README.md` 第 0 段。）

---

## 1. 平台与账号 🛑

- 平台 = ApplyWeb（CollegeNET） ← `channels/cornell--gradschool.md § 平台与账号`（`✓`）
- 注册表字段 ⬜ `待核实`（登录墙后，公开页拿不到） ← 同上

**🛑 交还控制权**：注册、建号、登录**全部由你本人完成**。停手线动作类第 1 条「替用户登录」。
建好号后回来继续第 2 段。

---

## 2. Program 🟢

| portal 上的字段 | 你填什么 | 来源 |
|---|---|---|
| `apply to major fields only` / Program | MEng in Computer Science (Ithaca) | ← `programs.md:cornell--gradschool--cs-meng` |

---

## 3. Transcripts 🟢 ⬜

**该校规格**（← `channels/cornell--gradschool.md § 材料上传`，全部 `✓`）：

- 同一份成绩单的多页**必须合并成一个文件**
- 格式 PDF / TIFF / JPEG / GIF，**不收 Word**
- 单文件 ≤ **10MB**
- 质量 `clear and easy to read`；加密件必须先打印再扫描
- 申请阶段传**非官方件**，官方件录取后才交
- 翻译件认证等级：**certified or notarized**

🔴 **含 SSN 的成绩单必须先涂黑再上传** ← `channels/` 该节未记此条，源在 #6 字段表 `ssn_redaction_rule`
→ **这是一条包里长出来的约束，必须回填 `channels/cornell--gradschool.md § 材料上传`**（见文末「本次渲染发现的缺口」）。

| 要交的东西 | 从 canonical 怎么来 | 状态 |
|---|---|---|
| 本科成绩单 | `documents/transcript/<institution_id>/page-NN.pdf` → **合并成一个 PDF**、保持清晰 | ⬜ 缺（`documents/transcript/` 为空；且 `profile.md` 的学历表没有 `institution_id` 列 —— 见文末） |
| 交换成绩单 | 同上，交换院校单独一份 | ⬜ 缺（同上） |
| 学位证 | `documents/degree/<institution_id>.pdf` | ⬜ 缺（条件必填：境外学历） |
| 翻译件 | `documents/translation/<institution_id>/`，需 certified 或 notarized | ⬜ 缺（`profile.md` 待补充清单第 2 项：翻译件是否已办） |

**降级方向**：canonical 是逐页高分辨率彩色，给这里**合并 + 保清晰**；给 UIUC 反向降到 <200dpi 灰度。
降级可逆，升级不可逆 —— 别反过来存。

---

## 4. Recommendations 🛑 —— 本包最早的交还点

> 🔴 **这一段在 portal 上排第 4，但在时间上必须最先想清楚。**
> 推荐信一旦发出去就收不回，而本校的冻结点在付费那一刻 —— 两个不可逆点，先撞上的是这个。

**该校机制**（← `channels/cornell--gradschool.md § 推荐信机制`）：

- 系统 → 推荐人（发含链接的在线表单） `✓`
- 触发时点 ⬜ `待核实`（官方页未写何时发信）→ **按「填入即已发信」的保守假设操作**
- 需要 **2–3 封**，按 field 定 ← `#6 字段表 referee_details`
- 接受 **Interfolio**（须 field 同意）；部分情况可选 By Mail `✓`

**🛑 以下字段 agent 一律不填、不代选，本包不给可粘贴的值**：

| portal 字段 | 为什么停手 |
|---|---|
| `referee_details` / `referee_1..3_email` | 停手线动作类第 6 条「以推荐人名义发邀请」——填入即可能触发发信 |
| `reference_delivery_method`（Interfolio / 在线 / By Mail） | 🔴 **选错不可逆** ← `channels/ § 推荐信机制` |
| `ferpa_waiver_checkbox` | 影响推荐人对保密性的预期，不代勾 |

**两个必须容忍的合法例外**（← `channels/cornell--gradschool.md § 推荐信机制`，`✓`）：

1. 用 Interfolio 时，官方指引就是把 **Interfolio 生成的 custom document e-mail address 填进推荐人邮箱栏**，
   取代推荐人本人邮箱。这是合法路径，别当成异常。
2. 在读生只需 1 封，官方指引在第 2 位推荐人处 `enter a "filler"`。占位内容是官方认可的。

**你现在要做的**：先向 R1 / R2 / R3 本人确认愿意写，回 `recommenders.md` 打勾。
⬜ **三人当前都是「未确认」** ← `recommenders.md § 提交前人工确认闸口`
→ 闸口未全部打勾，这一段不能动。

**给推荐人的 support pack**：每**推荐人**一份、跨项目复用，是派生视图，**不在本包里**
（← `CONTRACT.md` §2 与 §1 的不落盘清单）。

---

## 5. Statements 🟢 ⬜

**该校规格**（← `channels/cornell--gradschool.md § 文书规格`，`✓`）：
**两篇独立文书，不是一篇**。Academic Statement of Purpose 一到两页；Personal Statement 另一篇，分工不同。

| portal 字段 | 交什么 | 状态 |
|---|---|---|
| `statement_of_purpose` | `essays/academic-sop.md` | 🟢 已渲染（源 `essays/canonical/long.md` v1，裁到两页、去掉个人动机段） |
| `personal_statement` | `essays/personal-statement.md` | ⬜ 缺（源 `essays/canonical/points.md` 的 P2；P3/P4 待补，素材门槛未达标） |

⚠️ **why this program 段缺失 = 警告放行，不报错**（← [#18](https://github.com/jiangxidong/EduApplication/issues/18) 两级闸门）。
`essays/canonical/per-program/cornell--gradschool--cs-meng.md` 不存在。
本校的 portal 没有单独一问 —— 若要嵌进 SOP，拼接配方归 `channels/ § 文书规格`，**不进本包**（#18 §6 / #23 §11.1）。

---

## 6. 附加材料 ⛔ —— 本校明令不收

- `Publications, award certificates, resumes, theses, and similar materials` **除非 field 事先批准，否则不允许**
  ← `#6 字段表 extra_materials_prohibition`（`不允许`）
  → **这条也不在 `channels/` 里，必须回填**（见文末）

🔴 **连简历都不收。** 对照 UIUC：`cv_upload` 是条件必填。
同一份 `documents/cv/` 在这里一个字都不能交 —— 这就是「canonical + 逐校 rendering rules」而不是「逐校成品」的理由。

---

## 7. Test Scores 🟢 ⬜

| portal 字段 | 你填什么 | 来源 / 状态 |
|---|---|---|
| `english_test_report_upload` | TOEFL iBT 102（R28 L27 S22 W25，2026-05-16） | ← `profile.md § 英语`。⚠️ 口语 22，本校 speaking 下限 ⬜ `待核实` |
| `test_score_institution_code` | **2098**（送分时填） | ← `#6 字段表`。⬜ **不在 `channels/`，必须回填** |
| `gre_score` | — | ⬜ `待核实` GRE 是否要求 ← `channels/ § 项目级差异 → cornell--gradschool--cs-meng` |

---

## 8. Submission 🛑 —— agent 到此为止

| portal 字段 | 为什么停手 |
|---|---|
| `application_fee_payment` | 停手线动作类第 4 条「付申请费」 |
| `application_fee_waiver` | 需你本人陈述资格 ⬜ 金额与减免条件 `待核实` ← `channels/ § 费用与资格` |
| **点提交** | 停手线动作类第 5 条 |

🔴 **本校付费即冻结。** 走到这一步之前，把上面所有 `⬜` 清掉。

---

## 本次渲染发现的缺口（🔴 必须回 `channels/`，不能留在本包里）

按 #23 §11.3：准备包阶段渲染时发现缺一条约束，**不得就地补进 `packets/`**。以下四条已在上文标出，
其中三条归**材料阶段** owner 的 `## 材料上传`、一条归**选校阶段** owner 的 `## 费用与资格`
（← `CONTRACT.md` §1.2 归属表），准备包阶段无权写，**全部转缺口清单**：

| 缺的约束 | 该落哪个节 | 该节 owner | 出处 |
|---|---|---|---|
| 含 SSN 的成绩单须先涂黑 | `## 材料上传` | 材料 | #6 `ssn_redaction_rule` |
| 加密 / 密码保护文件禁止上传 | `## 材料上传` | 材料 | #6 `encrypted_file_prohibition` |
| 附加材料明令禁止（含简历） | `## 材料上传` | 材料 | #6 `extra_materials_prohibition` |
| 送分 institution code = 2098 | `## 费用与资格` | 选校 | #6 `test_score_institution_code` |

⚠️ 另有一条**不是缺口而是契约洞**：`documents/` 的路径要 `institution_id`，
而 `profile.md` 的学历表**没有这一列**（`CONTRACT.md` §1.1 说定义权在 `profile.md` 的学历条目）。
本包暂用 `<institution_id>` 占位，不自己发明值。
