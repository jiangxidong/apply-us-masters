# 英/美/澳院校对「申请材料使用 AI」的政策现状

> **来源与状态**：2026-08-14 一手抓取（curl + 浏览器 UA / firecrawl scrape / pdftotext / r.jina.ai 代理），
> 全部引述取自 **UCAS 官网、院校官方域名（.ac.uk / .edu / .edu.au）、官方 PDF 政策文件**。
> **未使用任何新闻报道、留学中介文章、Reddit/Quora、排名站或二手总结**——搜索阶段出现的这些来源仅用于发现线索 URL，
> 所有结论均回官网原文核实。每条主张附 URL + 查阅日期 + 页面自述的生效周期/版本（若页面标注）。
> 服务于 [#7 英美澳院校对 AI 辅助申请的政策现状](https://github.com/jiangxidong/EduApplication/issues/7)。
>
> 引述规则：`>` 引用块内均为**英文逐字原文（verbatim）**，未做任何改写；PDF 来源已把 pdftotext 输出的 `ﬁ`/`ﬀ` 连字还原为普通字母，除此之外一字未改。
> 中文均为本文件的判断/说明，不得与原文混淆。

---

## 档位定义（全文统一）

| 代号 | 档位 | 判定标准 |
|---|---|---|
| **A** | **允许但须披露** | 官方文本**明确允许**某种 AI 使用，**并要求申请人申报/标注/acknowledge 该使用** |
| **B** | 允许有限辅助，未要求披露 | 明确允许 brainstorm / 结构 / 校对 / 语法等辅助，但**全文无任何披露义务** |
| **C** | 明确禁止 | 官方文本明确说用 AI 写申请材料属于作弊/欺诈/不被允许 |
| **D** | **未找到明确条款** | 已实际抓取并全文检索官方招生页面，`artificial intelligence` / `generative` / `ChatGPT` 命中为 0 |

> **D 是「查过没有」，不是「没查」。** 全文所有 D 档均列出已查页面清单。
> **D ≠ 允许。** 沉默地带的产品含义单独成节讨论（见 [§六](#六沉默地带政策没说的地方意味着什么)）。

**贯穿全文的一条判定纪律**：
> **「certify 提交内容属实」≠「披露使用了 AI」。**
> 判档只看动词的**宾语**：宾语是「AI 的使用」才算披露（A 档）；宾语是「信息的真实性」不算（多数是 C 档的配套认证）。
> 这是本主题最容易被包装错的一条，下文每次出现都会标注。

---

## ⚠️ 最重要的前置结论：UCAS 根本不覆盖硕士申请

任务要求「先确认 UCAS 对硕士申请的适用范围」——这本身是本次调研最重要的发现之一。

**答案：截至 2026-08-14，UCAS 的申请人 declaration（也就是全英国唯一一份制度化的、写进申请系统的 AI 条款）不适用于研究生申请。**

**证据链（全部为 ucas.com 原文）**

**1. UCAS 自述研究生申请是直投院校**
URL：https://www.ucas.com/faqs/how-do-i-apply-postgraduate-study ｜2026-08-14

> You apply direct to the provider for postgraduate courses.
> You can find courses and details of how to apply in the postgraduate search tool.

URL：https://www.ucas.com/faqs/what-are-stages-applying-postgraduate-course ｜2026-08-14

> Completing an application for each university you want to apply to.
> Writing a personal statement that explains why you want to study, and what you can contribute and gain.

**2. UCAS 只发布两份申请人 declaration，没有研究生版**
- 声明索引页 https://www.ucas.com/about-us/policies/privacy-policies-and-declarations 只列出 `UCAS student declaration`（重定向至 undergraduate declaration）与 `UCAS Conservatoires declaration`。
- 直接探测 `https://www.ucas.com/about-us/policies/ucas-data-privacy-portal/ucas-postgraduate-declaration` → **HTTP 404**。

**3. 相似度检测服务也自述只覆盖本科与 Conservatoires**
URL：https://www.ucas.com/media/147176/download（官方 PDF "SIMILARITY GUIDANCE FOR APPLICANTS"）｜2026-08-14

> All UCAS Undergraduate and UCAS Conservatoire personal statements are screened by our similarity detection software.

**对产品的直接含义**：
> 中文互联网上被反复引用的「UCAS 要求你声明个人陈述没有用 AI」——**对一个申请英国硕士的用户没有任何约束力**。
> 硕士用户面对的是**九所学校九套规则**，而不是一条统一规则。任何把 UCAS 条款当作「英国规则」呈现给硕士用户的设计都是错的。

⚠️ **一个诚实标注的历史缺口**：ucas.com 上有一条 2018-06-05 新闻说 UCAS 当时上线过研究生**申请**服务
（https://www.ucas.com/corporate/news-and-key-documents/news/ucas-launches-new-postgraduate-service），
但站内**未找到任何说明该服务何时关闭的页面，也未找到 UKPASS 停用声明**（`ucas.com/ukpass` → 404，`ukpass.ac.uk` → 域名无响应）。
现行 FAQ 明确说直投院校，故按现行文本判定，**不对停用时点做任何推测**。

---

## 一、英国

### 1.0 UCAS 本科口径（作为制度先例，不适用于硕士）

即便不适用于硕士，UCAS 仍是**全球唯一一个真正把 AI 声明落地进申请系统的机制**，值得作为制度参照记录。

**（a）官方 AI 指南 —— 允许有限辅助（B 档）**
条款类型：advice page（非合同条款）｜scope：UCAS 本科个人陈述
URL：https://www.ucas.com/applying/applying-to-university/writing-your-personal-statement/a-guide-to-using-ai-and-chatgpt-with-your-personal-statement ｜2026-08-14

> Generating (and then copying, pasting and submitting) all or a large part of your personal statement from an AI tool such as ChatGPT, and presenting it as your own words, could be considered cheating by universities and colleges and could affect your chances of an offer.

> However, universities and colleges do understand that AI tools can be useful to applicants writing personal statements if used in the correct way.

明确允许的三种用法（原文小标题）：

> Brainstorm some ideas
> You could use ChatGPT to give you ideas about topics that are relevant to your chosen subject, which you can then relate to your own experiences and opinions.

> Help with structure
> You may want to ask ChatGPT to suggest ways of structuring your personal statement answers, ensuring that you're evidencing your skills in a clear way.

> Use it for checking readability
> ChatGPT can be used to check your personal statement draft for readability. It may suggest ways to rephrase sentences to make them more concise, while maintaining their meaning.

> Don't
> Copy and paste from AI tools and use as final text.

**（b）申请人 declaration 原文 —— C 档，且是**否定式**声明**
条款类型：**applicant declaration**（提交前勾选同意）｜scope：**UCAS Undergraduate**
URL：https://www.ucas.com/about-us/policies/ucas-data-privacy-portal/ucas-undergraduate-declaration ｜2026-08-14

> We will ask you to confirm your agreement by ticking a box in the Terms and Conditions section before you submit your application. By ticking this box, we will consider that you accept the terms of the declaration set out below and privacy policy; we cannot process your application unless you do so.

> b. Your personal statement
> Your personal statement must be completed by you and we do undertake checks to verify that it is your own work.
> If your personal statement includes material that we reasonably consider may have been copied from or provided by another source, including but not limited to friends, writing service providers or artificial intelligence software, we may notify your current school, college or other UCAS registered centre (provided that, where legally required, we have your permission to share such information) and the universities and colleges to which you have applied, whose decision it will be to take what action they consider appropriate.

同一条款逐字出现在 Conservatoires declaration（https://www.ucas.com/about-us/policies/ucas-data-privacy-portal/ucas-conservatoires-declaration ｜2026-08-14）。

**后果原文**：

> We have the right to cancel your application without refunding your application fee if we determine (having carried out any necessary checks), or have reasonable belief, that your application contains false information or that you have left out relevant information.

> You will not be able to submit another application for entry whilst your original application is suspended. If your application is cancelled, you will not be able to submit another application for entry in the same admissions cycle.

> Your right to appeal if we cancel your application
> If we cancel your application you have the right to appeal.

> ### ⚠️ 一个已核实的引用陷阱：勾选框的确切措辞在 ucas.com 上找不到
>
> AI 指南页（a）称申请人 "now have to **declare** that your personal statement hasn't been copied or provided from another source, including artificial intelligence software"（**主动否认句式**）。
> 但 declaration 公开页（b）的实际条款是**被动/权利句式**："...we may notify..."。
>
> 已逐页确认**不含**该主动声明措辞的页面：undergraduate declaration、Conservatoires declaration、声明索引页、
> fraud-and-similarity 页、两份官方 PDF（`/media/146941/download`、`/media/147176/download`）、
> 相似度 FAQ 页（`artificial` / `ChatGPT` / `AI` 命中 = **0**）。
> 勾选界面在 UCAS Hub 内需登录，**未能核验**。
>
> **因此：不得把 AI 指南页的转述当作 declaration 原文引用。** 可引用的 declaration 原文只有上面 b 段。

**（c）⭐ UCAS 的检测是 similarity detection，不是 AI detection**

URL：https://www.ucas.com/applying/applying-to-university/writing-your-personal-statement/fraud-and-similarity ｜2026-08-14

> UCAS operates a dedicated Verification Team tasked with the prevention and detection of fraud in applications and similarity in personal statements.

URL：https://www.ucas.com/media/147176/download ｜2026-08-14

> Each personal statement is compared against a library of personal statements previously submitted to UCAS, and a library of sample statements collected from websites and other sources. Each personal statement received at UCAS is added to this library after it has been processed.

> Any statements showing a level of similarity of greater than 30% are reviewed by members of the UCAS Verification Team. The findings are reported to the applicant and their chosen universities and colleges.

**判定：UCAS 未声明对申请文本使用 AI 生成检测工具。** 理由全部基于上引原文：
① 机制是「与已提交个人陈述库 + 网上样本库比对」，属抄袭比对；② 触发阈值是**相似度百分比 >30%**，不是 AI 生成概率；
③ ucas.com 全站未找到任何「我们使用 AI 检测工具」的表述。
**这条负面结论很重要**——它让 §五 里那三例真正的 AI 检测声明有了对照意义。

---

### 1.1 University of Cambridge —— ⭐ **全英国唯一「禁止 + 披露」双档并存的中央招生条款**

条款类型：**官方研究生招生指南页**（Postgraduate Admissions Office，站点导航中列为 "AI and postgraduate applications" 一级条目）
scope：**研究生（Postgraduate）**，非本科
URL：https://www.postgraduate.study.cam.ac.uk/apply/how/ai-postgraduate-applications ｜2026-08-14｜页脚 © 2026 University of Cambridge

该页全文（分三块，逐字）：

> When completing an application, you should note the following restrictions and risks of using AI tools.

> **Personal statements and CVs**
> AI must not be used when writing personal statements and CVs. This prohibition covers the use of AI to help your use of English.
> AI may generate false claims ('hallucinations') and if these are about your personal achievements they will be treated like any other application fraud.

> **Research proposals**
> Appropriate use of AI tools to support the preparation of research proposals is permitted.
> Content generated by AI should be acknowledged.
> A reliance on AI tools may produce poor-quality output, weakening your chance of success.

> **Interviews**
> AI must not be used to impersonate or assist you during an interview, including to help your use of English.
> At interview, you should expect to be asked to confirm that you are not using AI.

同页 Further guidance：

> The University of Cambridge is a signatory of the Russell Group statement on the use of AI in higher education and provides guidance for students on artificial intelligence and academic misconduct.

**档位判断：同一页面上两档并存 —— 这是本次调研最重要的结构发现**

| 材料类型 | 档位 | 依据 |
|---|---|---|
| personal statement / CV | **C（明确禁止）** | "AI **must not** be used" |
| **research proposal** | **A（允许但须披露）** | "**is permitted**" + "**should be acknowledged**" |
| 面试 | **C（明确禁止）** | "must not be used to impersonate or assist you" |

⚠️ **对中国市场的产品来说，这一页最锋利的一句是禁令的射程**：
> "This prohibition covers the use of AI to **help your use of English**."

**即「用 AI 帮你改英文」在剑桥的 PS/CV 上也是被禁的。** 这是所有院校中唯一一条明确把「语言润色」写进禁令的条款——
而语言润色恰恰是英语非母语申请人使用 AI 的**主要场景**。产品若把「润色/改语法」当作全球安全档，在剑桥上会直接违规。

⚠️ **措辞精度**：research proposal 的披露义务用的是 "**should** be acknowledged"（应当），弱于强制性的 "are required to"；
且**页面未说明 acknowledge 的格式与位置**（写在哪里、写到什么颗粒度）。

**AI 检测声明**：该页**无**。

---

### 1.2 University of Oxford —— C 档，且是三国中**最硬的一条 AI 检测声明**

条款类型：**官方 Graduate Application Guide**（中央研究生招生指南，非博客）｜scope：研究生 supporting documents
URL：https://www.ox.ac.uk/admissions/graduate/application-guide/supporting-documents/supporting-documents-requirements#use-of-artificial-intelligence-tools ｜2026-08-14

该独立小节全文：

> **Use of Artificial Intelligence tools**
> Artificial Intelligence (AI) tools may be used to research materials in preparing your application, but may not be used to generate documents or form the basis of documents that are then adapted. Our academic assessors will be looking for your own insights and critical evaluation skills, so it is unlikely that using AI tools to create your supporting documents will improve your chances of success. If academic assessors consider that inappropriate use of AI was made in application documents, they may reject your application.

同一 Application Guide 的 statement of purpose 页交叉引用：
URL：https://www.ox.ac.uk/admissions/graduate/application-guide/supporting-documents/statement ｜2026-08-14

> Your statement of purpose or research proposal must be entirely your own work. Departments may screen your statement of purpose or research proposal using plagiarism-detection software. For more information, consult our guidance on plagiarism as well as the guidance on the use of artificial intelligence tools within this *Application Guide*.

**Plagiarism 政策页（申请人政策，非在读学生政策）**
URL：https://www.ox.ac.uk/admissions/graduate/application-guide/applicant-policies/plagiarism ｜2026-08-14

> 'Plagiarism' is defined as the copying or paraphrasing of other people's work or ideas into your own work without full acknowledgment.
> All published and unpublished material, whether in manuscript, printed or electronic form, is covered by this definition, as is the use of material generated wholly or in part through use of artificial intelligence.

**⭐ AI 检测声明（verbatim，本次调研中位阶最高的一条）**：

> In some cases departments may screen the written work, research proposals or supporting statements submitted by their applicants for plagiarism using a plagiarism-detection system. This system produces a matching report that highlights any areas of significant similarity between submitted work and other published documents **and can also be used to detect AI usage**. The matching report will then be reviewed by members of the department, including academics with specialist knowledge of the subject area in question and, in some cases, the applicant's academic background.

同页 "Use of Artificial Intelligence (AI) tools" 小节：

> The candidate may use AI tools to assist in researching application materials, but any submitted documents must be written by the candidate, and any text that is not the candidate's own should be appropriately referenced.

**申请人 declaration（官方对其内容的描述）与后果**
URL：https://www.ox.ac.uk/admissions/graduate/application-guide/applicant-policies/ineligible-applications ｜2026-08-14

> Applications deemed to be ineligible for the reasons outlined here, will be withdrawn and any application fee paid will be refunded.

> As part of the application form declaration, applicants are asked to confirm that the information in their application, including both the form and supporting documents, is true, accurate, current and complete. Where, having investigated and having considered the applicant's reasons for the issues identified, the University concludes that an applicant has breached these terms, the relevant decision maker can decide that: (a) all of the applicant's applications for the current cycle should be withdrawn, and/or (b) that the applicant should be prohibited from submitting further applications for a set period.

> Where the University reasonably suspects that information in an application is untrue, it may use external agencies for verification as noted in our Postgraduate Applicant Privacy Policy.

**档位判断：C（明确禁止生成）**。允许 "research materials"，禁止 "generate documents or form the basis of documents that are then adapted"。
**无任何披露/申报要求**——与剑桥的关键差别：剑桥给 research proposal 开了「允许 + acknowledge」的口子，**牛津没有**。

⚠️ 一处内部张力：plagiarism 页写的是 "any text that is not the candidate's own **should be appropriately referenced**"（暗示注明即可），
但 Application Guide 的 AI 小节写的是 "**may not** be used to generate documents"（直接禁止）。
**两句并存，牛津未说明如何调和**；产品应按更严的一条（禁止生成）建模。

**AI 检测声明：⭐ 有** —— "can also be used to detect AI usage"，且写在**中央申请人政策页**上，不是博客。
但页面未点名工具、未给阈值。

⚠️ 抓取说明：ox.ac.uk 对 curl / WebFetch / firecrawl / Wayback 全部返回 403 或空；上述原文经 `r.jina.ai` 代理读取官网实时内容取得（内容源仍为 ox.ac.uk 本页）。

---

### 1.3 University of Edinburgh —— C 档，措辞最重（直接叫 fraud）

条款类型：**研究生招生指导页**（scope 明确为 postgraduate）
URL：https://study.ed.ac.uk/postgraduate/applying/what/personal-statement ｜2026-08-14

> Submitting a complete and accurate application
> The information you give us must be true. Copying information from elsewhere, asking someone else to write your statement or using AI apps such as ChatGPT could be considered fraud.

URL：https://study.ed.ac.uk/postgraduate/applying/complete-accurate-application ｜2026-08-14
（页面底部自述：`This article was published on 2025-10-07`）

> Personal statement must be true
> The information provided in your personal statement must be true.
> You could be committing fraud if:
> you copy a personal statement from elsewhere
> you ask someone else to write a personal statement for you
> **you use AI applications such as ChatGPT to write your personal statement**

**后果原文（同页）**：

> If we suspect fraud, we will put your application on hold while we investigate. If any of the following statements apply, we will reject your application. If we have made an offer, we will withdraw it.
> Reasons for rejection or withdrawal of offers
> We have reasonable belief that any information you have provided is false or misleading.
> You have deliberately omitted relevant information.
> You do not provide requested information by the specified deadline.
> If we have rejected an application or withdrawn an offer for any of the reasons given above, we reserve the right to refuse to consider any further applications from you.

**招生 T&C（未点名 AI，仅作后果补充）**
URL：https://study.ed.ac.uk/admissions/terms-conditions ｜2026-08-14

> 3.3 ... if the University reasonably believes that your application contains incorrect or fraudulent information or that significant information has been omitted from your application form, the University may in its discretion:
> (i) carry out further checks, which may include verifying information with awarding bodies, previous academic institutions or a third-party verification agency;
> (ii) withdraw or amend your offer; and/or
> (iii) where you have already registered, the University may terminate your registration at the University and the Contract with you.

**档位判断：C（明确禁止）**。无任何披露路径。
⚠️ **措辞精度**：禁令的射程是 **"to write your personal statement"**（用 AI **写**个人陈述）。
Edinburgh **没有**说明校对 / brainstorm / 语法检查等辅助用途是否可以——**页面对辅助用途保持沉默，不得解读为允许**。

**AI 检测声明：无**（4 个页面均无；T&C 3.3(i) 的 "third-party verification agency" 语境是资历核验）。

---

### 1.4 King's College London —— B 档，**唯一把 AI 写进全校招生政策正文**的英国综合性大学

条款类型：**Admissions Policy (Student Admissions)**｜版本：`Effective Date September 2025` / `Next review September 2028` / 取代 2023 年版｜scope：覆盖 PGT/PGR
URL：https://www.kcl.ac.uk/assets/policyzone/students/admissions-policy.pdf ｜2026-08-14

> **17.3** The university recognises that the use of Generative Artificial Intelligence (AI) to create personal statements or writing samples for the application process is a tool that applicants may consider using in the application process. The university has a statement on the use of AI here and this will also be applied to the admissions process, particularly "any work submitted must represent a genuine demonstration of your own work, skills and… respects the university's value of academic integrity and honesty". Similarly, UCAS provides guidelines as to the acceptable usage of AI in creating an application which applicants should review and adhere to when creating and submitting an application.

§17.3 中 "statement on the use of AI here" 的超链接指向 https://www.kcl.ac.uk/about/strategy/learning-and-teaching/ai-guidance/student-guidance ，被引那句在该页逐字存在：

> Above all, any work submitted must represent a genuine demonstration of your own work, skills and subject knowledge, adhere to the guidelines of the assessment task, and respects the university's value of academic integrity and honesty.

⚠️ 被引页面本体是**在读学生 coursework/assessment 指导**，但被 Admissions Policy §17.3 **明确以引用方式并入招生流程**——这是一种「借用在读学生标准」的立法技术。

**后果原文**：

> **17.4** Where evidence is detected that a personal statement may be plagiarised or **wholly written using AI**, or that any other element of an application may be fraudulent, including the provision of falsified documents, the application will not be progressed until the matter has been investigated by the King's Admissions Office and resolved. The university reserves the right to withdraw an offer if incorrect or misleading information is provided in the application.

> **17.6** Once enrolled, as per the university's Regulations, if a student or a third party on behalf of the student, is found to have provided untrue or inaccurate information, or to have omitted information at enrolment or during the application process, registration can be terminated without notice. However, the student will have a right to appeal that decision.

**相似度检测条款（非 AI 检测）**
URL（PGT）：https://www.kcl.ac.uk/study/postgraduate-taught/how-to-apply/policies-and-guidance ｜2026-08-14

> It is important that any personal statement, research proposal, or other written materials submitted as part of an application are your own work. The university may use similarity detection software to evaluate the originality of a piece of work.

（PGR 页 https://www.kcl.ac.uk/study/postgraduate-research/how-to-apply/policies-and-guidance 同句，"university" 作 "College"。）

**档位判断：B（允许有限辅助，未要求披露）**。依据：§17.3 用的是**承认性措辞** "is a tool that applicants **may consider using**"，
挂的是「必须是你自己作品」的标准而非禁令；§17.4 的触发门槛是 "**wholly** written using AI"（**整篇**由 AI 撰写）。
**全文没有任何要求申报/披露 AI 使用的条款。**

⚠️ KCL 的 T&C 2026/27 与 2025/26 全文 `artificial intelligence` / `generative` / `ChatGPT` **零命中**（已独立复核）；AI 条款只在 Admissions Policy 里。
（T&C 后果条款 4.1.3 / 7.1.1 仅涉及 "false, fraudulent... or misleading information"，未点名 AI。）

**AI 检测声明：无明确工具声明**。§17.4 说 "Where evidence **is detected** that a personal statement may be... wholly written using AI"——
**断言会被检出，但未点名任何 AI 检测工具或流程**；明确点名的工具只有 similarity detection software。

**applicant declaration 原文：未取得**（在 King's Apply 登录墙内；已试且 404 的公开路径：`kcl.ac.uk/study/admissions-policies`、`kcl.ac.uk/policyhub/terms-and-conditions-for-students`）。

---

### 1.5 Imperial College London —— **大学层面 D 档，商学院 B 档 + AI 检测声明**（层级错位样本）

#### （a）大学层面：**D 档，未找到明确条款**

已查并全文检索（`artificial` / `generative` / `AI` / `ChatGPT` 命中 = **0**）：
| URL | 类型 |
|---|---|
| `https://www.imperial.ac.uk/media/.../25-entry/Postgraduate-Taught-Admissions-Policy-2024.pdf` | PGT 招生政策 |
| `https://www.imperial.ac.uk/study/apply/postgraduate-taught/application-process/personal-statement/` | PGT 个人陈述指导页 |

**后果原文**（PGT Admissions Policy）：

> Ensuring that statements made in applying for entry are accurate, as the discovery of false statements or omissions may lead to the offer being withdrawn (or in the case of students registered, to their registration being terminated).

**Applicant Behaviour Policy**（URL：`https://www.imperial.ac.uk/media/.../25-entry/Applicant-Behaviour-Policy.pdf` ｜2026-08-14）：

> Examples include but are not limited to:
> academic misconduct, which includes fabrication, plagiarism, or facilitating academic dishonesty during the application process.

> However, in extreme cases the University may act with no warning. Such actions may include rejecting an application made, or withdrawing an offer made. Conduct that constitutes a criminal offence may also be reported to relevant authorities. For prospective students applying through UCAS, where inappropriate behaviour leads to the withdrawal of any offer, the University will report its actions to UCAS.

⚠️ "plagiarism ... during the application process" 涵盖申请阶段抄袭，但**该政策未点名 AI**。

#### （b）Imperial College Business School：**B 档 + ⭐ AI 检测声明**

条款类型：**admissions blog**（官方域名 imperial.ac.uk，Business School 招生栏目，文中日期 3 December 2025）——**不是合同性 T&C**
URL：https://www.imperial.ac.uk/business-school/blogs/admissions/ai-admissions-how-use-it-responsibly-your-application/ ｜2026-08-14

> Here are a few acceptable (and encouraged) ways to use AI:
> Structure: getting tips on how to organise your personal statement
> Proofreading: catching typos or awkward phrasing
> Idea generation: generating prompts to reflect on your experience or career goals
> But the ideas, the reflection and the tone? That should be your own.

> We want to hear you, not a rehearsed script or AI-generated phrasing. Reading from prepared answers or relying on AI tools during the recording is not permitted and, in many cases, can be detected.

**⭐ AI 检测声明**：

> As we look at written statements, interviews and scholarship applications, we want to ensure that what we see represents you, not a machine.
> **We've introduced new ways to detect AI-generated content** and are continuously adapting our review process. But more than that, we want to create a culture of honesty, effort and ownership because those qualities make great students, future leaders and members of our community.

Top tips 原文（对产品措辞设计有直接参考价值）：

> Be yourself, not a persona: avoid overly polished or "corporate-sounding" language. Our teams can quickly recognise content that doesn't match a candidate's genuine communication style.
> Use AI thoughtfully but sparingly: it's fine to brainstorm or check structure, but write your own sentences. If a sentence doesn't feel like something you would naturally say, rewrite it until it does.
> Reflect before you write: start with bullet points in your own words before opening any tools.

**档位判断**：大学层面 **D**；Business School **B**（structure / proofreading / idea generation 明确列为 "acceptable (and encouraged)"；视频面试用 AI "not permitted"）。**未要求披露。**

⚠️ **层级错位警告**：Imperial 的 AI 表态只存在于**商学院招生博客**，大学层面招生政策完全沉默。
**不得把商学院博客当作 Imperial 全校规则援引**——申请 Imperial 工程/理学院的用户不受该博客约束（也不因此获得许可）。

---

### 1.6 University College London (UCL) —— D 档

已查页面（`artificial intelligence` / `generative AI` / `ChatGPT` **零命中**）：
| URL | 说明 |
|---|---|
| https://www.ucl.ac.uk/study/prospective-students/graduate/how-apply/writing-your-personal-statement | PG 个人陈述指导页（正文疑似 JS 渲染） |
| https://www.ucl.ac.uk/study/prospective-students/graduate/how-apply/general-conditions-entry | PG 入学一般条件 |
| https://www.ucl.ac.uk/study/current-students/academic-manual/chapters/chapter-1-student-recruitment-and-admissions/section-3-admissions-and-selection | Academic Manual Ch.1 §3 |

站内检索（`site:ucl.ac.uk` + admissions/application/AI 组合）只返回 AI 相关**课程页**，无招生 AI 政策页。

**后果原文**（Academic Manual Ch.1 §3，条款类型：admissions policy）：

> 3.4 Accuracy of Applicant Information
> Information provided by applicants is expected to be accurate and complete. UCL reserves the right to refuse admission or, if already registered, terminate registration if information provided by an applicant is inaccurate or incomplete.
> If fraud is suspected, UCL will, as appropriate, liaise with relevant external bodies (including the police, local education authorities, Student Loans Company, UCAS, UK Visas and Immigration).
> UCL reserves the right to use third party verification services to check claims made by applicants.

> The applicant will be informed in writing by the Director of Admissions of the apparent misrepresentation and asked to provide a statement in explanation or mitigation. Failure to provide a statement, or to provide satisfactory evidence to corroborate his/her explanation, will result in the applicant having the application and/or offer of admission to UCL withdrawn.

> **An applicant to UCL does not have the right of appeal against the decision.**

⚠️ **UCL 是本次英国样本中唯一明确写「申请人无申诉权」的学校。**

**个人陈述抄袭条款 —— scope 是本科，不适用 PG**：

> 3.5 Plagiarism in Undergraduate Personal Statements
> Should the UCAS Similarity Detection Service alert UCL to possible plagiarism in an application, the faculty office/Admissions will be passed the similarity report and the UCAS application flagged.

⚠️ 3.5 明确只覆盖 **Undergraduate**，且依赖 **UCAS Similarity Detection Service**。**UCL 研究生申请不经 UCAS，此条不适用于 PG。**

**档位判断：D（未找到明确条款）**。**AI 检测声明：无**（3.4 的 "third party verification services" 语境是资历核验）。

---

### 1.7 University of Manchester —— **既不是禁止也不是披露的第三种形态**（最需要小心的一条）

已查页面：
| URL | 类型 |
|---|---|
| https://www.manchester.ac.uk/study/student-terms-and-conditions/verification-admissions/ | T&C |
| https://www.manchester.ac.uk/study/masters/admissions/how-to-apply/ | 硕士申请页 |
| https://documents.manchester.ac.uk/display.aspx?DocID=78237 | **Applicant Admissions Fraud Prevention Procedure**（PDF） |
| https://documents.manchester.ac.uk/display.aspx?DocID=78235 | Detecting and Dealing with Fraudulent Applications – Registered Students Procedure（PDF） |

程序文件的适用范围（校方页面对该文件的描述，verbatim）：

> This procedure outlines how the University will verify information provided in support of an application to a programme of study, a student visa application or a tuition fee status assessment. The procedure is applicable to any person once they have submitted an application to study at the University, **for any level of study**, prior to the point of registration, whether submitting their application directly to the University, or via a third party such as UCAS or DfE Apply.

**⭐ 该程序把 generative AI 写进 plagiarism 的定义（verbatim）**：

> Definition of plagiarism
> Plagiarism is defined as the act of using ideas, words, or creations from either humans or digital systems, **such as generative artificial intelligence**, **without proper attribution or permission** and presenting them, either intentionally or unwittingly, as one's own work. Plagiarism encompasses a range of practices beyond just verbatim (word for word) copying. It also includes instances of close paraphrasing, minimal adaptation, and other actions that involve reproducing the work of another source in a way that means the assessed work lacks appropriate originality or proper referencing.

**后果原文**：

> If we determine that the applicant, or any person or body acting on their behalf, has provided us with information in connection with their application to the University which is fraudulent, untrue, inaccurate, incomplete and/or misleading, the University reserves the right to cancel the application, withdraw an offer of a place or terminate the student contract (in cases where the applicant has accepted an offer but not yet registered).

> The University reserves the right to:
> Suspend the application process while investigating an alleged fraudulent application and/or plagiarism
> Withdraw an application or offer of a place if it is proven or if it is determined, on the balance of probabilities, that the applicant or someone acting of their behalf, has committed admissions fraud
> **Impose a permanent exclusion on an applicant's admission to the University for any course or programme of study.**

**个人陈述检查条款 —— scope = UCAS 本科**：

> 9. Plagiarised UCAS Personal Statements
> All personal statements supporting applications to higher education processed through UCAS are checked by a similarity detection system.
> Any statements showing a potential level of similarity of 10% or greater will be reviewed by members of the UCAS Similarity Detection Service.

（注意 Manchester 用的门槛是 **10%**，低于 UCAS 官方文件写的 30%。两处数字不一致，均照抄原文，本文件不做调和。）

**档位判断：⚠️ 三档都不是 —— 记为「未找到明确的『申请材料使用 AI』规则条款；唯一点名 generative AI 的是 plagiarism 的定义条款」**

判定理由（这条必须精确，否则会被误传）：
1. 该程序适用于 "any level of study"（**覆盖研究生**），且**确实点名** generative artificial intelligence；
2. 但它是 **plagiarism 的定义**，不是 AI 使用规则；
3. 且含 **"without proper attribution or permission"** 这个限定语——它禁止的是**未注明来源**的 AI 使用，**而非 AI 使用本身**；
4. ⚠️ **Manchester 在任何查过的申请页面上都没有提供 AI 使用的申报/披露渠道或格式**，因此**也不能**编码为 A 档。

> **这是全文最锋利的一处政策空洞**：条文的字面结构暗示「注明出处即可」，但**整个申请流程里没有任何地方可以注明**。
> 详见 [§六](#六沉默地带政策没说的地方意味着什么)。

**AI 检测声明：无**（提到的检测是 UCAS similarity detection，本科口径）。

---

### 1.8 LSE —— 研究生 D 档，但**本科有条款**（第二个层级错位样本）

政策版本：LSE Postgraduate Admissions Policy = `Version 3, 15 December 2023`；`Next review due by September 2025`（**已过复审期**）。

> The London School of Economics Admissions Policy applies to all taught and research postgraduate admissions for entry in the academic year 2024/5 onwards.

**AI 条款（研究生层面）：D 档，未找到明确条款。**
已独立复核下列文件 `artificial intelligence` / `generative ai` / `chatgpt` 命中数**全部为 0**：
Postgraduate Admissions Policy PDF、Graduate Offer Pack 2026（含 Conditions of Registration and Enrolment 全文）、
how-to-apply 页、Supporting documents 页、Statement of academic purpose 页、Rules and exceptions 页、Offer-holders What next 页。

**后果原文**（https://info.lse.ac.uk/staff/services/Policies-and-procedures/Assets/Documents/graAdmPol.pdf ｜2026-08-14）：

> The School reserves the right to reasonably refuse an application; lay down such conditions as it sees fit for admission; and terminate, with immediate effect and without appeal, the enrolment of an individual who is subsequently discovered to have omitted or falsified relevant facts or information concerned with his/her application.

URL：https://www.lse.ac.uk/study-at-lse/Graduate/Prospective-students/Supporting-documents ｜2026-08-14

> We take active steps to scrutinise and verify documents received during the application process. If we are unable to verify independently the accuracy of information supplied, your application may be cancelled and any offer or subsequent registration withdrawn. This also applies if we discover that your personal statement and any writing sample you submit is not your own work.

> If you enter the UK on a student visa and we later withdraw your offer/registration due to the discovery of fraudulent documents, you should be aware that the UK Home Office may deport you, and also may ban you from the UK for up to ten years.

**⚠️ 两条极易被误引的条款，特此标注**

**（1）「禁止付费中介」条款 —— 与 AI 无关**
URL：https://www.lse.ac.uk/study-at-lse/graduate/prospective-students/how-to-apply ｜2026-08-14

> LSE expects all applicants to complete their application materials without the use of paid agents or other paid professional assistance. The use of such services may lead to the rejection of application materials, the revocation of an admissions offer, cancellation of admission, or involuntary withdrawal from the University.

→ 针对**付费人类中介/代写**，原文完全未提及 AI。**不得当作 AI 条款引用。**

**（2）LSE 唯一的申请材料 AI 条款在【本科 UCAS】页面**
URL：https://www.lse.ac.uk/study-at-lse/Undergraduate/Prospective-Students/How-to-Apply/Completing-the-UCAS-form/Personal-Statement ｜2026-08-14

> We reserve the right to reject your application where it has been found that a statement has significant similarities to a previous submission or has been created with the use of Artificial Intelligence (using tools such as ChatGPT).

> We do not encourage applicants to use generative Artificial Intelligence tools to create their personal statement as they do not produce high-quality personal statements and may lead to rejection. However, they can be used constructively to:
> generate initial ideas.
> suggest reading materials or references for you to explore (to be cross-checked with teachers for relevance).
> proofread original writing.

⚠️ 这是一份**真正针对申请材料**的 AI 政策（B/C 混合），但**层级为本科 / UCAS**。
**LSE 未在任何官方文件中说明该条款延伸适用于研究生。不得跨层级援引。**

**（3）在读期间的检测条款（双重排除：非申请材料 + 非 AI 检测）**
Graduate Offer Pack 2026 的 Conditions of Registration and Enrolment 第 26 条：

> You agree that you will follow all assessment and exam procedures and that all your assessed coursework (essays, projects, field reports, literature reviews, dissertations etc.) will be your own work... and may be analysed by text matching software. Research students' academic work, whether submitted for formative feedback or summative assessment, may be submitted to iThenticate.

→ 作用对象是**在读期间的 assessed coursework**，且是 **text matching**（抄袭比对）。
LSE 的生成式 AI 官方立场页标题本身就限定了范围：**"School position on the use of generative AI in assessment 2025/26"**（完全不涉及招生/申请）。

**档位判断：D**。**AI 检测声明：无**。
**applicant declaration 原文：未取得**（在 LSE Graduate Applicant Portal 登录墙内）。

---

### 1.9 Sheffield Hallam University —— ⭐ **英国唯一找到的「允许但须披露」明文**（非罗素集团，但条款最完整）

为回答「披露档位是否存在于英国」，做了跨 `.ac.uk` 域的定向检索，找到这份明文要求申报 AI 使用的招生政策。

条款类型：**Admissions Policy（2026 版）**
URL：https://www.shu.ac.uk/-/media/home/study-here/terms-and-conditions-and-student-regulations/files/2026-files/2026-university-admissions-policy.pdf ｜2026-08-14

适用范围：

> This policy lays out Sheffield Hallam University's (the University) position on key matters relating to recruitment and admission. Except where explicitly stated otherwise, it applies to all applications both full time and part time to all of our undergraduate, postgraduate (taught) and postgraduate (research) programmes.

**§2.21 Applications and the use of Artificial Intelligence (AI)** 全文：

> **2.21.1.** The university supports the use of AI as an assistive tool in preparing information to include in an application, however information within your submitted application should not include any text which has been directly copied from an AI tool. This includes but is not limited to – ChatGPT, Copilot, DeepSeek, Google Gemini, Claude etc.

> **2.21.2.** Where the application process may require additional inputs such as a portfolio (visual or aural artefacts whether physical or digital), written examples of work, interview engagement (both physical and digital – online interviews or video submissions), **any use of AI should be declared in advance and clearly marked within the submission**. Where such usage is prohibited this will be made clear.

> **2.21.3.** Where it is suspected that an application contains information which has been generated through and AI model, the University reserves the right to reject the application.

（注：2.21.3 原文即写作 "through and AI model"，疑为 "an" 的笔误，此处照抄未改。）

**后果原文（§2.22）**：

> 2.22.1. Applicants who do not abide by the rules and regulations of the University, UCAS, DfE Apply or partner organisations, or who make fraudulent applications, including non-disclosure of information relevant to the application, will have their offer of a place withdrawn.
> 2.22.2. Enrolments based on fraudulent applications will be covered under the Student Disciplinary Regulations, which may lead to the termination of a programme of study.

**档位判断：⭐ 混合档位 —— 同一政策内按材料类型分档**

| 材料类型 | 档位 | 依据 |
|---|---|---|
| 申请表内文字（含 personal statement） | **B** | 允许 AI 作为 assistive tool，但不得直接复制粘贴 AI 文本；**无披露要求** |
| **作品集 / 书面作品样本 / 面试与视频提交** | **A（允许但须披露）** | "any use of AI **should be declared in advance and clearly marked within the submission**" |

⚠️ 注意 2.21.2 的披露要求有**两个动作**：**事前申报**（declared in advance）+ **提交内标注**（clearly marked within the submission）。
这是本次调研中**披露义务定义得最具操作性**的一条（虽然仍未给格式）。

**AI 检测声明：无明确工具声明**（2.21.3 只说「怀疑即可拒」）。

---

### 1.10 英国小结

| 院校 | 档位（研究生申请材料） | 条款位阶 | AI 检测声明 |
|---|---|---|---|
| **Cambridge** | **C（PS/CV）+ A（research proposal）** | 中央招生指南页 | 无 |
| **Oxford** | **C** | 中央 Application Guide + 申请人 plagiarism 政策 | **⭐ 有**（"can also be used to detect AI usage"） |
| **Edinburgh** | **C**（"could be committing fraud"） | 研究生申请指导页 | 无 |
| **KCL** | **B** | **全校 Admissions Policy §17.3–17.4** | 无（只断言"会被检出"） |
| **Sheffield Hallam** | **B（申请表）+ A（作品集/面试）** | 全校 Admissions Policy §2.21 | 无 |
| **Imperial** | 大学层面 **D**；商学院 **B** | 商学院招生博客 | **⭐ 有（仅商学院）** |
| **UCL** | **D** | — | 无 |
| **Manchester** | **⚠️ 三档都不是**（AI 仅出现在 plagiarism 定义中） | 申请欺诈防范程序（覆盖所有学历层次） | 无 |
| **LSE** | **D**（研究生）；本科另有条款 | — | 无 |
| UCAS | C（否定式声明）——**仅本科 + Conservatoires** | applicant declaration | 无（是 similarity detection） |

---

## 二、美国

> 美国没有 UCAS 这样的中央机构。CommonApp / Slate / ApplyWeb / CollegeNET 只是提交通道，
> **研究生申请的 AI 条款一律由各研究生院（Graduate School）或各院系自行发布**，且**位阶普遍高于英国**——
> 多数写在 `admissions policy` / `application instructions` 上，而不是博客。

### 2.1 Columbia University GSAS —— **C 档，全文措辞最强、最无回旋余地**

条款类型：admissions policy（scoped to applicants）
URL：https://www.gsas.columbia.edu/content/introduction-gsas-admissions ｜2026-08-14

**AI 条款本体**：

> All materials submitted to Columbia GSAS as part of your application must be your own work. **Artificial intelligence programs may not be used to produce any application materials or responses.**

**attestation / 核验要求**：

> Note that the applicant must submit all materials directly, not through an agent or third-party vendor, with the sole exception of submissions by the US Department of State's Fulbright Program and its two partner agencies IIE and AMIDEAST. In addition, the applicant will be required to attest to the accuracy and authenticity of all information and documents submitted to Columbia.

> All students must provide written consent to participate in a verification process of all academic, professional, and reference information provided during their application process. All students must sign and date an authorization and release form to conduct the verification process. The link to do so will be provided in the online application; submission of the release form is required before an application may be submitted.

**后果原文**：

> Failure to submit complete, accurate, and authentic application documents consistent with these instructions may result in denial or revocation of admission, cancellation of academic credit, suspension, expulsion, or eventual revocation of degree.

> **Applicants who received an offer of admission that was later rescinded may not reapply to any program in GSAS. A rescinded admission offer will invalidate any future application to the Graduate School of Arts and Sciences.**

⚠️ **这是三国样本中最重的一条后果条款**：被撤 offer = **终身失去 GSAS 全部项目的申请资格**。

**档位：C**。**AI 检测声明：无**（只声明 verification，未提检测软件）。
⚠️ 注意区分：https://www.gsas.columbia.edu/ai-guidance-and-resources-gsas-students 是**在读学生**的 AI 指引，与申请人禁令是两码事。

---

### 2.2 University of Michigan — Rackham Graduate School —— **B 档 + 覆盖 AI 的 attestation**（美国模板的源头）

条款类型：admissions policy（申请人专属，页面标题即 "Guidance and Policies Related to Use of GenAI for Rackham Applicants"）
URL：https://rackham.umich.edu/admissions/applying/guidance-and-policies-related-to-use-of-genai-for-rackham-applicants/ ｜2026-08-14

> Given that scholars should not represent the ideas or work of others as their own, including ideas generated using GenAI, your application essays should reflect your unique academic, research, and life experiences, and **you should be the sole author of all written passages in your essays**.

> Below are several considerations for how you can **ethically use** GenAI in your graduate school application process:
> - GenAI tools may be used to search for guidance and suggestions on the application process to graduate school.
> - GenAI tools, like Grammarly, may be used to review grammar and spelling of your application essays.
> - GenAI tools, like Google Translate, may be used to aid and check translation of words and phrases.

> **Unethical use** of GenAI in your application process would include:
> - Use of GenAI tools to outline, substantively draft, or write the content of your application essays, including copying and pasting language generated by GenAI tools.
> - Use of GenAI tools to generate prose or replace your unique voice and style as a sole author of your essays.
> - Use of GenAI tools to translate substantial portions of an essay written in another language into English.

> This guidance for appropriate use of GenAI is analogous to ethical considerations for how you involve other individuals in the preparation of your applications to graduate school. It is appropriate to ask other individuals for guidance on the application process, or to review your essays for grammatical mistakes. However, it is not appropriate to ask other individuals to substantively draft, write, or fully translate your essays.

**⭐ attestation（官网对申请系统内勾选项的描述）**：

> Finally, please note that the Rackham Graduate School application will require your attestation that you are the sole author of all written passages in your application, including the academic statement of purpose and personal statement. **You will be asked to acknowledge the above constraints on ethical and appropriate use of GenAI, and to attest that your essays are your own and not that of others or GenAI.**

**后果原文**：

> There are several potential consequences for applicants who **falsely attest** that they have not used GenAI in unethical or inappropriate ways, including:
> - Admission to Rackham may be revoked if any part of the application contains falsifications, misrepresentations, or omissions. This includes falsely attesting that you have not used GenAI in unethical ways in your application.
> - Evaluation to determine if an enrolled student unethically used GenAI in their application, which would be handled in the same manner as other forms of academic and professional misconduct.

Rackham 官方 "Policy for Revoking an Offer of Graduate Admission"（https://rackham.umich.edu/academic-policies/section1/ §1.1.1 ｜2026-08-14）：

> A student who has been permanently dismissed from an academic program of the Rackham Graduate School because of academic or professional misconduct... may not apply to or enroll in any other Rackham program for **five years** from the date of dismissal or for the period specified in the letter of dismissal.

SOP 写作指导页的交叉引用（https://rackham.umich.edu/admissions/applying/statements-curriculum-vitae-resume/ ｜2026-08-14）：

> **Please consult Rackham's guidance and policies related to the use of generative artificial intelligence before preparing your academic statement of purpose or your personal statement.**

⚠️ **这句话的位置对本次任务的产品结论有直接价值**：Rackham 把 AI 政策的提示放在**「开始写之前」**（before preparing），
而不是提交前。这是官方自己给出的提示时机答案。

**档位：B（允许有限辅助，未要求披露）**。
⚠️ **判定纪律提醒**：Rackham 的 attestation 是「**声明自己没有以违规方式用 AI**」，方向与「披露使用了 AI」**相反**，**不属于 A 档**。
**AI 检测声明：无**。

---

### 2.3 Northwestern University — The Graduate School (TGS) —— B 档（明确自陈抄自 Rackham）

URL：https://www.tgs.northwestern.edu/admission/application-procedures/application-requirements/ ｜2026-08-14
章节标题："Guidance for Ethical Use of GenAI for TGS Applicants"

> **Please Note: The following guidance incorporates and draws from language from the University of Michigan Rackham Graduate School.**

> Given that scholars should not represent the ideas or work of others as their own, including ideas generated using Generative Artificial Intelligence (GenAI), your application essays should reflect your unique academic, research, and life experiences, and you should be the sole author of all written passages in your essays.

（Ethical / Unethical 两张清单与 Rackham 逐条同构，此处不重复。）

**attestation + 后果（同一段）**：

> Finally, please note that the TGS application will require your attestation that all substantive written application materials (e.g., essays, personal statements, writing samples, etc.) are your own personal work **and not the product of generative AI**. Admission to Northwestern University may be revoked if any part of the application contains falsifications, misrepresentations, or omissions. This includes falsely attesting that you have not used GenAI in unethical ways in your application.

**档位：B**。**AI 检测声明：无**。

---

### 2.4 Lehigh University —— B 档（第三个同模板样本）

条款类型：admissions policy（页面标题 "Statement on AI Use in Graduate Program Applications"）
URL：https://www2.lehigh.edu/admissions/ai-use-in-graduate-program-applications ｜2026-08-14

> **Ethical Uses of GenAI:**
> - **Process Research:** Using GenAI to research general information about graduate school applications, timelines, or Lehigh's program offerings.
> - **Grammar and Mechanics:** Utilizing AI tools for basic spelling, punctuation, and grammatical checks.
> - **Translation Support:** Using AI tools to check the translation of specific words or short phrases.

> **Unethical Uses of GenAI:**
> - **Content Generation:** Use of GenAI is not permitted when it replaces your own intellectual contribution, including generating substantive content or personal narratives.
> - **Voice Replacement:** Using AI to generate prose that replaces your unique voice, style, or personal narrative.
> - **Substantial Translation:** Using GenAI to translate entire essays or large sections of text from another language into English.

> These guidelines are analogous to how you might involve other people in your application process. While it is appropriate to ask a mentor to proofread or provide feedback, **it is never appropriate to have another person (or an AI) write the essay for you.**

**attestation**：

> The Lehigh University graduate application requires an attestation that you are the **sole author** of all submitted materials...
> In addition, by submitting your application, you acknowledge that you have adhered to Lehigh's standards for ethical GenAI use and that your essays represent your own original work.

**后果**：

> Failure to adhere to these policies or providing a false attestation regarding the use of GenAI may result in serious consequences, including:
> - **Revocation of Admission:** Lehigh University reserves the right to revoke an offer of admission if any part of the application is found to contain falsifications or misrepresentations.
> - **Disciplinary Action:** If unethical GenAI use is discovered after a student has enrolled, the matter will be handled in accordance with Lehigh's Student Code of Conduct.

**档位：B**。**AI 检测声明：无**。

> **一个可复用的观察**：Rackham / Northwestern TGS / Lehigh 三校的页面结构、小标题（"Ethical Use" / "Unethical Use" / "Consequences for Unethical Use"）
> 与「语法拼写 OK、实质写作禁止、翻译整段禁止」三分法**高度同构**，Northwestern 页面还自陈引用了 Rackham。
> **这个模板正在美国研究生院之间扩散**——对产品意味着这三条规则很可能是未来美国的事实标准，值得作为默认基线。

---

### 2.5 Vanderbilt University Graduate School —— B 档，**对申请人最友好、写得最细的一份**

条款类型：admissions policy / application FAQ（"Use of Artificial Intelligence" 一节）
URL：https://gradschool.vanderbilt.edu/application-faqs/ ｜2026-08-14

> **Our AI Policy** — AI should not be used to generate or substantially rewrite application content, personal narratives, or research interests. Applicants are expected to be the primary author of all submitted materials and are responsible for the accuracy and authenticity of their application.

> Vanderbilt University recognizes that many applicants use generative AI tools during the writing process. **Applicants may use AI to support brainstorming, organization, grammar, spelling, or general editing.** However, all application materials, including personal statements, statements of purpose, essays, short answer responses, research statements, and other written submissions, must reflect the applicant's own experiences, ideas, judgment, and writing.

> **We value authenticity over perfection.** Applicants should submit writing that reflects their own voice and experiences. A thoughtful, genuine statement provides far greater insight than one that has been overly polished by artificial intelligence or another person.

FAQ 逐条（对产品措辞设计极有参考价值）：

> **Can I ask AI to improve something I have already written?** Yes, within reasonable limits. Asking for feedback on clarity, organization, grammar, or spelling is appropriate. Asking AI to substantially rewrite a response, create a new narrative, or replace your writing with AI-generated language is not.

> **Can I use AI to brainstorm ideas before I begin writing?** Yes. AI can be used for brainstorming and organization. The ideas, experiences, conclusions, and final written submission should ultimately be your own.

> **What if English is not my first language?** Applicants may use AI for grammar, spelling, and general editing. We are interested in your ideas and experiences, not perfectly polished prose. Your submission should still reflect your own voice and meaning.

> **Can I use tools such as Grammarly or other AI-assisted writing tools?** Yes, when they are being used for functions such as grammar, spelling, or general editing.

⚠️ **注意 Vanderbilt 与 Cambridge 在「英语非母语」这一点上直接相反**：
Vanderbilt 明确说非母语者可以用 AI 做语法编辑；Cambridge 明确说禁令 "covers the use of AI to help your use of English"。
**同一个用户、同一份 PS，在两所学校得到相反的答案。** 这是产品必须逐校建库、不能给全局建议的最硬证据。

**档位：B**。**后果条款：该 FAQ 节内未找到明确原文。AI 检测声明：无**。

---

### 2.6 UNC Chapel Hill Graduate School —— ⭐ **美国唯一的「允许但须披露」（A 档）**

条款类型：**application instructions**（scoped to applicants）
URL：https://gradschool.unc.edu/admissions/instructions/ ｜2026-08-14

该句在同一页出现两次（Required application materials 一节 与 Statement of purpose 一节）：

> The starting point for writing statements of purpose and other application requirements should be applicant-generated. While the use of generative AI tools may be useful for structuring and editing writing, it should primarily be the voice of the applicant. **Any use of AI must be cited clearly.**

> The starting point for writing statements of purpose should be applicant-generated. While the use of generative AI tools may be useful for structuring and editing writing, it should primarily be the voice of the applicant. **Any use of AI must be cited clearly.**

**档位：A（允许但须披露）**。动词是 "**must** be cited clearly"——**强制性作为义务**，宾语是「AI 的使用」，判定明确。

⚠️ **但官网未说明**：`cited clearly` 的**格式**（脚注？结尾声明？行内引用？）、**位置**（写在 SOP 里还是另有字段）、**颗粒度**（每处标注还是整体声明一次）。
**也未给出违规后果条款、未声明检测工具。**

---

### 2.7 MIT —— **D 档（AI 专项），但 certification 全文公开**（唯一一所）

URL：https://oge.mit.edu/graduate-admissions/applications/procedures/ ｜2026-08-14
→ 该页全文**未出现** AI / artificial intelligence / generative / ChatGPT 任何字样。

**⭐ 申请人 certification 逐字原文**（MIT 是本次调研中唯一把逐字 certification 挂在官网的学校）
URL：https://oge.mit.edu/graduate-admissions/admissions-policies/legal-considerations ｜2026-08-14

> **Legal Considerations for Completing an Application** — By creating this application and filling out your information, you agree to the following statements:
> - I will complete all the applicable spaces on this form and I affirm their accuracy. I agree to the terms of this application and its instructions, and I confirm and declare that all of the information that I have provided in this application is **my own work** and, to the best of my knowledge, complete and accurate. I consent to MIT having the right to verify any information presented in my application. I understand that any misrepresentation of the facts on this application may be cause for refusal or cancellation of admission.
> - I understand that if I am offered admission, the offer is based on the information provided to MIT in this application. MIT reserves the right to withdraw or rescind an offer of admission under any of the following conditions:
>   - any part of my application contains misrepresentations;
>   - ...
>   - if I engage in behavior that brings into question my honesty, maturity, or professional suitability; or
>   - if I engage in conduct that violates MIT policy, including but not limited to those in the Mind & Hand Book.

**是否覆盖 AI 使用？** 该 certification **未出现任何 AI / generative / ChatGPT 字样**。
覆盖靠的是通用措辞 "**my own work**" 与 "**misrepresentations**"。
**官方未明示这两句是否涵盖 AI 代写** → 按纪律记为 **D（AI 专项未找到明确条款）**。

⚠️ 这是「沉默地带」最典型的形态：**通用条款在文义上可能罩得住 AI，但学校从未确认**。详见 §六。

---

### 2.8 D 档：已查申请页/FAQ，AI 检索零命中

> 以下均为**实际抓取并全文检索** `AI` / `artificial intelligence` / `generative` / `GenAI` / `ChatGPT` 后命中为 0。**这是「查过没有」，不是「没查」。**

| 学校 | 已查页面 | 补充说明 |
|---|---|---|
| **UC Berkeley Graduate Division** | `/admissions`、`/application-process/`、`/requirements/`、**`/writing-your-statements/`（SOP 指导页）**、`/faq` | 另做全站 URL sweep（firecrawl map，2000 条 URL），slug 含 ai/artificial/genai/integrity/certif/attest 的全部是活动页与项目页，无政策页 |
| **Stanford Graduate Admissions** | `/apply/faq`（全文）、**`/apply/statements`（SOP 官方 prompt 页）**、`/apply/application-overview`、Stanford GSE 申请要求页 | 全站 URL sweep（54 条 URL）无任何 AI/integrity/certification 页面 |
| **Georgia Tech（研究生）** | `grad.gatech.edu/admissions`、`/application-instructions`（含 Application Essay 小节）、CC MSCS 要求页、OMSCS 指南页 | 全站 sweep（227 条 URL）无 AI/integrity 政策页。**注意其本科招生有明确 AI 条款**（见下） |
| **Cornell Graduate School** | https://gradschool.cornell.edu/admissions/application-steps/important-application-policies/ | 后果条款原文："Cornell University reserves the right to revoke an offer of admission under certain circumstances, and at any time, including after a student is in attendance at the university." |
| **MIT（见 2.7）** | — | certification 有 "my own work"，未点名 AI |

**Stanford 官方 SOP prompt 原文（供比对，确认其中无 AI 条款）**：

> Describe succinctly your reasons for applying to the proposed program at Stanford, your preparation for this field of study, research interests, future career plans, and other aspects of your background and interests which may aid the admission committee in evaluating your aptitude and motivation for graduate study. The maximum recommended length is 1,000 words.

stanford.edu 域名下唯一面向研究生申请人的 AI 表述（**是 advice page，不是招生政策**）
URL：https://humsci.stanford.edu/prospective-students/guide-getting-grad-school/writing-your-personal-statements ｜2026-08-14

> Think very carefully about the use of generative AI (artificial intelligence) bots, as these may lead to statements that are not authentic to your own experiences.

---

### 2.9 ⚠️ 明确排除：本科条款 / 在读学生条款 / 建议页（查过但不算数）

**这一节存在的意义**：这些页面在搜索里出现频率极高，极易被误当作「某校研究生政策」。逐条排除：

| 页面 | 真实 scope | 原文要点 |
|---|---|---|
| **Cornell 本科 FAQ**（faq.enrollment.cornell.edu/kb/article/428-...） | **本科招生**（页面自标注 "Cornell Undergraduate Admissions"） | "Ethical uses of generative AI include researching colleges, brainstorming essay topics, and reviewing the grammar and spelling of your completed essays. Unethical uses include (but are not limited to) using generative AI to outline, draft, or write your essays; translating an essay written in another language; and creating images for a required portfolio." |
| **Georgia Tech 本科 "Statement on AI"**（admission.gatech.edu/first-year/application-review） | **first-year 本科** | "AI tools can be powerful and valuable in the application process when used thoughtfully... Use it to brainstorm, edit, and refine your ideas... We think AI could be a helpful collaborator, particularly when you do not have access to other assistance to help you complete your application." |
| **U Minnesota Graduate School**（grad.umn.edu/guidance-generative-ai-graduate-education） | **面向项目/教师的内部指引**，非申请人政策 | 把决定权下放给各项目："Decide on any uses of GAI that they wish to prohibit as a program... This applies to all phases of the admissions process as well as enrolled student use of AI." → **对申请人 = D 档** |
| **Vanderbilt "Academic Integrity and Generative AI"**（vanderbilt.edu/generative-ai/academic-integrity/） | **课堂 coursework** | "The university empowers instructors to establish their own policies..." 与 §2.5 的招生政策是**两套独立政策** |
| **Berkeley Law "Artificial Intelligence Policy"** | registrar 的**在读学生课程/考试**政策 | 非申请材料政策 |
| **Northwestern Career Advancement "Using AI for Grad or Law School"** | 职业发展中心**建议页**，面向 Northwestern 自己的本科生 | 非招生条款（注意与 §2.3 的 TGS 招生政策区分） |
| **Harvard FAS Career Services "AI for Graduate and Professional School"** | **建议页** | 非招生条款；**未在 Harvard GSAS 官网找到申请材料 AI 条款** |

⚠️ **Georgia Tech 是最锋利的对照**：**同一所学校**，本科招生有明确且相当宽松的 AI 条款，研究生招生完全沉默。
**「学校 X 的 AI 政策」这个提法本身在产品里就是错的**——必须精确到「学校 × 学历层次 × 材料类型」。

---

### 2.10 美国小结

| 档位 | 院校 |
|---|---|
| **C 明确禁止** | **Columbia GSAS**（"may not be used to produce any application materials or responses"） |
| **A 允许但须披露** | **UNC Chapel Hill Graduate School**（唯一，"Any use of AI must be cited clearly"） |
| **B 允许有限辅助，未要求披露** | U-M Rackham、Northwestern TGS、Lehigh、Vanderbilt |
| **D 未找到明确条款** | UC Berkeley Graduate Division、Stanford Graduate Admissions、Georgia Tech（研究生）、MIT（AI 专项）、Cornell Graduate School（AI 专项） |

**Section：申请人 certification / declaration 原文的可得性**

| 学校 | certification 逐字原文是否公开 | 是否覆盖 AI |
|---|---|---|
| **MIT (OGE)** | **是**，官网全文发布 | 否，仅 "my own work" + "misrepresentation"，未点名 AI |
| U-M Rackham | 否（官网仅**描述**其存在与内容） | **是**，官网明示 attestation 覆盖 GenAI |
| Northwestern TGS | 否（仅描述） | **是**，明示 "not the product of generative AI" |
| Lehigh | 否（仅描述） | **是**，明示 GenAI 标准 |
| Columbia GSAS | 否（仅描述 "attest to the accuracy and authenticity"） | 另有独立 AI 禁令条款；attestation 文本本身未公开 |
| UC Berkeley / Stanford / Georgia Tech | **未找到** | — |

> **结构性说明**：美国研究生申请的 certification 勾选文本通常位于申请系统（Slate / ApplyWeb / CollegeNET）提交前的最后一屏，需登录方可见，
> 绝大多数学校**不在官网公开发布**。因此「未找到」多数是**发布方式**所致，而非该条款不存在。
> 这与英国 KCL / LSE 的情况完全一致——**是全球性的结构盲区，不是某一国的问题**。
