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
| UIUC（Graduate College 校级） | **$90**，国际与国内同价 | "Domestic applicants are required to submit a $90.00 application fee (effective Spring 2026). International applicants are required to submit a $90.00 application fee." | https://grad.illinois.edu/admissions/application-instructions/completing-your-graduate-application ｜2026-08-14｜Spring 2026 起生效 |
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

来源：https://grad.illinois.edu/admissions/international-applicants ｜2026-08-14

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

来源：https://www.engineering.columbia.edu/admissions-aid/graduate-admissions/admissions-faqs （Columbia）｜https://gradschool.cornell.edu/admissions/admitted-students/admissions-and-admitted-student-faq-2/ 与 https://www.cs.cornell.edu/master-engineering-computer-science/apply （Cornell CS M.Eng.）｜2026-08-14

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

来源：`scratchpad/ogs_financial-requirements.txt`（Northeastern Office of Global Services · Financial Requirements）｜2026-08-14｜页面自述 **estimate of expenses for academic year 2026-2027**｜⚠️ **原始 URL 未随抓取保存，见附录 B 级**

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

来源：`scratchpad/au/utas-appdates.md`（University of Tasmania · Key dates）｜2026-08-14｜页面自述 **2027 与 2026 两个周期并列公布**｜⚠️ **原始 URL 未随抓取保存，见附录 B 级**

> ⚠️ 该表为**校级综合**日程（本科 + 研究生同表），未单独标注国际生。
> **UTAS 国际生是否另有更早的截止日：未找到。**

**（e）入学季：澳洲是稳定的 2 个主 intake + 部分学校第 3 个**
> RMIT：`"Typically, Australian universities have 2 main intakes—**Semester 1** (late February/early March) and **Semester 2** (mid-July). Some universities, like RMIT, offer an additional third intake—**Semester 3**—for specific courses, starting around September/October/November and catering mainly to international students."`
> 且**每个 intake 的课程可用性不同**：`Semester 1 = All courses` / `Semester 2 = Majority of courses` / `Semester 3 = A select number of courses for international students`

**UNSW 用的是 term 制不是 semester 制**（Term 1 / Term 2 / Term 3），offer round 表里三个 term 全部出现。
→ **同一个国家内，学期制本身就不统一**，产品的日历模型不能假设「澳洲 = 两学期」。

来源：https://www.rmit.edu.au/study-with-us/international-students/intakes-in-australia-for-international-students ｜2026-08-14｜2026

## 4. Offer 类型——澳洲有**三种**，其中「packaged offer」是英美都没有的

**RMIT 给出了本次三国调研中最完整的 offer 类型定义（逐字）：**

| 类型 | 定义原文 |
|---|---|
| **Full offer** | "A full offer means you have met all admissions requirements for your chosen course and have been offered a place." |
| **Conditional offer** | "Conditional offers mean your offer is subject to meeting all the conditions in your offer letter. **You can accept your conditional offer to secure your place, but you will only be able to receive full acceptance and enrol once you meet all conditions.**" 典型 condition：`Evidence of meeting the English language requirement` / `Academic transcripts` / `Graduation certificates` |
| **Packaged offer** ⭐ | "A packaged offer **combines two or more courses in a single offer**. These may include combinations of **English for Academic Purposes (EAP), Foundation Studies, Vocational Education, and Higher Education programs**. You must successfully complete the first course and meet the admissions requirements of the next course in your package before you can progress. **Once you accept an unconditional packaged offer, we will issue multiple Confirmations of Enrolment (CoEs) for each course in the package.**" |

来源：https://www.rmit.edu.au/study-with-us/international-students/apply-to-rmit-international-students/accept-your-offer/understand-your-offer ｜2026-08-14

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
来源：`scratchpad/ucl/english.md`（UCL 校级 English language requirements）＋ `scratchpad/ucl/cs-msc.md`（课程页 Level 2）｜2026-08-14｜⚠️ **原始 URL 未随抓取保存，见附录 B 级**

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
**Business School 那一份是双语具名的完整名单**（中英对照，从「阿坝师范学院 Aba Teachers University」开始按英文名字母序排列；本次抓取的页面含 **918 行带中文字符的条目**——该数字为对整页做 CJK 字符行计数所得，**未按名单行格式二次校验，不等于校名条目数**），并在表头写死了规则：
> `"Please check whether your university is accepted by looking up its English name in the following alphabetical list."`
> `"GPA requirements for all Business School Programmes: **75%-80% minimum GPA requirement depending on your institution.**"`
> `"Please note: This document is to be used as a guide only. Final decisions will be made by the University of Leeds admissions teams."`

来源：https://www.leeds.ac.uk/international-applying/doc/accepted-chinese-institutions-postgraduate-admissions ｜https://business.leeds.ac.uk/masters/doc/accepted-chinese-institutions ｜2026-08-14｜**2026/27 entry**（页面更新日期 12 September 2025）

**Manchester 走的是另一种：公开「国别 + 分数线 + 院校层级形容词」，但不公开名单本身。**
> MSc Advanced Computer Science：`"We operate a selective staged admissions process. **We give preference to students with the strongest grades from high-ranking institutions.**"`
> `"China: a minimum of **87%** in a 4-year bachelor's degree **from a well ranked institution**."`
> `"India: a minimum of 65% (First Class with Distinction) in a BSc Eng, BEng or BTech degree, **depending on the institution**."`
> AMBS：`"China: We typically require a 4-year bachelor's degree with a minimum average of **between 80-85%** from a well ranked institution. **Requirements vary dependent on the institution of study and the courses applied to.**"`
> 并明确把院校层级写进评估要素清单：`"Note that all of the information you submit within your application, including your personal statement, academic references, English Language ability, **and the standing of the institution you are studying in** are all used to make a decision on your application."`

来源：`scratchpad/man/acs-entry.txt`（MSc Advanced Computer Science 入学要求）＋ `scratchpad/man/ambs-intl.txt`（Alliance MBS 国际入学要求）｜2026-08-14｜⚠️ **原始 URL 未随抓取保存，见附录 B 级**

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

# C 三国对照：共有骨架 vs 必须分叉

> 本节的 **UK 列一律引用 [`uk-apply-timeline-deposit.md`](./uk-apply-timeline-deposit.md)**，不重复其原文引述；
> US / AU 列引用本文件 [A-1](#a-1-美国coursework-master) / [A-2](#a-2-澳洲coursework-master) / [B](#b-三国共缺的四个维度) 节。
> **最后一列「判定」是本票的实际产出**，其余是支撑证据。

判定取值：
- 🟢 **可统一**：三国机制相同，只是参数不同 → **一个模型 + 一张参数表**
- 🟡 **半统一**：概念存在于三国但语义/形态不同 → **一个抽象接口 + 三套实现**
- 🔴 **必须分叉**：三国的东西根本不是同一个 → **三套独立模型**，强行统一会产生错误结论

---

## C-1 主表

### 第一刀：申请入口层

| # | 维度 | 英国 | 美国 | 澳洲 | 判定 |
|---|---|---|---|---|---|
| 1 | **是否有集中申请系统** | **无**。UCAS 只覆盖本科（Coventry 页面明写）。四所 100% 直申 | **无跨校统一系统**。但 Liaison CAS 家族（GradCAS / BusinessCAS / EngineeringCAS…）存在且**可选加入**；**本次 5 所样本项目无一走 CAS** | **无**。四校直申各自 portal | 🟢 **可统一**：三国 coursework master 都是「直申院校 portal」。产品不需要为「集中系统」建模 |
| 2 | **底层平台厂商** | 四所四种：SITS:Vision / PeopleSoft / Power Apps / Salesforce | Slate（Columbia SEAS）、ApplyWeb-CollegeNET（Cornell）、其余未确认 | **集中度最高**：StudyLink Connect（Flywire）× 3（UNSW/UQ/Adelaide），TechnologyOne eStudent × 1（Melbourne） | 🔴 **必须分叉，但分叉维度是「平台」不是「国家」**。自动填表 / portal 状态抓取要按平台适配；澳洲的 StudyLink 一次适配覆盖三校，英国四所要写四次 |
| 3 | **中介 / agent 的官方地位** | 部分承认：Coventry 列为三大入口之一 + 专用门户；Leeds 有 agent 登录；UCL/Manchester PGT 页未列 | **本次五所样本的公开页面均未见** agent 入口（**未找到**，不等于不存在） | **制度化，且是产品红线**：跨校共用 `partner.studylink.com`；**部分国籍强制经 agent**（Melbourne 对 Pakistan / 在印度完成高等教育者；Adelaide 对中东/北非/撒哈拉以南非洲/南亚/菲律宾/拉美；UQ 由系统按 citizenship 动态判定且不公布名单）；agent 可代做 certified copy、代接受 offer、代申请 conditional CoE | 🔴 **必须分叉**。澳洲的「按国籍强制走 agent」是一个**会让直申路径直接不可用**的前置门，英美无对应物 |
| 4 | **申请费** | £0–£160，非校级统一（同校内商科与 CS 可不同） | **$0–$105**。Northeastern 对**整个 MS 层级按周期整体豁免**；UIUC 一年内 $70→$90 | Go8 四校齐平 A$150–154；**RMIT 按国籍收**（名单内 AU$100，中国不在名单 → $0），且**申请费可抵扣进押金** | 🟡 **半统一**。字段结构可统一（金额 + 是否可退 + 豁免条件），但**值是「院校 × 学院 × 周期 × 国籍」的函数**，必须建成可失效的动态数据，不能当静态属性缓存 |
| 5 | **同时申请上限 / 志愿** | 「一项目一申请」：UCL 硬上限 2、Coventry 不限、Manchester/Leeds 未公开 | 「一项目一申请 + 一份费用」：**Columbia SEAS 硬上限 1（每学期整个工院）**、UIUC 不限但每份都要交费 | **「一申请多志愿」**：UQ 3、UNSW 3（且 `"Program changes are not available and require a new application"`）、Melbourne 3 或 4（官方页面自相矛盾） | 🔴 **数据模型必须分叉**。英美是 `N 个 Application`；澳洲是 `1 个 Application + N 个 Preference`。**这不是参数差异，是实体关系差异** |

### 第二刀：时间线与决策层

| # | 维度 | 英国 | 美国 | 澳洲 | 判定 |
|---|---|---|---|---|---|
| 6 | **截止机制形态** | 四种：固定日期+非日期型阶段漏斗（UCL）／日期型分轮次两日期（Manchester，且商科与 CS 轮次不同）／滚动+校级总截止（Leeds）／纯滚动不写日期（Coventry） | 主导是**硬截止日**：Columbia priority+regular 双档逐项目不同；Cornell 逾期不受理；Northeastern 固定截止 + **滚动出结果**；UIUC 校级不给日期全部下放 | **三日期型 offer round**（UNSW / RMIT：投递截止 + 出结果 + **接受截止**）／审理时长承诺（Melbourne 4–8 周）／日历日硬截止（UTAS） | 🟡 **半统一**。可抽象为枚举：`rolling` / `fixed-deadline` / `rounds` / `undisclosed`，但**每种形态携带的日期字段数不同**（英国轮次 2 个日期，澳洲轮次 3 个日期），schema 要能容纳可变日期集 |
| 7 | **国际生是否有单独截止日** | 有，按「是否需要签证」（UCL 26 Jun vs 28 Aug）或「国际 vs UK」（Leeds 31 Jul vs 11 Sep） | 有，且**再按校区细分**（Northeastern：国际生美国校区 5/1、国际生 Vancouver 6/1、国内生 8/30） | 有，且**按国籍再切一刀**（UNSW：India/Pakistan 本国居住者 + 非洲国家（南非除外）非洲居住者，T1 2027 最后一轮提前到 19 Nov 2026）；另有 **onshore / offshore 分档** | 🟡 **半统一**。「截止日是申请人属性的函数」三国共有，但**函数的自变量不同**：英国是签证需求，美国是校区，澳洲是国籍 + 是否已在境内 |
| 8 | **入学季数量** | 1–6：三所 Russell Group 样本只有 9 月；Coventry 一年 6 个开学点 | **稳定 2–3 个**（Fall + Spring，UT Dallas 含 Summer） | **2 个主 intake（Sem 1 ≈ 2 月底/3 月、Sem 2 ≈ 7 月中）+ RMIT 第 3 个**；且**每个 intake 的课程可用性不同**；**UNSW 用 term 制不是 semester 制** | 🟡 **半统一**。日历模型可统一为「(intake, 课程可用性, 学期制类型)」三元组，但**「学期制类型」这个字段是澳洲逼出来的**，英美不需要 |
| 9 | **审理时长是否公开承诺** | **四所均未找到** | 只有项目级内部节奏（Cornell CS M.Eng. 处理 3 周 + 审理 5–6 周），**无校级承诺** | **Melbourne 是三国样本中唯一给出校级承诺的**：Graduate coursework **4–8 weeks**，并列出四类超时例外 | 🔴 **必须分叉**。这不是「有没有数据」的问题，是「有没有这个制度」的问题 |
| 10 | **额外筛选环节** | UCL Management 强制在线面试（第三方 jobma.com）；Coventry 可能有 interview / **credibility interview** / portfolio；Leeds LUBS 明确面试非标准流程；Manchester ACS 连 PS 和推荐信都不要 | **Columbia SEAS 全部 MS 强制录像面试**：`"three randomly selected questions, be given 90 seconds to consider your responses, and have three minutes to record"`，且**提交并付费后才解锁** | RMIT 有专门的**面试轨截止日**（面试截止 + 面试后接受截止，两个额外日期） | 🔴 **必须分叉**。三国的面试各自有独立的触发条件、时间约束和第三方系统 |
| 11 | **复议 / 申诉通道** | **未找到**（四所样本） | **明确拒绝反馈**：Cornell `"It is not practical for us to comment on individual applicants as to why they were not offered admission."` | **Melbourne 有正式通道**：`study.unimelb.edu.au/how-to-apply/request-a-review`，可在 portal 内提交并附证据 | 🔴 **必须分叉** |

### 第三刀：offer 与钱、签证文件层（**delta 最深的一刀**）

| # | 维度 | 英国 | 美国 | 澳洲 | 判定 |
|---|---|---|---|---|---|
| 12 | **offer 术语体系** | **conditional / unconditional 二元制**，四所统一使用，Leeds 2027-28 政策有正式定义（另有 combined offer / exceptions） | **没有这套二元制**。取而代之：① `contingent upon` 兜底措辞（NEU）② `conditional admission` 但**只用于「在读未毕业」**（UIUC）③ **Limited Status / Full Status 按语言分数分级**（UIUC，英澳都没有） | **三元**：`Full offer` / `Conditional offer` / **`Packaged offer`**（可串 EAP→Foundation→VET→HE 四段，**每段一张 CoE**）。且「非条件」无统一词（RMIT 同页混用 full / unconditional） | 🔴 **必须分叉**。若复用英国的 `conditional/unconditional` 状态机：美国的 Limited Status 会被错误建成 conditional；澳洲的 packaged offer 建不出来（一个 offer 对应多门课多张 CoE） |
| 13 | **offer 有效期** | 写在 offer 信；Manchester 明示典型 4–6 周；UCL 有 6/30 后两周的兜底规则；Leeds 与押金截止绑定 | Cornell CS M.Eng. 约 1 个月（Spring 压缩到 2–3 周）；其余**未找到** | **lapse date**（Melbourne）／`"last day to accept"`（RMIT，逾期 offer 取消需重新申请）／**acceptance deadline 在 offer round 表里提前公布**（UNSW） | 🟢 **可统一**。三国都是「offer 携带一个响应截止时点，逾期作废」，只是时长与公布方式不同 |
| 14 | **是否可 defer** | UCL 未查；**Manchester ACS 明确不可**；**Leeds 明确不可** | **Columbia SEAS 明确不可**（`"Deferrals will not be offered."`）；**Cornell 可**（`"one or two semesters"`，需联系 field） | **UNSW 可但非自动**（`"Offer deferrals are not automatically approved and must be requested via StudyLink"`）；RMIT 有 defer 通道 | 🟢 **可统一**为三值枚举（`不可` / `需申请` / `可`），值逐校 |
| 15 | **是否收押金** | **全部收**（国际生）：UCL 学费 10%（≈£4,270）／Manchester £2,500（另有部分项目的 acceptance deposit £2,500）／Leeds £2,000／Coventry £4,000–£8,000 按地区 | **不普遍**：Columbia ≥ $4,000（按项目，写在录取信）；**Cornell 明说 `"doctoral programs and many master's programs do not require an enrollment deposit"`**；NEU/UIUC/UTD **未找到** | **全部收**：Melbourne **AUD $17,000**（或协议指定额）／UNSW 按 offer letter，**金额由 mode of study + visa risk rating + sponsorship 决定**／UQ、Adelaide（称 "First Tuition Payment"）、RMIT、UTAS 均按 offer letter | 🟡 **半统一**。字段存在于三国，但**美国是可选的、澳洲是必然的**；且**澳洲的金额不可离线计算**（visa risk rating 是外部动态输入） |
| 16 | **押金的构成** | **纯学费预付**（NHS surcharge 是签证阶段单独交英国政府，不经学校） | **纯学费预付**，抵扣到 add/drop 后的学生账户 | **复合**：学费押金 + **强制 OSHC** + 可能的 **ELICOS 学费** + **enrolment fee**（RMIT 逐字）；RMIT 的**申请费也抵扣进押金** | 🔴 **必须分叉**。费用估算模型：英美在「接受 offer」这一步算 1 项，澳洲算 4 项 |
| 17 | **「交押金」是否等于「接受 offer」** | **各校答案相反**：UCL 明确**不等于**；Manchester AMBS 明确**等于**；Coventry 部分等于 | **等于**：Columbia `"all newly admitted MS students are asked to submit a tuition deposit **to accept the offer of admission**"` | **接受 offer 之后的独立一步**（RMIT/UQ/Adelaide 的 Step 2 接受 → Step 3 付款，顺序固定） | 🔴 **必须分叉**。这直接决定状态机里「accepted」这个状态的进入条件 |
| 18 | 🔴🔴 **签证文件的前置条件（本篇最硬的一条）** | **CAS ← 押金**（Manchester/Leeds/Coventry 三所白纸黑字；**UCL 是唯一例外**，只挂在「正式接受 unconditional offer」上） | **I-20 ← 资金证明 + 护照**，**与押金完全无关**。NEU OGS 把规格写到逐条：必须英文/官方抬头/12 个月内出具/注明币种与美元换算/明示可动用流动资金；**明确不接受**股票基金、退休金、公积金、信用额度、电汇凭证、房产证、租约、工资单、税表、实物资产 | **CoE ← 接受 offer + 押金 + OSHC**（UNSW/UQ/Adelaide/RMIT/UTAS 五所一致）；且 **CoE 经联邦 PRISMS 系统签发，不是学校系统** | 🔴 **必须分叉，且是三套完全不同的链**。<br>UK：`钱 → CAS`（1 条链）<br>AU：`钱 + 医保 → CoE`（1 条链，但输入多一项）<br>US：`占位链（钱）` 与 `签证链（资金证明）` **互不相交，押金不算进资金门槛，资金证明也不因交押金而降低**<br>**若按「押金 = 签证前置」统一建模，美国全线错误，UCL 也会被错误建模** |
| 19 | **签证文件能否在未清 condition 时先发** | **不能**。四所一致：CAS 硬前置是清完所有 offer condition | 不适用（I-20 不与学术 condition 绑定，绑定的是录取 + 接受 + 资金证明） | **能**：**conditional CoE**（RMIT），`"if your current academic results indicate that you are on track… you may be eligible to request a conditional CoE. This allows you to start your student visa application earlier."`（只能经 agent 申请）；Melbourne 也有 Conditional CoE 流程 | 🔴 **必须分叉**。澳洲存在一条英国不存在的**时间线捷径** |
| 20 | **签证文件的后续维护义务** | 未在本次范围内取证 | 未在本次范围内取证 | **明确的持续义务**：RMIT `"RMIT must update the details of your CoE and notify the Department of Home Affairs if you: [换课 / 休学（会重发新 CoE）/ 提前 2 个月以上完成 / 欠费导致取消]"` | 🟡 未足以判定（英美**未找到**）。**澳洲侧确认存在，产品若做「入学后状态跟踪」，澳洲是唯一有明文触发清单的** |
| 21 | **押金退款与冷静期** | **14 天法定冷静期**（UCL、Manchester 均有，源自英国消费者法）；退款窗口与硬截止各校不同（Leeds 硬截止 9 Nov 2026、Manchester 31 Jul 2026）；Coventry 虚假信息扣 £4,000 | **无冷静期**。Columbia `"There are no exceptions to this long-standing and standard university practice."` Cornell 不退只抵学费 | **联邦 TPS 兜底 + 学校反悔惩罚**：UNSW `"discontinue… before the census date in their commencing semester will be charged **50% of their deposit fee**"`，并列 5 条豁免（签证拒签但排除欺诈与主动撤签、疾病、学校无法开课、未达 conditional offer 条件、因 GTE 被撤 CoE）；申请走 Refund Request Form，5 个工作日回复 | 🔴 **必须分叉**。三国的底层法律基础不同（英国消费者法 / 美国无 / 澳洲 ESOS+TPS），**退款规则不可能有统一默认值** |

### 第四刀：材料与评估层

| # | 维度 | 英国 | 美国 | 澳洲 | 判定 |
|---|---|---|---|---|---|
| 22 | **个人陈述** | **单份 PS = 动机文书**，**硬上限**：UCL 3,000 字符或 2 页 A4（CS MSc 收紧到 1 页）／Leeds LUBS 500 词／Manchester CS 半页 A4／**Manchester ACS 根本不要** | **两份分工**（Cornell：ASOP + Personal Statement 均必需，ASOP 1–2 页）或 **PS + 短答**（UIUC：学术陈述 500–1000 词 + 4 个 250 词短答，2 必答 2 选答）；**软上限**（Columbia 250–1000 词且明说超了不扣分） | **主流不要 PS**，被 **GS declaration** 取代（Melbourne 2026-07-16 起强制）；GS statement 每小问 **< 150 词 × 4**，且 **`Not be AI-generated.`** | 🔴 **必须分叉**。文体不同（动机 vs 学术履历 vs 合规声明）、份数不同（1 / 2 / 0+1）、约束性质不同（硬 vs 软）。**同一份稿子不能跨国改长度复用** |
| 23 | **CV / Resume** | **条件性**，触发点是毕业年限（Manchester ACS >3 年、AMBS >2 年）或用于解释异常（Leeds EPS：gap / 跨专业 / borderline） | **默认必需**（Columbia 列六类内容、NEU 与 SOP 并列必需、UIUC 固定分区） | **四校文件清单均未列**（负面证据，非明确不要） | 🟡 **半统一**。字段存在，但「是否必需」的判定逻辑三国不同 |
| 24 | **推荐信数量** | 0–2，**同校内跨学院不同**（Manchester ACS 0 / Manchester CS 2 / AMBS 提交时 0） | **2–3 为主流**（Columbia 3、Cornell 2、NEU 2），**UIUC MCS 为 0（可选）** | **主流 0**；例外 UNSW AGSM MBA 2 | 🟡 **半统一**（一个整数字段），但**默认值不能按国家给** |
| 25 | **推荐信提交机制** | **两种并存**：系统邀请（UCL PGCE，且触发时点按项目不同——有的提交即发、有的**接受 conditional offer 后**才发）／**按需索取**（Leeds、Manchester AMBS——学校决定要不要） | **系统自动邀请**（Columbia：填入联系方式即触发，且 `"Under no circumstance should you write any portion of the evaluation, nor have any involvement in its drafting or submission."`） | **申请人自行转发 + 上传签名件**（UNSW AGSM，无系统邀请）；<br>⚠️ **UQ portal 提交后有 `provide referee details` 功能，是否发系统邮件——未确认（登录墙后），产品红线相关** | 🔴 **必须分叉**。「AI 以推荐人名义发邮件」是明确禁区（Columbia 措辞最硬），而澳洲主流是申请人线下转发——**两种机制下 AI 的合规边界完全不同** |
| 26 | **推荐信是否阻塞审理** | **UCL 阻塞**（`"complete application (… and both references returned)"`）／Leeds 不阻塞 | **Cornell 不完全阻塞**（3 封只到 2 封也算达标）／Columbia 未明说 | 不适用（主流不要） | 🟡 布尔字段可统一，值逐校 |
| 27 | **FERPA / 推荐信保密选项** | **未找到** | **有**（UIUC 明文 FERPA 弃权勾选） | 不适用 | 🔴 **美国专属字段** |
| 28 | **第三方学历评估** | **不需要**。ENIC Statement of Comparability（£69.60）**不是准入材料**；**UCL 甚至明确拒收**（`"rather than any ENIC Statement of Comparability"`）；Manchester 把 NARIC 当**学校自己的换算参照**；仅受监管专业需要（Coventry 护理） | **不普遍**：NEU `"a WES evaluation is not required"`（自建 FCE）／UT Dallas `"Outside credential evaluations are not required or accepted"`（自建 FCE）／Columbia 仅在学校无法电子直投时作 fallback／Cornell 把 WES 当**投递渠道之一**（ICAP only）／UIUC 未提 | 走**证书数字化平台**：My eQuals / Digitary VIA / Parchment / NSC（Melbourne 提供下拉多选） | 🔴 **必须分叉**。「申请美国必须 WES」是错的；「申请英国要 ENIC」也是错的 |
| 29 | **中国学历核验（CHESICC / 学信网）** | **不要 CHESICC**。UCL 要**成绩证明**（官方盖章 + 签字翻译，须在毕业日或之后出具），**申请时即上传** | **Columbia 强制**（中国院校学生专属规则），但是**录取之后、入学之前**的核验 | **Melbourne 是中国学生两条法定路径之一**（CSSD → My eQuals 投三份报告；另一条走 authorised agent）；UQ/Adelaide/UNSW **未提** | 🔴 **必须分叉**。**同一份中国材料在三国分别是：申请时材料（UK）／录取后核验（US）／申请路径之一（AU）** |
| 30 | **certified copy / 公证** | 未在本次范围内系统取证 | 无 certified copy 制度；改为「录取后由 Registrar 直投官方成绩单」+ 事后 verification process | **四校政策直接冲突**：UNSW **明确不要**（授课型）／UQ **要**／Adelaide **要且有 4 条逐项规格 + 授权认证人清单**／Melbourne 不用 certified，改为**校方直接向发证机构核验** | 🔴 **必须分叉**，且**澳洲内部就要逐校分叉** |
| 31 | **接受的语言考试类型** | IELTS 全接受；TOEFL 接受但限制多（Leeds/Manchester 均**不接受 Home Edition**，Manchester **不接受 MyBest**）；Duolingo **未见接受** | **分裂到学院级**：Cornell **只接受 IELTS + TOEFL**（明文拒 Duolingo/PTE）；Columbia/UIUC/UTD/NEU-CoE 接受 Duolingo；**NEU-Khoury 不接受 Duolingo**，官方还给出「换个学院申请」的建议 | 未逐校取证（**未找到**） | 🔴 **必须分叉，且分叉粒度是学院不是学校** |
| 32 | **TOEFL iBT 2026-01-21 改版双轨分数线** | UCL / Leeds / Manchester 均已维护新旧两套 | Columbia / UIUC / Cornell / NEU 均已维护新旧两套 | 未取证 | 🟢 **可统一**（英美一致，澳洲未证伪）。**分数线字段必须带生效日期，不能存单值** |
| 33 | **分数线的表达方式** | **课程级「档位」+ 全项最低分**（UCL Level 1–5；课程页只写档位）；实际区间 IELTS 6.5–7.0 总分 / 单项 5.5–6.5 | **三种口径并存**：无最低分只给软线（Columbia）／硬性单项线 + Tier A/B 且绑 TA 资格（Cornell）／Limited vs Full Status 双门槛（UIUC）／建议线且不 super-score（NEU Khoury） | **未找到** | 🔴 **必须分叉**。**Columbia 的「IELTS 软线 7」与 Manchester 的「IELTS 硬线 7.0」若都存成 `ielts_min=7.0`，会给出完全相反的建议** |
| 34 | **语言不达标的救济路径** | **pre-sessional 语言班 + combined offer**（语言班成绩顶替语言分数，Leeds 政策明文）；语言班时长是当前分数的函数（Coventry） | **降级录取 + 校内内测 + 降课业负荷**（UIUC Limited Status → EPT → 非学分 ESL）／**独立 Pathway 项目**（NEU Global Pathways） | **packaged offer 串 EAP/ELICOS，每段独立 CoE**；ELICOS 有联邦标准（ELICOS Standards 2018） | 🔴 **必须分叉**。三种形态对申请人的实际影响完全不同：<br>UK = 多一次申请 + 多一笔钱 + 多一段签证期，**仍是一张 CAS**<br>US = 不产生额外申请，**申请阶段看不出来**，影响的是入学后课业<br>AU = **产生多张 CoE**，签证时间线被拆段 |
| 35 | 🔴🔴 **是否卡本科院校层级** | **具名清单制**。Leeds 公开四份分学院清单（Business School 一份为中英双语具名全表），并写死 `"If your institution is not listed then unfortunately it is not accepted."` + `"75%-80% minimum GPA requirement depending on your institution"`；Manchester 走另一路：公开国别分数线 + 「well ranked institution」形容词，**但不公开名单** | **不卡院校层级，卡国别学历形态**。UIUC 有 **Minimum Requirements By Country**（China：4 年学士 + **B Average / 80%**）；其余四所一律是「recognized standing / regionally accredited / 该国教育部认可」。**五所样本无一公开境外院校分级名单** | **不给名单也不给国别表，给换算规则**。Melbourne：`"the final WAM may be adjusted depending on the previous institution's accreditation, subject grading, and pass marks"` | 🔴 **必须分叉，三套完全不同的判定函数**：<br>UK = 查表（清单 → 档位 → 分数线）<br>US = 按国别定形态与最低分<br>AU = 把分数换算到本校标尺再按院校调整<br>**且英国内部还分两类：Leeds 可穷举可建库，Manchester 不可穷举只能给区间 + 免责** |
| 36 | **GPA 的换算目标** | **英国学位等级（1:1 / 2:1 / 2:2）**，由学校用院校清单换算，申请人不自行折算；Manchester MBA 另用**班级排名**（top 25%） | **4.0 制**，且 **UIUC 只算本科最后两年**；NEU Khoury 给三条并列尺子（3.0/4.0、8.0/10.0、80/100） | **WAM 百分比**（Melbourne 65%），由学校单方面换算 | 🔴 **必须分叉**。产品**不能只存一个 `gpa` 字段**，至少要存：原始均分 + 原始满分 + 计算口径（全程 / 后两年）+ 发证院校，三国判定函数各自去取 |
| 37 | **工作经验的作用** | **学术条件的补正**，触发点是毕业年限（>2 / >3 / >5 年分别触发 CV、职场推荐人） | **先修课程的替代**（UIUC MCS `"prerequisite coursework or commensurate experience"`） | **可上传的雇主 certified reference**（Adelaide，条件性） | 🔴 **必须分叉**。三国触发的动作不同，不能做成通用加分项 |
| 38 | **录取后核验流程** | 等价物是「清 condition」——语义是「你还没达到 → 达到了才算数」 | **独立正式流程**：Columbia Verification Process，需**签署授权与免责表**，核验全部学术、职业与推荐信息；自报分数在此阶段核验 | 前置：certified copy / 校方直接向发证机构核验（Melbourne `"The University will verify all results and documentation with the issuing institution upon receipt of your application."`） | 🔴 **必须分叉**。**英国是「达标验证」，美国是「诚信审计」，澳洲是「来源核验」**——三种不同的失败模式，风险提示文案完全不同 |

### 第五刀：国家制度层（**英美完全没有的一层**）

| # | 维度 | 英国 | 美国 | 澳洲 | 判定 |
|---|---|---|---|---|---|
| 39 | **是否有国家级招生法定标准** | **无**（一致性来自行业惯例 + 签证制度） | **无**（I-20/SEVIS 是联邦移民规定，**招生本身没有任何联邦标准**） | **有，两层**：**HESF 1.1 Admission**（招生政策必须成文、公平一致；收费前必须告知全部费用、学分认定、offer 撤销与退款政策；合同必须书面）＋ **ESOS Act / National Code 2018 / CRICOS / TPS / PRISMS** | 🔴 **结构性差异**。**在澳洲，下列可做国家级默认值**：offer 必须书面、必须列明全部费用、必须写明退款与撤销政策、CoE 必经 PRISMS、学费保护经 TPS。**英美这一层是空的**——这解释了为什么美国样本的 offer 术语最不统一、退款规则最不透明 |
| 40 | **国际生招生名额配额** | 无 | 无 | **有：NOSC（New Overseas Student Commencement）**。UNSW `"All programs have exhausted their New Overseas Student Commencement (NOSC) allocation for 2026 intakes and are **closed to new applications for 2026**."`（豁免：UNSW Canberra / AGSM / HDR / Study Abroad / non-award） | 🔴 **澳洲专属状态**。这既不是「截止了」也不是「招满了」，是**「配额用尽 → 整所学校对国际生关闭整个申请季」**。[#4 状态层](https://github.com/jiangxidong/EduApplication/issues/4) 必须支持这种院校级不可用状态 |
| 41 | **签证风险评级是否进入申请流程** | 无（Coventry 按**地区**分押金档，是静态可穷举表） | 无（资金证明规格全国统一） | **深度介入，且是三处**：① **押金金额**由 visa risk rating 决定（UNSW Fee Procedure §2.4，**产品无法离线计算**）② **申请费按国籍收**（RMIT）③ **SSVF 不达标可直接导致申请失败且不复议**（RMIT） | 🔴 **必须分叉**。**「申请人的国籍/居住地会改变申请流程本身」在澳洲是常态，在英美是例外** |
| 42 | **GS / GTE 等真实性声明** | 无对应物（英国的等价物是签证阶段的 credibility interview，非申请阶段；Coventry 提到可能有 credibility interview） | 无对应物 | **有，且四校落点各不相同**：Melbourne **在申请表内且必填**／UNSW **offer 之后条件触发，且直申者也必须找 agent 或 regional manager 会签并面签**／Adelaide **作为 conditional offer 的一个 condition**／UQ **公开页只指向签证，学校表单内是否有 GS 未确认** | 🔴 **必须分叉**，且**澳洲内部四校四种**。⚠️ **产品红线**：Melbourne GS statement 明文 `Not be AI-generated.` |
| 43 | **政策文本是否可信为「现行制度」** | — | — | **⚠️ 反例**：UNSW Student Fee Procedure 的押金退款豁免条款仍写 **GTE**，而 GTE 已于 2024 年被 **GS** 取代 | 🔴 **通用工程警告**：**政策 PDF 的措辞可能滞后于现行制度，不能作为唯一真值源**。同理 UNSW Fee Policy 的 **Schedule 1 是 UNSW Bengaluru（印度校区）专属**，依据印度 UGC 2024 规定，其退款比例表与澳洲本土完全无关——**抓取时极易误采** |

---

## C-2 结论：共有骨架有多大

> **本节由 C-1 主表的「判定」列机械汇总而来**，43 行的分布是：**🟢 4 行 / 🟡 9 行 / 🔴 30 行**。
> 下面三个清单**穷举**这 43 行，不做取舍（🟢 另加 2 条不在主表编号内的观察，故为「4 + 2 = 6 条」）。

### 🟢 真正可以做「一套模型 + 一张参数表」的（4 行 + 2 条表外观察 = 6 条）

来自主表的 4 行：

1. **（#1）申请入口形态**：三国 coursework master 都是直申院校 portal，不存在覆盖性的集中申请系统。
2. **（#13）offer 携带响应期限**：三国都是「offer 有一个响应截止时点，逾期作废」。
3. **（#14）defer 三值枚举**：`不可 / 需申请 / 可`。
4. **（#32）语言分数线的双轨时效性**：TOEFL 2026-01-21 改版，英美样本同步维护新旧两套（澳洲未证伪）→ 分数线字段统一设计成 `(值, 生效起始日, 生效截止日)`。

表外补充的 2 条（未单独占主表行，但三国样本一致）：

5. **申请费不可退**：三国样本无一例外（RMIT 的「抵扣进押金」是抵扣不是退款）。
6. **押金抵扣学费**：三国一致，押金都不是额外费用（UK 四所、Columbia、Cornell、Melbourne、UNSW 均明文）。

### 🔴 必须国别分叉的（30 行，穷举，按对产品的杀伤力排序）

| 排序 | 分叉点（主表编号） | 若不分叉会产生什么错误 |
|---|---|---|
| 1 | **签证文件的前置链**（#18） | 美国全线错误（I-20 挂资金证明不挂押金）；UCL 也被错误建模（CAS 挂接受 offer 不挂押金） |
| 2 | **是否卡本科院校层级 + 用什么卡**（#35） | 给中国申请人的选校建议全错。UK 需查具名清单（Leeds 可穷举、Manchester 不可穷举），US 查国别表，AU 算 WAM |
| 3 | **GPA 的换算目标**（#36） | 只存一个 `gpa` 字段 → 三国都算错。UIUC「只算后两年」这条会被完全丢掉 |
| 4 | **个人陈述的文体与份数**（#22） | 用一份稿子跨国改长度 → 美国缺 ASOP、澳洲缺 GS 且触碰 AI 红线 |
| 5 | **offer 术语体系**（#12） | Limited Status 被错建成 conditional；packaged offer 建不出来 |
| 6 | **同时申请的实体关系**（#5） | 澳洲的「1 申请 N 志愿」建不出来；Columbia 的「每学期只能 1 个」漏掉会导致申请作废 |
| 7 | **「交押金」是否等于「接受 offer」**（#17） | **直接决定状态机里 `accepted` 状态的进入条件**。UCL 明确不等于、Manchester AMBS 明确等于、Columbia 等于、澳洲是接受之后的独立一步——四种语义 |
| 8 | **签证文件能否在未清 condition 时先发**（#19） | 澳洲的 **conditional CoE** 是一条英国不存在的时间线捷径；漏掉会把澳洲申请人的签证准备时间估晚数周 |
| 9 | **推荐信提交机制**（#25） | AI 合规边界判断错误（Columbia 措辞最硬；UQ 的 portal `provide referee details` 功能未确认） |
| 10 | **语言分数线的表达性质**（#33） | 软线与硬线混存 → 给出完全相反的建议 |
| 11 | **agent 的强制性**（#3） | 澳洲部分国籍的直申路径根本不可用，产品会引导用户走进死路 |
| 12 | **语言救济路径**（#34） | 三种形态对时间线和费用的影响完全不同 |
| 13 | **中国学历核验的时点**（#29） | 同一份材料的准备时机差半年 |
| 14 | **第三方学历评估**（#28） | 让用户白花 WES / ENIC 的钱（UT Dallas 明确**不接受**，UCL 明确**拒收**） |
| 15 | **押金的构成**（#16） | 澳洲的费用估算漏掉 OSHC + ELICOS + enrolment fee |
| 16 | **押金退款与冷静期**（#21） | 三国法律基础不同（英国消费者法 / 美国无 / 澳洲 ESOS+TPS），无法有统一默认值 |
| 17 | **国家级监管地板**（#39） | 会误以为美国也有「必须书面告知全部费用」这类保护 |
| 18 | **国际生名额配额**（#40） | 澳洲的「配额用尽 → 整所学校对国际生关闭整季」状态无法表达 |
| 19 | **签证风险评级进入申请流程**（#41） | 澳洲押金金额无法离线计算；「申请费按国籍」这条会漏 |
| 20 | **GS / GTE 声明**（#42） | 澳洲四校四种落点，且触碰 AI 红线（Melbourne 明文禁 AI 生成） |
| 21 | **certified copy 制度**（#30） | 澳洲内部就要逐校分叉（UNSW 不要 / UQ 要 / Adelaide 严格 / Melbourne 改为校方核验） |
| 22 | **录取后核验的语义**（#38） | 风险提示文案完全错位（英国达标验证 vs 美国诚信审计 vs 澳洲来源核验） |
| 23 | **接受的语言考试类型**（#31） | 分叉粒度必须到学院（NEU 内部 CoE 与 Khoury 就不同） |
| 24 | **底层平台厂商**（#2） | 自动填表 / portal 状态抓取必须按 vendor 适配；**但分叉维度是「平台」不是「国家」**（澳洲一次覆盖三校，英国要写四次） |
| 25 | **额外筛选环节**（#10） | Columbia 全部 MS 强制录像面试且提交付费后才解锁、UCL Management 强制第三方面试、RMIT 有独立面试轨截止日——三套独立触发条件与时间约束 |
| 26 | **审理时长是否公开承诺**（#9） | 这不是「有没有数据」而是「有没有这个制度」；只有 Melbourne 有校级承诺 |
| 27 | **复议 / 申诉通道**（#11） | Melbourne 有正式通道，Cornell 明确拒绝给理由，英国四所未找到——「申诉」功能不能对三国一视同仁 |
| 28 | **工作经验的作用**（#37） | 三国触发的动作不同（UK 补正学术条件 / US 替代先修课 / AU 上传雇主 certified reference），不能做成通用加分项 |
| 29 | **FERPA / 推荐信保密选项**（#27） | **美国专属字段**，英澳样本无对应物 |
| 30 | **政策文本的时效性**（#43） | 政策 PDF 措辞可能滞后于现行制度（UNSW 仍写 GTE），且可能夹带完全不适用的境外校区条款（UNSW Bengaluru Schedule 1 依据印度 UGC 规定） |

### 🟡 半统一的（9 行，穷举）

字段可以共用，但**判定逻辑或值域必须逐国实现**：

| 主表编号 | 维度 | 共用的部分 | 必须逐国实现的部分 |
|---|---|---|---|
| #4 | 申请费 | 金额 + 是否可退 + 豁免条件的字段结构 | 值是「院校 × 学院 × 周期 × 国籍」的函数，必须可失效，不能静态缓存 |
| #6 | 截止机制形态 | 枚举 `rolling` / `fixed-deadline` / `rounds` / `undisclosed` | 每种形态携带的日期字段数不同（英国轮次 2 个日期，澳洲轮次 3 个） |
| #7 | 国际生单独截止日 | 「截止日是申请人属性的函数」 | 自变量不同：英国是签证需求、美国是校区、澳洲是国籍 + 是否已在境内 |
| #8 | 入学季与学期制 | `(intake, 课程可用性, 学期制类型)` 三元组 | 「学期制类型」是澳洲逼出来的字段（UNSW 用 term 不用 semester），英美不需要 |
| #15 | 是否收押金 | 押金字段本身 | 美国是可选的、澳洲是必然的；澳洲金额不可离线计算（visa risk rating 是外部动态输入） |
| #20 | 签证文件后续维护义务 | — | 澳洲侧确认存在明文触发清单，**英美未找到**，不足以判定 |
| #23 | CV 是否必需 | 布尔字段 | 判定逻辑三国不同（美国默认必需 / 英国按毕业年限触发 / 澳洲清单未列） |
| #24 | 推荐信数量 | 一个整数字段 | **默认值不能按国家给**，同校跨学院就不同 |
| #26 | 推荐信是否阻塞审理 | 布尔字段 | 值逐校（UCL 阻塞、Cornell 不完全阻塞、Leeds 不阻塞） |

## C-3 对 delta 架构的直接建议：切五刀

基于上表，建议 delta 层沿以下**五个接缝**切分，而不是按「国家」平铺：

1. **平台适配层（按 vendor 切，不按国家）** — Slate / ApplyWeb / StudyLink / SITS / PeopleSoft / Power Apps / Salesforce / TechnologyOne。
   澳洲切一刀覆盖三校，英国要切四刀。**这一层与国别正交。**

2. **申请实体模型层（按国家切，只有两种）** — `N × Application`（英 + 美）vs `1 × Application + N × Preference`（澳）。
   这是**实体关系差异**，必须在最底层解决。

3. **时间线 / 状态机层（按国家切三套）** — 三条签证文件链是三套不同的状态机：
   - UK：`submit → conditional offer → accept → clear conditions → unconditional → deposit → CAS → visa → enrol`（UCL 的 deposit 位置不同，作为参数）
   - AU：`submit(N preferences) → offer(full/conditional/packaged) → accept → deposit + OSHC → CoE(可 conditional 前置) → visa → enrol`
   - US：`submit → decision → accept + deposit（占位链）` ∥ `financial docs + passport → I-20 → SEVIS fee → F-1（签证链）`——**两条链并行且不相交**

4. **材料模型层（按国家切三套，且要能下钻到学院）** — 文书文体、CV 触发条件、推荐信数量与机制、成绩单认证路径。
   **注意：这一层的最小粒度不是学校而是学院**（Manchester ACS vs Manchester CS；NEU CoE vs NEU Khoury；Leeds LUBS vs Leeds EPS 的清单都不同）。

5. **准入判定层（按国家切三套判定函数）** — 院校清单查表（UK）／国别形态表（US）／WAM 换算（AU）；
   加上语言分数线的 `(值, 性质=硬/软, 生效期)` 三元组。

**跨五刀的横切关注点（cross-cutting）**：
- **周期（intake year）是全局维度**，不是属性。申请费、分数线、截止日、清单、押金都会按周期变（UIUC 一年 $70→$90；Leeds 清单标 2026/27 entry）。
- **申请人国籍 / 居住地在澳洲会改变流程本身**（agent 强制、申请费、offer round、押金金额），在英美只改变参数。这一点需要在架构上给澳洲留出「流程分支」而不只是「参数分支」的能力。

---

# 未解决项

## 本轮明确「未找到」的（按重要性）

**美国**
1. 🔴 **UIUC / UT Dallas / Northeastern 的申请系统底层厂商**——未取到能定性的静态资源指纹。
2. 🔴 **Cornell 的 enrollment deposit 金额**——公开页只说「部分项目要」，未给数字。
3. 🟠 **Northeastern / UIUC / UT Dallas 是否收 enrollment deposit**——公开页未见。
4. 🟠 **Cornell / Northeastern / UT Dallas 的同时申请上限**。
5. 🟠 **Columbia 之外的美国学校是否要求 CHESICC**——Northeastern 有中国专属 FCE 规则页，但正文为 Salesforce 动态渲染，本次抓取未取到条款。
6. 🟡 **是否存在「CGS April 15 Resolution」这类跨校统一的接受截止日约定**——本次五所样本的公开页面**全文检索无命中**，不予采信。

**澳洲**
7. 🔴 **四所 Go8 的具体语言分数线**——本轮未逐校取证（B-3.2(c) 留空）。
8. 🔴 **UQ portal 的 `provide referee details` 是否向推荐人发系统邮件**（登录墙后）——**产品红线相关，优先级最高**，见 `au-notes.md` §8。
9. 🔴 **UQ 与 Adelaide 的截止机制 / offer 轮次 / offer 类型定义**——本轮 A-2 §3、§4 只取到 UNSW、RMIT、Melbourne、UTAS 四所，**UQ 与 Adelaide 完全未取证**。
10. 🟠 **UQ / Adelaide / RMIT / UTAS 的院校层级或 GPA 换算机制**——只取到 Melbourne 的 WAM 规则。
11. 🟠 **UTAS 国际生是否另有早于校级表的截止日**——本次只取到校级综合日程。
12. 🟠 **UQ / Melbourne / Adelaide 的单文件大小上限与接受格式**（只有 UNSW 公开：PDF/JPG/TIF，10Mb）。
13. 🟡 **Melbourne 志愿数量到底是 3 还是 4**（两个官方页面互相矛盾，见 `au-notes.md` §8）。
14. 🟡 **澳洲各校接受的语言考试类型清单**（是否接受 Duolingo / PTE）。

**英国**（承接 UK 文件的未解决项，未在本轮推进）
15. 三所的 2027 entry 开放 / 截止日期；Leeds 申请费具体金额；Leeds / Manchester 的同时申请上限；Coventry 的任何具体日期。
16. 🟠 **UK 四所的 certified copy / 公证要求**——本轮未系统取证。
17. 🟠 **UK 四所是否有正式的录取复议 / 申诉通道**——未找到。

**跨国**
18. 🟠 **英美的签证文件后续维护义务**（澳洲侧已确认存在明文触发清单，英美未取证）。
19. 🟡 **美国样本中是否存在境外院校分级名单**——五所公开页面均未见，但**不能据此断言不存在**（可能是内部文件）。

## 方法论警告（供后续 ticket 复用）

1. **政策 PDF 会滞后于现行制度**：UNSW Fee Procedure 仍写 GTE（已被 GS 取代）。**不能把政策文本当唯一真值源。**
2. **同一份政策文件里可能夹着完全不适用的境外校区条款**：UNSW Fee Policy 的 Schedule 1 是印度 Bengaluru 校区专属，依据印度 UGC 规定。**抓取时必须检查 scope 声明。**
3. **「清单未列」≠「明确不要」**：澳洲四校的推荐信、CV 结论都是负面证据，本文件已逐条标注证据强度，后续不得升级为正面结论。
4. **最小分叉粒度是学院不是学校**：本轮取证到 4 组同校异院分叉——Manchester ACS（不要 PS、不要推荐信）vs Manchester CS 授课型（半页 A4 statement of aims + 两封学术推荐信）／NEU CoE（收 Duolingo 105）vs NEU Khoury（不收 Duolingo）／Leeds LUBS（PS 500 词、两封学术推荐人、独立中国院校清单）vs Leeds EPS（PS 非标配、CV 用于解释异常、另一份清单）／UCL Management（4 × 4,000 字符 essay + 强制面试）vs UCL CS MSc（PS 一页 A4、两封推荐信）。**四组全部在学院层就分叉。**


---

# 附录：来源清单（按核验强度分两级）

> **本附录严格区分两类**，因为本轮抓取里有相当一部分页面是脚本批量取回的，
> **原始请求 URL 没有随文件保存**。对这类页面，本文件**只给本地抓取文件路径，不给 URL**——
> 凭文件名反推 URL 属于编造，宁可留空。

## A 级：URL 已核验
（来源：firecrawl 抓取元数据的 `sourceURL`、页面 HTML 的 `rel="canonical"` / `og:url`、或本轮抓取脚本里的 URL 清单）

**美国**
| 内容 | URL |
|---|---|
| Columbia SEAS 申请要求（材料清单 / 截止日表 / 录像面试 / 每学期只能申 1 个 / 申请费与 waiver） | https://www.engineering.columbia.edu/admissions-aid/graduate-admissions/how-apply/application-requirements |
| Columbia SEAS 招生 FAQ（押金 / 官方成绩单与 CHESICC / 语言分数 / GPA 换算 / verification process） | https://www.engineering.columbia.edu/admissions-aid/graduate-admissions/admissions-faqs |
| Columbia CS MS 申请 FAQ（GPA 3.5 / I-20 资金证明时点） | https://www.cs.columbia.edu/education/ms/appfaq/ |
| Columbia SEAS 申请入口（Technolutions Slate 取证） | https://apply.engineering.columbia.edu/ |
| Cornell Graduate School 缴费（$105 / fee waiver 流程） | https://gradschool.cornell.edu/admissions/application-steps/pay-fees/ |
| Cornell Graduate School 语言要求（只收 IELTS/TOEFL / Tier A/B / 豁免） | https://gradschool.cornell.edu/admissions/application-steps/required-tests/english-language-proficiency-requirement-2/ |
| Cornell Graduate School 成绩单（10MB 上限 / WES 作投递渠道 / NACES / AICE） | https://gradschool.cornell.edu/admissions/application-steps/transcripts/ |
| Cornell Academic Statement of Purpose（1–2 页） | https://gradschool.cornell.edu/admissions/application-steps/statements-of-purpose/ |
| Cornell Personal Statement（与 ASOP 分工） | https://gradschool.cornell.edu/admissions/application-steps/personal-statements/ |
| Cornell 录取生 FAQ（enrollment deposit / defer） | https://gradschool.cornell.edu/admissions/admitted-students/admissions-and-admitted-student-faq-2/ |
| Cornell CS M.Eng. 申请（硬截止 / 审理节奏 / 2 封推荐信 / 押金与资金证明） | https://www.cs.cornell.edu/master-engineering-computer-science/apply |
| UIUC 完成申请（$90 / 文书字数 / FERPA / 多项目申请与费用） | https://grad.illinois.edu/admissions/application-instructions/completing-your-graduate-application |
| UIUC 研究生录取最低要求（GPA 3.0 / conditional admission） | https://grad.illinois.edu/admissions/graduate-admissions-minimum-requirements |
| UIUC 申请前须知（国际生资金证明 / 多项目申请） | https://grad.illinois.edu/admissions/application-instructions/you-begin |
| UIUC 国际申请人（Limited vs Full Status / EPT / 豁免国清单 / 不收 MyBest） | https://grad.illinois.edu/admissions/international-applicants |
| UIUC 按国别最低要求 · 中国（B Average / 80%） | https://grad.illinois.edu/admissions/instructions/country/china |
| UIUC Siebel School MCS 申请信息（GPA 3.2 建议 / 不要推荐信） | https://siebelschool.illinois.edu/academics/graduate/professional-mcs |
| Northeastern CoE 研究生招生（MS 申请费豁免 / 2 封推荐信 / SOP / 语言分数 / Global Pathways） | https://coe.northeastern.edu/academics-experiential-learning/graduate-school-of-engineering/graduate-admissions/ |
| Northeastern Khoury 硕士申请（截止日 / GPA / WES 不需要 / 不收 Duolingo） | https://www.khoury.northeastern.edu/apply/masters-apply/ |
| UT Dallas 国际生研究生招生（$75 / 语言考试 / 三年制学位 / 不接受外部学历评估） | https://graduate-admissions.utdallas.edu/international/ |
| Liaison GradCAS（集中申请服务的官方定位） | https://www.liaisonedu.com/centralized-application-service/gradcas/ |

**澳洲**
| 内容 | URL |
|---|---|
| ESOS Framework / National Code 2018 / CRICOS / TPS / PRISMS | https://www.education.gov.au/esos-framework |
| UNSW 国际生招生信息（NOSC 配额 / offer round 三日期表 / 按国籍最后轮次 / IADP / defer） | https://www.unsw.edu.au/study/international-students/admissions-info |
| UNSW 接受 offer（押金 → eCoE） | https://www.unsw.edu.au/study/help/offer |
| Melbourne 审理时长承诺 / lapse date / reconsideration 通道 | https://study.unimelb.edu.au/how-to-apply/indicative-turn-around-times |
| Melbourne Handbook · MC-IT 入学要求（WAM 65% 与按院校调整） | https://handbook.unimelb.edu.au/2026/courses/mc-it/entry-participation-requirements |
| UQ 响应 offer（押金 + OSHC → CoE，Flywire） | https://study.uq.edu.au/admissions/postgraduate-coursework/respond-your-offer |
| Adelaide University 接受 offer（First Tuition Payment + OSHC → CoE，1–2 个工作日） | https://adelaide.edu.au/study/international-students/how-to-apply/accepting-your-offer/ |
| RMIT 申请费（按国籍名单，中国不在名单） | https://www.rmit.edu.au/study-with-us/international-students/apply-to-rmit-international-students/application-fee |
| RMIT 申请日期（三日期 + 面试轨） | https://www.rmit.edu.au/study-with-us/international-students/apply-to-rmit-international-students/application-dates |
| RMIT 理解你的 offer（full / conditional / packaged / SSVF） | https://www.rmit.edu.au/study-with-us/international-students/apply-to-rmit-international-students/accept-your-offer/understand-your-offer |
| RMIT 接受 offer（押金构成 / Convera / CoE 5 个工作日） | https://www.rmit.edu.au/study-with-us/international-students/accept-your-offer |
| RMIT 入学季（Semester 1/2/3 与课程可用性） | https://www.rmit.edu.au/study-with-us/international-students/intakes-in-australia-for-international-students |
| 其余澳洲平台 / agent / GS / 上传 / 认证 / 推荐信取证的 URL | 见 `scratchpad/au-notes.md` §9「来源 URL 汇总」（已逐条核验） |

**英国**
| 内容 | URL |
|---|---|
| Leeds 接受的中国院校清单（研究生招生总入口，分四份） | https://www.leeds.ac.uk/international-applying/doc/accepted-chinese-institutions-postgraduate-admissions |
| Leeds University Business School 接受的中国院校清单（中英双语具名全表） | https://business.leeds.ac.uk/masters/doc/accepted-chinese-institutions |
| UK ENIC（Statement of Comparability 定位与 £69.60 定价） | https://www.enic.org.uk/ |
| 其余英国四校的申请入口 / 申请费 / 时间线 / offer / 押金 URL | 见 [`uk-apply-timeline-deposit.md`](./uk-apply-timeline-deposit.md)（已逐条核验） |

## B 级：URL 未核验——只给本地抓取文件路径

以下内容在本文件中被引用，**原文可在本地抓取物中逐字复核**，但**本轮未保存其请求 URL**。
后续若要对外引用，**必须先重新抓取并记录 URL**。

| 内容 | 本地文件 |
|---|---|
| HESF 1.1 Admission 逐字条款 | `scratchpad/raw/au-scrapes/hesf.pdf` / `hesf.txt` |
| Melbourne 国际生 Terms and Conditions（AUD $17,000 押金） | `scratchpad/au/um-tc.pdf` / `um-tc.md` |
| UNSW Student Fee Policy & Procedure（押金按 visa risk rating / 50% 反悔费 / 退款豁免 / Bengaluru Schedule 1） | `scratchpad/au/unsw-feepolicy.pdf` / `unsw-feepolicy.txt` |
| RMIT CoE 页（conditional CoE / CoE 维护义务 / CoE 签发条件） | `scratchpad/au/rmit-coe.html` / `rmit-coe-main.txt` |
| UTAS 关键日期（2026 / 2027 两周期并列） | `scratchpad/au/utas-appdates.md` |
| UTAS 接受 offer（押金 + 医保 → eCoE） | `scratchpad/au/utas-accepting.md` |
| Northeastern OGS 资金证明（I-20 逐条规格与可/不可接受资金来源） | `scratchpad/ogs_financial-requirements.txt` |
| Cornell 申请系统（CollegeNET ApplyWeb 取证） | `scratchpad/us/cornell/p_www_applyweb_com_instructions_cornellg.html` |
| UCL 语言要求分级（Level 1–5 与 IELTS/TOEFL 映射） | `scratchpad/ucl/english.md` |
| UCL Computer Science MSc（PS 一页 A4 / 两封推荐信 / 6–8 周决策） | `scratchpad/ucl/cs-msc.md` |
| UCL 个人陈述（3,000 字符 / 两页 A4） | `scratchpad/ucl/ps.md`、`scratchpad/uk/ucl-pg-personal-statement.txt` |
| UCL 成绩单与中国「成绩证明」要求 | `scratchpad/ucl/transcript.txt` |
| UCL PGCE（ENIC 明确拒收 / 推荐信系统邀请时点） | `scratchpad/ucl/pgce.txt` |
| UCL Management MSc 附加材料（4 × 4,000 字符 essay + 面试） | `scratchpad/ucl/addreq.txt` |
| Manchester MSc ACS 入学要求（China 87% / high-ranking institutions / CV >3 年） | `scratchpad/man/acs-entry.txt` |
| Manchester 授课型 CS 申请材料（两封学术推荐信 / statement of aims 半页 A4 / CV） | `scratchpad/man/cs-apply.txt` |
| Alliance MBS 国际入学要求（China 80–85% / 院校层级进入评估要素） | `scratchpad/man/ambs-intl.txt` |
| Alliance MBS 申请文件（推荐信按需索取 / CV >2 年工作经验） | `scratchpad/man/ambs-docs.txt` |
| Manchester MBA（UK NARIC 作参照 / top 25% of class） | `scratchpad/man/mba.txt` |
| Leeds 硕士申请材料（CV / 两位推荐人联系方式 / 按需联系） | `scratchpad/leeds/apply-masters.txt` |
| Leeds 中国资格与「使用院校清单」制度声明 | `scratchpad/leeds/china.txt` |
| Leeds LUBS 申请（PS 500 词 / 两位学术推荐人）与语言要求 | `scratchpad/leeds/lubs-apply2.txt`、`scratchpad/leeds/lubs-eng2.txt` |
| Leeds EPS 申请（PS 非标配 / CV 用途） | `scratchpad/leeds/eps-apply.txt` |
| Coventry 语言考试与 pre-sessional（IELTS 门槛与语言班时长） | `scratchpad/cov/engtests.txt`、`scratchpad/cov/presess.txt` |
| Coventry 研究生申请（推荐信 / IELTS 6.5） | `scratchpad/cov/pg-app.txt`、`scratchpad/cov/ds.txt` |
| Coventry 护理（ENIC Certificate of Comparability） | `scratchpad/cov/nursing.txt` |
