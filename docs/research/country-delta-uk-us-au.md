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
