# 英国授课硕：申请入口 / 时间线 / offer 类型 / 押金

> **来源与状态**：2026-08-14 由 research subagent 对四所院校官网与官方 PDF 一手抓取所得，
> 抓取手段为 curl/urllib 直取 HTML 后本地去标签，PDF 用 pdftotext；**未使用任何中介博客、排名站或二手总结**。
> 该 agent 因会话额度中断，未能自行落盘，本文件为其完整成果的抢救留存。
> 服务于 [#5 英/美/澳授课硕在申请机制上到底差什么](https://github.com/jiangxidong/EduApplication/issues/5)，
> 部分内容同时服务 [#6 网申系统字段](https://github.com/jiangxidong/EduApplication/issues/6)。

样本：UCL（Management MSc，商科）、Manchester（MSc Advanced Computer Science，另对照 Alliance MBS）、
Leeds（Business Analytics and Decision Sciences MSc）、Coventry（MSc Data Science，post-92 对照组）。

---

## ⚠️ 最重要的前置结论：周期状态

**查阅日 2026-08-14，四所中有三所尚未发布 2027 entry（2027 年 9 月入学）的课程页面。** 实测三种年份 URL 参数全部回落到 2026 entry：

- Manchester `?entryYear=2027` → `<title>` 仍为 `MSc Advanced Computer Science (2026 entry)`
- Coventry `/pg/2027-28/...` → 302 回落到 2026-27
- UCL `?year=2027` → HTTP 520

**唯一的 2027 周期一手文件是 Leeds 的 Admissions Policy 2027-28。** 下文所有日期严格标注页面自述的周期，凡属 2026 entry 的不冒充 2027。

> **对产品的直接含义**：申请季数据的「可获得时点」本身是个变量。8 月时下一季度的页面多数还没出——这正是
> [#4 状态层](https://github.com/jiangxidong/EduApplication/issues/4) 里「申请季标记 + 换季全表降级」要处理的现实。

---

## 一、UCL — Management MSc

### 申请入口
直申院校 portal，无集中系统。品牌名 Portico，底层是 **Tribal SITS:Vision (e:Vision)**——登录页 URL 路径 `/urd/sits.urd/run/siw_ipp_lgn.login` 是 SITS 标志性路径。支付走第三方 **Flywire**。

- 入口：https://www.ucl.ac.uk/prospective-students/graduate/apply
- portal：https://evision.ucl.ac.uk/urd/sits.urd/run/siw_ipp_lgn.login

**申请费：标准 £90，但 Management MSc 是 £160。**
> "A standard fee of £90 for online applications will apply to the following types of course: Master's degrees (MA, MSc, LLM, etc.)"
> 表格：Management MSc £160｜Business Analytics (with Management Science) MSc £160｜Finance MSc £160｜Project and Enterprise Management MSc £160｜Slade School of Fine Art 全部课程 £35
> "Application fees are non-refundable - this includes in circumstances where an application is unsuccessful."

来源：https://www.ucl.ac.uk/study/prospective-students/graduate/how-apply/application-fees ｜2026-08-14｜页面未标周期

**免申请费**：约 20 个具名课程（研究型学位、Brain and Mind Sciences MSc、MSc Data Analytics for Government 等）+ 教师培训（走 DfE Apply）+ 冲突/难民情形。明确排除奖学金申请者：
> "It is not possible to apply for an application fee waiver under any other circumstances, including if you are applying for a scholarship."

**同时申请上限：硬性 2 个，且撤回重交也占额度。**
> "Please note - you can only apply to a maximum of two taught graduate courses in any academic cycle."
> "You can only submit up to two applications per admissions cycle. In this instance, both your withdrawn and new applications would use up your allowance."

来源：https://www.ucl.ac.uk/study/prospective-students/graduate/how-apply/applying-graduate-taught-study-ucl ｜https://www.ucl.ac.uk/study/prospective-students/graduate/how-apply/what-happens-after-you-apply-ucl ｜2026-08-14

### 时间线
**2027 entry 开放月份：未找到**（已查项目页、院系页、apply 页、`?year=2027` 参数均失败）。

2026 entry 实际窗口（形态参照）：
> "Applications for the 2026/27 cycle will open on 20th October 2025 and close on 26th June 2026 at 5pm UK time for applicants who require a visa; and on 28th August 2026 for those who do not."

来源：https://www.mgmt.ucl.ac.uk/management ｜2026-08-14｜2026/27 entry

**截止机制 = 固定周期截止日 + 内部非日期型 4 阶段筛选漏斗**（两者要分开理解）：
> "Applications for MSc Management are assessed in 4 stages: Stage 1 - Initial assessment … Stage 2 - Completion of an interview … Stage 3 - Post interview selection … Stage 4 - Holding"
> "Stage 4 - Holding: During this stage applications are held and regularly reviewed. When they are reviewed the Programme Director will consider all applications currently at stage 4 and recommend offers to the strongest candidates until all places are filled."

Stage 2 面试由第三方 `@jobma.com` 发出邀请。

**国际生差异**：按「是否需要签证」划分（26 Jun vs 28 Aug，差约 2 个月），**不是按国籍**。未找到针对中国籍的单独截止日。

**入学季**：Management MSc 只有 9 月。但校级确有 1 月开学的授课课程（申请费豁免清单中多条带 "(January Start)" 后缀，如 PG Cert Cognitive Behaviour Therapy (for Psychosis)）。

### Offer 类型
使用 conditional / unconditional，成对出现：
> "The General Conditions of Entry apply to all offer-holders. They apply whether you hold an unconditional or conditional offer."
> "You must meet all your conditions and hold an unconditional offer before you can enrol."

condition 内容含**非学术条款**：
> "You must inform UCL of any criminal conviction(s) between application and enrolment."
> "If you accept UCL's offer of admission and then behave in a way that may bring UCL into disrepute, UCL reserves the right to withdraw your offer of admission."

来源：https://www.ucl.ac.uk/study/prospective-students/graduate/your-offer/about-your-offer ｜2026-08-14

**offer 有效期**：写在 offer 信里；无日期时有兜底规则：
> "If you are expecting to start your studies in September or October, and you receive your offer after the 30th June and your offer letter does not give a specific date to respond by we strongly encourage you to respond within two weeks and no later than the start date of your programme."

清 condition 截止（2026 entry）：11 September 2026（标准 28 September 开学者）。

### 押金
**按学费百分比，不是固定额。**
> "For Full-time and Part-time offer holders a fee deposit will be charged at 2.5% of the first year fee for those with a fee status classification of UK and 10% of the first year fee for those with a fee status classification of Overseas."
> "There is usually no fee deposit required for PG Dip and PG Cert applicants."

Management MSc 2026/27 海外学费 £42,700 → 押金约 **£4,270**。

来源：https://www.ucl.ac.uk/study/prospective-students/graduate/funding-your-masters/tuition-fees ｜2026-08-14

**缴纳时点（关键差异）**：
> "For September starters, the deadline for full payment of the deposit will be the later of: 1 April, six weeks from the date of the offer of admission but no later than the day preceding the formal start date specified in the offer of admission."

**押金 ≠ 接受 offer，是两个独立动作；conditional offer 持有人也要交：**
> "Is payment of the deposit the same as acceptance of the offer? No. The payment of the deposit is a separate requirement. You still need to accept UCL's offer, via the Applicant Portal"
> "Do I have to pay my deposit before I accept my offer? No, the requirement to pay the deposit will only arise once you accept your offer."

**不交的后果**：撤 offer，至少提前两天通知。

**退款**：原则不退，5 条具名例外含 **14 天冷静期**：
> "If an Offer Holder, who has accepted their offer of a place at UCL on a postgraduate course and paid the Tuition Fee Deposit changes their mind within 14 days of paying the deposit (the "cooling off period")"
> "UCL will not refund the exact amount of deposit that it receives. … UCL shall also be entitled to deduct any bank charges directly connected to the refund of the deposit."

来源：https://www.ucl.ac.uk/study/prospective-students/graduate/funding-your-masters/fee-deposits-frequently-asked-questions ｜正式 PDF：https://www.ucl.ac.uk/study/sites/study/files/2026-01/tuition_fee_deposits_policy_2026_entry.pdf ｜2026-08-14

**⚠️ CAS 与押金不挂钩——UCL 是四所中唯一的例外：**
> "We cannot prepare your CAS until you have formally accepted your unconditional offer."

已查 deposit 页、deposit FAQ、offer FAQ、next steps、about-your-offer、院系页，**全部未见 CAS↔deposit 绑定表述**。

---

## 二、University of Manchester — MSc Advanced Computer Science

### 申请入口
直申 portal，底层 **Oracle PeopleSoft Campus Solutions**（URL 特征路径 `/psc/apply/EMPLOYEE/SA/c/`，页面含 "Copyright © 2000, 2025, Oracle and/or its affiliates"）。

- portal：https://pgapplication.manchester.ac.uk/psc/apply/

**申请费：非校级统一，按项目清单收。MSc Advanced Computer Science 页面全文无 application fee；Alliance MBS 的 8 个具名商科项目收 £60。**
> "The following courses require a non-refundable application fee of £60: MSc Accounting / MSc Accounting and Finance / MSc Business Analytics and Artificial Intelligence / MSc Digital Marketing / MSc Finance / MSc International Business and Management / MSc Marketing / MSc Management."
> "You don't need to pay an application fee if the programme you are applying for is not listed."

免除：Chevening / LPDP 奖学金申请者、Manchester Master's Bursary 合资格者（需提交证据）。

来源：https://www.alliancembs.manchester.ac.uk/study/masters/how-to-apply/ ｜2026-08-14｜2026/27 entry

**同时申请上限：未找到校级规则。** 只有两条相关：同系列内限 1 份（"we ask that applicants place only one application for their preferred programme"）；按项目逐份收费（隐含允许多份）。

### 时间线
**2027 entry 具体日期：未找到。** 唯一可引用的是周期无关表述："Applications for September entry open in October"。

2026 entry 开放日：13 October 2025。

**截止机制 = 明确的日期型分轮次，每轮公布「投递截止 + 出结果日」——四所中最结构化。**

MSc Advanced Computer Science（2026 entry）：
| 轮次 | 投递截止 | 出结果 |
|---|---|---|
| Stage 1 | 7 Nov 2025 | 9 Jan 2026 |
| Stage 2 | 2 Jan 2026 | 6 Mar 2026 |
| Stage 3 | 27 Feb 2026 | 1 May 2026 |
| Stage 4 | 22 May 2026 | 19 Jun 2026 |

> "Applications received after 22 May 2026 will be considered depending on course availability."
> "Whilst we aim to give you a decision on your application by the deadline date, in some instances due to the competition for places and the volume of applications received, it may be necessary to roll your application forward to the next deadline date."

Alliance MBS 轮次**不同**：Stage 1「7 Dec 2025 → 20 Feb 2026」、Stage 2「1 Mar → 1 May」、Stage 3「3 May → 19 Jun」、Stage 4「5 Jul → 31 Jul」，总截止 5 July 2026。

**同一所学校内，商科与 CS 的轮次日期各不相同。**

**入学季**：该 CS 项目只有 9 月，且明确不接受 deferral。

### Offer 类型
conditional / unconditional。**Manchester 特有的 academic progression 条款**：
> "We expect you to consistently achieve good grades throughout each year of your studies and maintain a consistent level of academic performance. Particularly in your final year, we expect to see an improvement in your overall average."

**offer 有效期写死了典型时长：**
> "If we make you an offer, you will be given a deadline by which to accept. This is typically 4-6 weeks but may be shorter. Offers that are not accepted by the deadline will be withdrawn."

清 condition 截止（2026 entry）：31 July 2026。

### 押金——**Manchester 有两种，必须分开**

**D-1 CAS deposit（签证用）：£2,500 起**
> "Self-funded international applicants are required to pay a deposit of £2500 towards their tuition fees before a confirmation of acceptance for studies (CAS) is issued."
> "Applicants who live in certain countries – currently Bangladesh, Ghana and Pakistan – will need to pay a higher deposit before a CAS can be issued. This is part of the University's process to help confirm applications are genuine."

**中国不在加价名单内 → 中国申请人 £2,500。**

**必须等 unconditional 才能交（与 UCL 完全相反）：**
> "You can only pay your tuition fee deposit once your offer is unconditional. If you have more than one unconditional offer, you should decide which programme you want to accept before paying the deposit for that programme."

豁免：第三方全额资助 / 美国学生贷款覆盖全额 / 读语言预科。
退款：签证拒签可退，但欺诈文件导致的拒签除外。

来源：https://www.manchester.ac.uk/study/masters/fees-and-funding/international-student-fees/tuition-fee-deposits/ ｜2026-08-14

**D-2 Offer acceptance deposit（占位用）：£2,500，只有部分项目要**
> "If you're required to pay an acceptance deposit, any requirement for a CAS deposit will be waived, unless your programme's required CAS deposit is higher than the acceptance deposit."
> "If you don't pay your acceptance deposit by the deadline included in your offer letter, your offer of a place will be withdrawn."

官方 PDF「Courses and Programmes Requiring an Offer Acceptance Deposit for 2026 Entry」逐字抽样：
> "MSc Accounting and Finance    2500    Offer Acceptance Deposit"
> "MSc Management    2500    Offer Acceptance Deposit"
> "MPhil Accounting and Finance    500    Offer Acceptance Deposit"

**MSc Advanced Computer Science 不在清单内**（全文检索 "computer science" 命中 0 次）→ 该 CS 项目只需 £2,500 CAS deposit；MSc Management 需 £2,500 acceptance deposit。**同校内商科与 CS 的占位机制不同。**

来源：https://documents.manchester.ac.uk/display.aspx?DocID=60626 ｜2026-08-14｜2026 Entry

**AMBS：交押金 = 接受 offer**（与 UCL 语义相反）：
> "Once we have received the payment, we will manually update your record to accept your offer."

**14 天法定冷静期 + 退款申请硬截止 31 July 2026：**
> "You have a legal right to cancel your place by notifying us within 14 days of The University of Manchester's acceptance of your application."

---

## 三、University of Leeds — Business Analytics and Decision Sciences MSc

### 申请入口
直申 portal（My Leeds Portal），底层 **Microsoft Power Apps Portal / Dynamics 365 + B2C 登录**（加载 `content.powerapps.com/resource/powerappsportal/dist/app.bundle-*.js`，含 `b2clogin`、`Dynamics` 字符串）。

政策层面确认无集中系统：
> "Applications for taught postgraduate courses should be made directly to the University through the My Leeds Portal."

来源：https://www.leeds.ac.uk/study/doc/university-leeds-admissions-policy/page/3 ｜2026-08-14｜**2027-28 entry**

Apply 按钮带课程码与年份参数：`myleedsportal.leeds.ac.uk/signin-landing/?courseId=MSC-BS%2FBADS&year=2026%2F27`

**申请费：无校级统一费，政策规定「个别课程可能收，收则在 Course Search 页标注」：**
> "Some courses may charge a non-refundable application fee. Where an application fee applies, it will be displayed on the relevant Course Search, course information or admissions guidance page. Applications to courses with an application fee will not be considered until the University has confirmed receipt of the payment."

样本项目 BADS 页面无 application fee 字样 → 应为免费，但官网无正面陈述。**具体金额与免除情形：未找到。**

**同时申请上限：未找到任何规则**（已查 5 个相关页面）。

### 时间线
**2027 entry 开放月份：未找到。** Leeds 的 2027-28 Admissions Policy **已发布**（版本记录："8 June 2026: Page published. 3 August 2026: Updated the Introduction…"），但**对 PGT 只给机制不给日期**：
> "Courses may have an application deadline, which will be stated on Course Search, and applicants should check this before submitting an application."

对照：同一政策把**本科**的 2027 周期日期写得很死（"13 January 2027 by 6pm (UK time) for all other courses"）。**PGT 刻意不给校级日期，是政策设计，不是遗漏。**

2026 entry 实际窗口：开放 1 October 2025；国际生截止 31 July 2026；UK 学生截止 11 September 2026。

**截止机制 = 滚动录取 + 一个校级总截止（无轮次）：**
> "We aim to make decisions within three to five weeks if all necessary documents have been received."

LUBS 明确不设面试：
> "Interviews do not form part of the Business School's standard admissions process."

**国际生差异**：31 Jul vs 11 Sep，差约 6 周。未找到中国籍单独截止日。

**入学季**：主流 9 月，但确有 2 月 intake（MSc Dental Public Health，February 2027 start）。样本项目 BADS 的 Start date 字段为 JS 动态渲染、抓取为空 → **未找到**。

### Offer 类型
2027-28 政策有**正式定义**，且多出 combined offer 与 exceptions 两个概念：
> "An offer may also contain exceptions, which are additional admissions requirements or information relating to the offer. Failure to meet the requirements of an exception may result in the withdrawal of an offer"
> "A combined offer may be made for a summer pre-sessional English language course and a taught postgraduate course, whereby the pre-sessional is used to meet the English language requirements of the taught postgraduate offer."

**清 condition 截止（PGT 规则，2027-28 周期）：**
> "Taught postgraduate confirmation — Applicants must typically meet all conditions set by the University by six weeks before the course start date. Any course-specific deadlines will be detailed in the offer letter"

（注意：同页本科小节的 "by 1 September 2027" 不适用于 PGT。）

2026 entry 具体日期：7 August 2026（Dental Public Health 为 9 December 2026）。LUBS 解释了原因：
> "This is to allow applicants who need a Student route visa time to be confirmed as unconditional, and to pay the tuition fee deposit or provide the sponsor evidence that is required for us to issue a CAS"

**offer 有效期与押金截止绑定**："Your offer will remain valid until the deadline to pay the deposit or provide exemption evidence has passed."

**不允许 defer。**

### 押金——四所中公开度最高
**固定 £2,000，只有需 Student visa 的 PGT 申请人才交：**
> "If you are a taught postgraduate applicant who requires a Student visa to study in the UK, you will need to pay a tuition fee deposit of £2,000 to receive a Confirmation of Acceptance for Studies (CAS)."
> "We will ask you to pay the deposit after you have met all your academic and English language conditions and accepted your unconditional offer."

**缴纳截止（2026 entry）**：21 August 2026（9 月开学者）。
> "After you have accepted an unconditional offer, the University will email you to confirm your acceptance and request your deposit payment or exemption evidence. **Please do not pay before you have received this email.**"

豁免 5 条，含：
> "If your scholarship covers only part of your tuition fee, you will need to pay the deposit."
> "We are not able to exempt you on the basis of a scholarship application or conditional award letter."

**退款：仅 2 类情形 + 14 天窗口，且有硬性申请截止日：**
> "You must submit your refund request through the 'Enquiries' section of the application portal, along with any supporting evidence, by the deadline of 9 November 2026. We will not consider any refund requests relating to applications for September 2026 entry received after this date."
> "Unless your fees are being paid in full by a sponsor, if you receive a deposit refund your course offer will be withdrawn and cannot be reinstated."
> "The deposit is not refundable in the event of an unsuccessful funding application."

来源：https://www.leeds.ac.uk/masters-fees/doc/tuition-fee-deposits-masters-applicants ｜2026-08-14｜2026/27 entry

**CAS 与押金明确挂钩，且写进 2027-28 政策**（原文见上方 Admissions Policy 引用）。

---

## 四、Coventry University（post-92 对照组）— MSc Data Science

### 申请入口
直申 portal，底层 **Salesforce Experience Cloud**（原始 HTML 含 `SfdcApp.projectOneNavigator.handleRedirect('https://applicantportal.coventry.ac.uk/s/login?...')`）。支付走 **Convera GlobalPay**。

**UCAS 明确只对本科：**
> "Apply through UCAS — If you are applying for an undergraduate course, you can apply through UCAS. Our university code is C85"

**代理（agent）是官方承认的三大入口之一：**
> "Apply with an agent — You can apply through an agent of the university. This is a good option if you'd like to get help with your application from one of our overseas representatives."

**申请费：零。**
> "We do not charge application fees. It can take up to 5 working days for our Admissions team to process a standard application."

**同时申请上限：明确不限。**
> "You can submit applications for multiple courses if you're interested in more than one."

来源：https://www.coventry.ac.uk/study-at-coventry/apply-now/postgraduate/ ｜https://www.coventry.ac.uk/international-students-hub/apply/ ｜2026-08-14

### 时间线
**官网不公布任何具体日期。** 国际生页面有 "Application deadlines" 标题，标题下只有原则性文字、**没有一个日期**：
> "You should aim to complete each stage in advance of the deadlines, where possible… We also recommend that you take visa processing times in to account"

**2027 entry 开放月份与截止日均「未找到」**（已查 5 个页面）。

**截止机制 = 纯滚动，无 round/stage。** 唯一时间约束是押金："Pay your deposit at least three months before your course starts"。

**入学季：与三所 Russell Group 最剧烈的分歧——一年 6 个开学点。**
> "September 2026 / November 2026 / January 2027 / March 2027 / May 2027 / July 2027"

来源：https://www.coventry.ac.uk/course-structure/pg/ees/data-science-msc/ ｜2026-08-14｜**2026-27 entry**（January 2027 属 2026-27 周期，不是 2027 entry）

未达 condition 可顺延下一个 intake。

### Offer 类型
使用 conditional / unconditional，但公开页面**无正式定义**，只在流程描述中出现：
> "Payment of the deposit confirms your place at the university, but only once you've also met all the conditions of your offer."

**额外筛选环节（三所 Russell Group 均无）**：可能有 interview / **credibility interview** / portfolio review / 强制 Open Day 邀请。

**offer 有效期**：未找到公开日期，只说写在 offer 信里。

### 押金
**按地区分三档，中国属「All other countries」→ £8,000（四所中最高）：**
> "European Union, Sub Saharan and Northern Africa (excluding Nigeria, Ghana and Kenya) - £4,000.00 / Pakistan, Bangladesh, India (Punjab, Uttarakhand, Haryana) - Full tuition fees charged for the first year of your course / All other countries (including Nigeria, Ghana and Kenya) - £8,000.00."

官方 T&C PDF 复核：
> "International Students who are studying full-time and self-funding their full or partial course fees, must pay a minimum of £8,000, or the full course fee if the course fee is less than £8,000 or from regions outlined in section 6a, to complete Enrolment each year. This payment of £8,000 is required to release the Confirmation of Acceptance of Studies letter."

来源：https://www.coventry.ac.uk/globalassets/media/documents/registry/fees/coventry-university-tuition-fee-terms-and-conditions-2026-2027.pdf ｜2026-08-14｜2026/27 entry

**支付通道唯一：**
> "Please pay your fees through Convera. We don't accept cash, cheques or banker's drafts. Alternative payment methods may be less secure or make it harder to confirm your place."

**CAS 前置三条件写得最清楚：**
> "You'll only be able to apply for your visa after: You have logged into your application account on the application portal and accepted the offer. You have met all the conditions of your offer … You have paid the tuition fee deposit specified on your offer letter"

**⚠️ 注册门槛高于 CAS 门槛**：CAS 只要 £4,000（欧盟/撒哈拉以南非洲）或 £8,000，但入学注册一律要 £8,000。

**退款：签证拒签通常可退，但提供虚假信息扣 £4,000：**
> "A visa application is refused due to the submission of fraudulent/false documents or deception. Incomplete or incorrect information has been provided as part of the admissions process. In those circumstances, the University will retain £4,000 of the tuition fee deposit paid."
> "In all circumstances, approved refunds will only be paid back in the same method and to the same account from where the money was originally received."

---

## 英国内部**一致**的部分（可做统一模板骨架）

1. **申请入口形态一致**：授课硕 100% 直申院校自有 portal，**不存在任何集中申请系统**。UCAS 只覆盖本科（Coventry 页面直接写明）。四所无一例外。
2. **offer 二元术语一致**：conditional / unconditional 是四所共同正式词汇，condition 典型内容都是「学位证/成绩单 + 均分 + 语言」。
3. **状态机顺序一致**：递交 → conditional offer → 接受 → 清 condition → unconditional →（交钱）→ CAS → 签证 → 注册。
4. **CAS 的硬前置一致**：必须先清完所有 offer condition。四所都有等价表述。
5. **国际生均需某种学费预付才能推进流程**（UCL 10%、Manchester £2,500、Leeds £2,000、Coventry £4,000–£8,000）。
6. **押金默认不可退，例外集合高度相似**：签证拒签 / 未达 condition / 学校取消课程。UCL 与 Manchester 还都有法定 14 天冷静期。
7. **押金都计入学费**，不是额外费用。
8. **申请费一旦收取一律不退。**

## 英国内部**就有分歧**的部分（不能做统一模板，必须逐校建库）

> **核心结论：状态机是统一的，但状态机上的每一个数字、每一个触发条件、每一个门槛都是院校私有的。**
> 「一个模板 + 一张院校参数表」可行；「一个模板打天下」不可行。

1. **申请费跨度 £0–£160，且非校级统一。** Coventry £0 → Manchester £0(CS)/£60(8 个具名商科) → UCL £90 标准/£160(四个商科)/£35(艺术) → Leeds 按课程。**同校内商科与 CS 的申请费都可能不同。**
2. **同时申请数量上限**：UCL 硬上限 2 且撤回占额度 → Coventry 明确不限 → Manchester 只有局部规则 → Leeds 完全未公开。
3. **截止机制四种完全不同的形态**：UCL 固定日期(按是否需签证分两档) + 非日期型 4 阶段漏斗；Manchester 日期型分轮次(且商科与 CS 轮次不同)；Leeds 滚动 + 校级总截止(按国际/UK 分两档)；Coventry 纯滚动、连日期都不写。
4. **入学季从 1 个到 6 个**：三所 Russell Group 样本项目只有 9 月 → Coventry 一年 6 个开学点。**直接决定产品是否需要支持「多 intake 排期」。**
5. **押金计算基准三种范式**：UCL 百分比(海外 10%，约 £4,270) → Manchester 固定 £2,500 → Leeds 固定 £2,000 → Coventry 按地区 £4,000/£8,000/全年学费。**中国籍在 Coventry 是 Leeds 的 4 倍。**
6. **押金触发时点——最锋利的一条分歧，直接影响现金流时间线**：
   - UCL：**接受 offer 时就交，conditional 持有人也要交**
   - Manchester CAS deposit：**必须等 unconditional 才能交**（与 UCL 完全相反）
   - Manchester acceptance deposit：接受 offer 即交，offer 后 4–6 周（同校内两套并存）
   - Leeds：接受 unconditional 之后才交，且**明令收到邮件前不要付**
   - Coventry：由 conditional offer 信的 schedule 决定，可在 conditional 阶段就付
7. **CAS 是否与押金绑定——UCL 是唯一例外。** Manchester/Leeds/Coventry 三所白纸黑字挂钩；UCL 全部相关页面只挂在「正式接受 unconditional offer」上。**若按「押金 = CAS 前置」建模，UCL 会被错误建模。**
8. **「交押金」等不等于「接受 offer」，各校答案相反**：UCL 明确**不等于** → Manchester AMBS 明确**等于** → Coventry 部分等于。
9. **退款窗口与截止日各不相同**：Leeds 硬截止 9 Nov 2026 → Manchester 31 Jul 2026 → UCL 无公开截止但扣银行手续费且不原额退还 → Coventry 虚假信息扣 £4,000。
10. **底层技术栈四所四种，无任何两所共用**：UCL = Tribal SITS:Vision + Flywire｜Manchester = Oracle PeopleSoft｜Leeds = Microsoft Power Apps/Dynamics 365｜Coventry = Salesforce Experience Cloud + Convera。**任何「自动填表 / portal 状态抓取」功能必须逐校适配。**
11. **代理渠道的官方地位不同**：Coventry 明确列为三大入口之一并有专用 agent 门户；Leeds 有 agent 专用登录；UCL/Manchester 的 PGT 页面未列 agent 为入口。
12. **额外筛选环节不对称**：UCL Management 有强制在线面试(第三方 jobma.com) → Coventry 可能有 interview/credibility interview/portfolio review → Leeds LUBS 明确面试非标准流程 → **Manchester ACS 甚至连推荐信和个人陈述都不要**（"References and personal statements are not required for your application to this programme"）。

---

## 抓取备注与未解决项

- 无法访问：UCL `?year=2027`（HTTP 520）；`coventry.ac.uk/study-at-coventry/postgraduate-study/your-offer/`（HTTP 400）
- firecrawl 多次触发 rate limit，主要依赖 curl 直取（四所关键页面均服务端渲染，未遇 JS 空壳）
- **未找到**：三所的 2027 entry 开放/截止日期；Leeds 申请费具体金额；Leeds/Manchester 的同时申请上限；Coventry 的任何具体日期；Leeds BADS 的 start date（JS 动态渲染）
