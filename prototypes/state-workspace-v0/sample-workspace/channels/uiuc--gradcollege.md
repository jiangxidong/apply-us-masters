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
- 对照（来自 [#5](https://github.com/jiangxidong/EduApplication/issues/5) 的记录，**本轮未复核、无 `✓`**）：UT Dallas 同为**不接受**；Northeastern 是**不需要** —— 两者在产品里的下一步不同（前者是「做了也白做」，后者是「可以省这笔钱」）
- `✓ https://grad.illinois.edu/admissions/information-admitted-students` 学信网认证（🔴 该页称 **CSSD**，不叫 CHESICC，写 CHESICC 在页上零命中）：`If we are able to verify your credential online, we will accept CSSD credential verification reports from the CSSD website`（链 `https://www.chsi.com.cn/en/`）。**录取后**才要 —— 该条住在「Final Academic Credential Requirements」节，同页时点句 `All final, official credentials are required during your first term of enrollment`
- `✓ https://grad.illinois.edu/admissions/country/china` 中国申请人最低线：`Minimum GPA Requirements` = **B Average / 80%**；申请阶段只要 `scanned copies of official transcripts` / `official certificate of degree or diploma` / `accompanying official English Translations`，并明写 `If admitted, applicants will be expected to provide final, official or attested copies of all academic credentials.`
- `✓ https://grad.illinois.edu/admissions/country/china` 换算口径由校方裁量：`When institutions provide a different grading scale or a different degree format, academic credentials will be reviewed on an individual basis to determine acceptable degrees and GPAs.`
- `✓ https://siebelschool.illinois.edu/admissions/graduate/applications-process-requirements` 校级最低线：`The University of Illinois Urbana-Champaign policy requires applicants to hold at least a 3.0/4.0 or higher GPA in the last two years of their undergraduate study`
- `✓ https://siebelschool.illinois.edu/admissions/graduate/faqs` 国际成绩单由**校方自己换算**：`School staff will calculate and convert international transcripts`，结果取决于原院校的评分制

> ⚠️ 本节第一条出处原是 `https://grad.illinois.edu/admissions/…/international`（**带省略号，不是可取回的端点**），WES 与 CHESICC 两条用 `✓ 同上` 挂在它下面 —— 三条 `✓` 全部悬空。
> [#62](https://github.com/jiangxidong/EduApplication/issues/62) 已把两条各自重新取回、改写成自带完整 URL 的独立 `✓` 行，省略号那一行删除（`B Average / 80%` 由 china 精确端点承载）。**本文件其余 `✓ 同上` 链全部锚在 `✓ https://grad.illinois.edu/admissions/apply` 上，删除未孤立任何一条**（2026-08-15 逐条核过）。
> 🔴 **不要把这两条改挂回 `country/china`** —— 那页上既没有 WES 也没有 CHESICC（2026-08-15 重取全文复核，仍然如此）。换锚点 = 让两条 `✓` 静默断言来自一个没有它们的页。

**英语 —— 🔴 两档，且 2026-01-20 起换了量表**

- `✓ https://grad.illinois.edu/admissions/international-applicants` 研究生院英语线分 **Limited Status / Full Status 两档**（下表为该页原值）。⚠️ 旧链 `https://grad.illinois.edu/admissions/instructions/04c` 现**重定向到本端点**，正文逐字相同（2026-08-15 两次取回 diff 只差聊天机器人插件文本）—— 事实成立、门牌号漂了（同 #39），故 `✓` 改指规范 URL

| 考试 | Limited Status Admission Minimum | Full Status Admission Minimum |
|---|---|---|
| TOEFL iBT / Home Edition | **4.0**（成绩日期 2026-01-20 之后）／**79**（2026-01-21 之前） | **5.0**（2026-01-20 之后）／**103**（2026-01-21 之前） |
| IELTS Academic | 6.5 | 7.5 |
| Duolingo | 115 | 135 |

> 🔴 **两档 = 这个维度有第二条线**：Limited 是最低线，Full 是第二条线。没跨过 Full 就是该维度**擦线**（见 `CONTEXT.md`），
> 而 `safer` 的合取第 ③ 项要求**没有任何维度擦线**——所以这一栏不只是资格门槛，它能单独挡掉 `safer`。
> ⚠️ 量表在 **2026-01-20** 换过，同一张表上**两制并排**。样例画像的考期已由 [#56](https://github.com/jiangxidong/EduApplication/issues/56) 挪到 `2025-12-06`（换表**之前**），故 `102` 与四个小分按 **0–120 旧制**读，与该行 `79` / `103` 同量表可比。
> 🔴 **学校只公布了两档门槛在两个量表上各自的取值（两个点），没有换算表** —— 在 `79↔4.0` 与 `103↔5.0` 之间插值是凭空造数，见 `CONTEXT.md`「分数量表」。新量表单项满分为 **6.0**（`✓ https://siebelschool.illinois.edu/admissions/graduate/applications-process-requirements/additional-required-application-materials`：`A passing score on the TOEFL iBT (spoken portion of the exam only) is 24/30 (for scores dated prior to 1/21/2026 ) and 5.0/6.0 (for scores dated after 1/20/2026).`）。

- `✓ https://siebelschool.illinois.edu/admissions/graduate/applications-process-requirements` 项目侧另有口语提示：`Applicants with TOEFL iBT speak scores below 22 have a low chance of admission`（样例口语恰为 22，**不低于**，未被这条挡住）
- `待核实（官网未列）` 🔴 **MCS 录取绑的是 Limited 还是 Full Status？** —— 2026-08-15 逐页取回 `grad.illinois.edu` 与 `siebelschool.illinois.edu` 共 9 个页面，**没有一句把某个项目的录取绑到某一档上**。这不是「没查够」，是学校在结构上不这么公布（见下条）
- `✓ https://grad.illinois.edu/admissions/graduate-admissions-minimum-requirements` limited status 是**逐案裁量**、不是逐项目公布的一档：`A student who does not meet one or more of the admission requirements: may qualify for limited status admission with support from the academic program and approval from the Graduate College.`
- `✓ https://grad.illinois.edu/admissions/international-applicants` 低于 Full 线的后果是**入学后补课**、不是不录：`The English as a Second Language Placement Test (EPT) will be required prior to enrolling at Illinois for all students who score below the full status minimums listed in the chart above.`
- `✓ https://grad.illinois.edu/admissions/information-admitted-students` 且 Limited 是真实的**录取**路径：`Some newly admitted students are admitted on Limited Status because of an English language requirement.`

> ⚠️ **唯一一句读起来像绑定的话，不能当绑定用。** `✓ https://siebelschool.illinois.edu/admissions/graduate/faqs` 里写着 `You can click on the country you obtained your degree and see the bottom of the page to find the "Full Status Admission Minimum GPA Requirements".`
> ① 它说的是 **GPA 维度**，不是英语维度，从这一侧外推到那一侧正是 #56 禁掉的动作；
> ② 🔴 **它描述的那个小标题今天已不在目标页上** —— `✓ https://grad.illinois.edu/admissions/country/china` 现在的小标题逐字是 `Minimum GPA Requirements`，FAQ 给的链接 `http://www.grad.illinois.edu/admissions/countries` 也是旧路径。这是学校**自己文档之间**的指针漂移（同 #39）。
> ⇒ 英语维度上**不存在「已取证未达标」** ⇒ 按 `CONTEXT.md`「分档」，本行**判不了 `ineligible`**，`match` 站住；未决前提落在 `programs.md` 的 `tier_void_if`。

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

- `✓ https://siebelschool.illinois.edu/academics/graduate/professional-mcs` **不要求 GRE**：`The MCS program is a coursework-only degree consisting of 32 credit hours with no GRE required for admission.`
- `✓ https://siebelschool.illinois.edu/admissions/graduate/degree-program-options` 「Comparison of CS Graduate Programs」表，GPA 列的列头逐字为 `Undergraduate GPA (Recommended, 4.0 scale)`；取值：MCS（Urbana-Champaign / Chicago / Online）**3.2**、MS in Computer Science (thesis) **3.2**、MS Bioinformatics **3.2**、5-year BS/MCS **3.2**、PhD **3.4**、5-year BS/MS **3.5**
- 🔴 `✓ https://siebelschool.illinois.edu/admissions/graduate/faqs` 学校**对上面那个数字本身的官方解释**——问「My undergraduate GPA is below the average quoted on your website. Will my application be reviewed?」，答：`Our website states the average GPA of admitted students. It is not a minimum.`
- `✓ https://siebelschool.illinois.edu/admissions/graduate/faqs` 同向佐证：`Our school typically requires a higher minimum as a benchmark for admission`（对照 Graduate College 那条基于 "B" equivalent 的最低线）

> **所以 3.2 是类型 B，不是类型 A。** 表头写 `Recommended`（`CONTEXT.md`「第二条线」表里的**类型 A 触发措辞**），
> 但学校自己把这个数字解释成**已录取者的平均分、且明说不是门槛**——那描述的是「谁被录取了」，判**类型 B**。
> 措辞与实质冲突时按实质判：该词条已写明「触发措辞只判定第二条线的**类型**」，而类型的定义是语义的，不是词表的。
> ⚠️ 类型 B 是**单个平均值、无区间** ⇒ 按词条 ⚠️ 第二条（类型 B 通往 `safer` 必须有离散度）**不判 `safer`**；3.4 高于 3.2 ⇒ **到 `match` 为止**。

#### 费用与资格
- `待核实` CIP code（用于判 STEM OPT 资格；STEM 归属是派生视图，渲染时对照 DHS 名单现算，不落盘）
- `✓ https://siebelschool.illinois.edu/admissions/graduate/degree-program-options` 同一张表：**Master of Computer Science（Urbana-Champaign）** = Admission Cycle **Spring & Fall** / 3 semesters (on campus) / Thesis Required **No** / Research Required **No**；**Master of Science in Computer Science with thesis（Urbana-Champaign）** = **Fall only** / 2 years / Thesis **Yes** / Research **Yes**（同表的 GPA 列住 `#### 学历门槛`，本条不复述）
- `✓ https://siebelschool.illinois.edu/academics/graduate/professional-mcs/campus-master-computer-science` Urbana-Champaign 校区页：`The Siebel School of Computing and Data Science's Master of Computer Science (MCS) consists of 32 credit hours of coursework and no thesis.`

> ✅ **本行 = MCS，在切片（coursework / taught master）内。** #31 建行时 `program` 那一格写成了 `MS in Computer Science` —— 在 UIUC 那是 Thesis/Research 皆 Yes 的研究型硕士、落在切片外。[#55](https://github.com/jiangxidong/EduApplication/issues/55) 已把显示名改回 MCS；**`program_key` 未变**（`cs-msc` 本就是 Master of **C**omputer **S**cience 的 slug，仓库内无一处把它解释成 Master of Science）。分档不受影响：两个学位的 3.2 相同。
> 🔴 **`deadline` 将来补的时候不能混用**：MCS 是 **Spring & Fall**，带论文的 MS 是 **Fall only**。查错轮次会把一个还开着的申请季报成已关闭。
> 🔴 **通则（#55）**：切片归属**不能按学位名推**（`MS` / `MEng` / `MCS` 都不是判据），只能看项目页上「thesis 是否 required」那一句 —— 同一个 `MS in CS` 在 UIUC 是研究型、在 Columbia 是授课型。

#### 项目内容

- `✓ https://siebelschool.illinois.edu/academics/graduate/professional-mcs/campus-master-computer-science` 修业时长：`Designed to be completed in as little as three semesters of full-time study`
