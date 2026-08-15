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

---

## 三、澳大利亚

> **本节的结论与英美完全不同形态，必须先说方法。**
> 澳洲高校的招生规则集中在**政策库（policy library）**里的 Policy / Procedure 正式文书，
> 每份都有版本号、批准机构、生效日期，且**层级分明**（Policy 定原则 → Procedure 定操作）。
> 本节对 **8 所学校** 的招生 Policy / Procedure 正式文书 + 面向申请人的 how-to-apply 页面
> 逐份抓取后全文检索 `artificial intelligence` / `generative` / `ChatGPT` / `machine-generated`。

### 3.0 ⚠️ 全局结论：**8/8 命中为 0**

**截至 2026-08-14，本次抓取的 8 所澳洲大学的招生政策/程序正式文书与申请人指引页面中，没有任何一份提及 AI。**

**这是事实结论，不是数据缺口**——所有相关约束都落在通用的
「incomplete / inaccurate / fraudulent / misleading information」条款上，
而这些条款的文本**从未点名 AI**，因此按本文件的判定纪律，**不能推定其涵盖 AI 辅助写作**。

| 学校 | 已查文书 | AI 命中 |
|---|---|---|
| **Melbourne** | Selection and Admission Policy (MPF1295) | 0 |
| **UQ** | Admission Policy + Admission to Coursework Procedure + HDR Admission Procedure | 0 |
| **ANU** | Policy: Admissions (Coursework) ANUP_008805 + Procedure ANUP_007810 | 0 |
| **Adelaide** | Admissions Policy + Coursework Admission Procedure + Graduate Research Admission Procedure | 0 |
| **UWA** | Admissions Policy (Coursework) UP 16/5 + HDR Admission Policy UP23/13 | 0 |
| **Monash** | Admission to Coursework Courses and Units Procedure + Graduate Research Admissions Procedure + 学术诚信 Policy | 0 |
| **UNSW** | Admissions Policy v2.2（Effective 13 May 2026） | 0 |
| **Sydney** | 研究生 how-to-apply 页 + 国际生申请页 + PG research 申请页 | 0 |

---

### 3.1 University of Melbourne

文书：**Selection and Admission Policy (MPF1295)**｜URL: https://policy.unimelb.edu.au/MPF1295/ ｜2026-08-14
元数据（页面逐字）：`Version: 22` / `Document Type: Policy` / `Document Status: Published` / `Approved On: 30 April, 2026` / `Effective Date: 17 August, 2026` / `Policy Approver: Academic Board`

⚠️ 查阅日（2026-08-14）显示的 Published 版本 v22 生效日为 **2026-08-17，即查阅日之后 3 天**；当日在效版本应为 v21（`Approved On: 09 January, 2025`）。两版在本主题上实质内容一致（均无 AI 条款）。

**AI：0 命中 → D 档。**

后果条款 5.27（`Cancellation or withdrawal of offer`）：

> The Academic Registrar or a dean may refuse entry into a course or subject including, but not limited to, **withdrawing an offer or cancelling the admission and enrolment of a student** where:
> ...
> b) the offer of admission has been made based on **incomplete, inaccurate or fraudulent information** provided by the person or a third party on behalf of the person;
> ...
> f) in the reasonable opinion of a dean or the Academic Registrar the person is holding open, or intends to hold open, the offer or enrolment for purposes other than genuine study;

条款 5.28：

> Any action taken under this section must be notified in writing to the student.

申请人 declaration（政策内提及，条款 4.13(f)）：

> agree to the terms and conditions specified by the University and complete all declarations required in the application process.

⚠️ **declaration 逐字文本未公开**——政策只规定「须完成 declaration」，未复刻其措辞。

---

### 3.2 University of Queensland

| 文书 | URL | AI 命中 |
|---|---|---|
| Admission Policy | https://policies.uq.edu.au/document/view-current.php?id=140 | 0 |
| Admission to Coursework Procedure | https://policies.uq.edu.au/document/view-current.php?id=228 | 0 |
| Higher Degree by Research Admission Procedure | https://policies.uq.edu.au/document/view-current.php?id=244 | 0 |

（三份页面均自述 `This is the current version of the approved document.`｜2026-08-14）

**AI：0 命中 → D 档。**

Coursework Procedure `Part G - Withdrawal of or Refusal to Make an Offer of Admission` 第 (42) 条：

> The Academic Registrar may refuse to make an offer or withdraw an offer:
> if it is found that the applicant failed to:
> ...
> **provide complete and accurate information relevant to their application for admission**, whether submitted by the applicant or on behalf of the applicant.
> ...
> if UQ determines an international applicant is not meeting the Department of Home Affairs' Genuine Student requirement criterion for a student visa (or equivalent criterion).

第 (43) 条：

> The Academic Registrar may also refuse to make an offer or withdraw an offer:
> if they reasonably believe:
> the applicant poses a risk to other students, staff, themselves, or the UQ or broader community;
> **the applicant is not a genuine applicant.**

HDR Admission Procedure 第 (40) 条（**澳洲各校中措辞最直接的一条**）：

> The Dean may withdraw a letter of offer if it is found **or suspected** that the applicant has provided false, misleading, incomplete or inaccurate information in their application.

⚠️ 注意 "**or suspected**" —— UQ 是本次样本中唯一把「怀疑」也写入触发条件的一校。**但该条仍未提及 AI。**

---

### 3.3 Australian National University

| 文书 | URL | 元数据 | AI 命中 |
|---|---|---|---|
| Policy: Admissions (Coursework) ANUP_008805 | https://policies.anu.edu.au/ppl/document/ANUP_008805 | `Effective Date: 1 Dec 2024` / `Next Review Date: 1 Dec 2029` / `Approved By: Academic Board` | 0 |
| Procedure: Admissions (Coursework) ANUP_007810 | https://policies.anu.edu.au/ppl/document/ANUP_007810 | `Effective Date: 10 Mar 2026` / `Next Review Date: 10 Mar 2031` | 0 |

Policy scope：

> This policy applies to the University's coursework programs, including non-award studies. It does not apply to higher degrees by research.

申报义务：

> All academic failing grades are included in the calculation of an applicant's entrance GPA. **Applicants applying to ANU are required to disclose their complete academic history, even if their academic transcripts may exclude failing grades.**

**⚠️ ANU 的特殊之处：连「提供虚假/误导信息」的后果条款都没找到。**
已在这两份文书中检索 `mislead / fraudulent / false / falsif / revoke / rescind / misrepresent / dishonest / forged` 全部命中，
**无一条针对申请材料造假的后果规定**。ANU 把该事项留给了未在本次检索范围内的其他文书（如 Coursework Awards Rule 2024 / 学生纪律规则）。

**档位：D。虚假信息后果：在 Admissions 政策与程序中亦未找到明确条款。**

---

### 3.4 Adelaide University

⚠️ **结构性提示**：查阅当日 adelaide.edu.au 的政策库已以 **"Adelaide University"** 名义发布
（阿德莱德大学与南澳大学合并后的新实体），政策正文多处出现 `Adelaide University`、`foundation universities`、`Transitional Academic Board` 等过渡期措辞。

| 文书 | URL | 元数据 | AI 命中 |
|---|---|---|---|
| Admissions Policy | https://adelaide.edu.au/about/policies/admissions-policy/ | `Effective from 19 December 2025` / `Approving authority Vice Chancellor and President` | 0 |
| Admission for Coursework Programs Procedure | .../admission-for-coursework-programs-procedure/ | `Effective from 24 September 2025` | 0 |
| Graduate Research Admission Procedure | .../graduate-research-policy/graduate-research-admission-procedure/ | — | 0 |

上位 Policy 第 3.7 节（**全部内容**）：

> 3.7 We may refuse or revoke admission
> We reserve the right to refuse or revoke admission if an applicant poses a risk to students, staff or others.

⚠️ **上位 Policy 层面对造假只字未提**，仅写了「风险」这一条。

Coursework Procedure 第 3.3.2 条：

> We may refuse admission or revoke an offer of admission if:
> the offer was made in error or was based on **incomplete or incorrect information**
> ...

⚠️ **注意**：coursework 程序仅写 "incomplete or incorrect information"，**没有** "fraudulent" 或 "misleading" 字样。

Graduate Research Admission Procedure 第 5 节：

> 5. Why an offer may be withdrawn
> We reserve the right to withdraw an offer of admission of an applicant in cases where:
> An offer is made in error.
> An offer is made based on **incomplete, inaccurate, fraudulent, or misleading information** supplied by the applicant or certifying authority.
> ...
> **Applicant fails to disclose prior misconduct findings at any HEP.**

（HEP = Higher Education Provider。即申请人须主动申报在任何高教机构的既往 misconduct 处分记录——
澳洲少数把「学术不端历史」写进招生条款的例子，但**指向的是既往处分记录，不是申请材料本身的 AI 使用**。）

---

### 3.5 University of Western Australia

| 文书 | 元数据 | AI 命中 |
|---|---|---|
| Admissions Policy (Coursework) UP 16/5 (F79902)，含 Admissions (Coursework) Procedures（PDF） | Policy 部分 `Approval Date: 28 August 2024` / `Version: 03`；Procedures 部分 `Approval Date: 22 February 2024`；`Approver: Academic Board` | 0 |
| Admission to Higher Degree by Research Courses Policy UP23/13 (F23/2327)（PDF） | `Approval Date: 24 September 2025` / `Version: 03` / `Approver: Academic Board` | 0 |

Policy 第 5.6–5.7 条：

> 5.6 All applicants to courses of the University are required to disclose all of their prior academic study as a part of their application.
> 5.7 An application for admission may be denied at the discretion of the University in situations where:
> (a) **the applicant has engaged in dishonest, deceitful, and/or fraudulent behaviour;**
> ...
> (g) there is evidence that the applicant does not have a genuine intent to study at the University;

Procedures `Part 10: Withdrawal of Offer`：

> 10.1.3. Evidence arises that the applicant should be refused admission in line with clause 5.7 of the Admissions (Coursework) Policy, **including evidence of fraud or misconduct in the admissions process**.

**⭐ 后果时长（澳洲各校中罕见的明确量化）**，Procedures 第 9.7 条：

> 9.7. **Refusal of admission normally have a timeframe of five years from the decision**, unless otherwise specified.

HDR Policy 第 9 节：

> 9.1 An offer of admission may be withdrawn and/or admission cancelled, where:
> ...
> (b) the offer of admission has been made based on **incomplete, inaccurate or fraudulent information** provided by the applicant or a third party on behalf of the applicant;

---

### 3.6 Monash University

| 文书 | scope（页面逐字） | AI 命中 |
|---|---|---|
| Admission to Coursework Courses and Units Procedure | "all applicants for coursework courses, units and approved enabling programs; current students seeking to transfer course; incoming study abroad and exchange students; and all locations." | 0 |
| Graduate Research Admissions Procedure | "all applicants for admission to Monash University graduate research courses, including joint doctoral and research master's courses." | 0 |

Coursework Procedure 第 16 节：

> **16. Cancellation of application, offer or enrolment**
> 16.1 The dean of the managing faculty (or nominee), or the campus Pro Vice-Chancellor (or nominee) in the case of courses offered in Indonesia, Malaysia or Suzhou, can decide to reject an application, or cancel an offer of a place or a student's enrolment if:
> - the applicant has previously been suspended or excluded from Monash or another educational institution;
> - admitting or enrolling the applicant may place the University in breach of a law or a legal requirement;
> - **the applicant is found to have falsified information that would otherwise have led to their application being rejected;**
> - the applicant failed to disclose information that would have led to their application being rejected; or
> - the applicant has breached any of the terms and conditions of application or offer.

Graduate Research Admissions Procedure 第 2.18 条（同构，另加 HDR 专属项）：

> Rejection of application, cancellation of offer or enrolment
> 2.18 The GRC (or delegate) may reject an application, or cancel an offer of admission or a student's enrolment if:
> - the applicant has not satisfactorily demonstrated the eligibility requirements under section 1 of this procedure;
> - the applicant has previously been suspended or excluded from the University or another educational institution;
> - admitting or enrolling the applicant may place the University in breach of a law or other legal requirement;
> - **the applicant is found to have falsified information that would otherwise have led to their application being rejected;**
> - the applicant failed to disclose information that would have led to their application being rejected;
> - the applicant fails to respond, or commence, in accordance with the offer in which case the offer will be lapsed and withdrawn, **and such offers will not be reinstated**; or
> - the faculty advises that it does not have sufficient resources or supervisory expertise to support the student's proposed research project to completion.

⚠️ 注意 Monash 的触发词是 "**falsified information**"（伪造信息）——比 Melbourne/UWA 的 "inaccurate" 门槛更高，
**更难被解释为涵盖「用 AI 辅助写作」**。

---

### 3.7 UNSW

文书：**Admissions Policy**｜元数据（PDF 页眉逐字）：`Version 2.2` / `Approved by: Deputy Vice-Chancellor Education and Student Experience` / `Approval date 13 May 2026` / `Effective date 13 May 2026`

Scope：

> The policy applies to admission to undergraduate, postgraduate coursework and higher degree research programs and non-award study at UNSW.

**AI：0 命中 → D 档。**

⚠️ **UNSW 的情况比其他七所更极端**：这份 Admissions Policy 全文仅 3 页，是一份**纯原则性政策**
（"Applicants will be selected for admission on merit."、"Eligibility requirements for admission will be clearly expressed and publicly available."），
检索 `integrity / cancel / withdraw / lapse / genuine / own work / honest / misconduct / accurate / verif` **全部零命中**——
即 **UNSW 的招生政策连「虚假信息后果」条款都不在这一层**，实体规则下放到未在本次范围内的其他文书。

---

### 3.8 University of Sydney

已查申请人指引页（AI 命中 = 0）：
| URL | 类型 |
|---|---|
| https://www.sydney.edu.au/study/how-to-apply/postgraduate-coursework.html | 研究生授课型申请页 |
| https://www.sydney.edu.au/study/applying/how-to-apply/international-students.html | 国际生申请页 |
| https://www.sydney.edu.au/study/applying/how-to-apply/postgraduate-research.html | 研究型申请页 |

⚠️ **诚实标注**：https://www.sydney.edu.au/policies/a-to-z-policy/coursework-policy.html 的政策正文为 JS 渲染，
本次抓取只取到导航壳，**Coursework Policy 正文未成功核验**。
Sydney 的 D 档判定**仅基于上述三个申请人指引页**，其政策库正文**记为未核实**，不作为零命中的证据。

---

### 3.9 澳洲小结与结构性解释

**为什么澳洲是三国中唯一「全面沉默」的？** 基于抓取到的政策文本本身可以观察到三点（以下是推断，明确标注为推断）：

1. **澳洲招生规则的载体是「政策库正式文书」，不是网页指引。** 英美的 AI 条款大量出现在 how-to-apply 页、FAQ、招生博客这类**低摩擦载体**上——改一句话就能上线。澳洲的等价规则必须走 Academic Board 批准 + 版本号 + 生效日期的流程（本节每份文书都有），**修订成本高、周期长**。
2. **澳洲的招生合规重心在签证与 ESOS/Genuine Student，不在文书真实性。** UQ、ANU、Adelaide 的条款里 Department of Home Affairs 的 **Genuine Student** 要求反复出现，而个人陈述的原创性几乎不被单独规定。
3. **澳洲授课型硕士的申请材料本身就比英美轻。** 多数澳洲授课硕以成绩单 + 学位证为主，个人陈述的权重远低于英美——**没有强规则，某种程度上是因为没有强需求**。

⚠️ 以上第 1、2 点有政策文本支撑，第 3 点是基于申请材料清单的推断，**未在任何官方文本中得到直接确认**。

**但沉默不等于安全**——澳洲的通用条款后果反而是三国中最重的一类：
- **Melbourne / UWA**：不仅撤 offer，还可 **cancelling the admission and enrolment**（已入学也能取消）
- **UWA**：refusal of admission **normally have a timeframe of five years**
- **UQ（HDR）**：「**或怀疑**」提供虚假信息即可撤 offer

详见 [§六](#六沉默地带政策没说的地方意味着什么)。

---

## 四、⭐ 专章：「允许 AI 辅助但要求披露」这一档到底存不存在？

> 这是本次调研的**重点问题**，也是产品设计最想落脚的位置。单独成章，跨国横向对比。

### 4.1 结论：存在，但是**孤例，不是趋势**

在本次实际抓取核实的**约 35 个机构页面**中（英 10 + 美 15+ + 澳 8 + 商法学院专项），
真正落在「**先允许，再要求申报/标注 AI 使用**」这一档的，**只有下面 4 条**。

| 强度 | 机构 | 载体（决定其约束力） | 覆盖材料 |
|---|---|---|---|
| **最硬** | **Michigan Ross**（Online MBA / Weekend MBA / MBAn） | **Application requirements 页面，essay 题目正下方** | essay |
| **硬** | **UNC Chapel Hill Graduate School** | **application instructions** | statement of purpose + other application requirements |
| **中** | **University of Cambridge** 研究生招生 | **官方 "Using AI in your application" 页** | **仅 research proposal**（PS/CV 反而是禁止） |
| **中** | **Sheffield Hallam University** | **全校 Admissions Policy §2.21.2** | **仅**作品集 / 书面作品样本 / 面试与视频提交（申请表内文字反而无披露要求） |
| **软（不建议援引）** | London Business School | **官方 admissions blog**（招生官第一人称建议） | essay |

### 4.2 逐条原文

**（1）Michigan Ross —— 唯一给出披露【格式】的机构**

位置：MBA / 硕士项目的 Application Requirements 页面，紧接在 essay 题目（Part 1 Career Aspirations / Part 2 Impact / Optional Essay）**正下方**，与「5. Choose Your Recommender」之间。

> *Note: Ross graduate admissions recognizes the appropriate use of generative artificial intelligence (AI) tools for providing guidance and suggestions. **If you use artificial intelligence (AI) software in the creation of your essay answers, you are required to use the APA in-text citation "Personal Communication."** Rule: (Communicator, personal communication, Month Date, Year); example: (OpenAI, personal communication, January 16, 2023).*

已逐一核实含该句的 URL（2026-08-14）：
- https://michiganross.umich.edu/graduate/online-mba/admissions/application-requirements
- https://michiganross.umich.edu/graduate/weekend-mba/admissions/application-requirements
- https://michiganross.umich.edu/graduate/master-of-business-analytics/admissions/application-requirements

⚠️ **同一批抓取中未命中该句的 Ross 页面**：Full-Time MBA、Executive MBA、Global MBA、Master of Accounting、Master of Management。
→ **该条款在 Ross 内部并非全项目统一。** 产品必须精确到「学校 × 项目」，不能精确到「学校」。

**为什么这是 A 档而非 B 档**：动词是 "you **are required to** use the APA in-text citation"——对申请人施加的**强制性作为义务**，
且披露形式**具体到引用格式和示例**。它同时明确 "recognizes the appropriate use of generative AI tools"——**先允许，后要求标注**。
这是「允许 + 强制披露」的完整结构，也是本次调研中**唯一给出可执行格式**的一条。

抓取说明：该站有 Cloudflare 防护，plain curl 返回 "Just a moment..."；原文经 `firecrawl scrape --format markdown` 取得。

**（2）UNC Chapel Hill Graduate School**（详见 §2.6）

> Any use of AI **must be cited clearly**.

**（3）University of Cambridge**（详见 §1.1）

> Appropriate use of AI tools to support the preparation of research proposals **is permitted**.
> Content generated by AI **should be acknowledged**.

**（4）Sheffield Hallam University**（详见 §1.9）

> any use of AI **should be declared in advance and clearly marked within the submission**.

**（5）London Business School —— 软实例，仅供参考，不建议援引**

URL：https://admissionsblog.london.edu/mba-and-one-year-mba-application-preparation-essays/ ｜2026-08-14｜文章日期 2025-06-19

> With the rise of generative AI tools, it can be tempting to use that as a starting point for your essays. Whilst we acknowledge that many might use AI to finetune their essays, I would always advise the starting point comes from you. Remember that the Admissions Committee are trying to get to know you as an individual through the application process, so please make the starting point authentic (**and if you do use generative AI in any way, make sure to reference it!**)

⚠️ 句式是 "make sure to reference it!"（要求 reference = 披露），但整段是**招生官第一人称建议**（"I would always advise"），
发布在 **blog 而非 application instructions**；LBS 正式 apply 页（https://www.london.edu/masters-degrees/mba/apply）**未找到任何 AI 条款**。
**不宜与 Ross 等同引用。**

### 4.3 ⚠️ 三条常见误传的纠偏（这一节比正面清单更重要）

**误传 1：ASU Law「允许用 AI 但要求 certify AI 使用」**
媒体广泛报道 ASU Law 是「全美第一所允许申请人用生成式 AI 的法学院」，并常描述为「允许但要求 certify AI 使用」。
**核实官网原文后：certification 的对象是「所提交信息属实」，与是否使用 AI 无关。**

URL：https://law.asu.edu/admission/jd/full-time-on-campus ｜2026-08-14

> ASU Law allows applicants to use generative artificial intelligence (AI) in the preparation of their application materials. Applicants are expected to use this technology responsibly and **must certify that the information they submit in their application to ASU Law is true**.

2023 年首次公布该政策的官方新闻稿（https://law.asu.edu/newsroom/asu-law-permit-use-generative-ai-applications ｜发布日期 2023-07-27，2026-08-14 仍在线）：

> ...announces that applicants to its degree programs are permitted to use generative artificial intelligence (AI) in the preparation of their application **and certify that the information they submit is accurate**, beginning in August 2023.

→ 动词宾语是「**信息的真实性**」，不是「**AI 的使用**」。**ASU Law 是 B 档（最宽松的允许，无披露要求），不是 A 档。**

**误传 2：Duke Fuqua「未注明来源的 AI 属抄袭」= 有披露要求**
URL：https://www.fuqua.duke.edu/programs/daytime-mba/application-instructions ｜2026-08-14

> All submitted materials must be your own work and a truthful representation of your experiences. Essays are reviewed using plagiarism detection software. Using language or content from external sources, including websites, publications, other applicants' materials, consultants, or AI-generated content, **without proper attribution**, constitutes plagiarism. Plagiarism is a violation of the Fuqua Honor Code and may result in denial of admission.

> We recognize that applicants may use tools such as Grammarly, ChatGPT, or other AI technologies. These tools may be used to support editing and clarity, but your ideas, experiences, and responses should be your own. **AI should help refine your content, not generate it.** You will tell your story better than any tool. **Essays may also be reviewed using AI-detection tools.** Submissions that rely heavily on AI-generated content, misrepresent the applicant, or are written by another person may negatively affect an applicant's evaluation and may constitute a violation of the Fuqua Honor Code.

⚠️ **这是 A/B 边界上最容易误判的一条。** 第一段字面上暗示「有 attribution 就不算抄袭」，看起来接近披露要求；
但第二段的实际操作规则是「AI 可用于 editing and clarity，不可用于 generate」，且**全文没有任何地方告诉申请人如何/在哪里做这个 attribution**，
也没有要求申请人主动声明。→ **归 B 档**，但其措辞的模糊性必须标注。
（与英国 Manchester 的 plagiarism 定义条款是**完全同构的陷阱**——见 §1.7 与 §六。）

**误传 3：Michigan Law「certification 里可以声明用了 AI」= 有披露档**
URL：https://michigan.law.umich.edu/admissions/apply-jd-program ｜2026-08-14

> Please note that for all written submissions, we expect that the work is the applicant's own... **In general, applicants ought not use generative artificial intelligence tools as part of their drafting process.** (There is one exception to this rule, however, discussed below under "Supplemental Essays.")

> ...one prompt, however, is specifically designed to be used with AI tools, and if you choose to answer it, you **must** use generative AI.

> **Essay Ten - TO BE ANSWERED USING GENERATIVE AI:** Discuss how you have used AI to solve a real-world problem. How was AI helpful, and how was it lacking? Going forward, how will you approach the use of such tools?

→ Michigan Law 是 **C 档**，结构独特：**禁止 + 一个反向的强制使用 AI 的题目 + 在 certification 里为这个例外留一个声明口子**。
那句声明服务的是**一条禁令的例外**，不是「允许用 AI 写申请文书」的政策。**不应作为 A 档实例引用。**

⚠️ **引用可靠性警告**：Michigan Law 的 certification 逐字文本只存在于官方 "Annotated Application 2025" PDF 中，
而该 PDF 里 certification 是 **LSAC FlexApp 的截图**，文本抽取得到的是有损坏的 OCR 层
（如 "a111>lication"、"materia s"、"generativ~ ificial"）；且原站 2026-08-14 返回 **HTTP 500**，实际取自 Wayback 2025-11-12 快照。
**引用时应优先使用上方来自现行页面的 prose 版本，不要引用 OCR 重建的 certification 文本。**

### 4.4 三条给下游使用者的判定纪律

1. **「certify 内容属实」≠「披露使用了 AI」。** 判档只看动词的宾语：宾语是「AI 的使用」才算 A 档；宾语是「信息的真实性」不算。ASU Law 是这个混淆的重灾区。
2. **A 档目前是孤例，不是正在成型的行业惯例。** 全球范围内只有 Ross 一家在正式 application instructions 里写了强制披露**并给出格式**；UNC 有强制但无格式；剑桥限于 research proposal 且用 "should"；Sheffield Hallam 限于作品集/面试；LBS 只在 blog 里说。
3. **⭐ 披露要求出现的位置不在学术诚信页，而在 essay instructions 旁边。** Ross 的条款就贴在 essay 题目下面，UNC 的句子出现在 statement of purpose 一节。**这对产品的检索策略与提示位置都有直接含义**：要抓的是 "application requirements" / "essays" 子页与 application certification 文本，不是 academic integrity 页。

### 4.5 ⭐ 最重要的一条结构性观察：声明基础设施已经现成，但方向是相反的

**制度化的「AI 声明」机制在现实中已经大量存在**——但业界的默认设计**清一色是「让申请人否认使用」，而不是「让申请人披露使用」**：

| 机构 | 声明的方向 | 原文关键句 |
|---|---|---|
| UCAS（本科） | **否认** | "declare that your personal statement hasn't been copied or provided from another source, including artificial intelligence software" |
| U-M Rackham | **否认** | "attest that your essays are your own and not that of others or GenAI" |
| Northwestern TGS | **否认** | "attestation that all substantive written application materials... are your own personal work and not the product of generative AI" |
| Lehigh | **否认** | "acknowledge that you have adhered to Lehigh's standards for ethical GenAI use" |
| Columbia Law | **否认** | "no agent, third-party vendor, educational consultant, or artificial intelligence tool or service has written or modified any component of the application" |
| **Michigan Ross** | **披露** | "you are required to use the APA in-text citation 'Personal Communication'" |
| **UNC** | **披露** | "Any use of AI must be cited clearly" |

> **产品含义**：Michigan Ross 的引用要求之所以罕见，**不是因为技术上做不到**——招生系统里的勾选框、认证文本、
> 提交前拦截这些基础设施**全部现成**。罕见的原因是**政策取向不同**：绝大多数院校选择让申请人承诺「我没用」，
> 而不是让申请人说明「我用了什么」。
>
> 这意味着一个「AI 辅助 + 自动生成披露声明」的产品功能，**在今天大多数学校是无处可交的**——
> 你生成的披露文本，在 Rackham 的申请系统里没有字段可填，反而与那里的 attestation 直接冲突。

---

## 五、专章：哪些机构公开声明使用 AI 检测工具？

> 任务明确要求查「是否有院校公开声明使用 AI 检测工具」。答案是：**有，但只有三例，且必须与 similarity detection 严格区分。**

### 5.1 关键区分：similarity detection ≠ AI detection

**similarity detection（相似度/抄袭比对）**的机制是「与已提交文本库和网上样本库比对」，输出是**相似度百分比**；
**AI detection（AI 生成检测）**的输出是**「这段文本是否由模型生成」的判断**。**两者是不同的技术，也是不同的法律风险。**

大量机构声明使用的是**前者**，极易被误报为后者：

| 机构 | 声明的是什么 | 原文 |
|---|---|---|
| **UCAS** | similarity | "Each personal statement is compared against a library of personal statements previously submitted to UCAS... Any statements showing a level of similarity of greater than 30% are reviewed" |
| **KCL** | similarity | "The university may use **similarity detection software** to evaluate the originality of a piece of work." |
| **Manchester** | similarity（且 scope 为 UCAS 本科） | "All personal statements supporting applications to higher education processed through UCAS are checked by a **similarity detection system**." |
| **LSE** | text matching，且作用于**在读期间 coursework** | "may be analysed by **text matching software**... may be submitted to **iThenticate**" |
| UCL / Edinburgh / Melbourne 等 | **verification agency**（资历核验） | 语境是核验成绩单/证书真伪，与文本无关 |

### 5.2 真正的 AI 检测声明：三例

**（1）⭐ University of Oxford —— 位阶最高（申请人 plagiarism 政策页，非博客）**

> In some cases departments may screen the written work, research proposals or supporting statements submitted by their applicants for plagiarism using a plagiarism-detection system. This system produces a matching report that highlights any areas of significant similarity between submitted work and other published documents **and can also be used to detect AI usage**.

URL：https://www.ox.ac.uk/admissions/graduate/application-guide/applicant-policies/plagiarism ｜2026-08-14
⚠️ 未点名工具、未给阈值；且原文是 "**may** screen"（部分院系可能会做），不是全校统一。

**（2）Duke Fuqua —— 写在 application instructions 上**

> **Essays may also be reviewed using AI-detection tools.**

URL：https://www.fuqua.duke.edu/programs/daytime-mba/application-instructions ｜2026-08-14
⚠️ 是**研究生项目**（Daytime MBA）的申请说明，位阶高于博客。同页还声明用 plagiarism detection software。

**（3）Imperial College Business School —— 招生博客**

> **We've introduced new ways to detect AI-generated content** and are continuously adapting our review process.

URL：https://www.imperial.ac.uk/business-school/blogs/admissions/ai-admissions-how-use-it-responsibly-your-application/ ｜2026-08-14
⚠️ 载体是**招生博客**，非合同性文件；未说明工具与阈值。**且仅限商学院，不覆盖 Imperial 其他学院。**

### 5.3 边界情形与负面结论

**边界情形：KCL 断言「会被检出」但不说用什么**

> 17.4 Where **evidence is detected** that a personal statement may be plagiarised or wholly written using AI...

→ 政策**假定**了 AI 撰写可被检出，但**从未声明使用任何 AI 检测工具**；同一政策中明确点名的工具只有 similarity detection software。

**边界情形：Sheffield Hallam「怀疑即可拒」**

> 2.21.3. Where it is **suspected** that an application contains information which has been generated through and AI model, the University reserves the right to reject the application.

→ 门槛是「怀疑」，**不需要检测工具背书**。这在实务上比一个明说用检测工具的学校更难预测。

**负面结论（同样重要）**：
- **美国**：在 Rackham / Northwestern TGS / Lehigh / Vanderbilt / Columbia GSAS / MIT / Cornell / Berkeley / Stanford / Georgia Tech 的招生页面上全文检索 `detect / detection / detector / Turnitin / GPTZero`，**零命中**。最接近的官方表述是「保留核实权」而非「使用检测工具」（MIT："I consent to MIT having the right to verify any information presented in my application."）。**Fuqua 是美国样本中唯一的例外，且它是商学院项目页而非研究生院政策。**
- **澳洲**：8 校全部**未找到**任何 AI 检测声明。
- **UCAS**：**明确不是** AI 检测（见 §1.0(c)）。

> **产品含义**：AI 检测声明极其稀少（3/35），且没有一家公布工具、阈值或申诉机制。
> **但这不构成「检测不到所以可以用」的理由**——反过来更成立：正因为没有公开的检测标准与申诉路径，
> 一旦被判定，申请人**没有可援引的技术标准来自证**。KCL 的 "evidence is detected"、
> Sheffield Hallam 的 "where it is suspected"、UQ 的 "or suspected" 全都把判断权完全留给院校。
> **不透明的检测比透明的检测对用户更危险。**

---

## 六、沉默地带：政策「没说」的地方意味着什么

> 这是本次调研中**范围最大的一档**（D 档：澳洲 8/8、美国 5 所、英国 2–3 所），
> 也是最容易被产品和用户共同误读的一档。**必须明确：D ≠ 允许。**

### 6.1 沉默的四种不同形态（不能混为一谈）

| 形态 | 典型样本 | 特征 |
|---|---|---|
| **① 真沉默** | UCL、Stanford、UC Berkeley、Georgia Tech（研究生）、澳洲 8 校 | 招生页面上完全没有 AI 相关表述，通用条款也不点名 AI |
| **② 通用条款可能罩得住，但学校从未确认** | **MIT** | certification 写 "my own work" + "misrepresentations"，**未出现 AI 字样**，官方未明示是否涵盖 AI 代写 |
| **③ 点了名，但落在定义里而不是规则里，且暗示的救济路径不存在** | **Manchester**、**Duke Fuqua** | plagiarism 定义写明 "generative artificial intelligence... **without proper attribution**"，但整个申请流程**没有任何地方可以 attribute** |
| **④ 层级错位：同一所学校，另一个层级有条款** | **LSE**（本科有、研究生无）、**Imperial**（商学院有、大学层面无）、**Georgia Tech**（本科有、研究生无）、**Cornell**（本科有、研究生无） | 用户极易跨层级误读，把不适用的条款当成适用 |

### 6.2 ⭐ 形态 ③ 是最危险的：一个自相矛盾的条款

**Manchester 的 Applicant Admissions Fraud Prevention Procedure**（适用于 "any level of study"）把 generative AI 写进 plagiarism 定义，
并带上限定语 "**without proper attribution or permission**"。

字面推论是：**注明出处的 AI 使用，不构成 plagiarism。**
但——**Manchester 在整个申请流程中没有提供任何 AI 使用的申报字段、披露格式或说明位置。**

Duke Fuqua 的条款是**完全同构的**："...or AI-generated content, **without proper attribution**, constitutes plagiarism"，
同样未说明如何/在哪里 attribute。

> **这意味着什么**：条文给了一条看似存在的合规路径（「注明就行」），但**这条路径在流程上是走不通的**。
> 用户如果按字面理解自行在 PS 结尾加一句「本文部分内容由 AI 辅助生成」，
> 他既**没有满足**任何明文要求（因为没有要求他这么做），又**主动暴露**了一个在其他学校（Cambridge PS/CV、Edinburgh、Columbia GSAS）
> **明确违规**的事实——而这份 PS 很可能是同一份，投给了多所学校。
>
> **产品绝不能自作主张地生成披露声明**。见 §八。

### 6.3 沉默不降低风险敞口，只是让它**不可预测**

**关键机制**：AI 层面的沉默**不会**让通用条款失效。通用条款照常适用，而它们的后果**普遍比 AI 专项条款更重**——
因为 AI 专项条款往往写着「可能影响评估」，而通用欺诈条款写的是撤销与禁入。

**沉默地带里的通用条款后果实录（全部为已引原文）**：

| 机构 | 后果 |
|---|---|
| **Melbourne / UWA（AU，D 档）** | 不仅撤 offer，还可 **cancelling the admission and enrolment**（已注册也能取消） |
| **UWA（AU，D 档）** | "Refusal of admission normally have a timeframe of **five years** from the decision" |
| **UQ HDR（AU，D 档）** | "if it is found **or suspected** that the applicant has provided false, misleading, incomplete or inaccurate information" |
| **UCL（UK，D 档）** | 撤销申请与 offer，且 "**An applicant to UCL does not have the right of appeal against the decision.**" |
| **Oxford（UK，C 档）** | 当季**全部**申请被撤销，且可 "**prohibited from submitting further applications for a set period**" |
| **Columbia GSAS（US，C 档）** | "**A rescinded admission offer will invalidate any future application to the Graduate School of Arts and Sciences.**"（终身） |
| **Manchester（UK，形态③）** | "**Impose a permanent exclusion** on an applicant's admission to the University for any course or programme of study." |
| **Rackham（US，B 档）** | 被开除者 "may not apply to or enroll in any other Rackham program for **five years**" |

> **一句话概括**：**沉默的学校没有告诉你什么是安全的，但它们保留了最重的处罚权。**
> 「政策没说 = 可以用」这个推论，在后果分布上是完全反向的。

### 6.4 结构性盲区：申请门户内的勾选文本无法核实

本次调研的**主要方法论盲区**，三国一致：

**申请提交前那一屏的 certification / declaration 勾选文本，绝大多数院校不在官网公开发布。**

| 已确认「官网仅描述、原文未公开」 | 已确认「原文完全公开」 |
|---|---|
| U-M Rackham、Northwestern TGS、Lehigh、Columbia GSAS、KCL（King's Apply 内）、LSE（Applicant Portal 内）、UC Berkeley、Stanford、Georgia Tech、Melbourne（政策只说「须完成 declarations」） | **MIT（OGE）** —— 本次调研中唯一一所 |

> **这对本次结论的限制必须明说**：如果某个学校的「允许但须披露」条款是以**门户内勾选题**的形式存在
> （例如第三方曾流传 Caltech 研究生申请表里有 "Did you receive any AI generated assistance in the preparation of your application materials?" 这样一题——
> 已在 Caltech 官方 AI 政策页、研究生院 FAQ、Apply Online 页、Application Checklist PDF 中**全部检索未找到**，申请表在登录墙后**无法核实**），
> **本次方法结构上无法发现它。**
>
> **反过来说**：这也意味着产品**不能承诺**「我们知道每所学校的全部 AI 规则」。
> 真正稳妥的做法是把「提交前那一屏请自己读一遍」写进流程，而不是替用户断言。

---

## 七、三国**一致**的部分（可做统一骨架）

1. **AI 条款一律挂在通用「真实性/欺诈」条款之下，没有一所把它做成独立的处罚体系。** 无论 A/B/C/D，最终援引的后果条款都是同一套：撤 offer / 取消入学 / 禁止再申请。**产品的风险模型只需要一套后果表，不需要一套 AI 专属后果表。**
2. **「整篇由 AI 生成」在所有有条款的学校都是违规**，无一例外。分歧全在「辅助到什么程度算辅助」。
3. **「你必须是主要作者 / 唯一作者」是跨国通用表述**：Rackham "sole author"、Lehigh "sole author"、Vanderbilt "primary author"、Oxford "entirely your own work"、KCL "your own work"、LSE "all your own work"。**这句话是全球最安全的产品措辞基底。**
4. **没有任何一所学校要求申请人证明「我没用 AI」**——举证责任在校方一侧（"where evidence is detected" / "if it is suspected" / "we reasonably consider"）。
5. **后果都含「已入学后追溯」条款**：Melbourne/UWA 取消 enrolment、KCL §17.6 终止注册、Columbia GSAS revocation of degree、Rackham 转入学术不端程序。**风险不随提交而结束，产品不应给用户「交完就安全」的暗示。**
6. **申诉权的有无高度分化，但都写明了**：UCAS 有、KCL 有、Rackham 有（院长终审）、**UCL 明确没有**、LSE "without appeal"。
7. **申请门户内的 certification 勾选文本几乎全部不公开**（三国唯一例外是 MIT）。

---

## 八、三国**就有分歧**的部分（必须逐校 × 逐材料建库）

> **核心结论：后果模型是统一的，但「什么算越界」这条线是院校私有的，甚至是院校内部按材料类型私有的。**
> 「一个模板 + 一张院校参数表」不够用；需要的是「**学校 × 学历层次 × 材料类型**」三维参数表。

1. **档位跨度覆盖全部四档，且没有国别规律**：同为英国 Russell Group，Cambridge 禁 PS、KCL 说「是个可以考虑的工具」；同为美国顶尖研究生院，Columbia GSAS 全面禁止、UNC 要求引用、Stanford 完全沉默。
2. **⭐ 「用 AI 改英文」是分歧最尖锐的一条，也是对中国用户最致命的一条**：
   - **Cambridge（PS/CV）**：禁止，且明说 "This prohibition covers the use of AI to help your use of English."
   - **Vanderbilt**：明确允许 —— "What if English is not my first language? Applicants may use AI for grammar, spelling, and general editing."
   - **Rackham / Lehigh / Northwestern**：允许 "words and phrases" 级翻译，**禁止**整段/大段翻译
   - **Imperial 商学院**：Proofreading 列为 "acceptable (and encouraged)"
   → **同一个用户、同一份 PS，在这几所学校得到完全相反的答案。**
3. **同一所学校内部按材料类型分档**（不是极端个例，而是最好的两份政策都这么写）：
   - **Cambridge**：PS/CV 禁止｜research proposal 允许 + acknowledge｜面试禁止
   - **Sheffield Hallam**：申请表内文字允许但不得复制粘贴（无披露）｜作品集/写作样本/面试须**事前申报 + 提交内标注**
4. **同一所学校内部按项目分档**：**Michigan Ross** 的 APA 引用要求只出现在 Online MBA / Weekend MBA / MBAn 的申请页，Full-Time MBA / EMBA / Global MBA / MAcc / MM 页面没有。
5. **同一所学校内部按学历层次分档**（层级错位，四个实例）：LSE 本科有 / 研究生无｜Imperial 商学院有 / 大学层面无｜Georgia Tech 本科有 / 研究生无｜Cornell 本科有 / 研究生无。
6. **条款位阶差异极大，直接决定其约束力**：全校 Admissions Policy（KCL §17、Sheffield Hallam §2.21）＞ 中央 Application Guide（Oxford）＞ 招生指南页（Cambridge、Edinburgh）＞ application instructions（UNC、Ross、Fuqua）＞ FAQ（Vanderbilt）＞ **招生博客（Imperial 商学院、LBS）**。**博客不是条款，产品在呈现时必须标出位阶。**
7. **披露义务的强度与可执行性各不相同**：Ross "are required to" + APA 格式与示例｜UNC "must be cited clearly" 无格式｜Cambridge "should be acknowledged" 无格式无位置｜Sheffield Hallam "declared in advance and clearly marked" 有两个动作但无格式。
8. **AI 检测声明只有 3 例，且载体位阶差三级**：Oxford（中央申请人政策）＞ Fuqua（项目申请说明）＞ Imperial 商学院（博客）。
9. **后果的「射程」差异巨大**：Columbia GSAS 终身禁申 GSAS 全部项目｜Manchester 可永久排除｜UWA 通常 5 年｜Rackham 5 年｜Oxford 当季全撤 + 一段时期禁申｜Edinburgh 保留拒收后续申请｜Melbourne/UWA 可取消已生效注册。
10. **申诉权有无相反**：UCL「无申诉权」与 LSE「without appeal」vs. UCAS/KCL/Rackham 明文有申诉。
11. **国别整体形态三分**：**英国 = 条款分散、位阶混乱、层级错位最多**｜**美国 = 条款位阶最高、模板正在扩散、写得最细**｜**澳洲 = 全面沉默，但通用条款后果最重**。

---

## 九、⭐ 产品结论：应该在流程的哪一步、用什么措辞提示用户？

> 任务要求回答一个产品问题，并明确指出「**提示时机比措辞更重要——文书写完再提示等于没提示**」。以下是基于上述全部证据的明确建议。

### 9.1 时机的硬约束：三条来自政策本身的推导

**（1）同一份 PS 会被投给多所学校 → 【最严的那一所决定整份草稿的写法】**

这是全部结论中最关键的一条。用户的选校列表里只要有一所 Cambridge（PS/CV 禁止 AI，**含改英文**）、
Edinburgh（用 AI 写 PS "could be committing fraud"）或 Columbia GSAS（"may not be used to produce any application materials"），
那么**这份 PS 的整个生成过程就已经被锁死了**——他不可能先用 AI 起草一版，再为 Cambridge「洗掉」。

> **推论：AI 使用边界必须在【开始写之前】就确定，且必须由【选校列表】驱动。**
> 写完再提示，用户面对的唯一选项是「推翻重写」或「赌一把」——这正是任务所说的「等于没提示」。

**这不是本文件的发明，而是官方自己的做法**：U-M Rackham 在 SOP 写作指导页写的是
"Please consult Rackham's guidance and policies related to the use of generative artificial intelligence **before preparing** your academic statement of purpose or your personal statement."

**（2）规则的粒度是「学校 × 学历层次 × 材料类型 × 项目」，不是「学校」**

- Cambridge 同一页面上 PS/CV 与 research proposal **档位相反**
- Sheffield Hallam 同一政策内申请表文字与作品集 **档位相反**
- Michigan Ross 同一学院内不同 MBA 项目 **有无条款不同**
- LSE / Imperial / Georgia Tech / Cornell **同一学校不同学历层次条款不同**

> **推论：任何按「学校」建模的提示都会给出错误答案。** 数据结构最少要到四维。

**（3）披露档需要产出一个「东西」→ 必须有第二个触点在导出/提交前**

A 档不是一句提醒能满足的，它要求一个**实际产物**：Ross 要 APA 行内引用、UNC 要 "cited clearly"、
Cambridge 要 "acknowledged"、Sheffield Hallam 要「事前申报 + 提交内标注」。
这个产物**只能在文本定稿后才能加**，且**只对 A 档学校加**。

### 9.2 建议方案：**两个触点，一个红线，绝不自作主张**

#### 触点一（主触点）：**选校列表确定后、任何文书生成动作开始之前**

**位置**：用户加完选校、点击「开始写个人陈述 / 生成初稿」的**那一次点击之前**，作为一个必须通过的门。
**不是**设置页里的一个开关，**不是**首次使用的一次性公告——因为选校列表会变，规则必须跟着变。

**逻辑**：对当前选校列表做**取最严**运算，输出三种结果之一：

| 列表中的最严档位 | 提示形态 | 产品行为 |
|---|---|---|
| 含 **C 档**（Cambridge PS/CV、Edinburgh、Columbia GSAS、Oxford…） | **硬提示 + 需要用户明确选择** | 对这些学校**默认关闭**代写/改写/润色，只保留「提问帮你回忆经历」「结构建议」「事实校对」等不落笔的功能 |
| 最严为 **A 档**（UNC、Ross、Cambridge research proposal、Sheffield Hallam 作品集） | **中提示** | 记录该校需要披露，**在触点二兑现** |
| 全为 **B / D 档** | **轻提示（一次性，可折叠）** | 正常使用，但仍展示「你必须是唯一作者」这条通用底线 |

**措辞（触点一，C 档存在时）**——建议直接引用原文，不做二次转述：

> **你的选校里有 3 所对申请文书使用 AI 有明确限制，其中最严的一条来自剑桥大学研究生招生：**
>
> > "AI must not be used when writing personal statements and CVs. **This prohibition covers the use of AI to help your use of English.**"
> > —— University of Cambridge, Using AI in your application（2026-08-14 查阅）
>
> **注意最后一句：剑桥的禁令包括「用 AI 帮你改英文」。** 语法润色、句子改写、翻译成英文，在剑桥都算违规。
>
> 因为你的个人陈述会同时投给多所学校，**最严的那一所决定了整份文书能怎么写**。
>
> 建议你现在选一条路：
> - **[推荐] 为剑桥单独写一份**，其余学校用另一份 → 我可以帮你做提纲、提问、查事实，但正文由你写
> - **全部学校都按剑桥标准写** → 我全程只做提问和结构建议，不落笔
> - **把剑桥移出列表** → 其余学校的限制较宽松，我可以帮你改写和润色
>
> 违规的后果不是「扣分」：剑桥把 AI 生成的不实内容按 application fraud 处理；
> 爱丁堡的原文是 "could be committing fraud"，处理方式是撤销 offer 并保留拒收你后续所有申请。

**为什么这样写**：
- **先给原文再给结论**——用户不会相信一个软件转述的规则，但会相信学校官网的原句；
- **点名最严的那一所**，而不是给一张表——用户此刻需要的是一个决策，不是一份资料；
- **把「改英文也禁」单独拎出来**——这是中国用户最可能踩、也最想不到的一条；
- **给出三个动作而不是一句警告**——警告不改变行为，选项才改变行为；
- **后果用原文的动词**（fraud / withdraw / refuse further applications），不用「可能有风险」这种无信息量的措辞。

#### 触点二（收口触点）：**导出 / 复制 / 标记为定稿之前**，且**只对 A 档学校触发**

**位置**：用户点「导出这份 PS」或「复制到剪贴板」时。
**触发条件**：该文书的目标学校中存在 A 档要求。**B/C/D 档学校不触发**（C 档在触点一已经拦住，D 档不该被打扰）。

**措辞（以 UNC 为例）**：

> **这份文书要投的 UNC Chapel Hill 研究生院要求：如果用了 AI，必须明确注明。**
>
> > "The starting point for writing statements of purpose should be applicant-generated. While the use of generative AI tools may be useful for structuring and editing writing, it should primarily be the voice of the applicant. **Any use of AI must be cited clearly.**"
> > —— UNC Chapel Hill Graduate School, Application Instructions（2026-08-14 查阅）
>
> **UNC 没有说明这个注明该写成什么格式、写在哪里。** 我不会替你写这句话——
> 写错位置或写错措辞，可能比不写更糟。
>
> 建议：**发邮件问一句 UNC 研究生院招生办**，或按对方给的格式写。
> 如果你需要一个参照，密歇根 Ross 商学院是目前唯一给了格式的学校，它要求：
> `(OpenAI, personal communication, January 16, 2023)`（APA in-text citation "Personal Communication"）。

### 9.3 一条红线：**产品绝不自动生成披露声明**

这是本次调研得出的最反直觉、也最重要的一条产品结论。

**理由三条，全部有证据**：

1. **多数学校的申请系统里根本没有地方交这个声明。** Rackham / Northwestern TGS / Lehigh 的申请系统里，提交前那一屏的 attestation 方向是**「我声明我没有以违规方式使用 AI」**。用户自己在 PS 结尾加一句「本文部分由 AI 辅助」，**不满足任何要求，却与他刚勾选的 attestation 直接冲突**。
2. **一份 PS 会投多校。** 加了披露声明的那份 PS，投到 Cambridge / Edinburgh / Columbia GSAS 就是**递交了一份自认违规的证据**。
3. **形态③的陷阱**（§6.2）：Manchester 与 Duke Fuqua 的条文字面上暗示「注明就不算抄袭」，但**两校都没有提供注明的位置和格式**。按字面理解自行注明，是在一条**流程上走不通的路径**上主动暴露。

> **产品能做的是：告诉用户「这所学校要求你披露」+ 给出原文 + 给出唯一已知的格式先例（Ross 的 APA 写法）+ 建议他去问招生办。**
> **产品不能做的是：替他决定披露的措辞、格式和位置。**

### 9.4 其余四条落地要点

1. **通用底线句常驻，不做弹窗。** 在写作界面固定展示一句跨国通用、不会错的话：
   > 「你必须是这份文书的唯一作者（sole author）。这一条在英美澳所有有明文规定的学校都成立。」
   有条款的学校用的正是这个词（Rackham / Lehigh "sole author"、Vanderbilt "primary author"、Oxford "entirely your own work"）。

2. **D 档必须显式呈现为「未找到明确条款」，不能留白，更不能显示为「允许」。** 建议措辞：
   > 「我们在 XX 大学的招生政策与申请页面上**没有找到**关于申请材料使用 AI 的明确条款（查阅日 2026-08-14）。
   > **这不代表允许。** 该校的通用条款仍然适用——[原文]。」
   附上该校最重的一条后果原文（如 UCL「无申诉权」、Melbourne「可取消已生效注册」、UWA「通常 5 年内不受理」）。

3. **标注条款位阶与查阅日期。** 「Imperial 商学院招生博客（2025-12-03）」与「KCL 全校招生政策 §17.3（2025 年 9 月生效）」在用户心里应该是不同分量。政策变动快，每条都要带查阅日。

4. **规则库要有过期机制。** 本文件已发现多处周期问题：Melbourne MPF1295 在查阅日次日换版（v21 → v22）；LSE 研究生招生政策 `Next review due by September 2025` **已过复审期**；UNSW Admissions Policy v2.2 生效于 2026-05-13。**建议规则条目强制带「查阅日 + 页面自述版本/生效日」，超过 6 个月未复核的条目在 UI 上降级显示。**

---

## 十、抓取备注与未解决项

**抓取手段**：curl（浏览器 UA）+ firecrawl scrape / map / search + pdftotext / pypdf + `r.jina.ai` 代理 + Wayback（原站 500 时）。

**已记录的抓取障碍（供复现）**：
- **全渠道 403**（curl / WebFetch / firecrawl / Wayback）：`ox.ac.uk` → 仅 `r.jina.ai` 可读
- **Cloudflare 拦截 plain curl**：`michiganross.umich.edu`、`michigan.law.umich.edu`、`ox.ac.uk` → 用 firecrawl 或 r.jina.ai 绕过
- **原站 HTTP 500**：`michigan.law.umich.edu` 的 Annotated Application PDF → 用 Wayback 2025-11-12 快照（该文件内 certification 为截图，OCR 有损，**已在 §4.3 标注不建议引用**）
- **JS 渲染只取到导航壳**：UCL PG 个人陈述页、`sydney.edu.au/policies/a-to-z-policy/coursework-policy.html`
- firecrawl 限速约 11 req/min

**明确的未解决项（不得据此下任何结论）**：

| 项目 | 状态 |
|---|---|
| **各校申请门户内的 certification / declaration 勾选原文** | **结构性不可核实**（登录墙后）。三国仅 MIT 公开全文。这是本次最大方法论盲区，见 §6.4 |
| UCAS 勾选界面的确切措辞 | UCAS Hub 内需登录，未能核验（见 §1.0(b) 警告框） |
| UKPASS / UCAS 研究生申请服务的停用时点 | ucas.com 上未找到任何说明，**不做推测** |
| University of Sydney Coursework Policy 正文 | JS 渲染未取到；其 D 档判定仅基于三个申请人指引页 |
| Oxford Saïd Business School 申请要求页 | curl 与 firecrawl 均返回空，未完成核实（牛津**中央**研究生招生条款已核实） |
| Stanford `gradadmissions.stanford.edu/admitted-students/conditions-admission` | 未取到正文，记为未核实 |
| Columbia GSAS personal statement prompt 页 | 未取到正文 |
| Cornell Graduate School admission-revocation-policy 子页 | firecrawl 与 curl 均未取到正文（该政策存在已由上级页面引述证实） |
| Caltech 研究生申请表内传闻的 AI 勾选题 | 官方 AI 政策页、研究生院 FAQ、Apply Online 页、Application Checklist PDF **全部检索未找到**；申请表在登录墙后 → **不得作为 A 档实例引用** |
| 各国其余院校（Harvard GSAS、Yale、UCLA、UBC 等）、AMCAS / AACOMAS / Common App 的 AI 声明 | 未纳入本次范围 |

**未采信的来源（虽在搜索结果中大量出现）**：新闻报道（11alive、Columbia Spectator、Cornell Sun、Poets&Quants、Clear Admit、ABA Journal）、
留学中介与第三方比较站（GradPilot、Wordvice、mbaMission、Kaplan、Spivey、Oriel Admissions）、
Reddit / Quora / Facebook / LinkedIn / Instagram、academia.stackexchange、Medium、Scribd。
**这些仅用于发现线索 URL，未用于本文件任何一条结论。**
