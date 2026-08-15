# 英 / 美 / 澳授课硕：申请机制国别 delta

> **服务于** [#5 英/美/澳授课硕在申请机制上到底差什么](https://github.com/jiangxidong/EduApplication/issues/5)
>
> **本文件与 [`uk-apply-timeline-deposit.md`](./uk-apply-timeline-deposit.md) 是配套的两半**：
> 那一份把**英国**的「申请入口 / 申请费 / 时间线 / offer 类型 / 押金」查到了逐校逐条；
> 本文件补齐 **(A) 美国与澳洲的同样六个维度**、**(B) 三国都还缺的四个维度**（材料清单、成绩单认证、语言、录取逻辑）、
> **(C) 三国对照与「可统一 / 必须分叉」判定**。
> **英国的具体数值不在此重复**，section C 的 UK 单元格一律引用那份文件，需要原文引述请回查它。
>
> **查阅日期**：本文件所有新增条目均为 **2026-08-14**（原始抓取）+ **2026-08-15**（整理与复核）。
> **取证纪律**：与 UK 文件同一套——每条主张给 URL + 查阅日期 + 页面自述周期；
> 查不到就写「**未找到**」，绝不用常识、排名站、中介口径补。
> **原始抓取物**存放于 `scratchpad/us/`、`scratchpad/raw/{columbia,uiuc,neu,utd}/`、`scratchpad/au/`、`scratchpad/q2/`、`scratchpad/q5/`、`scratchpad/q6/`。

---

## 目录

- [A-1 美国](#a-1-美国coursework-master)
- [A-2 澳洲](#a-2-澳洲coursework-master)
- [B 三国共缺的四个维度](#b-三国共缺的四个维度)
- [C 三国对照：共有骨架 vs 必须分叉](#c-三国对照共有骨架-vs-必须分叉)
- [未解决项](#未解决项)

---

# A-1 美国（coursework master）

样本四所 + 一所对照，覆盖不同层级与不同「招生哲学」：

| 学校 | 样本项目 | 定位 |
|---|---|---|
| Columbia SEAS | MS（CS / DS / AI 等全部 MS） | 私立顶尖，工院统一招生 |
| Cornell | CS M.Eng.（另对照 Graduate School 校级规则） | 私立顶尖，**校级 Graduate School + field 双层** |
| UIUC | MCS（Master of Computer Science，Siebel School） | 公立顶尖，**Graduate College 校级最低线 + 按国别细则** |
| Northeastern | Khoury MS in CS / CoE MS（另对照 Align） | 私立、国际生 MS 规模极大，**招生取向最激进** |
| UT Dallas | 研究生招生校级规则（另对照 Jindal / CS） | 公立中游，德州体系 |

## 0. 最重要的前置结论：美国没有「校级统一规则」这个层级本身就是错的问法

**「美国各校自建 portal、无统一规则」这个说法只对了一半，必须拆成三句才准确：**

1. **确实不存在跨校集中申请系统**（没有 UCAS 那种东西覆盖 coursework master）。
2. **但也不是「每校一套自研」——是一个很小的第三方厂商集合在供货。** 本次取证到：
   - **Columbia SEAS = Technolutions Slate**：申请入口 `apply.engineering.columbia.edu`，页面静态资源直接从 `technolutions.net` / `technolutions-net.cdn.technolutions.net` 加载（`framework/base.css`、`shared/build-mobile-global.css` 等 Slate 标志性路径）。
   - **Cornell = CollegeNET ApplyWeb**：`www.applyweb.com/cornellg/`，页面与说明文档中 `ApplyWeb` 出现 41 次、`CollegeNET` 26 次；Cornell CS M.Eng. 页面直接用 "check the status of your application on the Activity page in **College Net**" 指代申请系统。
   - **UIUC / UT Dallas / Northeastern 的申请系统底层厂商：未确认**（未取到能定性的静态资源指纹）。
3. **存在集中申请服务（CAS），但对 coursework master 是「可选加入」而非默认。** Liaison 运营 **GradCAS / BusinessCAS / EngineeringCAS / HealthProfessionsCAS / PostbacCAS / ResidencyCAS / UniCAS**，官方定位是 "For applicants, Liaison's GradCAS offers a single application portal… Streamlining the process for researching and applying to multiple programs of interest."（https://www.liaisonedu.com/centralized-application-service/gradcas/ ｜2026-08-14）。
   **但本次采样的 5 所院校的样本项目，没有一所走 CAS**——全部走自己的 portal。

> **对产品的含义**：不能按「美国 = 一校一表」建模，也不能按「美国 = 有集中系统」建模。
> 正确模型是「**平台层是少数厂商（Slate / ApplyWeb / CAS 家族 / 未知自研）＋规则层完全院校私有**」。
> 自动填表要按**平台**适配（可复用），业务规则要按**院校甚至按学院**建库（不可复用）。
> 这与 UK 的结论同构（UK 四所四种底层技术栈），但美国的平台集中度**更高**，Slate 在美国研究生招生中反复出现。

**校级 vs 学院级的分层，美国比英国更深一层：**
- Columbia：**SEAS 工院自己招生**（`apply.engineering.columbia.edu`，独立 Slate 实例、独立 FAQ、独立截止日表），不是校级 Graduate School。
- Cornell：**Graduate School 校级统一**收 ASOP + Personal Statement + 语言分数线，但 **field（CS M.Eng.）自己定截止日、推荐信封数、审理节奏**。
- UIUC：**Graduate College 定最低线**（GPA 3.0、语言分数、按国别细则），**Siebel School 定项目线**（MCS 建议 3.2、不要推荐信）。
- **同一所学校内，商科 / 工科 / CS 的规则可以完全不同**——与 UK 的发现一致（见 UK 文件「英国内部就有分歧」第 1、3 条）。

## 1. 申请费——跨度 $0 到 $105，且**有学校对整个 MS 层级直接免掉**

| 学校 | 金额 | 原文 | 来源 ｜ 查阅日 ｜ 周期 |
|---|---|---|---|
| Cornell（Graduate School 校级） | **$105**，国际生同价 | "The nonrefundable application fee is $105." ／ "International applicants pay the same $105 application fee as U.S. applicants" | https://gradschool.cornell.edu/admissions/application-steps/pay-fees/ ｜2026-08-14｜页面未标周期 |
| UIUC（Graduate College 校级） | **$90**，国际与国内同价 | "Domestic applicants are required to submit a $90.00 application fee (effective Spring 2026). International applicants are required to submit a $90.00 application fee." | https://grad.illinois.edu/admissions/apply ｜2026-08-14｜Spring 2026 起生效 |
| Columbia SEAS | **$85** | "$85 non-refundable application fee (payable by a major credit card through the online application system)" | https://www.engineering.columbia.edu/admissions-aid/graduate-admissions/how-apply/application-requirements ｜2026-08-14 |
| UT Dallas | **$75** | "$75 Application fee" | https://graduate-admissions.utdallas.edu/international/ ｜2026-08-14 |
| Northeastern CoE | **$0（MS 全免）／ $100（PhD）** | "$100 USD to be paid online by credit card **for PhD applicants**." ／ "**The application fee is waived for all new applicants applying to any of our Master of Science or Graduate Certificates for the Fall 2026 and Spring 2027 application terms.**" | https://coe.northeastern.edu/academics-experiential-learning/graduate-school-of-engineering/graduate-admissions/ ｜2026-08-14｜**Fall 2026 / Spring 2027** |

**⚠️ Northeastern 这条是本节最锋利的一条**：一所国际生 MS 规模极大的学校，把整个 MS 层级的申请费**按申请周期整体免除**，而 PhD 照收 $100。
这说明**申请费在美国是招生营销杠杆，不是行政成本**——它会**按周期变动**，产品不能把它当静态属性缓存。
UIUC 同页也印证了这一点：`"*The Fall 2025 domestic application fee is $70.00."` → **同一所学校，一年内 $70 → $90。**

**费用减免（waiver）是美国独有的制度化通道，英国四所无对应物：**
- Columbia：面向美籍/绿卡在读、军人/退伍军人、特定 pipeline 项目，走 `apply.engineering.columbia.edu/register/feewaiverform`。
- Cornell：含 **financial hardship** 一档，且**明确对国际生开放**（"May international applicants request an application fee waiver?" 单列 FAQ）。
  流程约束很硬：`"Paying the application fee or requesting a fee waiver is the final step in submitting your application… Once a fee is paid or a fee waiver request is submitted, you will not be able to make changes to your application."` ＋ `"If you plan to request a fee waiver, submit your application at least three business days before the application deadline."`
- UT Dallas 有 "Graduate Application Fee Waiver Program"（具体条件未取证）。

## 2. 同时申请上限——两种相反的制度，同为顶尖私立

| 学校 | 规则 | 原文 |
|---|---|---|
| **Columbia SEAS** | **硬上限 1**（每学期整个工院只能申 1 个项目），违反会作废 | "It is against school policy to apply to more than one program at the Fu Foundation School of Engineering and Applied Science per term, including Columbia Video Network (CVN). **Doing so may cause applications to be invalidated and application fees paid for additional applications will not be refunded.** Do not create a new application account in order to circumvent this policy." |
| **UIUC** | **不限，但每个项目一份申请 + 一份申请费** | "Applicants who wish to be considered for admission to multiple programs of study should submit a separate application, application fee, and appropriate supporting materials for each graduate program. You will only need to create one online application account and can add multiple applications to this account." |

UIUC 另有一条**联合项目例外**：`"You application will be viewed by both academic programs, and you only need to pay one application fee. When submitting your second application, please indicate 'Joint Program 2nd Application' in the Allied Agency field…"`

Cornell / Northeastern / UT Dallas 的同时申请上限：**未找到**。

> 对照 UK：UCL 硬上限 2、Coventry 明确不限、Manchester/Leeds 未公开（见 UK 文件）。
> **结论：这个字段在三国内部都不一致，只能做院校级参数，不能做国别默认值。**

## 3. 时间线与截止机制——美国的主导形态是「硬截止日」，与英国的「滚动 + 轮次」相反

**（a）Columbia SEAS：priority / regular 两档固定日期，逐项目不同**（2026 admission cycle）

| MS 项目 | Priority Deadline | Regular Deadline |
|---|---|---|
| Business Analytics / Chemical Eng / **Computer Science** / **Data Science** / Electrical Eng / Industrial Eng / MS&E / Operations Research | January 15 | February 15 |
| Civil Engineering Programs | February 1 | February 15 |
| **Artificial Intelligence** | March 15 | April 15 |
| Financial Engineering | —（无 priority） | January 15 |
| All Other MS Programs | —（无 priority） | February 15 |
| 博士（MS/PhD、PhD、EngScD） | 全部 December 15 | — |

补件宽限与降级机制写得很明确：
> "All application materials should be submitted and received within two to four weeks after the posted deadline. **Columbia Engineering reserves the right to review and render decisions on applications that remain incomplete following the posted deadlines.**"
> "**Deferrals will not be offered.**"

**（b）Cornell CS M.Eng.：硬截止，逾期不受理**
> "**Fall Admissions Deadline: February 1** ／ **Spring Admissions Deadline: October 1**"
> "**We do not process applications received after the above deadlines.**" ／ "Applications received after the deadline will not be reviewed."

审理节奏也写死了：
> "The processing of applications by the Computer Science M.Eng. Office begins about two weeks before the application deadline."
> "Approximately three weeks after the deadline, applicants will be able to check the status of their application on the Activity page in College Net."
> "Review of complete applications takes approximately **five to six weeks** after processing…"
> "Once an admission offer is made, applicants will have **approximately 1 month to respond** to the offer.（Spring 压缩到 two to three weeks）"

Cornell **校级**则明确把截止日下放：`"Application deadlines and requirements vary by field of study and degree program."`（Graduate School FAQ）

**（c）Northeastern Khoury：按「国际 vs 国内」+「校区」双维度分档，且明说会变**（Fall 2026 / Spring 2027）

| 周期 | 日期 | 适用人群 |
|---|---|---|
| Fall 2026 | **May 1** | 国际生，申请**美国校区** |
| Fall 2026 | **June 1** | 国际生，申请 **Vancouver 校区** |
| Fall 2026 | **August 30** | 国内生，全部校区 |
| Spring 2027 | **November 1** | 国际生，美国 + Vancouver 校区 |
| Spring 2027 | **December 1** | 国内生，全部校区 |

> "Deadline is subject to change."
> "Decision notification: **Applications will be reviewed on a rolling basis as they are received.**"

**⚠️ 这是唯一一所同时具备「固定截止日」和「滚动审理」的样本**——两者并不互斥：截止日管投递，滚动管出结果。

**（d）UIUC：校级不给日期，全部下放到项目**
> "Application deadlines vary by degree program and not all programs admit to all terms. Visit your proposed program of study's web site to determine the application deadline. **If you apply after the posted deadline, full consideration is not guaranteed and no application fee refunds will be granted.**"
> 申请费与截止日的耦合：`"The fee must be paid prior to your program's deadline, or your application will be unsubmitted."` ← **没交费 = 视为未提交**，这个语义英国四所都没有。

**（e）入学季**：美国样本普遍 **Fall + Spring 两个 intake**（Cornell CS M.Eng. Fall/Spring；Northeastern Fall/Spring；UT Dallas "fall, spring and summer semesters"；Columbia AI 等项目也有 Spring）。
对照 UK 三所 Russell Group 样本只有 9 月、Coventry 一年 6 次。**美国是稳定的 2–3 个 intake。**

## 4. Offer 类型——美国**没有** conditional/unconditional 这套二元术语，取而代之的是三种别的东西

**这是与英国最大的语义断层，产品若直接复用 UK 的 offer 状态机会建模错误。**

**（a）"contingent upon" 型条件（措辞而非状态）**
> Northeastern CoE：`"Any offer of admission is contingent upon a candidate's successful completion of an undergraduate bachelor's degree from a regionally accredited U.S. college or university, or its equivalent from a foreign college or university."`
> — 这是**写在录取信里的兜底条款**，不是一个叫 "conditional offer" 的独立状态。

**（b）UIUC 的 conditional admission 是「学历未毕业」专用，且是校级正式概念**
> `"Applicants enrolled in the final year of a bachelor's degree… and who meet the GPA requirements stated above **will be admitted conditionally pending receipt of final academic credentials showing the undergraduate degree as conferred**."`
> — 触发条件**唯一**（在读未毕业），不像英国那样把语言、均分、材料全打包成 condition。

**（c）UIUC 的 Limited Status / Full Status——英澳都没有的第三种形态**
UIUC 把**语言分数**做成了「录取等级」而不是「录取条件」：

| 考试 | Limited Status Admission 最低 | Full Status Admission 最低 |
|---|---|---|
| TOEFL iBT / Home Edition | **4.0**（2026-01-20 后）／ **79**（2026-01-21 前） | **5.0**（2026-01-20 后）／ **103**（2026-01-21 前） |
| IELTS Academic | **6.5** | **7.5** |
| Duolingo | **115** | **135** |

> "The English as a Second Language Placement Test (EPT) will be required prior to enrolling at Illinois for all students who score below the full status minimums listed in the chart above. Based on the EPT results, **students are generally required to enroll in non-credit 'English as a Second Language' coursework and take a reduced academic load** beginning the first semester at the University."

来源：https://grad.illinois.edu/admissions/instructions/04 ｜2026-08-14

> **对照英国**：英国把语言不达标做成 **combined offer + pre-sessional 语言班**（Leeds 2027-28 政策原文，见 UK 文件）；
> **美国 UIUC 做成 Limited Status 录取 + 入学后 EPT 内测 + 降课业负荷**。
> **同一个业务问题（语言不够怎么办），三种完全不同的制度产物。**

**（d）录取后核验（post-admit verification）——美国独有的一个正式流程节点**
> Columbia SEAS：`"Following admission to a Columbia Engineering graduate program, all students will participate in the Verification Process. During this process, all materials submitted by the student will be reviewed for authenticity. All students must provide written consent… All students must sign and date an authorization and release form to conduct the verification process. The link to do so will be provided once you have formally accepted our offer of admission."`
> 自报分数同理：`"Your self-reported scores will be verified during the post-admit verification process."`

**英国的等价物是「清 condition」，但语义不同**：英国是「你还没达到 → 达到了才算数」；美国是「你已经说了 → 我事后查你有没有说谎」。
**这直接决定产品的风险提示文案完全不一样。**

**（e）offer 有效期**：Cornell CS M.Eng. 约 1 个月（Spring 2–3 周）；其余样本**未找到**公开的统一时长。

## 5. 押金 / I-20 —— **美国的「钱 → 签证文件」链条与英国的「押金 → CAS」链条不是同一条链**

**这是本节最重要的结论，也是三国 delta 中最硬的一处分叉。**

### 5.1 美国的 enrollment deposit：占位用，**与签证文件无关**

| 学校 | 金额 | 性质 | 原文 |
|---|---|---|---|
| **Columbia SEAS** | **至少 $4,000，按项目不同**（具体写在录取信里） | 交押金 **= 接受 offer** | "The tuition deposit amount will be **at least $4,000.00** and depends on the program of admission. The tuition deposit amount can be found on your admission letter." ／ "**Yes, all newly admitted MS students are asked to submit a tuition deposit to accept the offer of admission and secure their place in the class.**" |
| **Cornell** | 金额**未找到**；且**并非所有项目都要** | 交押金是 response form 的一部分 | "**Please note: doctoral programs and many master's programs do not require an enrollment deposit.**" ／ CS M.Eng.：`"The response includes completing an online response form (with the required deposit), and for international students, financial certification documents."` |

退款规则两校一致——**不退，但抵学费**：
> Columbia：`"The tuition deposit is non-refundable and non-transferable… if an admitted applicant pays the deposit, but fails to enroll for the particular program and term of the admission offer, the deposit will not be returned."` ／ `"if you do enroll as expected the full deposit will be credited toward your student account after registration. **There are no exceptions to this long-standing and standard university practice.**"` ／ 入账时点：`"Your tuition deposit will appear in your student account after the add/drop period in your first semester."`
> Cornell：`"Rather than being refunded to you, your enrollment deposit will reduce the amount of tuition you will pay for your first semester."`

**⚠️ 与英国的两点关键差异：**
1. **没有 14 天法定冷静期。** UCL 和 Manchester 都有（英国消费者法），美国两所都是「no exceptions」。
2. **押金金额可以远高于英国。** Columbia ≥ $4,000（约 £3,100+）已接近 UCL 的 £4,270，但 UCL 是按学费 10% 算的、Columbia 是按项目定的固定额。

Northeastern / UIUC / UT Dallas 的 enrollment deposit：**未找到**。

### 5.2 I-20 的真正前置是**资金证明**，不是押金

> Columbia CS：`"International students will be asked to submit the financial statement after they are accepted into the program **through the I-20 application process**. There is no need for you to submit it before the decision is made."`
> Columbia SEAS FAQ：`"You will be required to submit financial statements to the International Students and Scholars Office (ISSO) after you are accepted into the program."`
> UIUC：`"International applicants who are requesting F-1 or J-1 visa eligibility documents are also required to provide **a copy of their passport and evidence of financial support**."`
> Cornell CS M.Eng.：`"…and for international students, **financial certification documents**."`

**Northeastern OGS 把资金证明的规格写得最细（可直接作为产品的字段规范）：**
> "Please show all sources of your financial support and ensure that the **total amount of demonstrated available funds equals or exceeds the estimated expenses** (includes tuition and fees, as well as living expenses) for yourself and any dependents."
>
> 文件必须满足全部 6 条：`Must be in English (or certified English translations must be included)` / `Must be issued within 12 months of your program start date` / `Must be on official letterhead` / `Must clearly state the account holder's name in English` / `Must clearly list the currency of the funds in the account (if not U.S. dollars) in English` / `Must include a currency conversion from the original currency to USD if the funds are not in U.S. dollars` / `Must clearly indicate the total amount of readily available liquid funds`
>
> **可接受**的资金来源：`Checking or savings accounts` / `Money market accounts` / `Certificates/term deposits/fixed deposits with maturity dates no later than the program start date or stating that funds can be withdrawn at anytime` / `Educational loans (a loan application is not sufficient)` / `Benevolent account` / `Current account` / `Post office accounts` / `University scholarships`
>
> **明确不接受**：`Investment portfolios (Examples: stocks, bonds, mutual funds)` / `Retirement plans` / `Public provident funds` / `Available lines of credit` / `Wire transfers` / `Deeds to real estate` / `Leases with rental income` / `Salary agreements or paystubs` / `Income tax forms` / `Material items (examples: livestock, land, jewelry, fur)`

来源：https://international.northeastern.edu/ogs/new-students/financial-requirements/ ｜2026-08-14｜**estimate of expenses for academic year 2026-2027**

> ### 🔴 结论：英国的「交押金 → 拿 CAS」在美国**没有对应物**。
> 美国是两条**互不相交**的链：
> - **占位链**：录取 → 交 enrollment deposit（部分项目才有）→ 保住名额
> - **签证链**：录取 → 接受 → 提交**资金证明 + 护照** → 学校 ISSO/OGS 签发 **I-20** → 交 **I-901 SEVIS fee** → 面签 F-1
>
> 押金的钱**不算进**资金证明门槛，资金证明也**不因为交了押金而降低**。
> **产品若把「押金」建模成签证前置，美国全线错误。**

---

# A-2 澳洲（coursework master）

样本六所，层级从 Go8 到应用型再到区域型：

| 学校 | 定位 | 平台 |
|---|---|---|
| University of Melbourne | Go8 | TechnologyOne eStudent（自建） |
| UNSW Sydney | Go8 | StudyLink Connect（Flywire） |
| University of Queensland | Go8 | StudyLink Connect（Flywire） |
| Adelaide University | Go8 | StudyLink Connect（Flywire） |
| RMIT | 应用型 / 国际生规模大（澳洲的 Coventry 位） | 自有 application portal（厂商未确认），支付走 Convera |
| University of Tasmania | 区域型 | 自有 application portal（厂商未确认） |

> 平台取证、agent 双轨制、GS 声明、文件上传与认证、推荐信机制的**逐字取证**已在
> `scratchpad/au-notes.md`（30KB）+ `scratchpad/au-fields.tsv`（143 行字段表）里做完，本节不重复，只在
> [B 节](#b-三国共缺的四个维度)引用其结论。本节补 au-notes 完全没做的：**时间线 / offer 类型 / 押金与 CoE / 入学季 / 国家级监管层**。

## 0. 最重要的前置结论：澳洲有一个**国家级监管地板**，英美都没有

这是三国 delta 中**最结构性**的一条，直接决定了「哪些维度在澳洲可以统一建模」。

**（a）HESF（Higher Education Standards Framework (Threshold Standards) 2021）——所有澳洲高校的法定招生底线**
> **1.1 Admission**
> "1. Admissions policies, requirements and procedures are documented, are applied fairly and consistently, and are designed to ensure that admitted students have the academic preparation and proficiency in English needed to participate in their intended study, and no known limitations that would be expected to impede their progression and completion."
> "2. The admissions process ensures that, **prior to enrolment and before fees are accepted**, students are informed of their rights and obligations, including: a. all charges associated with their proposed studies as known at the time and advice on the potential for changes in charges during their studies; b. policies, arrangements and potential eligibility for credit for prior learning, and c. policies on **changes to or withdrawal from offers, acceptance and enrolment, tuition protection and refunds of charges**."
> "3. Admission and other contractual arrangements with students … **are in writing** and include any particular conditions of enrolment and participation…"

来源：`scratchpad/raw/au-scrapes/hesf.pdf` / `hesf.txt`（Federal Register of Legislation 官方 PDF）｜2026-08-14

**（b）ESOS 框架 —— 国际生专用的第二层法定要求**
> "Australia provides rigorous protection for international students through the *Education Services for Overseas Students Act 2000* (ESOS Act)…"
> "The *National Code of Practice for Providers of Education and Training to Overseas Students 2018* (National Code 2018) sets **nationally consistent standards** for the delivery of courses to overseas students."
> "Only education institutions registered under the ESOS Act and listed on **CRICOS** can enrol overseas students to study in Australia on a student visa."
> **Tuition Protection Service (TPS)**：`"Arrange a refund of any pre-paid tuition fees if there is no course that meets their needs"`
> **PRISMS**：CoE 的签发系统本身是联邦系统，不是学校系统。

来源：https://www.education.gov.au/esos-framework ｜2026-08-14

> ### 🔴 这一条的产品含义
> **英国的一致性来自「行业惯例 + 签证制度」；澳洲的一致性来自「成文法」。**
> 所以在澳洲，下列维度可以放心做**国家级默认值**（各校只是参数不同、机制相同）：
> offer 必须书面、必须列明全部费用、必须写明退款与撤销政策、CoE 必经 PRISMS、学费保护经 TPS。
> 而美国**完全没有这一层**——I-20 是联邦 SEVIS 规定，但**招生本身没有任何联邦标准**。
> 这解释了为什么美国样本的 offer 术语最不统一、退款规则最不透明。

**（c）NOSC / 国际生招生上限 —— 澳洲独有的「名额会用完」机制**
> UNSW：`"All programs have exhausted their New Overseas Student Commencement (NOSC) allocation for 2026 intakes and are closed to new applications for 2026."`
> `"Some programs are at capacity for 2026 intakes and new applications are closed to New Overseas Student Commencement (NOSC). Applications to all 2027 intakes are open."`
> 豁免范围也写明了：`"UNSW Canberra, AGSM, Higher Degree Research, Study Abroad and non-award students are not impacted."`

来源：https://www.unsw.edu.au/study/international-students/admissions-info ｜2026-08-14｜2026 / 2027 intakes

> **对产品的直接含义**：澳洲存在「**整个申请季、整所学校、对国际生直接关闭**」这种状态。
> 英美样本中都没有等价物（英国是滚动招满，美国是逐项目截止）。
> 这是 [#4 状态层](https://github.com/jiangxidong/EduApplication/issues/4) 必须支持的一种**院校级不可用状态**，不是「截止了」也不是「满了」，是「配额用尽」。

## 1. 申请费——Go8 四校齐平，但应用型院校按**国籍**收费

| 学校 | 金额 | 备注 | 来源 |
|---|---|---|---|
| Melbourne | **AUD $154** | 不可退 | `au-notes.md` §7（study.unimelb.edu.au）｜2026-08-14 |
| UQ | **A$150** | 不可退 | `au-notes.md` §7｜2026-08-14 |
| UNSW | **AUD $150** | 不可退，**仅接受信用卡** | `au-notes.md` §7｜2026-08-14 |
| Adelaide | **AUD $150** | 不可退 | `au-notes.md` §7｜2026-08-14 |
| **RMIT** | **AU$100，但只对名单上的国家收；名单外为 $0** | **中国不在名单上 → 中国申请人免费** | https://www.rmit.edu.au/study-with-us/international-students/apply-to-rmit-international-students/application-fee ｜2026-08-14 |

**RMIT 这条是本节最反直觉的一条，原文照抄：**
> "You will need to pay an application fee of **AU$100 if you are from one of the following countries**, except for applicants applying for a Higher Degree by Research."
> "The application fee is **non-refundable, but will be credited to your tuition fee deposit** once you accept your offer and commence your program."

名单为 **非洲绝大多数国家 + India (selected provinces and regions) + Pakistan**（全文逐条核对，共 60 个条目）。
**全文检索 "China" 命中 0 次 → 中国申请人在 RMIT 不缴申请费。**

> **这是「申请费 = 反欺诈/风控工具」的直接证据**，不是行政成本。
> 与 UNSW 押金按 "visa risk rating" 定额（见下 §4）、UNSW 按国籍分 offer round（见下 §3）是同一套逻辑的三种表现。
> **英国四所无一按国籍定申请费**（Coventry 按地区定的是**押金**不是申请费）。

**另一个英美都没有的机制**：RMIT 的申请费**会被抵扣进押金**——申请费与押金在澳洲是同一个资金账户上的两笔，在英美是两笔互不相干的钱。

## 2. 同时申请上限——澳洲是「一份申请里填多个志愿」，不是「交多份申请」

**这是与英美最本质的形态差异。** 英美是「一个项目 = 一份申请 = 一份费用」；澳洲是「一份申请 = N 个 preference」。

| 学校 | 志愿数 | 原文 |
|---|---|---|
| UQ | **3**（1 + up to 2 other preferences） | `au-notes.md` §7 |
| UNSW | **3** | `"up to three programs in your preferences"` ＋ `"You can only submit one application at a time"` |
| Melbourne | **3 或 4——两个官方页面互相矛盾，未解决** | 国际研究生课程页 `"You can apply for up to 3 courses in a single application"`；通用在线申请页 `"You can include up to four preferences"` |
| Adelaide / RMIT / UTAS | **未找到** | — |

UNSW 另有一条**很硬的连带规则**：
> "**Program changes are not available and require a new application.** It is recommended that multiple preferences are listed in the initial application."
> → 志愿是**一次性的**，改志愿 = 重新申请。这与英国「撤回再申请」（UCL 撤回仍占额度）的语义又不一样。

RMIT 则相反，允许改：`"If you have an offer or existing application but wish to apply for another course, you can request to change your preference through the application portal."`

## 3. 时间线与截止机制——澳洲有**四种**并存的形态，且 UNSW 的是三国中最结构化的

**（a）UNSW：按国籍分两种发放模式 + 三日期型 offer round（本次调研中最结构化的截止机制）**

> "Undergraduate and postgraduate offers for applicants from **International Student Award (ISA) eligible countries** are issued **on a weekly basis**. Offers for applicants from other countries are made **according to offer round schedules**."

PG offer round（节选，2026–Term 1 2027）——**每轮三个日期**，英美样本都只有两个：

| Term | 学生类型 | Complete application deadline | Offer release date | Acceptance deadline |
|---|---|---|---|---|
| Term 1 2027 | Both | Thu 28 May 2026 | Thu 9 Jul 2026 | Thu 3 Sep 2026 |
| Term 3 2026 | Both | Thu 4 Jun 2026 | Thu 16 Jul 2026 | Fri 14 Aug 2026 |
| Term 1 2027 | Both | Thu 4 Jun 2026 | Thu 30 Jul 2026 | Thu 24 Sep 2026 |
| Term 3 2026 | **Onshore only** | Thu 11 Jun 2026 | Thu 6 Aug 2026 | Thu 10 Sep 2026 |
| Term 1 2027 | Both | Thu 18 Jun 2026 | Thu 13 Aug 2026 | Thu 8 Oct 2026 |
| Term 2 2027 | Both | Thu 2 Jul 2026 | Thu 10 Sep 2026 | Thu 5 Nov 2026 |
| Term 3 2027 | Both | Thu 9 Jul 2026 | Thu 17 Sep 2026 | Thu 12 Nov 2026 |
| Term 1 2027 | Both | Thu 30 Jul 2026 | Thu 24 Sep 2026 | Thu 19 Nov 2026 |

**⚠️ 还有一条按国籍的硬截断：**
> "If the student is a citizen of **India or Pakistan** and is currently residing in their home country **or a citizen of African countries (excluding South Africa)** and is currently residing in Africa (excluding South Africa), **the last offer round for T1 2027 is Thursday, 19 November 2026.**"

另有 **onshore / offshore 分档**（部分轮次只对已在澳境内者开放）——**英美样本都没有这个维度**。

来源：https://www.unsw.edu.au/study/international-students/admissions-info ｜2026-08-14｜2026 & 2027 intakes

**（b）RMIT：每个 intake 三个日期（申请截止 / 出结果 / 接受截止），另有面试专用截止**
> "Application deadlines refer to the date by which your application must be [submitted]. **You must submit all required documents by the deadline in order for us to assess your application. Applications submitted with missing documents will not be assessed.**"

Semester 3 2026（节选）：申请截止 **28 August 2026**，接受截止 **1 September 2026**；另一档为 **14 October 2026 / 16 October 2026**。
面试专用轨：`"If you are required to attend an interview with International Admissions you must attend an interview by 30 July 2026 and accept your offer by 3 August 2026."`（另一档为 10 September / 14 September 2026）

来源：https://www.rmit.edu.au/study-with-us/international-students/apply-to-rmit-international-students/application-dates ｜2026-08-14｜Semester 3 2026

> **⚠️ 与英国 Manchester 的对比很值得注意**：Manchester 的轮次给「投递截止 + 出结果」两个日期；
> UNSW 和 RMIT 都给「投递 + 出结果 + **接受截止**」三个日期。**接受截止日被前置公布**，是澳洲特有的。

**（c）Melbourne：不给截止日，给「审理时长承诺」**

| 申请类型 | Indicative turnaround time |
|---|---|
| Undergraduate | 4 – 8 weeks |
| **Graduate coursework** | **4 – 8 weeks** |
| Graduate Research | 8 – 12 weeks |

并明确列出会导致超时的四类例外：
> `Incomplete applications` / `Additional information or documents required` / `Courses with specific additional processes（interviews, auditions, GMAT, LSAT, GAMSAT/MCAT）` / `**Courses with fixed selection rounds**`
> "Your application will likely be assessed more promptly if you apply for **one intake** and provide all the required information at the time of application. **If your application is put on hold to request missing information or documents, the turnaround times listed on this page will not apply.**"

来源：https://study.unimelb.edu.au/how-to-apply/indicative-turn-around-times ｜2026-08-14｜页面未标周期

> **这是三国样本中唯一一所公开承诺审理时长的学校。** 英国四所无一给出；美国只有 Cornell CS M.Eng. 给了内部节奏（5–6 周），且是项目级不是校级。

**（d）UTAS：给到日历日、且明确区分「可迟交」与「迟交不受理」**

| 周期 | 日期 | 事项 |
|---|---|---|
| 2026 | 25 Jun | 2027 全部本科与研究生课程开放申请 |
| 2027 | **19 Feb** | Semester 1 **非配额（non-quota）**本科与研究生课程最后截止（11:59 pm AEDST） |
| 2027 | **2 Jul** | Semester 2 非配额本科与研究生课程最后截止（11:59 pm AEST） |
| 2026 | 30 Sep | 部分**配额**课程首轮截止；另一些课程"Late applications for these courses **will not** be accepted" |

来源：https://www.utas.edu.au/study/apply/key-dates ｜2026-08-14｜**2027 与 2026 两个周期并列公布**

> ⚠️ 该表为**校级综合**日程（本科 + 研究生同表），未单独标注国际生。
> **UTAS 国际生是否另有更早的截止日：未找到。**

**（e）入学季：澳洲是稳定的 2 个主 intake + 部分学校第 3 个**
> RMIT：`"Typically, Australian universities have 2 main intakes—**Semester 1** (late February/early March) and **Semester 2** (mid-July). Some universities, like RMIT, offer an additional third intake—**Semester 3**—for specific courses, starting around September/October/November and catering mainly to international students."`
> 且**每个 intake 的课程可用性不同**：`Semester 1 = All courses` / `Semester 2 = Majority of courses` / `Semester 3 = A select number of courses for international students`

**UNSW 用的是 term 制不是 semester 制**（Term 1 / Term 2 / Term 3），offer round 表里三个 term 全部出现。
→ **同一个国家内，学期制本身就不统一**，产品的日历模型不能假设「澳洲 = 两学期」。

来源：https://www.rmit.edu.au/study-with-us/international-students/intakes ｜2026-08-14｜2026

## 4. Offer 类型——澳洲有**三种**，其中「packaged offer」是英美都没有的

**RMIT 给出了本次三国调研中最完整的 offer 类型定义（逐字）：**

| 类型 | 定义原文 |
|---|---|
| **Full offer** | "A full offer means you have met all admissions requirements for your chosen course and have been offered a place." |
| **Conditional offer** | "Conditional offers mean your offer is subject to meeting all the conditions in your offer letter. **You can accept your conditional offer to secure your place, but you will only be able to receive full acceptance and enrol once you meet all conditions.**" 典型 condition：`Evidence of meeting the English language requirement` / `Academic transcripts` / `Graduation certificates` |
| **Packaged offer** ⭐ | "A packaged offer **combines two or more courses in a single offer**. These may include combinations of **English for Academic Purposes (EAP), Foundation Studies, Vocational Education, and Higher Education programs**. You must successfully complete the first course and meet the admissions requirements of the next course in your package before you can progress. **Once you accept an unconditional packaged offer, we will issue multiple Confirmations of Enrolment (CoEs) for each course in the package.**" |

来源：https://www.rmit.edu.au/study-with-us/international-students/accept-your-offer/understand-your-offer ｜2026-08-14

> **packaged offer 与英国 Leeds 的 combined offer 不是一回事**：
> Leeds 的 combined offer 只覆盖「pre-sessional 英语 + PGT」两段（见 UK 文件）；
> RMIT 的 packaged offer 可以串 **EAP → Foundation → VET → Higher Education 四段**，并且**每段签发一张独立 CoE**。
> **产品若把 offer 建模成「一个申请 ↔ 一个 offer ↔ 一个课程」，澳洲的 packaged offer 会建模不出来。**

**术语差异要注意**：RMIT 用 **full offer** 而不是 unconditional；同一页面下方又出现 `"Once you accept an unconditional packaged offer"`——**同校同页两个词混用**。UNSW 政策文件用的是 `conditional offer`（`"The student did not meet the conditions of their conditional offer"`）。**澳洲的「非条件 offer」没有统一词。**

**其他 offer 层机制：**
- **offer lapse date（失效日）**：Melbourne `"Your offer letter will include a lapse date. This is the date by which you will need to accept your offer"`；RMIT `"If you don't accept or defer your offer before the last day to enrol, your offer will be cancelled and you will need to submit a new application."`
- **reconsideration / 复议**：Melbourne 有正式通道 `"If you would like to request reconsideration, you can submit a formal request through your application portal."`（`study.unimelb.edu.au/how-to-apply/request-a-review`）。**英美样本都未找到等价的正式复议通道**——Cornell 反而明说 `"It is not practical for us to comment on individual applicants as to why they were not offered admission."`
- **defer（延期）**：UNSW `"Offer deferrals are not automatically approved and must be requested via StudyLink."`；RMIT 有 defer 通道。对照英国：UCL/Manchester/Leeds 三所样本项目**明确不允许 defer**，美国 Columbia SEAS `"Deferrals will not be offered."`，Cornell 则 `"Under some special circumstances you may be able to defer entrance to your program for one or two semesters."`
- **签证框架介入录取决策**：RMIT `"If your application is unsuccessful based on not meeting **Simplified Student Visa Framework (SSVF)** criteria, we cannot review your application."` → **澳洲把签证风险判定前置进了录取环节**，且拒了不给复议。

## 5. 押金与 CoE —— 澳洲与英国**同构**（钱 → 签证文件），但金额与构成不同

**链条形态与英国的「押金 → CAS」完全一致，可以共用状态机：**

| 学校 | 链条原文 |
|---|---|
| **UNSW** | "When you accept your offer online, **you'll need to pay a tuition deposit to guarantee your place and receive an Electronic Confirmation of Enrolment (eCoE)**. The eCoE will be required to arrange your visa." |
| **UQ** | "Log in to UQ applications to: accept your offer / pay your tuition fee deposit / pay your Overseas Student Health Cover… **We'll process your payment. If everything is okay, we'll issue your Confirmation of Enrolment (CoE) and notify you.**" |
| **Adelaide** | "Step 2 – Pay your **First Tuition Payment** and organise Overseas Student Health Cover (OSHC)… Step 4 – **After we have received your acceptance of admission in the Online Application System, along with your First Tuition Payment and OSHC (if applicable), the University will send you or your Education Agent your Confirmation of Enrolment (CoE). This typically takes 1-2 business days** but may increase during peak times." |
| **RMIT** | "We can only issue a Confirmation of Enrolment (CoE) **after you have fulfilled the conditions and paid your deposit**." ／ "Once your payment is received and all requirements are met, RMIT will process your acceptance and **issue your CoE within five working days**." |
| **UTAS** | "Accept your offer and pay your fee deposit, health cover and any other fees indicated on your Letter of Offer… **Once the acceptance of offer and fee payments have been received, visa processing eligibility will be determined by the university before an electronic Confirmation of Enrolment (eCoE) form will be emailed to you or your University of Tasmania Representative Agent.**" |

### 5.1 三条与英国的关键差异

**差异 1：押金里**打包了 OSHC**，英国的押金只是学费。**
> RMIT：`"The next step is to pay the deposit amount specified in your offer letter. This may include **tuition fees and Overseas Student Health Cover (OSHC), as well as any ELICOS and enrolment fee**, if applicable."`
> UTAS：`"pay your fee deposit, health cover and any other fees"`
> → **澳洲的「接受 offer 那一笔钱」是复合的**：学费押金 + 强制医保 + 可能的语言班学费 + 注册费。
> 英国的 CAS deposit 是**纯学费预付**（NHS surcharge 是签证阶段单独交给英国政府，不经学校）。
> **这直接改变产品的费用估算模型：澳洲要在「接受 offer」这一步算四项，英国只算一项。**

**差异 2：金额量级更大，且 Melbourne 是定额巨款。**
> Melbourne 官方 Terms & Conditions：`"Your tuition, deposit, and Overseas Student Health Cover (OSHC) fees will be detailed in your personalised Student Acceptance and Payment Agreement. **To confirm your acceptance, you must submit a payment of $AUD 17,000 or the amount stated in your Agreement**, and evidence of visa-length OSHC to the University with the completed acceptance form by the date stated in the letter of offer. **Your deposit payment will be credited to the cost of your enrolment in your first semester.**"`
> 来源：`scratchpad/au/um-tc.pdf`（University of Melbourne 国际生 Terms and Conditions 官方 PDF）｜2026-08-14
>
> **AUD $17,000 ≈ £8,800 ≈ 是 Leeds（£2,000）的 4 倍多，是英国四所中最高的 Coventry（£8,000）的 1.1 倍。**

**差异 3：押金金额由「签证风险评级」决定——英美都没有这个变量。**
> UNSW Student Fee Procedure §2.4：`"The required deposit is outlined in each student's letter of offer and **varies according to a range of factors including the student's mode of study, visa risk rating, sponsorship and scholarship status**."`
> §2.1：`"International students accepting offers of admission to a program must pay a deposit fee to secure their place."`
> §2.2：`"Deposits are used to confirm a student's intention to study and are **held as a credit on their account** until a tuition charge is raised against their enrolment."`
>
> 来源：`scratchpad/au/unsw-feepolicy.pdf`（UNSW Student Fee Policy / Procedure 官方 PDF）｜2026-08-14

> **「押金金额是申请人属性的函数」——这一条在英美样本中都不成立。**
> 英国 Coventry 按**地区**分档（静态表可穷举）；UNSW 按 **visa risk rating**（Home Affairs 的动态评级 + 学校内部判定）→ **产品无法离线算出金额，只能读 offer letter**。

### 5.2 押金退款：ESOS 保护 + 学校反悔惩罚，两层并存

UNSW Student Fee Procedure 的规则最完整：
> **反悔惩罚**：`"International fee-paying students who discontinue from their program before the census date in their commencing semester will be charged **50% of their deposit fee**."` ／ `"This fee will serve as a disincentive or deterrent to discontinuing in the commencing semester after committing to a place at UNSW."`
> **豁免情形（逐字，共 5 条）**：
> - `"The applicant has not been granted a student visa (This does not include cases where the applicant withdrew their student visa application, or where the applicant has been refused a student visa due to providing fraudulent documentation)"`
> - `"The applicant is unable to attend because of UNSW approved documented illness or misadventure"`
> - `"UNSW is unable to provide the program for which the student has accepted an offer"`
> - `"The student did not meet the conditions of their conditional offer"`
> - `"UNSW withdrew the Confirmation of Enrolment (CoE) due to the inability of the student to meet the University's Genuine Temporary Entrant (GTE) requirements"`
> **流程**：`"Students seeking to have the charge waived must submit a Refund Request Form with supporting documentation to Student Financials at fees@unsw.edu.au. Applications will be assessed and a **response provided within five working days**."`

> ⚠️ **注意最后一条豁免仍写 GTE**——GTE 已于 2024 年被 **GS（Genuine Student）** 取代（见 `au-notes.md` §3），
> 该政策文件的措辞**滞后于现行制度**。**产品不能把政策文本当成现行制度的唯一真值源。**

**⚠️ 一个必须隔离的陷阱**：UNSW 同一份 Fee Policy 的 **Schedule 1 是 UNSW Bengaluru（印度校区）专属**，
其退款比例表（15 天前退 100%、15 天内 90%、之后 80%/50%/0%）依据的是**印度 UGC 2024 年规定**，
`"apply … to the exclusion of all other provisions in this Policy in relation to fee refunds"`。
**这套数字与澳洲本土完全无关，抓取时极易误采。**

### 5.3 Conditional CoE —— 澳洲独有，英国 CAS 无此形态
> RMIT：`"If you require a Confirmation of Enrolment (CoE) to apply for a student visa but **do not yet have your official final results**, you may be eligible to request a **conditional CoE**. This allows you to start your student visa application earlier. A conditional CoE may be issued if your current academic results indicate that you are on track to meet your program's entry requirements, and your final results are expected to be released close to your program commencement date."`
> 且**只能经 agent 申请**：`"To find out if you are eligible for a conditional CoE please contact your agent."`

> 对照英国：CAS 的硬前置是**必须先清完所有 offer condition**（UK 文件「英国内部一致的部分」第 4 条，四所无例外）。
> **澳洲允许在未清 condition 的情况下先发一张有条件 CoE 去启动签证** —— 这是一个英国不存在的时间线捷径。

### 5.4 CoE 后续维护是持续义务（英美都无对应物）
> RMIT：`"You must have a valid CoE while studying on a [student visa] in Australia… RMIT must update the details of your CoE and notify the Department of Home Affairs if you: [change course] / are granted a leave of absence (a new CoE will be issued for your return) / complete your program more than 2 months before the end date on your CoE / [CoE cancelled for] non-payment of fees."`

---
