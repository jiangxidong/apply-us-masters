---
channel_key: cornell--gradschool
school: Cornell University
college: Graduate School / Cornell Bowers CIS
platform: ApplyWeb (CollegeNET)
season: 2027fall
---

# Cornell Graduate School — 申请约束

## 平台与账号

- `✓ https://gradschool.cornell.edu/admissions/apply/` 平台 = ApplyWeb（CollegeNET）
- `待核实` 注册表字段（登录墙后，无法从公开页确认）

## 🔴 冻结点 —— 全样本最硬的一个

- `✓ https://gradschool.cornell.edu/admissions/apply/` **付费 = 提交的最后一步；付费或提交 waiver 之后完全不能再改**
  → 「提交前最后检查」在本校是**一锤定音**，产品必须在付费前做完整核对并明确交还控制权

## 材料上传 —— ⚠️ 与 UIUC 直接冲突

- `✓ 同上` 成绩单：**必须把同一份成绩单的多页合并成一个文件**（`Combine multiple pages from the same transcript into one file`）
- `✓ 同上` 格式：PDF / TIFF / JPEG / GIF —— **不收 Word**
- `✓ 同上` 单文件上限 **10MB**
- `✓ 同上` 质量：`clear and easy to read`；**加密件必须先打印再扫描**
- `✓ 同上` 成绩单：申请阶段上传非官方件，录取后才交官方件
- `✓ 同上` 翻译件认证等级：**certified or notarized**
- `✓ https://gradschool.cornell.edu/admissions/application-steps/transcripts/` **含 SSN 的成绩单禁止上传**：
  `Do not upload transcripts that include a U.S. Social Security Number (SSN). Redact, cross out, or cover your SSN, if applicable, before scanning the document.`
  → 涂黑要在**扫描之前**做；扫完再涂等于没涂
- `✓ https://gradschool.cornell.edu/admissions/application-steps/transcripts/` **加密 / 密码保护的文件系统不接受**：
  `The online application will not accept or properly display encrypted or password-protected documents.`
  → 这是上面「加密件必须先打印再扫描」那条的**原因**。直接转发学校发来的加密官方电子成绩单（e-transcript）会失败
- `✓ https://gradschool.cornell.edu/admissions/application-steps/transcripts/` **第三方成绩单渠道**：
  `We also accept transcripts that have been certified and uploaded directly to your application by IIE, or Amideast or were submitted through SOPHAS, VMCAS, or LSAC.`
  ⚠️ 与 Columbia「明文禁止本人以外任何人代交」口径**相反**——「中介路径是否关闭」逐校不同，不能写一套通用判断
- 🔴 `✓ https://gradschool.cornell.edu/admissions/application-process/important-application-policies/` **附加材料明令不收（含简历）**：
  `Publications, award certificates, resumes, theses, and similar materials should not be sent unless prior approval has been given by the field of study to which you are applying. Mail any approved materials directly to the graduate field, not to the Graduate School.`
- `✓ https://gradschool.cornell.edu/admissions/application-steps/required-tests/` **官方送分机构代码 = 2098**：
  `All official test scores should be reported directly to Cornell University's institution code 2098.`
  `Department codes are not needed for matching scores to applications. If ETS requires you to select a department code, you may choose "0000 undecided."`
  → 这条不是费用，是**第三方（ETS）把一份材料送到学校的渠道地址**，与上面的 IIE / Amideast / SOPHAS 同形状，故归本节（#39 改派，票面原写 `## 费用与资格`）

> **冲突记录**：Cornell 要「清晰易读 + 多页合并」，UIUC 要「≤200dpi 灰度 + 尽可能低分辨率」。
> 一份成品不可能同时满足。
> → canonical 存**高分辨率彩色、逐页单文件**（`documents/transcript/page-NN.pdf`），
> 投递时给 Cornell 合并 + 保清晰，给 UIUC 降采样。**降级可逆，升级不可逆。**

> **默认值相反记录（`documents/cv/` 槽位）**：本校是 `不允许(除非 field 事先批准)`，UIUC 是 `条件必填(多数项目)`。
> 一份 canonical 简历，投 UIUC 交、投 Cornell 不交——少了任何一条，产品在一所学校上必错：
> 对 Cornell 是**教用户违反默认**，对 UIUC 是**漏交多数项目要的件**。
> ⚠️ **不是互斥**：两边都带条件，合取可满足；无条件的那一侧在池外（Columbia SEAS 的简历是 `必填`）。
> 两层结构的正当性锚在**降级不可逆**，不锚在互斥断言——互斥断言总能被一个「除非…」条款推翻。

## 文书规格 —— 两篇独立文书，不是一篇

- `✓ https://gradschool.cornell.edu/admissions/apply/` **Academic Statement of Purpose**：一到两页
- `✓ 同上` **Personal Statement**：另一篇，与上一篇互相独立
- → 渲染来源：`essays/canonical/long.md`（学术线）+ `essays/canonical/points.md`（个人线要点重组）
  ⚠️ **不能把 Columbia 的那一篇原样复用**——它是一篇，这里要两篇且分工不同

## 🔴 推荐信机制 —— 风险 A + 两个反直觉例外

- `✓ https://www.cs.cornell.edu/masters/…` 机制：**系统 → 推荐人**（发含链接的在线表单）
- `待核实` 触发时点（机制细节最全，但何时发信官方页未写）
- `✓ 同上` **接受 Interfolio**（须 field 同意）；部分情况可选 By Mail

**两个必须容忍的合法例外**（否则会误判）：
1. `✓ 同上` 用 Interfolio 时，官方指引是把 **Interfolio 生成的 custom document e-mail address
   填进推荐人邮箱栏，取代推荐人本人邮箱**。产品若一律把该字段当真人邮箱拦截，会在这条**合法路径**上误判。
2. `✓ 同上` **在读生只需 1 封推荐信**，官方指引是在第 2 位推荐人处 `enter a "filler"`。
   字段校验必须容忍官方认可的占位内容。

- 🔴 `✓ 同上` `reference_delivery_method`（Interfolio / 在线 / By Mail）**选错不可逆** → AI 不得代选

## 费用与资格（从 programs.md 下沉至此 —— evidence 列只担保 deadline）

- `待核实` MEng 学费口径（按学年还是按学分）
- `待核实` STEM OPT 资格（须查项目 CIP code 对照 DHS STEM 清单）
- `待核实` 申请费金额；是否有 fee waiver

## AI 使用政策

- `待核实` **Cornell 属沉默档**：公开页未见明文 AI 政策。
  → 按产品默认基线处理（语法拼写 OK / 实质写作禁止 / 整段翻译禁止），并告知用户这是推定不是明文。

## 项目级差异

### `cornell--gradschool--cs-meng`

#### 学历门槛

- `待核实` GRE 是否要求

#### 费用与资格

- `待核实` 申请费金额
