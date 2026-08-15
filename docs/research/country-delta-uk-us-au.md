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

# B 三国共缺的四个维度

> 本节按**维度**组织（不是按国家），因为这四个维度的国别差异恰恰是最需要横着看的。
> 取证策略：**国家层面 + 每格 1–2 所样本院校**，够判断「能不能统一」即可，不做全院校库。
> 凡未在本次抓取范围内取到原文的格子，一律写「**未找到**」。

---

## B-1 材料清单：PS vs SOP、CV、推荐信

### B-1.1 个人陈述——**三国是三种不同的文体，不是同一份文档的三种长度**

| 国家 | 文档形态 | 长度约束（逐字取证） |
|---|---|---|
| **英国** | **单份 Personal Statement**，写「为什么是这个专业 / 这所学校」 | **UCL 校级**：`"You can type your personal statement in the online application form (3,000-character limit, including spaces) or upload it as a separate document. If you upload your personal statement, you can go over 3,000 characters but it cannot be longer than two sides of A4 paper (size 12 font and single spaced)."`<br>**UCL CS MSc（项目级更严）**：`"Your personal statement should answer the following questions and should not be longer than one A4 size page"`<br>**Leeds LUBS**：`"Your personal statement should be no more than 500 words in length, be written in English and be your own work."`<br>**Leeds EPS（工院）**：`"A personal statement is not required as standard however it could strengthen your application in the following circumstances… The personal statement should be no more than one side of A4"`<br>**Manchester CS（授课型 MSc / modular）**：`"statement of aims - (about half an A4 sheet) briefly summarising your motivation"`<br>**Manchester MSc Advanced Computer Science**：**根本不要**（`"References and personal statements are not required for your application to this programme"`，见 UK 文件） |
| **美国** | **两份分工明确的文档**（Cornell 校级强制），或**一份 PS + 多个 short answer**（UIUC） | **Cornell Graduate School**：`"There are two types of statements included in the Graduate School's online application, (1) the **Academic Statement of Purpose** and (2) the **Personal Statement**, both of which are **required for all graduate degree programs**."`<br>ASOP 长度：`"Unless otherwise noted, **one to two pages** in a standard font and size is typical"`<br>分工写死了：`"Content in the Personal Statement should **complement rather than duplicate** the content contained within the Academic Statement of Purpose, which should focus explicitly on your academic interests, previous research and/or relevant professional experience…"`<br>**Columbia SEAS**：只有一份 Personal Statement，`"We recommend your Personal Statement be **between 250 and 1,000 words**. **Your application will not be negatively impacted should you exceed this recommendation.** Please do not email us to request permission to exceed this recommendation, no permission is necessary."`（**软上限**，与英国的硬字符数限制是两种约束）<br>**UIUC**：Academic Statement `"The length of these statements is chosen by your proposed program of study and range from **500 to 1000 words maximum**"`；Personal Statement 则是 `"a series of short-answer personal statement essay questions. **Each essay has a 250-word maximum.** Questions 1-2 are required from all applicants, while questions 3-4 are optional" ` |
| **澳洲** | **主流不要个人陈述**；被 **GS（Genuine Student）声明**取代 | Melbourne 官方文件清单只写 `"personal statements, portfolios or results from aptitude tests **may also be required**"`（条件性，非默认）<br>**真正强制的是 GS**：Melbourne `"The Genuine Student declaration form is a **mandatory component** of the online application for applicants applying from 16 July 2026."`<br>GS statement（offer 后触发时）**每小问 < 150 words × 4 小问**，且写作规则含 **`Not be AI-generated.`**<br>（逐字取证见 `au-notes.md` §3.1） |

> ### 🔴 这是三国 delta 中对产品影响最直接的一条
> 1. **英国 PS ≠ 美国 SOP。** 英国 PS 是**动机文书**（为什么这个专业、这所学校）；
>    美国 ASOP 是**学术履历陈述**（研究经历、方法、匹配度），且另有一份 Personal Statement 讲背景与多元性。
>    **不能用一份稿子改长度去投两国。**
> 2. **长度约束的性质不同**：英国给**硬上限**（3,000 字符 / 一页 A4 / 500 词）；美国给**建议区间且明说超了不扣分**。
> 3. **澳洲的等价物是合规声明不是文书**，且**明文禁止 AI 生成**——这是产品的红线。
> 4. **同一所英国学校内部，学院之间从「必写 500 词」到「根本不要」都有**（Manchester ACS vs Manchester CS modular）。

### B-1.2 CV / Resume——**美国普遍必需，英澳条件性**

| 国家 | 结论 | 逐字取证 |
|---|---|---|
| **美国** | **默认必需** | Columbia SEAS 必需项清单含 `Resumé/CV`，且列明六类内容：`Employment held (include title of jobs and start/end dates)` / `Research activities` / `Academic honors, including fellowships` / `Volunteer or community service` / `Extracurricular activities` / `Honorary societies and awards` / `Publications`<br>Northeastern CoE：`"Resume — Include your resume."`（与 SOP 并列为必需项）<br>UIUC：`"Resume and Application Statements"` 为申请表固定分区 |
| **英国** | **条件性必需，触发条件是「毕业年限」** | Manchester MSc ACS：`"**A CV if you graduated more than three years ago.**"` ＋ `"If you graduated more than three years ago, we will also consider the information contained on your CV and any relevant work experience you have to assess if you are still able to fulfil the entry criteria."`<br>Manchester AMBS：`"**If you have more than two years' postgraduate work experience** you need to submit your CV."`<br>Leeds EPS：`"CV/Resume. Please include an up-to-date CV… **Decisions are normally made considering your academic background only**, however a CV can be useful in clarifying your education and possibly considering work experience where appropriate. A CV can also help explain any gaps between education and **may also help if your academic background is borderline**."`<br>Manchester CS（modular）：`"CV - showing academic and employment history"`（该项目为必需） |
| **澳洲** | **未找到**任何一所把 CV 列为授课型硕士必需项 | Melbourne / UNSW / Adelaide / UQ 的公开文件清单均未列 CV（`au-notes.md` §6.1 的负面证据同源）。**注意这是「清单未列」，不等于「明确不要」。** |

> **产品含义**：英国的 CV 是「解释异常」的补充材料（gap、跨专业、borderline），
> 美国的 CV 是「结构化履历」的正式材料。**两者的写法与信息密度要求不同。**

### B-1.3 推荐信——**数量、提交机制、是否阻塞，三国全部不同**

**（a）数量**

| 学校 | 数量 | 取证 |
|---|---|---|
| Columbia SEAS（US） | **3** | `"Columbia Engineering requires three letters of recommendation."` |
| Cornell CS M.Eng.（US） | **2**（本校学生 1） | `"Two letters of recommendation are required."` ／ `"Current Cornell Computer Science students need only one letter of recommendation. Please enter a 'filler' for the second contact."` |
| Northeastern CoE（US） | **2** | `"Two letters of recommendation are required. Letters of recommendation may be either academic or professional in nature…"` |
| UIUC MCS（US） | **0（可选）** | `"Applications for the MCS **do not require letters of recommendation** but will be considered if included, especially if used to justify experience in lieu of required coursework or other irregularities."` |
| UCL CS MSc（UK） | **2** | `"This course requires two references."` |
| Manchester CS 授课型 MSc（UK） | **2 学术**（modular 且毕业 >2 年可用 1 封 industrial） | `"academic references - for a full-time MSc we require two academic references; for modular applicants, one industrial reference is sufficient if you have graduated more than two years ago"` |
| Manchester MSc ACS（UK） | **0** | `"References and personal statements are not required for your application to this programme"`（见 UK 文件） |
| Manchester AMBS（UK） | **提交时 0，事后可能索取** | `"When you complete your online application, **you are not required to submit an academic reference**. After an initial assessment of your application, we may contact you to request an academic reference"` |
| Leeds（UK，校级） | **2 位推荐人的联系方式**（不是推荐信本身） | `"References, or contact details for two referees"` |
| Coventry（UK） | 部分专业需**专业 + 学术各一** | `"For some courses, such as those in Health and Nursing, we will need both a professional and academic reference."` |
| 澳洲四所授课型（AU） | **主流 0** | 见 `au-notes.md` §6（Melbourne/Adelaide 为清单未列的负面证据，UNSW 为「推荐人属 Research program 要求」的正面划界证据，UQ 为矛盾信号未解决） |
| UNSW AGSM MBA（AU，例外） | **2** | `"You need to arrange two referees to complete the AGSM referee report forms"` |

**（b）提交机制——三种，产品必须分开建模**

| 机制 | 谁触发 | 谁提交 | 样本 |
|---|---|---|---|
| **系统自动邀请**（推荐人直接线上提交） | 申请人在表内填推荐人联系方式即触发 | 推荐人 | **Columbia SEAS**：`"Upon entering your recommendation providers' contact information in your application, your recommendation providers will be contacted to supply the letter of recommendation. **Under no circumstance should you write any portion of the evaluation, nor have any involvement in its drafting or submission.**"`<br>**UCL PGCE**：`"Your referees will be sent an email asking them to write a reference for you and to submit it online."`（且**触发时点按项目不同**：EYITT PGCE 提交即发，其他 PGCE **接受 conditional offer 后**才发） |
| **按需索取**（学校决定要不要） | **学校**，只在需要时 | 推荐人 | **Leeds**：`"If you are required to supply referee details, **the admissions team will only contact your referees if they need to see a reference in order to make a decision** on your application."`<br>**Manchester AMBS**：`"After an initial assessment of your application, we may contact you to request an academic reference"` |
| **申请人自行转发并上传**（无系统邀请） | 申请人线下 | **申请人** | **UNSW AGSM MBA**：`"All applicants should forward the referee report form to the two referees and **upload the signed reports to their application**."`（`au-notes.md` §6.2） |

**（c）是否阻塞审理——决定产品要不要做「推荐信催办」功能**

- **UCL CS MSc：阻塞。** `"We aim to make a decision within 6-8 weeks of receiving a **complete** application (submitted, application processing fee paid, all evidence included, **and both references returned**)."`
- **Cornell CS M.Eng.：不完全阻塞。** `"If you requested three letters of recommendation and only two are received at the time of processing, **we will consider that the letter of recommendation requirement has been met**."`
- **Leeds：不阻塞**（学校自己决定要不要）。
- **UIUC：不阻塞**（本来就不要）。

**（d）美英都有的一个隐藏字段：FERPA 弃权 / 保密选项**
> UIUC：`"For each recommendation record you add, you will be asked **if you wish to waive your right to view these letters**. Under the Family Educational Rights and Privacy Act of 1974, students have access to their education record, including letters of recommendation. However, students may waive their right to see these letters, in which case the letters will be held in confidence."`
> **澳洲样本未见等价字段**（澳洲主流不要推荐信，自然也没有这个问题）。

---

## B-2 成绩单认证：WES？ENIC？CHESICC？——**三国的答案彼此不可替换**

### B-2.1 先破一个流行误解：**「申请美国必须做 WES」是错的**

本次五所美国样本的实际口径：

| 学校 | 第三方学历认证（WES/NACES）是否必需 | 逐字取证 |
|---|---|---|
| **Northeastern（Khoury）** | ❌ **明确不需要** | `"For international students, a **WES evaluation is not required**."` 学校自己做：`"At Northeastern, this is called a **Foreign Credential Evaluation (FCE)** process and often depends on comparability to a bachelor's degree received from a regionally accredited institution in the United States."` |
| **UT Dallas** | ❌ **明确不接受** | `"**Outside credential evaluations are not required or accepted for admission.** The Office of Admission and Enrollment perform foreign credential evaluations for applicants with international academic credentials."` |
| **Columbia SEAS** | 🟡 **仅作 fallback**：只有当学校无法电子直投时才要 WES | `"If the university cannot send transcripts electronically via a secure, password-protected system, applicants must order a **Course-by-Course Evaluation and International Credential Advantage Package** to be sent electronically to finaldocs@columbia.edu from World Education Services (WES)."` |
| **Cornell** | 🟡 **是可选投递渠道之一，不是强制评估** | `"Transcripts and other required academic records must be delivered to Cornell electronically **either by your institution OR by a credential verification service**. We do not accept transcripts directly from students. Preferred providers include: … **World Education Services (WES) (Course-by-Course ICAP only)** … Any **NACES** or **AICE** member organizations"` ／ `"We have download accounts with Parchment, TEC, and WES."` |
| **UIUC** | ❌ 公开页只要求上传扫描件 + 官方英文翻译，**未提第三方评估** | `"All applicants are required to upload scanned copies of official transcripts… All credentials must be provided in both the native language and with accompanying official English Translations. If admitted, applicants will be expected to provide final, official or attested copies of all academic credentials."` |

> **结论：WES 在美国是「投递渠道 / 疑难 fallback」，不是普遍准入门槛。**
> 唯一被**明确要求**的第三方是 GPA 换算场景（且仍是「推荐」）：
> Columbia `"Many translation or evaluation services can convert your grades to the U.S. scale. **We recommend you use a NACES-accredited evaluator** to accurately determine what your GPA would be on a U.S. grading scale."`

### B-2.2 中国学生的真正硬约束是 CHESICC（学信网），且**英美澳三国的要求完全不对称**

| 国家 / 学校 | 是否要 CHESICC / CSSD | 逐字取证 |
|---|---|---|
| **美国 · Columbia SEAS** | ✅ **强制，且是中国学生专属规则**（录取后阶段） | `"**All students attending Chinese institutions will be required to contact CHESICC** to arrange submission of a 'Verification Report of China Higher Education Student's Academic Transcript' AND a 'Verification Report of China Higher Education Qualification Certificate' or 'Online Verification Report of China Higher Education Qualification Certificate' (for those earning a degree in China) to Columbia at finaldocs@columbia.edu."` |
| **美国 · Northeastern** | 🟡 有中国专属 FCE 规则页（`neu-fce-china.md`），**具体是否指定 CHESICC：未找到**（页面为 Salesforce 动态 FAQ，本次抓取内容不含条款正文） | — |
| **澳洲 · Melbourne** | ✅ **是中国学生两条法定路径之一**（另一条是走 authorised agent） | 经 **CSSD（原 CHESICC）** 走 **My eQuals** 投递三份报告；操作路径原文见 `au-notes.md` §5.4 |
| **澳洲 · UQ / Adelaide / UNSW** | ❌ 公开页**未提** CHESICC/CSSD | `au-notes.md` §5.4 |
| **英国 · UCL** | ❌ 不要 CHESICC，改为要 **成绩证明（官方盖章 + 签字翻译）** | `"If you are currently studying in mainland China and your university issues an official grade certificate (**成绩证明**) please upload a copy (including an English translation which is **signed and stamped by your university**) to your application form."` ／ `"If you have studied in China you are also required to provide a graduation certificate and your official grade certificate (成绩证明) **confirming your overall percentage average, issued on or after the date of graduation**. If your university does not issue official grade certificates, we will determine your overall weighted average based on the information provided in your transcript."` |
| **英国 · Manchester / Leeds / Coventry** | ❌ 本次抓取**未见** CHESICC 要求 | — |

> **⚠️ 时点差异极重要**：Columbia 的 CHESICC 是**录取之后、入学之前**的核验；
> UCL 的成绩证明是**申请时就要上传**。**同一份中国材料，在两国是流程的两个不同阶段。**

### B-2.3 UK ENIC——**主流授课硕不需要，个别场景甚至明确拒收**

UK ENIC（原 UK NARIC，由 Ecctis 为英国教育部运营）：
> `"UK ENIC is the UK national information centre for international qualifications and skills. Previously UK NARIC, the organisation was renamed UK ENIC after the UK left the European Union. UK ENIC is managed by Ecctis for the UK government's Department for Education."`
> Statement of Comparability 价格：`"The service costs **£69.60** which includes an e-Statement."`（纸质另加：英国境内 £12.60，国际 £75.60）
> 来源：https://www.enic.org.uk/ ｜2026-08-14

**四所英国样本的实际口径（全文检索结果）：**
- **UCL、Manchester、Leeds、Coventry 的授课型硕士页面，没有任何一处把 ENIC Statement 列为申请必需材料。**
- **UCL 甚至明确拒收其作为替代**（PGCE 页面，措辞为校级）：
  > `"To meet degree requirements, **UCL will require to see original degree certificates and/or official transcripts, rather than any ENIC Statement of Comparability**."`
- **Manchester 把 NARIC 当作学校自己的换算参照，不是要申请人去买**：
  > `"We require you to have a strong undergraduate degree result (UK bachelor or **international equivalent as recognised by UK NARIC**) from a recognised university."`（MBA 页面）
- **唯一要求 ENIC 的是受专业监管的课程**：Coventry 护理专业 `"Non-UK degrees will be accepted if healthcare-related and accompanied by a '**Certificate of Comparability**' which you can obtain from www.enic.org.uk"`（NMC 监管要求）

> ### 🔴 三国认证制度的本质差异
> | 国家 | 谁来判定「你的学历等于什么」 |
> |---|---|
> | **美国** | **学校自己**（NEU FCE / UTD 自评 / UIUC 按国别表），第三方（WES/NACES）是**可选渠道**或**疑难 fallback** |
> | **英国** | **学校自己 + 学校自建的院校名单**（见 B-4），ENIC 是**参照标准**不是**准入材料** |
> | **澳洲** | **学校 + 证书数字化平台**（My eQuals / Digitary VIA / Parchment），加上 **certified copy 制度**（UQ/Adelaide 要，UNSW 明确不要，Melbourne 改为校方直接向发证机构核验）——逐字见 `au-notes.md` §5.2 |
>
> **产品绝不能做一个「成绩单认证」通用模块**：三国的动作、时点、付费对象、失败模式都不同。

---

## B-3 语言要求：考试类型、分数线、语言班 / 内测

### B-3.1 接受的考试类型——**没有任何一个考试被三国样本全体接受**

| 考试 | 英国样本 | 美国样本 | 澳洲样本 |
|---|---|---|---|
| **IELTS Academic** | 全部接受（UCL 称 `"This test is UCL's preferred English language qualification."`） | 全部接受 | 全部接受 |
| **TOEFL iBT** | 接受，但**限制多**：Leeds LUBS `"we only accept TOEFL iBT scores from a single test date"` + `"We do not accept TOEFL iBT Home Edition."`；Manchester CS `"We do not accept 'MyBestScore'. We do not accept TOEFL iBT Home Edition."` | 接受，限制各不同：Columbia `"TOEFL MyBest scores are not accepted."`；UIUC `"We do not accept the TOEFL Essentials test, TOEFL MyBest scores, or IELTS One Skill Retake scores."`；Cornell `"The Graduate School will accept valid scores from either version of the TOEFL iBT."` 且**接受 MyBest**（但 `"individual graduate fields may have different policies and may not accept them"`） | 未在本次抓取范围内逐校取证 |
| **Duolingo (DET)** | UCL / Manchester / Leeds 的本次抓取页面**未见接受**（未找到明确条款） | **分裂**：Columbia ✅、UIUC ✅（但 `"cannot be used to satisfy the English proficiency requirement for teaching assistants"`）、Northeastern CoE ✅（105）／**Khoury ❌**（`"Duolingo test scores are not accepted."`）、UT Dallas ✅、**Cornell ❌**（`"We do **not** accept any other English Language Proficiency exams (e.g., TOEFL Essentials, Pearson, Duolingo DET, etc.)."`） | 未取证 |
| **PTE Academic** | Manchester CS 接受 | Columbia ✅ / UT Dallas ✅ / **Cornell ❌** | 未取证 |

> **⚠️ Northeastern 内部就分裂**：CoE 接受 Duolingo 105，Khoury 完全不接受，
> 且官方明说了跨学院的处理办法：
> `"The Computer Science concentration of the Robotics program is offered jointly with Khoury College and follows Khoury's English proficiency requirements. The Computer Science concentration does not accept the Duolingo English Test and has higher thresholds… Prospective students interested in the Robotics program who have taken the Duolingo English Test are encouraged to apply to the Electrical and Computer Engineering or Mechanical Engineering concentrations."`
> **接受的考试类型是学院级属性，不是学校级属性。**

**全球性变量：TOEFL iBT 2026-01-21 改版换算**——三国样本**全部**在同一时间点被迫维护新旧两套分数线：
- Columbia：`"4.5 or lower on the TOEFL iBT (for tests taken after January 21, 2026); or 99 or lower on the TOEFL iBT for tests taken before January 21, 2026"`
- UIUC：`"4.0 (for scores dated after 1/20/2026) / 79 (for scores dated prior to 1/21/2026)"`
- Cornell：`"score requirements for exams taken before January 2026"` vs `"interim score requirements for exams taken beginning January 2026"`
- UCL：`"UCL will continue to accept the TOEFL iBT after 21 January 2026. Tests taken from this date onwards will need to meet the new score requirements in full."`
- Northeastern：`"TOEFL: 79 overall (or 4.0 on the iBT 2026 scale)"`

> **产品必须把「分数线」建成带生效日期的双轨字段**，不能存单值。**这条三国一致，可以统一建模。**

### B-3.2 分数线的**表达方式**三国完全不同——这才是必须分叉的地方

**（a）英国 = 课程级「等级」+ 全项最低分**

UCL 用 5 档制，课程页只写档位，档位到分数的映射在校级页面：

| UCL 档位 | IELTS Academic |
|---|---|
| Level 1（原 Standard level） | Overall 6.5，每项 ≥ 6.0 |
| **Level 2（原 Good level）** | **Overall 7.0，每项 ≥ 6.5** |
| Level 3 | Overall 7.0，每项 ≥ 7.0 |
| Level 4（原 Advanced level） | Overall 7.5，每项 ≥ 7.0 |
| Level 5 | Overall 8.0，每项 ≥ 8.0 |

UCL Computer Science MSc 的课程页只写一句：`"The English language level for this course is: **Level 2**"`。
来源：https://www.ucl.ac.uk/prospective-students/graduate/english-language-requirements ｜2026-08-14

其余英国样本：
- **Manchester CS MSc**：`"IELTS: overall score of 7.0 with no sub-test below 6.5."` ／ `"TOEFL iBT: at least 100 overall with no sub-test less than 22."`
- **Leeds LUBS**：`"IELTS Overall 6.5 with no less than 6.0 in each section"`；TOEFL iBT `"(IELTS 6.5 equivalent programmes) Overall 70, Reading 65, Writing 65, Speaking 65, Listening 65"`
- **Leeds 校级（中国申请人页）**：`"You will need IELTS 6.5 overall, GCSE English C or 4 or an equivalent qualification"`
- **Coventry**：`"For international students we ask for IELTS overall score of 6.5 or equivalent."`；MSc Data Science 课程页 `"IELTS: 6.5 overall, with no component lower than 5.5."`

> **英国样本的实际区间：IELTS 6.5–7.0 总分，单项 5.5–6.5。**
> **「单项最低分」在英国是标配**，四所样本无一例外。

**（b）美国 = 三种互不相同的口径并存**

| 口径 | 样本 | 逐字 |
|---|---|---|
| **没有最低分，只给「低于此值可能需要补英语」的软线** | Columbia SEAS | `"**There are no minimum test score requirements to apply for admission consideration.** However, it may be necessary to improve your English proficiency if you score: 4.5 or lower on the TOEFL iBT (post-2026-01-21) / **7 or lower on the IELTS** / 68 or lower on the PTE Academic / 134 or lower on the Duolingo English Test"` |
| **硬性单项分数线 + 分档（还绑定 TA 资格）** | Cornell | IELTS `"An overall band score of at least 7.0"`；TOEFL iBT（2026-01-21 前）`Speaking: 22 或以上 / Reading: 20 / Listening: 15 / Writing: 20`；另有 **Score Tier A / Tier B** 两档，**Tier A = 免额外英语评估即可当 TA**（IELTS 7.0 且口语 8.0 以上） |
| **双门槛：Limited Status vs Full Status** | UIUC | 见 [A-1 §4(c)](#a-1-美国coursework-master) 的表 |
| **建议线 + 不 super-score** | Northeastern Khoury | `"Recommended TOEFL = 90≥ or IELTS 6.5≥"` ／ `"**Note: We will not super-score the IELTS or TOEFL.**"` |
| **固定最低线** | Northeastern CoE | `"TOEFL: 79 overall (or 4.0 on the iBT 2026 scale) / IELTS: 6.5. overall / Duolingo: 105"` |

> **⚠️ Columbia 的 IELTS「软线 7 分」比 Manchester 的 IELTS「硬线 7.0」还高**，但性质完全不同：
> 一个是「低于此值我们建议你补英语」，一个是「低于此值不给 offer」。
> **产品若把两者都存成 `ielts_min = 7.0`，会给出完全错误的建议。**

**（c）澳洲**：本次抓取**未对四所 Go8 逐校取证具体分数线**，**未找到**。
可确认的只有制度形态：ELICOS 是联邦立法规范的（`ELICOS Standards 2018`），且 RMIT 的 packaged offer 明确可把 **EAP（English for Academic Purposes）** 串进 offer 包（见 A-2 §4）。

### B-3.3 语言不达标的救济路径——三国是**三种不同的产品形态**

| 国家 | 形态 | 逐字 / 出处 |
|---|---|---|
| **英国** | **Pre-sessional 语言班 + combined offer**（语言班成绩直接顶替语言分数） | Leeds 2027-28 Admissions Policy：`"A combined offer may be made for a summer pre-sessional English language course and a taught postgraduate course, whereby the pre-sessional is used to meet the English language requirements of the taught postgraduate offer."`（见 UK 文件）<br>Coventry：`"Most of our undergraduate and top-up degree courses require IELTS 6.0 for entry and our postgraduate courses require IELTS 6.5… The tables detail the length of course you will need **based on your current IELTS level**"`（语言班时长是当前分数的函数） |
| **美国** | **降级录取（Limited Status）+ 入学后校内内测（EPT）+ 强制修非学分英语 + 降课业负荷**；或**独立 Pathway 项目** | UIUC：`"The English as a Second Language Placement Test (**EPT**) will be required prior to enrolling at Illinois for all students who score below the full status minimums… students are generally required to enroll in **non-credit 'English as a Second Language' coursework and take a reduced academic load** beginning the first semester"`<br>Northeastern：`"If you do not meet the minimum TOEFL, IELTS, or Duolingo requirements… you are encouraged to apply first to Northeastern University's **Global Pathways Program**, where you can boost your English language skills and academic knowledge before beginning your engineering coursework."` |
| **澳洲** | **Packaged offer 串 EAP/ELICOS，每段发独立 CoE**（且 ELICOS 有联邦标准） | RMIT：`"A packaged offer combines two or more courses in a single offer. These may include combinations of English for Academic Purposes (EAP), Foundation Studies, Vocational Education, and Higher Education programs… we will issue **multiple Confirmations of Enrolment (CoEs) for each course in the package**."`<br>联邦层：`"The ELICOS Standards 2018 outline specific quality requirements for registered providers delivering English language courses to overseas students"` |

> **三种形态的产品含义完全不同：**
> - 英国：语言班是**一个额外的申请对象 + 一笔额外费用 + 一段额外签证期**，但仍是**一张 CAS**。
> - 美国：**不产生额外申请**，产生的是「录取等级」和「入学后课业负担」——**申请阶段看不出来**。
> - 澳洲：**产生多张 CoE**，签证时间线被拆成多段。

---

## B-4 录取逻辑：院校层级、GPA 换算、工作经验权重

### B-4.1 是否卡本科院校层级——**三国是三种截然不同的制度，这是全篇最锋利的一条分叉**

**（a）英国 = 「学校自建的具名院校清单」，且不在清单上 = 直接不接受**

**Leeds 是最彻底的实例，把清单直接公开了：**
> 校级页：`"Each of our academic schools has different entry requirements, so before making an application you need to check that your chosen school accepts graduates from your Chinese institution."`
> `"Look for the University of Leeds school you want to apply to in the following section, then click on the link to find out if your institution is accepted and the grades we require for 2026/27 entry. **If your institution is not listed then unfortunately it is not accepted.**"`
> 中国资格页：`"The University of Leeds **uses institutional lists** when assessing applications from accepted Chinese institutions, and requirements may vary by school."`
> `"If we ask for 2.1, you need: **70%-85%, depending on your institution.** If we ask for 2.2, you need: **70%-80%, depending on your institution.**"`

Leeds 把清单**按学院分成四份**：Business School 一份、School of Computer Science + School of Media and Communication 一份、其余全部学院按首字母 A–L / M–Z 两份。
**Business School 那一份是双语具名的完整名单**（中英对照，本次抓取的页面含 **918 行中文校名**，从「阿坝师范学院 Aba Teachers University」到清单末尾），并在表头写死了规则：
> `"Please check whether your university is accepted by looking up its English name in the following alphabetical list."`
> `"GPA requirements for all Business School Programmes: **75%-80% minimum GPA requirement depending on your institution.**"`
> `"Please note: This document is to be used as a guide only. Final decisions will be made by the University of Leeds admissions teams."`

来源：https://www.leeds.ac.uk/international-students-applying/doc/accepted-chinese-institutions ｜https://business.leeds.ac.uk/masters/doc/accepted-chinese-institutions ｜2026-08-14｜**2026/27 entry**（页面更新日期 12 September 2025）

**Manchester 走的是另一种：公开「国别 + 分数线 + 院校层级形容词」，但不公开名单本身。**
> MSc Advanced Computer Science：`"We operate a selective staged admissions process. **We give preference to students with the strongest grades from high-ranking institutions.**"`
> `"China: a minimum of **87%** in a 4-year bachelor's degree **from a well ranked institution**."`
> `"India: a minimum of 65% (First Class with Distinction) in a BSc Eng, BEng or BTech degree, **depending on the institution**."`
> AMBS：`"China: We typically require a 4-year bachelor's degree with a minimum average of **between 80-85%** from a well ranked institution. **Requirements vary dependent on the institution of study and the courses applied to.**"`
> 并明确把院校层级写进评估要素清单：`"Note that all of the information you submit within your application, including your personal statement, academic references, English Language ability, **and the standing of the institution you are studying in** are all used to make a decision on your application."`

来源：https://www.manchester.ac.uk/study/masters/courses/list/06915/msc-advanced-computer-science/entry-requirements/ ｜https://www.alliancembs.manchester.ac.uk/study/masters/entry-requirements/ ｜2026-08-14

> **⚠️ 对产品最关键的一句**：Leeds 的清单是**可穷举、可缓存、可查询**的结构化数据；
> Manchester 的规则是**不可穷举**的（「well ranked」没有定义、名单不公开）。
> **同为英国，同为「卡院校层级」，一个能建库，一个只能给区间 + 免责声明。**

**（b）美国 = 不卡院校层级，卡的是「国别的学历形态与最低分」**

UIUC 是最结构化的实例——**Minimum Requirements By Country** 制度：
> `"The below listed admission requirements are based on **what we most often see from institutions within this country**. However, when institutions provide a different grading scale or a different degree format, academic credentials will be reviewed **on an individual basis** to determine acceptable degrees and GPAs."`
>
> **China 页逐字：**
> | 项 | 值 |
> |---|---|
> | Comparable Bachelor's Degrees | **Bachelor's Degree (4 years)** |
> | Minimum GPA Requirements | **B Average** ／ **80%** |
> | Comparable Master's Degrees | Master's Degree (1-2 years) |

来源：https://grad.illinois.edu/admissions/instructions/country/china ｜2026-08-14

其余美国样本的表述**一律是「认可的机构」而不是「院校层级」**：
- Columbia SEAS：`"The basic requirement for admission as a graduate student is the bachelor's degree received from **an institution of acceptable standing**."`
- Cornell：`"a baccalaureate degree from **a college or university of recognized standing**. For students with international credentials, **an equivalent international degree** is required."`
- Northeastern CoE：`"…from **a regionally accredited U.S. college or university, or its equivalent from a foreign college or university**."`
- UT Dallas：`"…from **an institution recognized by that country's ministry of education**."`

> **五所美国样本，没有一所公开任何形式的境外院校分级名单。**（不能据此断言完全不存在，只能说**公开页面未找到**。）

**（c）澳洲 = 不给名单、不给国别表，给的是「WAM 换算 + 按院校调整」**

Melbourne 是唯一给出明确机制的：
> `"Have completed a bachelor degree (AQF7) in any discipline with a **weighted average mark (WAM) of 65%**, or equivalent."`
> `"**Weighted Average Mark (WAM) and subject-specific criteria are based on the University of Melbourne's grading standards and subjects. If studies are from elsewhere, we'll assess the grades and subjects against University of Melbourne equivalents. This means that the final WAM may be adjusted depending on the previous institution's accreditation, subject grading, and pass marks.**"`

来源：https://handbook.unimelb.edu.au/2026/courses/mc-it/entry-participation-requirements ｜2026-08-14｜**2026 Handbook**

> **这是三种制度里唯一「输入是你的分数、输出是一个被调整过的分数」的形态。**
> 英国是「查表 → 落在哪个档 → 要求多少分」；美国是「按国别定形态与最低分」；澳洲是「把你的分数换算到本校标尺，再按学校调整」。
> **三者不能互相翻译，产品必须为每国建三套不同的判定函数。**
>
> UNSW / UQ / Adelaide / RMIT / UTAS 的等价机制：**未找到**（本次未逐校取证）。

### B-4.2 GPA 换算惯例

| 国家 | 换算方向与主体 | 逐字取证 |
|---|---|---|
| **美国** | 换算到 **4.0 制**；**申请人自己或第三方**换算，学校给的是「多少分算够」 | UIUC 校级 `"A grade point average (GPA) of **3.0 (A=4.0)**, or comparable GPA for an international applicant, **for last two years of undergraduate study**"` ＋ `"The admission GPA is calculated based on the **last two years** of undergraduate study."`（**只算后两年，这个细节英澳都没有**）<br>Northeastern Khoury 直接给三条并列尺子：`"3.0 on a 4.0 scale / 8.0 on a 10.0 scale / 80 on a 100 scale"`<br>Columbia CS：`"While there is **no minimum GPA** requirement to apply for admission consideration, the program is highly selective. **Successful applicants typically have a GPA of 3.5 or higher.**"`<br>UT Dallas：`"An overall grade point average of 3.0 (based on 4.0 scale) or better **is expected**."`<br>UIUC MCS：`"The **recommended** undergraduate GPA for applicants applying to the Professional Master's program is **3.2/4.0 or higher**."` |
| **英国** | 换算到 **英国学位等级（1:1 / 2:1 / 2:2）**；**学校用院校清单换算**，申请人不需自行折算 | Leeds：`"If we ask for 2.1, you need: 70%-85%, **depending on your institution**."`（即同一个「2:1」在不同中国院校对应不同百分比）<br>Manchester MBA：`"We normally look for the equivalent of a first class (1:1) or upper second-class (2:1) honours result in the UK system. **We normally expect candidates to be in the top 25% of their class.**"`（**班级排名**是英国独有的表述） |
| **澳洲** | 换算到 **WAM（百分比）**；**学校单方面换算并按院校调整** | Melbourne WAM 65%，见 B-4.1(c) |

> **三国的「均分」根本不是同一个量：**
> 美国是 **4.0 制 GPA**（且 UIUC 只算后两年）；英国是 **英国学位等级**（背后是百分比区间 + 院校清单）；澳洲是 **WAM 百分比**（且会被本校标尺重算）。
> **产品里存一个 `gpa` 字段是不够的**，至少要存「原始均分 + 原始满分 + 计算口径（全程/后两年）+ 发证院校」，三国的判定函数各自去取。

### B-4.3 工作经验权重——**三国都不是主要录取要素，但触发的动作不同**

| 国家 | 工作经验的作用 | 逐字取证 |
|---|---|---|
| **英国** | **作为「学术条件的替代/补正」**，且触发点是**毕业年限** | Manchester MSc ACS：`"If you graduated more than three years ago, we will also consider the information contained on your CV and any relevant work experience you have **to assess if you are still able to fulfil the entry criteria**."`<br>Leeds EPS：`"**Decisions are normally made considering your academic background only**, however a CV can be useful… and **may also help if your academic background is borderline**."`<br>Leeds / Manchester 的**推荐人身份规则**也由工作年限决定：Leeds `"the admissions team may accept professional referees if you have been out of education for more than **five years** or are applying with evidence of work experience"`；Manchester `"one industrial reference is sufficient if you have graduated more than **two years** ago"` |
| **美国** | **作为「先修课程的替代」**，且是明文机制 | UIUC MCS：`"Students with a bachelor's degree in a field other than computer science are encouraged to apply, but they must have **prerequisite coursework or commensurate experience** in object-oriented programming, data structures, algorithms, linear algebra, and statistics/probability."` ＋ 推荐信的用途也被限定为此：`"…especially if used to **justify experience in lieu of required coursework** or other irregularities."`<br>Columbia SEAS：Resume 必需，但工作经验**未被写成任何门槛或替代条款** |
| **澳洲** | **作为可上传的雇主 certified reference**，条件性 | Adelaide 文件清单：`"Relevant work experience — **certified references from your employer, if needed**"`（`au-notes.md` §6.1）<br>Melbourne MIT 的入学要求为 `bachelor degree (AQF7) in any discipline with WAM 65%`，**工作经验未出现在条款中** |
| **三国共同的例外** | **MBA 是完全另一套逻辑** | Manchester MBA：`"We will review all aspects of your application equally - your application form, essays, references, CV, degree, professional qualifications, admission test score, English level and interview."`<br>UNSW AGSM MBA：强制两封 referee report，含 `"How long, how well and in what capacity have you known the applicant?"` 等 6 个必答问题（`au-notes.md` §6.2） |

> **产品含义**：不要把「工作经验」做成一个通用加分项。
> 在英国它触发的是「你要不要额外交 CV / 能不能用职场推荐人」；
> 在美国它触发的是「你能不能豁免先修课」；
> 在澳洲它是「要不要上传一份 certified 雇主证明」。
> **MBA 必须单独建模，它不属于本文讨论的 coursework master 主流形态。**

---
