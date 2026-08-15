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

> **冲突记录**：Cornell 要「清晰易读 + 多页合并」，UIUC 要「≤200dpi 灰度 + 尽可能低分辨率」。
> 一份成品不可能同时满足。
> → canonical 存**高分辨率彩色、逐页单文件**（`documents/transcript/page-NN.pdf`），
> 投递时给 Cornell 合并 + 保清晰，给 UIUC 降采样。**降级可逆，升级不可逆。**

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

## AI 使用政策

- `待核实` **Cornell 属沉默档**：公开页未见明文 AI 政策。
  → 按产品默认基线处理（语法拼写 OK / 实质写作禁止 / 整段翻译禁止），并告知用户这是推定不是明文。

## 项目级差异

### `cornell--gradschool--cs-meng`
- `待核实` deadline（**不得凭记忆**；MEng 有多轮，需查当季轮次表）
- `待核实` GRE 是否要求
- `待核实` 申请费金额
