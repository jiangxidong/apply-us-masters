---
program_key: cornell--gradschool--cs-meng
channel_key: cornell--gradschool
season: 2027fall
generated: 2026-08-15
source_fingerprint:
  apply.md: 776643646-1914
  profile.md: 2962069914-2208
  programs.md: 1431628522-1419
  recommenders.md: 3298438568-3030
  essays/canonical/long.md: 2890509704-773
  essays/canonical/points.md: 2498574752-952
  channels/cornell--gradschool.md: 1594302579-3829
---

# 提交动线 — Cornell MEng in Computer Science

> 🔴 **这一层整包重生成，绝不就地改。** 在本包里直接改内容，下次重生成时**静默丢失**。
> 要改内容改真相源（`essays/canonical/` / `profile.md` / `channels/`），然后重生成。
> 上面 `source_fingerprint` 记的是**生成那一刻源是什么样**（历史观察值，同 `log.md` 的豁免），
> 进入准备包阶段先比对：不一致 → 整包删了重生成；一致 → 直接用。

> 🔴 **读法**：**本包只渲染已取证的约束。** 凡真相源里尚未取证的，在包里一律以 **⬜** 出现。
> 包里不出现 `✓`，也不出现「待核实」这四个字——那两个词是真相源的词汇，转述进来就是镜像。
> 每条学校约束都带 `←` 指针指回真相源；渲染时缺一条约束**不能就地补在这里**，
> 必须回 `channels/` 的对应节，那一节不归准备包阶段就转缺口清单（#23 §11.3）。
> 跑 `../../trace-packet.sh` 机械检查。

> **本包停在提交前。** 最后一段是「你自己点提交」，agent 不越过它。

## 怎么用

电脑上左右并排：左边 portal，右边本文件，从上往下走。每段标题带一个状态标记：

| 标记 | 含义 |
|---|---|
| 🟢 | **可直接粘贴** —— 答案已备好 |
| 🛑 | **交还控制权** —— 停手线字段。agent 只说该做什么，**不给可粘贴的值** |
| ⬜ | **缺** —— 没有答案。括号里是缺的原因与下一步 |
| ⛔ | **本校明令不收** —— 别交，交了违规 |

⚠️ 这里不写「已完成 12/17」这类计数——那是镜像，靠改写才能维持为真（`CONTRACT.md` §1 判别式）。

## 🛑 本包的交还点（共 3 处）

| 段 | 为什么交还 | 不可逆？ |
|---|---|---|
| **1. 平台与账号** | 停手线动作类 ①「替用户登录」 | 否 |
| **4. Recommendations** | 停手线动作类 ⑥「以推荐人名义发邀请」 | 🔴 **是**——信发出去收不回 |
| **8. Submission** | 停手线动作类 ④⑤「付申请费 / 点提交」 | 🔴 **是**——本校付费即冻结 |

🔴 **第 4 段在 portal 上排第 4，但在时间上必须最先想清楚**：本包两个不可逆点里，先撞上的是它。

---

## 0. 冻结点 —— 🔴 先读这一段再动手

- **付费 = 提交的最后一步；付费或提交 waiver 之后完全不能再改**
  ← `channels/cornell--gradschool.md § 冻结点`

**这一校没有「提交后再补」的窗口**，所以下面每一段的 ⬜ 都必须在走到第 8 段之前清掉。
（对照：UIUC 是先提交后付费，语义相反 —— 见 `packets/uiuc--gradcollege--cs-msc/README.md` 第 0 段。）

---

## 1. 平台与账号 🛑

- 平台 = ApplyWeb（CollegeNET） ← `channels/cornell--gradschool.md § 平台与账号`
- ⬜ 注册表字段（登录墙后，公开页拿不到） ← 同上

**🛑 注册、建号、登录全部由你本人完成。** 建好号后回来继续第 2 段。

---

## 2. Program 🟢

| portal 上的字段 | 你填什么 | 来源 |
|---|---|---|
| `apply to major fields only` / Program | MEng in Computer Science (Ithaca) | ← `programs.md:cornell--gradschool--cs-meng` |

---

## 3. Transcripts 🟢 ⬜

**该校规格** ← `channels/cornell--gradschool.md § 材料上传`：

- 同一份成绩单的多页**必须合并成一个文件**
- 格式 PDF / TIFF / JPEG / GIF，**不收 Word**
- 单文件 ≤ **10MB**
- 质量 `clear and easy to read`；加密件必须先打印再扫描
- 申请阶段传**非官方件**，官方件录取后才交
- 翻译件认证等级：**certified or notarized**

| 要交的东西 | 从 canonical 怎么来 | 状态 |
|---|---|---|
| 本科成绩单 | `documents/transcript/<institution_id>/page-NN.pdf` → **合并成一个 PDF**、保持清晰 | ⬜ `documents/transcript/` 为空 |
| 交换成绩单 | 同上，交换院校单独一份 | ⬜ 同上 |
| 学位证 | `documents/degree/<institution_id>.pdf` | ⬜ 条件必填（境外学历） |
| 翻译件 | `documents/translation/<institution_id>/`，需 certified 或 notarized | ⬜ ← `profile.md § 待补充的 canonical 事实` 第 2 项 |

**降级方向**：canonical 是逐页高分辨率彩色，给这里**合并 + 保清晰**；给 UIUC 反向降到 <200dpi 灰度。
降级可逆，升级不可逆 —— 别反过来存。

⚠️ **本段的学校约束可能不全**，见文末缺口表第 1–2 行。

---

## 4. Recommendations 🛑 —— 🔴 本包最早必须想清楚的一段

**该校机制** ← `channels/cornell--gradschool.md § 推荐信机制`：

- 系统 → 推荐人（发含链接的在线表单）
- ⬜ 触发时点（官方页未写何时发信）→ **按「填入即已发信」的保守假设操作**
- 需要 **2–3 封**，按 field 定
- 接受 **Interfolio**（须 field 同意）；部分情况可选 By Mail

**🛑 以下字段 agent 一律不填、不代选，本包不给可粘贴的值**：

| portal 字段 | 为什么停手 |
|---|---|
| `referee_details` / `referee_1..3_email` | 填入即可能触发发信 |
| `reference_delivery_method`（Interfolio / 在线 / By Mail） | 🔴 **选错不可逆** ← `channels/cornell--gradschool.md § 推荐信机制` |
| `ferpa_waiver_checkbox` | 影响推荐人对保密性的预期，不代勾 |

**两个必须容忍的合法例外** ← `channels/cornell--gradschool.md § 推荐信机制`：

1. 用 Interfolio 时，官方指引就是把 **Interfolio 生成的 custom document e-mail address 填进推荐人邮箱栏**，
   取代推荐人本人邮箱。这是合法路径，别当成异常。
2. 在读生只需 1 封，官方指引在第 2 位推荐人处 `enter a "filler"`。占位内容是官方认可的。

**你现在要做的**：先向 R1 / R2 / R3 本人确认愿意写，回 `recommenders.md` 打勾。
⬜ **三人当前都是「未确认」** ← `recommenders.md § 提交前人工确认闸口` → 闸口未全部打勾，这一段不能动。

**给推荐人的 support pack** 每**推荐人**一份、跨项目复用，是不落盘的派生视图，**不在本包里**。

⚠️ **本段的学校约束可能不全**，见文末缺口表第 5 行。

---

## 5. Statements 🟢 ⬜

**该校规格** ← `channels/cornell--gradschool.md § 文书规格`：
**两篇独立文书，不是一篇**。Academic Statement of Purpose 一到两页；Personal Statement 另一篇，分工不同。

| portal 字段 | 交什么 | 状态 |
|---|---|---|
| `statement_of_purpose` | `essays/academic-sop.md` | 🟢 已渲染（源 `essays/canonical/long.md` v1，裁到两页、去掉个人动机段） |
| `personal_statement` | `essays/personal-statement.md` | ⬜ 源 `essays/canonical/points.md` 的 P3/P4 为空——素材门槛未达标 |

⚠️ **why this program 段缺失 = 警告放行，不报错**（← [#18](https://github.com/jiangxidong/EduApplication/issues/18) 两级闸门）。
`essays/canonical/per-program/cornell--gradschool--cs-meng.md` 不存在。
本校 portal 没有单独一问；若要嵌进 SOP，拼接配方归 `channels/ § 文书规格`，**不进本包**（#18 §6 / #23 §11.1）。

---

## 6. 附加材料 ⛔ —— 本校明令不收

`Publications, award certificates, resumes, theses, and similar materials` —— 除非 field 事先批准，否则不允许。

🔴 **连简历都不收。** 对照 UIUC：`cv_upload` 是条件必填。
同一个 `documents/cv/` 槽位，两校一个必交一个禁交 —— 这就是「canonical + 逐校 rendering rules」
而不是「逐校成品」的理由。

⚠️ 这条约束**目前不在 `channels/` 里**，见文末缺口表第 3 行。在它回填之前，本段的依据是包外的调研，不是真相源。

---

## 7. Test Scores 🟢 ⬜

| portal 字段 | 你填什么 | 来源 / 状态 |
|---|---|---|
| `english_test_report_upload` | TOEFL iBT 102（R28 L27 S22 W25，2026-05-16） | ← `profile.md § 英语`。⬜ 本校 speaking 单项下限 |
| `test_score_institution_code` | ⬜ 见文末缺口表第 4 行 | —— |
| `gre_score` | — | ⬜ GRE 是否要求 ← `channels/cornell--gradschool.md § 项目级差异` |

---

## 8. Submission 🛑 —— agent 到此为止

| portal 字段 | 为什么停手 |
|---|---|
| `application_fee_payment` | 停手线动作类 ④「付申请费」。⬜ 金额与减免条件 ← `channels/cornell--gradschool.md § 费用与资格` |
| `application_fee_waiver` | 需你本人陈述资格 |
| **点提交** | 停手线动作类 ⑤ |

🔴 **本校付费即冻结。** 走到这一步之前，把上面所有 ⬜ 清掉。

---

## 本次渲染发现的缺口（🔴 已转缺口清单，不在本包里补）

按 #23 §11.3：准备包阶段渲染时发现缺一条约束，**不得就地补进 `packets/`**。
下表五条的 owner 没有一个是准备包阶段（← `CONTRACT.md` §1.2 归属表），本阶段无权写：

| 缺的约束 | 该落哪个节 | 该节 owner | 出处 |
|---|---|---|---|
| 含 SSN 的成绩单须先涂黑再上传 | `## 材料上传` | 材料 | #6 `ssn_redaction_rule` |
| 加密 / 密码保护文件禁止上传 | `## 材料上传` | 材料 | #6 `encrypted_file_prohibition` |
| 附加材料明令禁止（含简历） | `## 材料上传` | 材料 | #6 `extra_materials_prohibition` |
| 送分 institution code = 2098 | `## 费用与资格` | 选校 | #6 `test_score_institution_code` |
| 第三方成绩单渠道（IIE / Amideast / SOPHAS…） | `## 材料上传` | 材料 | #6 `third_party_transcript_channel` |

⚠️ 另有一条**不是缺口而是契约洞**：`documents/` 的路径要 `institution_id`，
而 `CONTRACT.md` §1.1 说定义权在 `profile.md` 的学历条目——但样例 `profile.md` 的学历表**没有这一列**。
本包用 `<institution_id>` 占位，不自己发明值。
