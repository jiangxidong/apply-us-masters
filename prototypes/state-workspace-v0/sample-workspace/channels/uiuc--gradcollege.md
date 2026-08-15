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
- `✓ https://grad.illinois.edu/admissions/country/china` 中国申请人最低线的**精确端点**（上面那条 `…/international` 带省略号，取不回来）：`Minimum GPA Requirements` = **B Average / 80%**
- `✓ https://grad.illinois.edu/admissions/country/china` 换算口径由校方裁量：`When institutions provide a different grading scale or a different degree format, academic credentials will be reviewed on an individual basis to determine acceptable degrees and GPAs.`
- `✓ https://siebelschool.illinois.edu/admissions/graduate/applications-process-requirements` 校级最低线：`The University of Illinois Urbana-Champaign policy requires applicants to hold at least a 3.0/4.0 or higher GPA in the last two years of their undergraduate study`
- `✓ https://siebelschool.illinois.edu/admissions/graduate/faqs` 国际成绩单由**校方自己换算**：`School staff will calculate and convert international transcripts`，结果取决于原院校的评分制

> ⚠️ 本节前三条里，那条省略号 URL 与挂在它上面的两条 `同上`（WES / CHESICC）本次（2026-08-15）**没有重新取证**。
> 上面新加的 china 端点正文里**既没有 WES 也没有 CHESICC**，所以**不能**把省略号换成它了事——那会让两条事实静默地开始断言它们来自一个没有它们的页。→ #62

## 英语门槛 —— 🔴 两档，且 2026-01-20 起换了量表

- `✓ https://grad.illinois.edu/admissions/instructions/04c` 研究生院英语线分 **Limited Status / Full Status 两档**（下表为该页原值）

| 考试 | Limited Status Admission Minimum | Full Status Admission Minimum |
|---|---|---|
| TOEFL iBT / Home Edition | **4.0**（成绩日期 2026-01-20 之后）／**79**（2026-01-21 之前） | **5.0**（2026-01-20 之后）／**103**（2026-01-21 之前） |
| IELTS Academic | 6.5 | 7.5 |
| Duolingo | 115 | 135 |

> 🔴 **两档 = 这个维度有第二条线**：Limited 是最低线，Full 是第二条线。没跨过 Full 就是该维度**擦线**（见 `CONTEXT.md`），
> 而 `safer` 的合取第 ③ 项要求**没有任何维度擦线**——所以这一栏不只是资格门槛，它能单独挡掉 `safer`。
> ⚠️ 量表在 **2026-01-20** 换过。样例画像的托福考期是 2026-05-16（在换表**之后**）却记着旧制 102，两格打架 → #56。

- `✓ https://siebelschool.illinois.edu/admissions/graduate/applications-process-requirements` 项目侧另有口语提示：`Applicants with TOEFL iBT speak scores below 22 have a low chance of admission`（样例口语恰为 22，**不低于**，未被这条挡住）

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
- → 渲染来源：`essays/canonical/long.md`（Academic Statement，按 1000 词上限裁；本项目上限见 `## 项目级差异`）
- → 渲染来源：`essays/canonical/points.md`（Personal Statement 四道短答题，一节一题）

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
- `待核实` 申请费金额；**UIUC 有多种免申请费路径**（先提交后付费，逾期未付会退回未提交）

## AI 使用政策

- `待核实` UIUC Graduate College 的明文 AI 政策未查到。
  → 参照事实标准基线（Rackham / Northwestern TGS / Lehigh 三校高度同构：
    语法拼写 OK、实质写作禁止、整段翻译禁止），并告知用户这是推定不是明文。

## 项目级差异

### `uiuc--gradcollege--cs-msc`

#### 文书规格

- `待核实` Academic Statement 的**本项目**具体字数（Graduate College 给的是一个区间，由项目收窄——区间取值见 `## 文书规格`）
- `待核实` 4 道短答题中哪 2 道是必答

#### 学历门槛

- `待核实` GRE 是否要求
- `✓ https://siebelschool.illinois.edu/admissions/graduate/degree-program-options` 「Comparison of CS Graduate Programs」表，GPA 列的列头逐字为 `Undergraduate GPA (Recommended, 4.0 scale)`；取值：MCS（Urbana-Champaign / Chicago / Online）**3.2**、MS in Computer Science (thesis) **3.2**、MS Bioinformatics **3.2**、5-year BS/MCS **3.2**、PhD **3.4**、5-year BS/MS **3.5**
- 🔴 `✓ https://siebelschool.illinois.edu/admissions/graduate/faqs` 学校**对上面那个数字本身的官方解释**——问「My undergraduate GPA is below the average quoted on your website. Will my application be reviewed?」，答：`Our website states the average GPA of admitted students. It is not a minimum.`
- `✓ https://siebelschool.illinois.edu/admissions/graduate/faqs` 同向佐证：`Our school typically requires a higher minimum as a benchmark for admission`（对照 Graduate College 那条基于 "B" equivalent 的最低线）

> **所以 3.2 是类型 B，不是类型 A。** 表头写 `Recommended`（`CONTEXT.md`「第二条线」表里的**类型 A 触发措辞**），
> 但学校自己把这个数字解释成**已录取者的平均分、且明说不是门槛**——那描述的是「谁被录取了」，判**类型 B**。
> 措辞与实质冲突时按实质判：该词条已写明「触发措辞只判定第二条线的**类型**」，而类型的定义是语义的，不是词表的。
> ⚠️ 类型 B 是**单个平均值、无区间** ⇒ 按词条 ⚠️ 第二条（类型 B 通往 `safer` 必须有离散度）**不判 `safer`**；3.4 高于 3.2 ⇒ **到 `match` 为止**。

#### 学位形态 —— 🔴 本行可能选错了学位

- `✓ https://siebelschool.illinois.edu/admissions/graduate/degree-program-options` 同一张表：**MS in Computer Science** 的 Thesis Required = **Yes**、Research Required = **Yes**、Admission Cycle = **Fall only**；**MCS（Master of Computer Science）** 三项分别为 **No / No / Spring & Fall**
- → 在 UIUC，`MS in Computer Science` 是**带论文的研究型硕士**，不是 coursework master；本行 `program` 填的正是它 → 归 #55。**分档结论不受影响**：两个学位的 3.2 相同

#### 费用与资格

- `待核实` CIP code（用于判 STEM OPT 资格；STEM 归属是派生视图，渲染时对照 DHS 名单现算，不落盘）
