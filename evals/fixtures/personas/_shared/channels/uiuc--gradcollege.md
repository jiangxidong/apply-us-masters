---
channel_key: uiuc--gradcollege
school: University of Illinois Urbana-Champaign
college: Graduate College / Siebel School of Computing and Data Science
platform: Slate (Technolutions)
season_downgraded:
  选校: 2027fall
  文书: 2027fall
  材料: 2027fall
  推荐信: 2027fall
  准备包: 2027fall
---

# UIUC Graduate College — 申请约束

> ⚠️ **与 Columbia SEAS 同为 Slate 平台，但字段结构迥异。**
> 平台只决定抓取方式，不决定字段契约 —— **不要建「Slate 适配层」**。
> 本文件申请人无关部分与 `prototype/state-layer` 的 `sample-workspace/channels/uiuc--gradcollege.md` 一致，
> **唯一差异是本文件把项目级差异挂在 `uiuc--gradcollege--mcs` 下，而不是 sample 现存的 `uiuc--gradcollege--cs-msc`**
> —— 三份调研里 UIUC 只有 MCS 一个项目，`cs-msc` 那个 key 整行查不到（[#14](https://github.com/jiangxidong/EduApplication/issues/14) §4 已判），
> 分歧原因与两个 key 各自的落点见 `../../README.md`。

## 平台与账号

- `✓ https://grad.illinois.edu/admissions/apply` 平台 = Slate（Technolutions）
- `待核实` 注册表字段（该实例登录墙后，拿不到 `maxlength` / `required`）

## 🔴 冻结点 —— 与 Cornell 语义相反

- `✓ 同上` **先提交，后付费**；逾期未付 → **退回未提交状态**
  → 与 Cornell「付费=提交，之后完全不能改」正好相反。
    产品的「提交前最后检查」必须**逐校知道冻结点在哪**，不能写一套通用流程。

## 学历门槛

- `待核实` 是否卡本科院校层级、卡到什么程度（五所样本**无一公开院校分级名单**，见 #5）
- `✓ https://grad.illinois.edu/admissions/application-faq/international-applicant-questions` 外部学历评估：不是「不需要」，是 🔴 **不接受** —— 问 `Do you accept credentials from credential evaluation service organizations such as WES and ECE?`，答 `No, all documents must come from your institution. We cannot accept documents from credential evaluation service organizations such as WES or ECE.`
- 对照（来自 #5 的记录，**本轮未复核、无 `✓`**）：UT Dallas 同为**不接受**；Northeastern 是**不需要** —— 两者在产品里的下一步不同（前者是「做了也白做」，后者是「可以省这笔钱」）
- `✓ https://grad.illinois.edu/admissions/information-admitted-students` 学信网认证（🔴 该页称 **CSSD**，不叫 CHESICC，写 CHESICC 在页上零命中）：`If we are able to verify your credential online, we will accept CSSD credential verification reports from the CSSD website`（链 `https://www.chsi.com.cn/en/`）。**录取后**才要
- `✓ https://grad.illinois.edu/admissions/country/china` 中国申请人最低线：`Minimum GPA Requirements` = **B Average / 80%**；申请阶段只要 `scanned copies of official transcripts` / `official certificate of degree or diploma` / `accompanying official English Translations`，并明写 `If admitted, applicants will be expected to provide final, official or attested copies of all academic credentials.`
- `✓ https://grad.illinois.edu/admissions/country/china` 换算口径由校方裁量：`When institutions provide a different grading scale or a different degree format, academic credentials will be reviewed on an individual basis to determine acceptable degrees and GPAs.`
- `✓ https://siebelschool.illinois.edu/admissions/graduate/applications-process-requirements` 校级最低线：`The University of Illinois Urbana-Champaign policy requires applicants to hold at least a 3.0/4.0 or higher GPA in the last two years of their undergraduate study`
- `✓ https://siebelschool.illinois.edu/admissions/graduate/faqs` 国际成绩单由**校方自己换算**：`School staff will calculate and convert international transcripts`，结果取决于原院校的评分制

**英语 —— 🔴 两档，且 2026-01-20 起换了量表**

- `✓ https://grad.illinois.edu/admissions/international-applicants` 研究生院英语线分 **Limited Status / Full Status 两档**（下表为该页原值）

| 考试 | Limited Status Admission Minimum | Full Status Admission Minimum |
|---|---|---|
| TOEFL iBT / Home Edition | **4.0**（成绩日期 2026-01-20 之后）／**79**（2026-01-21 之前） | **5.0**（2026-01-20 之后）／**103**（2026-01-21 之前） |
| IELTS Academic | 6.5 | 7.5 |
| Duolingo | 115 | 135 |

> 🔴 **两档 = 这个维度有第二条线**：Limited 是最低线，Full 是第二条线。没跨过 Full 就是该维度**擦线**，
> 而 `safer` 的合取第 ③ 项要求**没有任何维度擦线**——所以这一栏能单独挡掉 `safer`。
> ⚠️ 量表在 **2026-01-20** 换过，同一张表上**两制并排**。**学校只公布了两档门槛在两个量表上各自的取值（两个点），没有换算表**——在 `79↔4.0` 与 `103↔5.0` 之间插值是凭空造数。新量表单项满分为 **6.0**（`✓ https://siebelschool.illinois.edu/admissions/graduate/applications-process-requirements/additional-required-application-materials`：`A passing score on the TOEFL iBT (spoken portion of the exam only) is 24/30 (for scores dated prior to 1/21/2026 ) and 5.0/6.0 (for scores dated after 1/20/2026).`）。

- `✓ https://siebelschool.illinois.edu/admissions/graduate/applications-process-requirements` 项目侧另有口语提示：`Applicants with TOEFL iBT speak scores below 22 have a low chance of admission`
- `待核实（官网未列）` 🔴 **MCS 录取绑的是 Limited 还是 Full Status？** —— 逐页取回 `grad.illinois.edu` 与 `siebelschool.illinois.edu` 共 9 个页面，**没有一句把某个项目的录取绑到某一档上**。这不是「没查够」，是学校在结构上不这么公布
- `✓ https://grad.illinois.edu/admissions/graduate-admissions-minimum-requirements` limited status 是**逐案裁量**、不是逐项目公布的一档：`A student who does not meet one or more of the admission requirements: may qualify for limited status admission with support from the academic program and approval from the Graduate College.`
- `✓ https://grad.illinois.edu/admissions/international-applicants` 低于 Full 线的后果是**入学后补课**、不是不录：`The English as a Second Language Placement Test (EPT) will be required prior to enrolling at Illinois for all students who score below the full status minimums listed in the chart above.`
- `✓ https://grad.illinois.edu/admissions/information-admitted-students` 且 Limited 是真实的**录取**路径：`Some newly admitted students are admitted on Limited Status because of an English language requirement.`

> ⚠️ **唯一一句读起来像绑定的话，不能当绑定用。** `✓ https://siebelschool.illinois.edu/admissions/graduate/faqs` 里写着 `You can click on the country you obtained your degree and see the bottom of the page to find the "Full Status Admission Minimum GPA Requirements".`
> ① 它说的是 **GPA 维度**，不是英语维度；② 它描述的那个小标题今天已不在目标页上。
> ⇒ 英语维度上**不存在「已取证未达标」** ⇒ 本行**判不了 `ineligible`**，`match` 站住；未决前提落在 `programs.md` 的 `tier_void_if`。

## 材料上传 —— ⚠️ 与 Cornell 直接冲突

- `✓ https://grad.illinois.edu/admissions/apply` 扫描：`at the lowest resolution that results in a legible
  document (we recommend using under 200 dpi whenever possible)`；**灰度或黑白最佳**
- `✓ 同上` 格式：**PDF 或 Word**（与 Cornell「不收 Word」不冲突，但 canonical 存 PDF 更安全）
- `待核实` 单文件大小上限（未公开）
- 🔴 `✓ 同上` **文件内容须含申请人姓名与院校名** —— 这是对**文件本身**的要求，不是文件名
- `✓ 同上` `transcript_legend_upload`：需另传**评分说明 / grading legend**
- `✓ https://grad.illinois.edu/admissions/application-instructions/completing-your-graduate-application` **上传后须自检可读性**：
  `You will also be able to click the "view document" button to verify whether the uploaded document is legible.`
- `✓ https://grad.illinois.edu/admissions/application-instructions/completing-your-graduate-application` **简历条件必填（多数项目）**：
  `Most graduate programs require a resume or curriculum vitae.`（→ `documents/cv/`）
  ⚠️ 与 Cornell 默认值相反，记录在 `channels/cornell--gradschool.md § 材料上传`——**那一份是唯一一份，本文件不复述**

## 文书规格 —— 形态与另两校完全不同

- `✓ 同上` **Academic Statement**：500–1000 词，**具体字数由项目定**（→ 项目级差异）
- `✓ 同上` **Personal Statement**：**不是一篇文章**，是 **4 道短答题 × 每题 250 词（2 必答 + 2 选答）**
- → 渲染来源：`essays/canonical/long.md`（Academic Statement，按 1000 词上限裁；本项目上限见 `## 项目级差异`）
- → 渲染来源：`essays/canonical/points.md`（Personal Statement 四道短答题，一节一题）

## 🔴 推荐信机制 —— 风险 B：冒名复用

- `✓ 同上` 机制：**系统 → 推荐人**；推荐人信息必须在提交前填妥，但不必等信到齐
- 🔴 `✓ 同上` **允许把此前申请里的推荐信一键导入**（`reference_import_previous`），
  官方硬性要求 `you must obtain explicit permission from the letter writer`，
  且**导入后推荐人不会收到新请求**
- `✓ 同上` `ferpa_waiver_checkbox`（FERPA 1974 放弃查阅推荐信权）—— 影响推荐人对保密性的预期，**AI 不得代勾**
- `✓ https://grad.illinois.edu/admissions/application-instructions/completing-your-graduate-application` **需要几封**：
  `Most graduate programs require three letters of reference. Check with your proposed program of study office regarding the number required.`
  → 大学层给的是「多数项目 3 封」，**具体几封由项目定** → 本项目取值归 `## 项目级差异`
- 🔴 `✓ https://grad.illinois.edu/admissions/application-instructions/completing-your-graduate-application` **推荐人条目可增 / 可排除 / 可恢复，但排除有窗口**：
  `To add a recommender, simply click the "Add Recommender" link and follow the provided instructions. If you wish to exclude a recommender, you may do so as long as the recommendation letter has not yet been submitted.`
  → **信一旦提交就排不掉**

## 费用与资格（从 programs.md 下沉至此 —— evidence 列只担保 deadline）

- `待核实` 学费口径（UIUC 研究生按 program + residency 分档，Bursar 页单列）
- `✓ https://grad.illinois.edu/admissions/application-instructions/completing-your-graduate-application` 申请费 **$90**，国际与国内同价：`Domestic applicants are required to submit a $90.00 application fee (effective Spring 2026). International applicants are required to submit a $90.00 application fee.`；**UIUC 有多种免申请费路径**，先提交后付费，逾期未付会退回未提交

## AI 使用政策

- `待核实` UIUC Graduate College 的明文 AI 政策未查到。
  → 参照事实标准基线（Rackham / Northwestern TGS / Lehigh 三校高度同构：
    语法拼写 OK、实质写作禁止、整段翻译禁止），并告知用户这是推定不是明文。

## 项目级差异

### `uiuc--gradcollege--mcs`

#### 文书规格

- `待核实` Academic Statement 的**本项目**具体字数（Graduate College 给的是一个区间，由项目收窄——区间取值见 `## 文书规格`）
- `待核实` 4 道短答题中哪 2 道是必答

#### 学历门槛

- `✓ https://siebelschool.illinois.edu/academics/graduate/professional-mcs` **不要求 GRE**：`The MCS program is a coursework-only degree consisting of 32 credit hours with no GRE required for admission.`
- `✓ https://siebelschool.illinois.edu/admissions/graduate/degree-program-options` 「Comparison of CS Graduate Programs」表，GPA 列的列头逐字为 `Undergraduate GPA (Recommended, 4.0 scale)`；取值：MCS（Urbana-Champaign / Chicago / Online）**3.2**、MS in Computer Science (thesis) **3.2**、MS Bioinformatics **3.2**、5-year BS/MCS **3.2**、PhD **3.4**、5-year BS/MS **3.5**
- 🔴 `✓ https://siebelschool.illinois.edu/admissions/graduate/faqs` 学校**对上面那个数字本身的官方解释**——问「My undergraduate GPA is below the average quoted on your website. Will my application be reviewed?」，答：`Our website states the average GPA of admitted students. It is not a minimum.`
- `✓ https://siebelschool.illinois.edu/admissions/graduate/faqs` 同向佐证：`Our school typically requires a higher minimum as a benchmark for admission`

> **所以 3.2 是类型 B，不是类型 A。** 表头写 `Recommended`（触发措辞是类型 A），但学校自己把这个数字解释成**已录取者的平均分、且明说不是门槛**——判**类型 B**。
> ⚠️ 类型 B 是**单个平均值、无区间** ⇒ **不判 `safer`**；跨过 3.2 ⇒ **到 `match` 为止**。

#### 费用与资格

- `✓ https://tableau.admin.uillinois.edu/views/Program-Inventory/UofIProgramInventory.csv?Campus=UIUC` CIP = **11.0701**（M.S. in Computer Science / Master of Computer Science 同挂此码，Active）＋ `✓ https://www.ice.gov/doclib/sevis/pdf/stemList2024.pdf` 11.0701 在 DHS STEM 名单内 ⇒ **STEM 指定**（`research/stem-cip` 分支 2026-08-15 两处均取回；来源是大学层 Program Inventory 的 Tableau CSV 导出端点，不是项目页——项目页 / catalog / ISSS 对此均零提及）
- `✓ https://siebelschool.illinois.edu/admissions/graduate/degree-program-options` 同一张表：**Master of Computer Science（Urbana-Champaign）** = Admission Cycle **Spring & Fall** / 3 semesters (on campus) / Thesis Required **No** / Research Required **No**
- `✓ https://siebelschool.illinois.edu/academics/graduate/professional-mcs/campus-master-computer-science` Urbana-Champaign 校区页：`The Siebel School of Computing and Data Science's Master of Computer Science (MCS) consists of 32 credit hours of coursework and no thesis.`

> 🔴 **`deadline` 将来补的时候不能混用**：MCS 是 **Spring & Fall**，带论文的 MS 是 **Fall only**。查错轮次会把一个还开着的申请季报成已关闭。
> 🔴 **通则**：切片归属**不能按学位名推**（`MS` / `MEng` / `MCS` 都不是判据），只能看项目页上「thesis 是否 required」那一句 —— 同一个 `MS in CS` 在 UIUC 是研究型、在 Columbia 是授课型。

#### 项目内容

- `✓ https://siebelschool.illinois.edu/academics/graduate/professional-mcs/campus-master-computer-science` 修业时长：`Designed to be completed in as little as three semesters of full-time study`
