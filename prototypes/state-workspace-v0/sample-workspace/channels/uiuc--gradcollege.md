---
channel_key: uiuc--gradcollege
school: University of Illinois Urbana-Champaign
college: Graduate College / Siebel School of Computing and Data Science
platform: Slate (Technolutions)
season: 2027fall
---

# UIUC Graduate College — 申请约束

> ⚠️ **与 Columbia SEAS 同为 Slate 平台，但字段结构迥异。**
> 平台只决定抓取方式，不决定字段契约 —— **不要建「Slate 适配层」**。

## 平台与账号

- `✓ https://grad.illinois.edu/admissions/apply` 平台 = Slate（Technolutions）
- `待核实` 注册表字段（该实例登录墙后，拿不到 `maxlength` / `required`）

## 🔴 冻结点 —— 与 Cornell 语义相反

- `✓ 同上` **先提交，后付费**；逾期未付 → **退回未提交状态**
  → 与 Cornell「付费=提交，之后完全不能改」正好相反。
    产品的「提交前最后检查」必须**逐校知道冻结点在哪**，不能写一套通用流程。

## 学历门槛

- `✓ https://grad.illinois.edu/admissions/…/international` 中国申请人：**B Average / 80%**
- `待核实` 是否卡本科院校层级、卡到什么程度（五所样本**无一公开院校分级名单**，见 #5）
- `✓ 同上` 明确**不需要 WES 等外部学历评估**（对照：UT Dallas 明确不接受外部评估；Northeastern 明确不需要 WES）
- `✓ 同上` CHESICC / 学信网：**录取后**才要，不是申请时

## 材料上传 —— ⚠️ 与 Cornell 直接冲突

- `✓ https://grad.illinois.edu/admissions/apply` 扫描：`at the lowest resolution that results in a legible
  document (we recommend using under 200 dpi whenever possible)`；**灰度或黑白最佳**
- `✓ 同上` 格式：**PDF 或 Word**（与 Cornell「不收 Word」不冲突，但 canonical 存 PDF 更安全）
- `待核实` 单文件大小上限（未公开）
- 🔴 `✓ 同上` **文件内容须含申请人姓名与院校名** —— 这是对**文件本身**的要求，不是文件名
- `✓ 同上` `transcript_legend_upload`：需另传**评分说明 / grading legend**
  → 已回写 `profile.md` 的待补充清单

## 文书规格 —— 形态与另两校完全不同

- `✓ 同上` **Academic Statement**：500–1000 词，**具体字数由项目定**（→ 项目级差异）
- `✓ 同上` **Personal Statement**：**不是一篇文章**，是 **4 道短答题 × 每题 250 词（2 必答 + 2 选答）**

> **这是 canonical 必须有 `points.md` 的原因**：为 Columbia 写好的 1000 词长文在这里**连形态都对不上**，
> 截成 250 词也不行 —— 需要的是可拆成四段独立回答的**要点**，不是摘要。

## 🔴 推荐信机制 —— 风险 B：冒名复用

- `✓ 同上` 机制：**系统 → 推荐人**；推荐人信息必须在提交前填妥，但不必等信到齐
- 🔴 `✓ 同上` **允许把此前申请里的推荐信一键导入**（`reference_import_previous`），
  官方硬性要求 `you must obtain explicit permission from the letter writer`，
  且**导入后推荐人不会收到新请求**

> **这条是「只拦发信动作」的防护会完全漏掉的一类风险。**
> AI 代为勾选导入 = 在未取得推荐人明示同意的情况下复用其署名文件。
> `reference_import_previous` 必须与 `referee_*_email` 一同进 AI 停手清单。

- `✓ 同上` `ferpa_waiver_checkbox`（FERPA 1974 放弃查阅推荐信权）—— 影响推荐人对保密性的预期，**AI 不得代勾**

## 费用与资格（从 programs.md 下沉至此 —— evidence 列只担保 deadline）

- `待核实` 学费口径（UIUC 研究生按 program + residency 分档，Bursar 页单列）
- `待核实` STEM OPT 资格（须查项目 CIP code 对照 DHS STEM 清单）
- `待核实` 申请费金额；**UIUC 有多种免申请费路径**（先提交后付费，逾期未付会退回未提交）

## AI 使用政策

- `待核实` UIUC Graduate College 的明文 AI 政策未查到。
  → 参照事实标准基线（Rackham / Northwestern TGS / Lehigh 三校高度同构：
    语法拼写 OK、实质写作禁止、整段翻译禁止），并告知用户这是推定不是明文。

## 项目级差异

### `uiuc--gradcollege--cs-msc`
- `待核实` Academic Statement 的**本项目**具体字数（Graduate College 给的是 500–1000 词区间，由项目收窄）
- `待核实` 4 道短答题中哪 2 道是必答
- `待核实` deadline（**不得凭记忆**）
- `待核实` GRE 是否要求
