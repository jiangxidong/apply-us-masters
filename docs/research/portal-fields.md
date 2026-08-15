<!--
来源与状态：2026-08-14 由 research subagent 一手抓取澳洲四校申请 portal 公开页所得。
该 agent 因会话额度中断，未能自行落盘，本文件为其成果的抢救留存。
服务于 #6 三国主流网申系统各要填什么字段。
字段表见同目录 au-portal-fields.tsv（143 行字段，11 列）。
取证边界：所有 portal 页面仅 GET 读取登录前公开页，未注册、未登录、未 POST、未填任何字段。
-->

# 三国主流网申系统字段调研（AU / UK / US）— Notes

服务于 issue #6。字段表：`portal-fields.tsv`（11 列，schema 见下）。

**TSV schema（11 列，制表符分隔，不得增删列）**
`school / platform / section / field_name_verbatim / normalized_key / type / limit / required / source_url / source_type / checked_date`

**`source_type` 允许值（枚举已锁定，勿新造）**
`live public form`（登录前真实 HTML 表单，limit 取自 `maxlength`/`required` 属性）｜`official how-to-apply page`｜`official checklist`｜`official PDF application guide`｜`login-walled — not confirmable`

**取证边界（三国一致）**：所有 portal 页面**仅 GET 读取登录前公开页，未注册、未登录、未 POST、未填写任何字段**。登录墙后的字段一律不猜——改用官方 how-to-apply 页 / checklist / PDF 指引，并在 `source_type` 列如实标注来源档次；确实无法确认的记 `未确认(登录墙后)`。

**阅读顺序建议**：赶时间就直接看 **Part D「跨国字段复用分析」**——那是决定"准备包能不能省力"的一节，Part A/B/C 是其取证底稿。

---

## Part A — AU 澳洲（Melbourne / UQ / UNSW / Adelaide）

调研日期：2026-08-14
字段表：`au-fields.tsv`（143 行，不含表头）
原始抓取：`scratchpad/au/txt/*.txt`（curl + html2text）、`scratchpad/au/.firecrawl/*.md`（firecrawl，用于 Squiz WAF 拦 curl 的 unimelb 域）

**取证方法说明**：unimelb.edu.au 对 curl 返回 403（WAF），该域用 firecrawl 抓；其余域用 curl + 自写 html2text（保留 `<input>/<select>` 属性，因此能拿到 `maxlength`、`required` 等原始约束）。所有 portal 页面**仅 GET 读取登录前公开页，未注册、未登录、未 POST、未填任何字段**。

---

## 1. 平台取证（必须从 apply 页本身取证，不得凭记忆）

### 结论：4 所学校只有 2 种平台，其中 3 所是同一个第三方系统

| 学校 | 平台 | 字面取证字符串 | 出处 URL |
|---|---|---|---|
| Melbourne | **TechnologyOne eStudent（T1 Cloud）** | `__VIEWSTATE` base64 解出 `T1.S1.Web.Presenters.eApplication.Ci2, Version=4.12.0.0`；页面 HTML 含 `t1cloud`(7次)、`T1SM`(18次)、`eStudent`(47次)；备用入口 host 为 `unimelb-web.t1cloud.com/T1SMDefault/WebApps/eStudent/...` | `https://prod.ss.unimelb.edu.au/student/SM/eApplications/eAppLogin.aspx?r=&f=%23UM.EAP.CI2LOGIN.WEB` |
| UQ | **StudyLink Connect（Flywire）** | 页面正文首行 `StudyLink.com uses cookies to offer you the best possible experience of our website.`；页脚 `Powered by Flywire`；HTML 含 `https://cloud.studylink.com`；URL 模式 `index.cfm?event=security.showLogin`（ColdFusion） | `https://apply.uq.edu.au/` |
| UNSW | **StudyLink Connect（Flywire）** | 页脚 `Powered by Flywire`；HTML 含 `studylink`(22次)、`https://cloud.studylink.com`；同样的 `index.cfm?event=security.showLogin` 重定向 | `https://apply.unsw.edu.au/` |
| Adelaide University | **StudyLink Connect（Flywire）** | host `student-adelaideuni.studylink.com`；URL 参数 `brand=ADELAIDEUNI&custInstID=ADELAIDEUNI`；页脚 `Powered by Flywire`；HTML 含 `studylink`(9次) | `https://student-adelaideuni.studylink.com/index.cfm?event=security.showLogin&brand=ADELAIDEUNI&custInstID=ADELAIDEUNI` |

**平台名的决定性证据**：agent 侧门户页面标题原文 `Log in to StudyLink Connect's Partner Portal`（`https://partner.studylink.com/`）。这是"StudyLink Connect"这个产品名的自称，不是外部推断。

**Flywire 关系**：StudyLink 已被 Flywire 收购，三校 portal 页脚统一显示 `Powered by Flywire`，注册表单里还有一个独立勾选项 `I have read, understand, and agree to the Flywire Terms of Use and Privacy Policy`——即申请人要同时同意学校条款和 Flywire（第三方支付/平台商）条款。

**同平台但不同集成**（不要抹平这个差异）：
- UQ / Adelaide：登录前可走 `index.cfm?event=registration.terms` → `index.cfm?event=registration.form&termsAccepted=1`，**注册表单公开可见**。
- UNSW：登录按钮指向 `/sso/saml.cfm`（SAML SSO），直接 GET registration.form 返回 `You may not register on this portal.`。但 UNSW 官方 FAQ 又写 "select 'Register Now' on the portal home page to create an account"——**两处说法不一致，未能解决**。

**范围限制**：只采样了 4 所。不能据此说"StudyLink 是澳洲标准"，只能说**本次采样的 4 所中有 3 所用 StudyLink Connect**。尝试用 curl 旁证 Monash / Sydney 失败（Monash 403，Sydney 页面未暴露 apply host），未做进一步验证。

---

## 2. 直申 vs 中介代申（agent）双轨制 —— 完整叙述

### 2.1 结构上确实是两套入口，不是一个表单里的一个字段

- **学生入口**：`apply.uq.edu.au` / `apply.unsw.edu.au` / `student-adelaideuni.studylink.com`
- **中介入口**：`https://partner.studylink.com/` — 标题 `Log in to StudyLink Connect's Partner Portal`，登录字段为 `Username *` / `Password *` / `Remember me`，并有 `Not a StudyLink Connect Recruitment Partner? Sign Up`。这是**跨校共用的中介端门户**（不是每校一套）。
- UQ 学生 portal 首页直接把两条路写在一起：`Registered agents and partners should submit applications through UQ's agent and partner portal`（链接指向 `https://partner.studylink.com`）。

Melbourne（非 StudyLink）走的是另一种模式：**学生自己在 eApplication 里申请，另交一份纸质/PDF 的授权表**，不是 agent 单独登录代填。

### 2.2 「是否通过 agent 申请」这个字段的真实形态

- **UQ / Adelaide**：登录前注册表单里**没有** "Are you applying through an agent?" 这种问句，也没有 agent code 输入框。取而代之的是一段**按国籍条件显示的拦截文案**：
  - UQ：`We currently require applicants from your country of citizenship to apply using a UQ-approved agent. You can find an agent near you at this web page. Contact your agent directly for them to start the application process for you.`
  - Adelaide：`Please note, we require applicants from your country of citizenship to apply through a recognised representative of Adelaide University. ... We look forward to receiving your application via your nominated Education Agent.`
  - **重要技术细节**：这段文案在 HTML 里对所有人都存在，由 JS 函数 `checkNationality()` 根据 `nationality` 下拉选择结果决定显示/隐藏。所以**不能说"所有人都看到"**，它是条件门（conditional gate）。TSV 中该行 `required` 记为 `条件必填(按国籍/地区)`。
  - UQ 官方页面另有一句：`our online application system will let you know if you need to do this`（`study.uq.edu.au/admissions/postgraduate-coursework/submit-your-application`）——印证这是系统内的动态判定。
- **Melbourne**：有明确的、可下载的公开 PDF 表单 `Education agent nomination and authorisation form`，字段结构完整可见（见 TSV 中 23 行）。核心字段：`Agent company name` / `Agent office (city)` / `Agent office (country)` / `Counsellor's name and email`。**公开表单中未见数字化的 agent code**，墨大用「机构名 + 城市 + 国家 + 顾问姓名邮箱」定位。
- **UNSW**：公开页未见任何 agent 字段。但 FAQ 有一条极重要的原文：`Can I authorise someone else to apply on my behalf? **No. You must personally complete the application to study at UNSW.** However, UNSW has recognised agents who may be able to help you with your application.`

### 2.3 强制走 agent 的国别名单（这是产品必须硬编码的规则）

| 学校 | 强制经 agent 的人群 | 原文出处 |
|---|---|---|
| Melbourne | **Pakistan**: All graduate degree applicants；**India**: Any international applicant who completed tertiary studies in India；**China**: 可二选一（走 agent 或走 CSSD/CHESICC 认证） | `https://study.unimelb.edu.au/how-to-apply/authorised-education-agent` |
| Adelaide | The Middle East / North Africa / Sub-Saharan Africa / South Asia (Bangladesh, India, Maldives, Nepal, Pakistan and Sri Lanka) / Philippines / Latin America | `https://adelaide.edu.au/study/international-students/how-to-apply/apply-now/` |
| UQ | `Applicants from certain countries must apply through an agent` — **具体国别名单未在公开页公布**，由注册表单按 citizenship 动态判定 | `https://study.uq.edu.au/admissions/postgraduate-coursework/submit-your-application` |
| UNSW | 申请环节未强制；但 **GS 环节**对 India/Pakistan（居本国）、非洲国家（南非除外，居非洲）有特殊表格与 agent 会签要求 | `https://www.unsw.edu.au/study/how-to-apply/international/gs-requirement` |

### 2.4 代申模式下的其他连带差异

- Melbourne：`If you have applied through one of our authorised education agents, certified academic results submitted by your agent will be accepted.`（agent 有认证文件的权限）
- Adelaide：`Official Adelaide University Education Agents have authority to sight original documents and provide certified, electronic copies when submitting the application.`
- UQ：`Transcripts can be certified by an approved UQ agent or other appropriate parties.`
- Adelaide 接受 offer：`If you applied through an Education Agent, all you need to do is give them permission to accept the offer on your behalf.`——**offer 接受动作也可以由 agent 代做**。
- UNSW：`If you are receiving assistance with your application, your nominated agent will also receive a copy of the email.`
- Melbourne 换 agent 会**重置账号**：`your login and password for eApplication will also be reset with new password being sent to your personal email address on this form.`

---

## 3. GS（Genuine Student，2024 年取代 GTE）—— 落在学校表单还是签证？

### 结论：**四校各不相同**。不能一概而论。这是澳洲最容易做错的地方。

| 学校 | GS 落点 | 是否学校申请表内字段 | 关键原文 |
|---|---|---|---|
| **Melbourne** | **学校在线申请表内，必填** | ✅ 是 | `The Genuine Student declaration form is a mandatory component of the online application for applicants applying from 16 July 2026. The form is provided within the online application portal and can be downloaded and completed during the application process.` + `International students will need to complete a Genuine Student declaration as part of their application.` |
| **UNSW** | **offer 之后**，且条件触发 | ❌ 不在申请表内 | `If you have received a full or conditional offer and have been notified that you need to complete a GS check, please take the following steps.` |
| **Adelaide** | **conditional offer 的一个 condition** | ❌ 不在申请表内 | 列在 "Conditions might include (but are not limited to): ... Satisfying our Genuine Student requirements." |
| **UQ** | 公开页面**只把 GS 指向签证**（Home Affairs），未见学校表单内 GS 字段 | ❌（公开页未见） | UQ 学生签证页 `Read about the Genuine Student (GS) requirement` 的链接直接指向 `https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/student-500/genuine-student-requirement` |

### 3.1 Melbourne 的 GS 字段形态（唯一能拿到具体字数上限的）

GS **declaration**（申请表内，必填）内容：`applicants must provide details about their immigration history, how they intend to fund their studies, and their reasons for applying to their chosen course.`

GS **statement**（offer 后被要求时才写）四个小问 + 硬性写作规则：
1. Provide details of your current circumstances, including ties to family, community, employment and your financial situation.
2. Explain why you want to study this course in Australia, and why you chose the University of Melbourne.
3. Explain how completing the course will benefit you.
4. Add any other relevant information you'd like us to consider.

规则原文：
- `Respond to each point above, using a heading for each response.`
- `Be written in English and in the first person.`
- `Include evidence and research to support your statements.`
- **`Not be AI-generated.`** ← 产品红线：墨大 GS statement 明文禁止 AI 生成
- **`Keep each response under 150 words.`**（超出可另传附件）

> **这是本次调研找到的唯一带明确字数上限的大块文本字段：每小问 < 150 words × 4。**

### 3.2 UNSW 的 GS 机制（最反直觉的一条）

UNSW 的 GS 表格**直申的人也必须经 agent 或 regional manager 会签**：

> `If you have an agent, send your declaration form to them to complete.`
> `**If you are applying direct, you'll need to send your declaration form to a registered UNSW agent or UNSW regional manager to complete.**`

Agent 侧要做的事（原文）：
> `Sight financial documents ... download a copy of the Genuine Student (GS) Declaration ... co-sign with the student, stamp with your agency stamp and upload it to the student's application via the StudyLink partner portal.` + `Conduct a face-to-face interview according to the Genuine Student requirement.`

两套表格按国籍/居住地分流：
- 通用：`Genuine Student (GS) Declaration`
- India/Pakistan（居本国）或非洲国家（南非除外，居非洲）：`Genuine Student (GS) Assessment and Financial Declaration`

**未确认**：这两个 PDF 表格内部的具体字段和字数上限（表单本身托管在 UNSW 站内但需在 GS 页交互下载，本次未取得 PDF 正文）。

---

## 4. CoE / OSHC / USI

| 项 | 结论 |
|---|---|
| **OSHC** | **只有 UQ 在申请阶段就要表态**。UQ 原文：`On your application, let us know if: ... you want to arrange your Overseas Student Health Cover through UQ.`（申请表内的意向勾选）；实际支付在接受 offer 阶段（`pay your Overseas Student Health Cover (if you're organising this through UQ)`）。**Adelaide / Melbourne / UNSW 的 OSHC 都在接受 offer 阶段**：Adelaide 原文 `You can purchase cover through Adelaide University's preferred provider in the Online Application System, or you [arrange it yourself]`。 |
| **CoE** | **四校一致：CoE 不是申请人填写的字段**，是学校在收到 acceptance + 首期学费 + OSHC 之后签发的文件，用于随后的 500 签证申请。Melbourne 另有 **Conditional CoE**（条件式 CoE）流程，可在满足全部 offer 条件前先推进签证。 |
| **USI（Unique Student Identifier）** | **四校的国际生申请页面上，`unique student identifier` 出现次数为 0**（跨全部抓取文件 grep 命中 0 条）。USI 是 VET / 澳洲本地 HELP 贷款体系的概念，**在本次采样的国际授课型硕士申请阶段没有出现**。⚠️ 措辞注意：这是「四校国际申请页面均未提及」的证据，**不等于**"登录后也一定没有"——登录后是否出现无法确认。 |

---

## 5. 文件上传规格（A）—— 逐校，含 certified copy 差异

**这是四校差异最大的一块，产品必须按校分支。**

### 5.1 单文件大小 / 格式

| 学校 | 接受格式 | 单文件上限 | 来源 |
|---|---|---|---|
| UNSW | `PDF, JPG or TIF` | **`maximum file size 10Mb`** | `https://my.unsw.edu.au/apply/doc_attachment_guidelines.html` |
| UQ | 建议 PDF：`Upload documents as PDFs to reduce their file size.`（**建议，非强制枚举**） | **未确认(登录墙后)** | `study.uq.edu.au/admissions/postgraduate-coursework/submit-your-application` |
| Melbourne | 未列举 | **未确认(登录墙后)** — 官方上传指引页只有界面步骤截图，无格式/MB 说明 | `study.unimelb.edu.au/how-to-apply/instructions-to-upload-documents` |
| Adelaide | 未列举，但要求 `clear scanned copies of the original certifications` | **未确认(登录墙后)** | `ask.adelaideuni.edu.au/app/answers/detail/a_id/4180` |

**命名要求**：四校公开页面**均未提及文件命名规则**。

### 5.2 certified copy / 公证 —— 四校政策直接冲突，务必分校处理

| 学校 | 是否要 certified copy | 原文 |
|---|---|---|
| **UNSW** | **明确不要（授课型）** | `We do not require documents to be formally certified in support of coursework applications for admission and enrolment in most cases` |
| **UQ** | **要** | `You must provide a certified copy of each transcript. Transcripts can be certified by an approved UQ agent or other appropriate parties.` |
| **Adelaide** | **要（最严格，有逐项规格）** | `you must provide Adelaide University with certified copies of your original documents` |
| **Melbourne** | 不用 certified，改为**校方自行向发证机构核验** | `The University will verify all results and documentation with the issuing institution upon receipt of your application.` （走 agent 的话 `certified academic results submitted by your agent will be accepted`） |

**Adelaide 的 certification 逐项规格（每一页都要满足全部 4 条，原文）**：
1. `an original stamp bearing the name of the person or organisation who verifies the document`
2. `words in English to the effect of "I certify that this is a true copy of the original"`
3. `an original signature`
4. `the date of certification`

**Adelaide 授权认证人清单（原文）**：Education Agent or representative of Adelaide University / Authorised staff member of Adelaide University / Justice of the Peace / Notary Public / Consular Official / Commissioner for taking Affidavits / Registrar or nominee of the university that the transcript or parchment is from / Police Officer / Examining authority。附带限制：`the person who certifies the documentation should not have a personal relationship with you (the applicant)`。

**豁免通道**：`Certified documents won't be required if the documents are provided to Adelaide University via a secure link generated in the My eQuals platform.`

### 5.3 中英文对照 / 翻译

| 学校 | 要求 |
|---|---|
| Melbourne | **最严格**：只接受 **NAATI** 认证的 Professional Translator；`Each page of the authorised translation must bear the translator's signature, the date translated and the translator's accreditation details and/or the official stamp or seal`；`Translations of official documents by the applicant are not accepted.`；原文件也要一并提交 |
| Adelaide | `If your documents are not in English, they must be officially translated and submitted with certified copies.`（原文 certified copy + 官方翻译件，翻译件也要 certified） |
| UNSW | `If you submit your documents in a language other than English, you will also need to send a complete English translation.` |
| UQ | 公开页未单独展开翻译规格 → **未确认** |

### 5.4 CHESICC / 学信网（CSSD）

| 学校 | 是否接受 | 说明 |
|---|---|---|
| **Melbourne** | ✅ **明确接受，且是中国学生的两条法定路径之一** | 通过 CSSD（原 CHESICC）经 **My eQuals** 投递三份报告：`Online Verification Report of Higher Education Qualification Certificate` + `Verification Report of China Higher Education Student's Academic Transcript` + `China Higher Education Degree Certificate Information/OR Online Verification Report of Higher Education Degree Certificate`。操作路径原文：登录 CHSI → `International Cooperative Application` → 选 University of Melbourne → 付费 → 在 `International Cooperation Agencies` 填 `My eQuals` → Deliver。**替代方案是走 authorised education agent 认证。** |
| **UQ** | ❌ 公开页未提 CHESICC/CSSD，只提 **My eQuals**（且限"此前在澳/新读书者"） | — |
| **Adelaide** | ❌ 公开页未提 CHESICC/CSSD，只提 My eQuals | — |
| **UNSW** | ❌ 未提 | — |

### 5.5 其他学历核验渠道（Melbourne 独有的多渠道下拉）

Melbourne 申请表内有一个 `how you would like to provide your transcript` 的选择，选项含：**My eQuals**（澳新）/ **Digitary VIA**（澳新以外国际，一次性收费）/ **Parchment**（美国，需填 `Parchment Delivery ID (DID)`）/ **National Student Clearinghouse**（美国备选）/ **Upload**（手动上传，处理慢）。My eQuals 分享链接必须设成 `Recipient: Open access` / `Access PIN: None` / `Expiry: Does not expire`。

---

## 6. 推荐信提交机制（B）—— 产品红线

### 6.1 核心结论：**澳洲授课型硕士主流不要推荐信**

这是本次调研第一等重要的产品发现。但**三种证据强度必须分清，不能混为一谈**：

| 学校 | 证据强度 | 具体表述 |
|---|---|---|
| **Melbourne** | 🟡 **负面证据**（checklist 未列） | 官方文件清单为：academic transcripts / grading scale / passport 彩色扫描 / English proficiency / `personal statements, portfolios or results from aptitude tests may also be required`。**通篇未出现 referee / reference / recommendation**。→ 只能说「官方 checklist 未列推荐信」，不能说「明确不要」。 |
| **Adelaide** | 🟡 **负面证据 + 一个非学术变体** | 文件清单未列学术推荐信；但列了 `Relevant work experience — certified references from your employer, if needed`（雇主出具的 certified reference，**由申请人上传**）。 |
| **UNSW** | 🟢 **正面证据（明确划界）** | `Research program applications have additional requirements, including the submission of contact details for up to two academic or professional referees.` → 推荐人是 **Research program** 的要求，**授课型不在其列**。 |
| **UQ** | 🔴 **矛盾信号，未解决** | 授课型硕士的文件清单**没有**推荐信；但 portal 功能列表里明确有 `provide referee details`（见 6.3）。 |

### 6.2 例外：UNSW AGSM MBA（授课型硕士，确实要推荐信）—— 完整机制

来源：`https://www.unsw.edu.au/business/our-schools/agsm/learn-with-us/agsm-programs/how-to-apply`

1. **要几封**：两封。`You need to arrange two referees to complete the AGSM referee report forms to support your application.`
2. **谁发给推荐人**：**申请人自己**。原文：`**All applicants should forward the referee report form to the two referees and upload the signed reports to their application.**`
3. **提交方式**：**学生上传**（不是系统发邀请）。→ **本次采样中没有发现任何系统自动发信给推荐人的机制。**
4. **哪个申请人动作触发发给推荐人的邀请邮件**：**不存在这样的动作**。整个流程是线下转发 PDF → 推荐人签名 → 申请人上传签名件。学校保留事后联系权：`AGSM reserves the right to contact referees.`
5. **推荐人邮箱是否必须机构邮箱**：**来源未提出此要求**（未确认）。只有身份限制：`Relatives or personal friends are not permitted to act as referees.`
6. **推荐人信息字段（原文）**：`Referee details: Name, Title, Organisation, Work phone, Email, Address`（6 个字段 / 人）
7. **推荐信内容要求（推荐人要回答的问题，原文）**：
   - How long, how well and in what capacity have you known the applicant?
   - What do you consider to be the applicant's management strengths?
   - What do you consider to be the applicant's areas of improvement?
   - How would you describe the applicant's creativity and problem-solving ability?
   - Please indicate to what level was English used in the applicant's position of employment (covering spoken, written, reading and listening skills)
   - Please make any other comments you feel would be useful to AGSM MBA Programs in considering this application
8. **提交前必须到位还是可后补**：来源未明说 → **未确认**。

### 6.3 ⚠️ 唯一可能存在「系统发信给推荐人」的地方 —— 必须标红

UQ 的 `Submit your application` 页在「提交后可在 portal 做什么」列表里写着：

> After you've submitted your application, you can log in to UQ applications to: track the status of your application / upload documentation / **provide referee details** / change your preferences / withdraw your application / accept, decline or defer an offer.

- 这说明 UQ 的 StudyLink portal **有一个结构化的 referee 数据录入功能**，而且发生在**提交之后**。
- **「填入推荐人邮箱后系统是否会自动发邀请邮件给推荐人」——无法从公开页面确认**（该功能在登录墙后）。
- **不要用 AGSM 的结论（申请人自行转发，无系统邀请）去覆盖这一条。** 这是本次采样中唯一有可能存在「AI 以推荐人名义发邀请」风险面的地方，产品设计前必须实地确认。

### 6.4 其他可能要推荐信的授课型项目（发现但未深挖）

搜索命中但未逐一取证：Melbourne `Master of Music Therapy`、`Master of Genetic Counselling`、`Doctor of Clinical Dentistry`（后者非 coursework master）。**未确认**其推荐信机制。

---

## 7. 其他跨校可复用发现

- **志愿数量**：UQ 3 个（1 + `up to 2 other preferences`）；UNSW 3 个（`up to three programs in your preferences`，且 `You can only submit one application at a time`）；Melbourne **两页数字冲突**——国际研究生课程页写 `You can apply for up to 3 courses in a single application`，通用在线申请页写 `You can include up to four preferences`。**未解决，已在 TSV limit 列注明冲突。**
- **申请费**：Melbourne AUD $154；UQ A$150；UNSW AUD $150（仅信用卡）；Adelaide AUD $150。**四校都收，且都不可退。**
- **UQ 姓名字段的 limit 冲突**：`Given name` / `Family name` 的 HTML 属性是 `maxlength="50"`，但字段下方帮助文字写 `Maximum 30 characters.` → TSV 中以帮助文字为准并注明冲突。
- **表单体量**：UNSW 官方称 `Most applications take approximately 15 minutes to complete.` → 澳洲授课型硕士申请表**比美国短得多**，这与"不要推荐信、不要长文书"是一致的。
- **UQ 部分项目走 QTAC（不走学校 portal）**：Diploma in Arts (Graduate Entry) / Diploma in Science (Graduate Entry) / Master of Nursing (Graduate Entry) / **Master of Social Work (Qualifying)** / **Master of Teaching (Primary)** / **Master of Teaching (Secondary)**。这几个是授课型硕士但入口完全不同（Queensland Tertiary Admissions Centre）。
- **Melbourne 印度/巴基斯坦学历的额外要求**：印度需 `individual marksheets for each semester`；若只有 consolidated transcript，须院校另出声明说明无挂科、无扣分。

---

## 8. 明确「无法从公开页面确认」的清单

按重要性排序：

1. 🔴 **UQ portal 的 `provide referee details` 是否会向推荐人发送系统邮件**，以及该功能的字段结构、是否必填、几位推荐人。（登录墙后）— **产品红线相关，优先级最高**
2. 🔴 **四校主申请表（登录后）的完整字段列表**。本次只拿到 UQ / Adelaide 的**注册（registration）表单**——那是登录前的约 12 个字段的开户表，**不是申请表**。课程志愿、学历履历、文件上传、agent 归属、OSHC 勾选等全部在登录墙后。
3. 🟠 **UQ / Melbourne / Adelaide 的单文件大小上限与接受格式**。只有 UNSW 公开了（PDF/JPG/TIF，10Mb）。
4. 🟠 **四校的文件命名要求**——公开页面全部未提及。
5. 🟠 **UNSW 两份 GS 声明表（`Genuine Student (GS) Declaration`、`Genuine Student (GS) Assessment and Financial Declaration`）的表内字段与字数上限**。
6. 🟠 **UQ 强制走 agent 的具体国别名单**——UQ 只说"certain countries"，由系统按 citizenship 动态判定，未公布名单。
7. 🟡 **UQ 是否在学校申请表里问 GS**。公开页只把 GS 指向 Home Affairs 签证，但不能排除登录后表单内有 GS 问题。
8. 🟡 **USI 在登录后是否出现**。四校国际申请公开页 0 命中，但登录后无法确认。
9. 🟡 **UNSW 注册入口的真实形态**。portal 返回 `You may not register on this portal.`（走 `/sso/saml.cfm`），但官方 FAQ 说首页有 `Register Now`——两处矛盾未解决。
10. 🟡 **AGSM MBA 推荐信是否必须在提交前到位**（可否后补），来源未说明。
11. 🟡 **Melbourne 志愿数量到底是 3 还是 4**（两个官方页面互相矛盾）。
12. 🟡 **UQ 的翻译件规格**（是否要求特定认证机构），公开页未展开。
13. ⚪ **Monash / Sydney 的平台**——尝试用 curl 旁证失败，本次未验证，因此不能把"StudyLink 是澳洲标准"作为结论。

---

## 9. 来源 URL 汇总

**Melbourne**
- https://study.unimelb.edu.au/how-to-apply/your-online-application
- https://study.unimelb.edu.au/how-to-apply/genuine-student-requirement
- https://study.unimelb.edu.au/how-to-apply/authorised-education-agent
- https://study.unimelb.edu.au/how-to-apply/graduate-coursework-study/international-applications/applications
- https://study.unimelb.edu.au/how-to-apply/instructions-to-upload-documents
- https://study.unimelb.edu.au/__data/assets/pdf_file/0019/47071/Education-agent-nomination-form.pdf
- https://prod.ss.unimelb.edu.au/student/SM/eApplications/eAppLogin.aspx?r=&f=%23UM.EAP.CI2LOGIN.WEB

**UQ**
- https://study.uq.edu.au/admissions/postgraduate-coursework/submit-your-application
- https://study.uq.edu.au/admissions/postgraduate-coursework/respond-your-offer
- https://study.uq.edu.au/contact/find-approved-uq-agent-near-you
- https://study.uq.edu.au/university-life/getting-prepared-to-come-to-australia/student-visas
- https://study.uq.edu.au/sites/default/files/2023-05/international-guide-undergraduate-postgraduate.pdf
- https://apply.uq.edu.au/ ；https://apply.uq.edu.au/index.cfm?event=registration.form&termsAccepted=1

**UNSW**
- https://www.unsw.edu.au/study/how-to-apply/international
- https://www.unsw.edu.au/study/how-to-apply/apply-online-faqs
- https://www.unsw.edu.au/study/how-to-apply/international/gs-requirement
- https://www.unsw.edu.au/study/international-students/admissions-info
- https://www.unsw.edu.au/business/our-schools/agsm/learn-with-us/agsm-programs/how-to-apply
- https://my.unsw.edu.au/apply/doc_attachment_guidelines.html
- https://apply.unsw.edu.au/

**Adelaide University**
- https://adelaide.edu.au/study/international-students/how-to-apply/
- https://adelaide.edu.au/study/international-students/how-to-apply/apply-now/
- https://adelaide.edu.au/study/international-students/how-to-apply/accepting-your-offer/
- https://ask.adelaideuni.edu.au/app/answers/detail/a_id/4180
- https://student-adelaideuni.studylink.com/index.cfm?event=security.showLogin&brand=ADELAIDEUNI&custInstID=ADELAIDEUNI

**平台 / 政府**
- https://partner.studylink.com/
- https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/student-500/genuine-student-requirement
- https://immi.homeaffairs.gov.au/help-support/applying-online-or-on-paper/on-paper/certified-copy

---

## Part B — UK 英国

**平台栈来源说明**：四校平台结论来自同 issue 的另一份调研 `docs/research/uk-apply-timeline-deposit.md`（分支 `research/country-delta`）——UCL = Tribal SITS:Vision (Portico) + Flywire｜Manchester = Oracle PeopleSoft｜Leeds = Microsoft Power Apps / Dynamics 365｜Coventry = Salesforce Experience Cloud + Convera。本节**只对亲自 GET 过的页面写字面取证串**，其余直接引用该文件的结论，不复述我未亲眼见过的证据。

### B.0 英国与澳洲最大的结构差异：登录前没有表单可看

澳洲 StudyLink Connect（UQ / Adelaide）可以公开 GET 到完整的注册表单，因此 AU 部分能拿到真实的 `maxlength` / `required` 属性。**英国四校没有一所能做到这一点。** UCL 的 Portico 登录页只暴露两个可见输入框，页面上没有任何 Register / Create account 链接；Leeds 是 Power Apps SPA、Coventry 是 Salesforce Lightning、Manchester 是 PeopleSoft 登录墙。

**产品含义**：英国这边的字段约束基本只能来自官方 how-to-apply 页与 checklist，**因此 TSV 中英国行的 `limit` 列大量是 `未确认(登录墙后)`——这是取证边界，不是漏查**。任何「自动填表 / portal 状态抓取」功能在英国都拿不到登录前的字段契约。

---

### B.1 UCL（Tribal SITS:Vision / Portico）

**平台取证（本次亲自 GET）**

| 项 | 字面取证串 | 出处 |
|---|---|---|
| 页面标题 | `<title>IPP login screen</title>`（IPP = SITS 的 Institution Postgraduate Portal 模块） | `https://evision.ucl.ac.uk/urd/sits.urd/run/siw_ipp_lgn.login` |
| URL 路径 | `/urd/sits.urd/run/siw_ipp_lgn.login` —— `sits.urd` + `siw_` 前缀是 SITS:Vision 的标志性路径 | 同上 |
| 表单字段命名法 | `MUA_CODE.DUMMY.MENSYS.1`（MUA = SITS 用户账号表）、`SURNAME.TAB_DUMMY.CAMS.1`、`FORENAME.TAB_DUMMY.CAMS.1`、`IPP_CODE.IPP.SRS.1`——`表列.表名.模块.序号` 是 SITS 独有的命名约定 | 同上 HTML |
| 品牌串 | HTML 内含 `SITS`、`e:Vision`、`tribal` | 同上 |

**⚠️ 推荐信机制 —— 产品红线，UCL 是本次调研中最明确的一例**

完整链路（全部来自 `selecting-your-references` 官方页原文）：

1. 学生在申请表 references 区填推荐人信息，**必须用院校/机构邮箱**（原文举例 `john.smith@university.ac.uk` 而非 `johnsmith@hotmail.com`），用私人邮箱会拖慢审理。
2. **`When you submit your application, your referee(s) will automatically be sent an email asking them to write a reference for you and submit it using a reference portal link.`**
   → 触发时点是**提交申请那一刻**，自动发出，不是手动点"发送"、也不是保存即发。
3. **学生自己上传推荐信被明确禁止**：`Please do not email any references as we cannot accept references from applicants.` 推荐信只能由推荐人经 reference portal link 提交。
4. 提交后（如需付费则付费后）学生才拿到 applicant portal，可以查状态、重发请求、换推荐人。**在此之前招生办不代为重发或改推荐人邮箱。**
5. 自 12 月 8 日起，reference portal link 有效期 **30 个自然日**；过期须由学生自行重发，重发后再给 30 天，可无限次重发直至 reference deadline（课程关闭后第 10 个工作日 17:00 UK time）。

> 🔴 **红线判定**：UCL 的 `referee_1_email` 是一个「填入 + 提交 = 系统以申请人名义向第三方发信」的字段。AI 绝不能代填推荐人邮箱并触发提交。这不是「推荐信正文由谁写」的问题，而是**发信动作本身的授权归属**问题——即使推荐人真实存在、即使学生口头同意过，触发方也必须是学生本人。
> 顺带一个可用的产品设计点：UCL 官方自己反复强调 `contact your nominated referee(s) before starting your application`，产品可以把「已确认推荐人愿意写」做成提交前的人工确认闸口。

**文件上传规格（UCL 是本次英国部分唯一给出硬指标的）**

- **`Files must be less than 5MB. Allowed file types: .pdf (preferred), .docx, .jpeg, or .jpg.`**
- **不得加密或设密码**：`Do not password-protect or encrypt files. Admissions selectors will not be able to access them.`（这条在 how-to-apply 页与 transcript 页各出现一次，措辞一致）
- **翻译件必须分两个文件**：`you will be asked to upload English language and original language transcripts as two separate documents` —— 不可把原件和译文合成一个 PDF。
- **不得自行翻译**：`prepared by your institution or a registered translator. You must not translate the documents yourself.`
- **公开页未提及文件命名规则**（记为未确认）。
- **认证件（certified copy）**：UCL 公开页**未要求**申请阶段提交 certified copy，与澳洲部分校形成对比。

**中国大陆学历的专属分支**（产品必须硬编码）
- 需 毕业证 + **成绩证明**（官方页直接用中文写出「成绩证明」四字），且须载明 overall percentage average、**issued on or after the date of graduation**。
- 在读生：上传成绩证明 + 经院校签字盖章的英文翻译，**可合并为一个文件**传到 Education 页的 additional documents 区。
- 已毕业者：不需要另传成绩证明。
- 若院校不出具成绩证明，UCL 会自行按 transcript 推算加权平均。

**个人陈述的双上限（典型的「约束层不可复用」样本）**
- 表内直接输入：**3,000 字符（含空格）**
- 改为上传文件：可超过 3,000 字符，但 **不得超过 two sides of A4，12 号字，单倍行距**
- → 同一份内容，两种完全不同计量单位的上限（字符数 vs 版面页数）。准备包若只存「一份 3000 字符的 PS」，换成上传通道就浪费了额度；只存两页 A4 版，又填不进表内框。

**其他 UCL 特有约束**
- **一个 academic cycle 最多申请 2 个授课型硕士课程。**
- **提交后只能改**：name / contact details / referees' details / passport details（需签证者）。**`you cannot replace or add additional documents once you have submitted your application`** —— 文件一次定生死，这对「AI 辅助准备包」的价值判断是正面的（提交前把文件备齐的收益极高）。
- 申请费：标准 **£90**；Slade School of Fine Art 全部课程 **£35**；Business Analytics (with Management Science) MSc / Finance MSc / Management MSc **£160**。均不可退，含申请失败情形。
- 英语成绩**可后补**：`If you cannot provide this evidence when you submit your application, your application will still be considered.`
- Portfolio 类课程：**不要在申请时上传**——`should only be provided once requested by the Faculty of the Built Environment`。
- 部分课程要 GRE，UCL institution code **3344**，quantitative ≥ 162。

---

### B.2 University of Manchester（Oracle PeopleSoft Campus Solutions）

**平台取证（本次亲自 GET）**

| 项 | 字面取证串 | 出处 |
|---|---|---|
| 版权声明 | `Copyright © 2000, 2025, Oracle and/or its affiliates.`（另有 `Copyright (C) 1988, 2025, Oracle` 与 2013 版各一处） | `https://pgapplication.manchester.ac.uk/psc/apply/EMPLOYEE/SA/c/CIBAA_MNU.UMOAA_LOGIN_CMP.GBL` |
| 产品名 | HTML 内 `PeopleSoft` 出现 4 次 | 同上 |
| URL 结构 | `/psc/apply/EMPLOYEE/SA/c/CIBAA_MNU.UMOAA_LOGIN_CMP.GBL`、`/psp/apply/` —— PeopleSoft 的 psc/psp portal servlet 路径 | 同上 |
| 登录墙形态 | 直接 GET 组件 URL 被重定向到 `/psc/apply/?cmd=login&errorPg=ckreq&languageCd=ENG`，返回页 `<title>An error has occurred.</title>`，**无任何可见输入框、无 Register 链接** | 同上 |

**⚠️ 曼大最重要的结构性发现：不存在「曼大的申请材料清单」**

同一所学校，三份官方页面对推荐信/个人陈述的要求互相冲突：

| 来源 | 推荐信 | 个人陈述 |
|---|---|---|
| **AMBS**（商学院 supporting documents 页） | 申请时**不要**，初审后校方可能来函索取 | **要** statement of purpose，不超过一页 |
| **MSc Advanced Computer Science**（课程页） | **不要** | **不要**（原文 `References and personal statements are not required for your application to this programme.`） |
| **CS 系** how-to-apply 页 | 全日制 MSc **要 2 封学术推荐信**；modular 且毕业满 2 年可用 1 封 industrial reference | 未提；modular 路径要 `statement of aims`（约半页 A4） |

**这三处口径无法调和，本次未能解决。** 产品含义很硬：**曼大不能按「学校」建材料库，必须按「学校 × 院系（甚至 × 课程）」建库**。任何"曼大要什么材料"的单一答案都是错的。

**⚠️ 推荐信机制 —— 与 UCL 恰好相反的两个方向**

1. **AMBS 是校方发信给学生**：`we may contact you to request an academic reference so please keep a lookout for a reference request email` —— reference request email 的**收件人是申请人本人**，不是推荐人。这条路径上**不存在**「系统以申请人名义给推荐人发信」的动作，因此不触发 UCL 那条红线。
2. **CS 系允许推荐信另行邮寄**：`references can be emailed separately if preferred`。
   → 对照 UCL：`Please do not email any references as we cannot accept references from applicants.`
   **两校政策直接相反。** 这条差异必须逐校硬编码，跨校套用会直接导致材料被拒收或流程走错。

**文件上传规格 —— 曼大给的是「行为规格」而非「技术规格」**

- 单文件大小上限、允许格式：**公开页完全未给**（记未确认）。这点比 UCL 差。
- 但曼大给了三条别校没有的**上传行为规则**：
  1. `Each supporting document should be uploaded separately and not combined into one document.` —— 禁止合并 PDF。
  2. 🌟 `You should also provide a relevant title for each document which clearly states what that file contains.` —— **本次三国八校调研中唯一明文提出文件命名/标题要求的学校。**
  3. `Please also refrain from uploading any irrelevant documents not requested below.` —— 禁止塞无关材料。
- **一处自相矛盾的例外**：英语豁免证明（visa/CAS/BRP/院校信）明确允许 `uploaded within the same file as your CV`，与上面第 1 条「每份分开传」并存。
- **认证件**：申请阶段**明确不要原件**——`You do not need to send original copies of your degree certificate and transcripts during the application process`，录取后 9 月注册时才带原件。与澳洲部分校要求申请阶段即交 certified copy 相反。
- **提交后可以补件**：走邮箱 `pgadmissions.ambs@manchester.ac.uk`，须写明 ID number。⚠️ 与 UCL「提交后不得替换或补传任何文件」相反。

**申请费（英国三校里规则最细的）**
- **£60，只对 8 门商学院课程收**：MSc Accounting／Accounting and Finance／Business Analytics and AI／Digital Marketing／Finance／International Business and Management／Marketing／Management。未列入的课程**不收费**。
- 必须**在 portal 内先付才能提交**（`You can't submit your application without paying the application fee`），不接受银行转账，**每门课各付一次**。
- **免申请费**：已申请 Chevening／印尼 LPDP，或符合 Manchester Master's Bursary Scheme，但须交奖学金申请证明。

**中介（agent）政策 —— 又一处与澳洲相反**
- 曼大**允许中介代为提交申请**，且代申时**申请费由中介支付**，校方不给学生单独的付款链接。
- 对照 UNSW：`No. You must personally complete the application to study at UNSW.`
- 英国这边**未见**澳洲那种「按国籍强制走中介」的门槛。

**其他**
- 自费国际生须先付 **£2,500 学费押金**才签发 CAS（部分申请人更高）。
- 英语成绩**不可后补**：`We will not make a decision on your application until you submit evidence of your English language ability.` ⚠️ 与 UCL 的「缺英语成绩仍会被审理」相反。
- 课程特有件：finance 类在读生须交 **Final Year Modules** 清单；境外院校学历须交 **University Grading Scale**；MSc Organisational Psychology 须交 **BPS GBC** 资格证明。

---

### B.3 University of Leeds（Microsoft Power Apps Portal / Dynamics 365）

**平台取证（本次亲自 GET）**

| 项 | 字面取证串 | 出处 |
|---|---|---|
| Power Pages 运行时 | `Microsoft.PowerPages.onPagesClientApiReady`、`Microsoft.Dynamic365.Portal.onPagesClientApiReady` | `https://myleedsportal.leeds.ac.uk/signin-landing/?courseId=MSC-ACS-FT&year=2026%2F27` |
| 资源域 | `content.powerapps.com/resource/powerappsportal/dist/pwa-style.bundle-*.css` | 同上 |
| 分析组件 | `Dynamics365PortalAnalytics`（3 次） | 同上 |
| 登录 | `b2clogin.com`（Azure AD B2C） | 同上 |
| 登录墙形态 | 页面为 SPA 外壳，**无任何可见 text/password 输入框** | 同上 |

**一个 AU/US 都没有的结构细节**：Leeds 的登录前 deep link 已经带上 `courseId=MSC-ACS-FT&year=2026/27`。即**课程选择发生在进入表单之前，由入口链接决定**，不是表单内的一个下拉。澳洲那种"一张表里填 1–3 个志愿"的结构在 Leeds 不成立。

**⚠️ 推荐信机制 —— 第三种，与前两校都不同**

> `If you are required to supply referee details, the admissions team will only contact your referees if they need to see a reference in order to make a decision on your application.`

**填了推荐人信息也不必然发信**：只有招生团队认为需要看推荐信才**人工**联系推荐人。至此三所英国学校三种机制：

| 学校 | 谁发信 | 何时发 | 学生能否自己交推荐信 |
|---|---|---|---|
| **UCL** | 系统 → **推荐人** | **提交申请那一刻自动发** | ❌ 明文禁止 |
| **Manchester (AMBS)** | 校方 → **申请人** | 初审之后，视需要 | ✅（学生收到请求后自行取得） |
| **Manchester (CS 系)** | — | — | ✅ `references can be emailed separately if preferred` |
| **Leeds** | 招生团队 → **推荐人**，**人工** | 仅当需要看推荐信才联系 | 未确认 |

> 🔴 **红线的正确表述**：不是"凡填推荐人邮箱都危险"，而是**只有 UCL 这类 on-submit 自动发信的系统，才会把「AI 代填 + 代提交」变成「AI 以申请人名义给第三方发信」**。产品必须**逐校记录 `referee_invite_trigger`**，把 UCL 型的学校标成需要人工确认闸口；对 Leeds/曼大型的学校，风险点则落在别处（学生自己转交推荐信时的真实性）。

**其他 Leeds 细节**
- 推荐人可用 professional 的门槛是**离开教育满 5 年**（UCL 是 4 年）——同一个概念，不同数字，典型的"约束层不可复用"。
- 是否接受某份推荐信由**相关 academic school 自行裁量**。

**🌟 文件上传：本次八校中最细的扫描规格（来自 EPS 学部）**

- `All academic documentation should be scans of the originals, not photographs.` —— **不接受拍照**。
- `The scans should be complete and of a good quality, showing the 4 corners of all pages of the original document.` —— **必须拍到每页四个角**。
- `Please do not merge separate qualifications together.` —— 不同学历不得合并成一个文件。
- `Please do not upload academic documents to the funding section as we cannot access these.` —— **传错上传区等于没交**（portal 内不同区权限不同）。
- 补件必须走 portal 内的 **enquiry 或 condition response** 通道，系统才会自动挂到对应申请。
- 警告：`incomplete applications may not be continued if we feel that ... insufficient effort was made in submitting the application` —— 材料质量本身会影响是否继续审理。
- **单文件大小与允许格式：公开页未给**（英国三校只有 UCL 给了 5MB / .pdf .docx .jpeg .jpg）。

**🌟 草稿存活期 200 天**

> `You can save your application at any point. However, your application will be deleted after 200 days if it is not submitted.`

本次八校中**唯一**公开草稿存活期的学校。对「AI 帮学生长期托管未提交草稿」是一条硬约束。

**Leeds 校内两级口径也不一致**（同曼大）
- 大学层面：CV 属"may also need to provide"（按课程）；EPS 学部把 CV/Resume 列入 **MUST include** 必交清单。
- 大学层面：references 按课程可能要 2 位；EPS 把 References 归入 **Documents which are not required**，只在边缘案例与 **MSc Mathematics** 才要。
- 个人陈述：EPS 明写 **not required as standard**，但给了上限 **no more than one side of A4**。

**英国特有件：previous immigration documents**
需 Student visa 且**此前持英国学签就读过**者，须交 Visa / **Share code** / BRP / CAS。澳美两国都没有这一类字段。

**中国学历会命中的一条**：`details of the qualification used to gain entry into that later year` —— 非从第 1 年入读现学位者（专升本、3+1 等），须另附当初入读所凭资格的成绩单与证书。

**其他**
- 未提交草稿外，另一条时点差异：**unspent criminal conviction 通常在接受 offer 时才申报，少数课程在申请时即须申报**——同一字段在不同课程落在不同流程阶段。
- 申请费：公开的五步流程中**未出现**申请费环节，记为未确认（不等于不收）。
- 国际申请人：Leeds **主动建议**使用 overseas representatives（中介），并另设 agent 专页，但未见按国籍强制。

---

---

## Part C — US 美国

### C.0 美国与英澳的三个结构性差异（先看这个）

1. **注册表极短，但申请表极长。** Slate 的 Register Account 只有 4 个字段（邮箱／名／姓／出生日期），比澳洲 StudyLink 的 ~12 个字段还少；但登录后的申请表要 3 封推荐信、个人陈述、简历、逐校成绩单、自报分数——材料量远超英澳授课型硕士。
2. **推荐信是硬性起步，不是可选项。** 澳洲授课型硕士主流**不要**推荐信，英国三校**按课程可能要 0–2 封**，Columbia SEAS 是**固定 3 封**。这是三国间最大的材料量差异，也是产品红线密度最高的地方。
3. **中介政策与英国相反。** 曼大允许中介代交（且由中介付费）、Leeds 主动建议用海外代表；Columbia **明文禁止**经中介或第三方递交。

---

### C.1 Columbia Engineering (SEAS)（Slate / Technolutions）

**平台取证（本次亲自读取已抓取的 register 页原始 HTML）**

| 项 | 字面取证串 | 出处 |
|---|---|---|
| 平台 CDN | `//apply-engineering-columbia-edu.cdn.technolutions.net/favicon.ico`、`//slate-technolutions-net.cdn.technolutions.net/shared/base.css` | `https://apply.engineering.columbia.edu/register` |
| 出现次数 | HTML 内 `technolutions` 12 次、`slate` 3 次 | 同上 |
| 表单标识 | `<title>Register Account</title>`、`<form method="post" id="register_form" data-fw-form="1">` | 同上 |

**🌟 美国这边唯一拿到真实 HTML 约束的表单**（其余美国字段同英国一样只能来自官方指引页）：

| 字段 | HTML 约束 |
|---|---|
| Email Address | `maxlength="64"`、`data-validate="{ required: true, format: 'email' }"` |
| First Name | `maxlength="64"`、`required: true` |
| Last Name | `maxlength="64"`、`required: true` |
| Birthdate | 拆成 `birthdate_m` / `birthdate_d` / `birthdate_y` 三个 `<select>`，共用一条 required 校验 |

整张注册表**只有这 4 项**——没有国籍、**没有密码**（Slate 走邮件确认链接建号）。注意**出生日期在注册阶段就收集**，澳洲 StudyLink 是登录后才问。

**🔴 推荐信 —— 本次三国八校中最强的一条禁令**

逐字原文（`application-requirements` 页 Letters of Recommendation 节）：

> `Upon entering your recommendation providers' contact information in your application, your recommendation providers will be contacted to supply the letter of recommendation.`
> **`Under no circumstance should you write any portion of the evaluation, nor have any involvement in its drafting or submission.`**

两句都必须逐字对待：

1. **发信触发点比 UCL 更早。** 字面是"**填入**推荐人联系方式即联系推荐人"（on-entry），而 UCL 明确是"**提交申请那一刻**"（on-submit）。但公开页**没有明说是保存即发还是提交后发**——**记为未确认，不得假定为 on-submit**。产品在 Columbia 上必须按"填入即可能已经发信"来设计防护，这是更保守也更安全的假设。
2. **禁令的范围比"别代写"宽得多。** 不只是禁止代写评价的"任何部分"，连 **参与起草（drafting）** 与 **参与提交（submission）** 都禁止。这意味着：
   - AI 代写推荐信 → 违规；
   - AI 帮推荐人润色 → 落在 `involvement in its drafting` 里，违规；
   - AI 代推荐人点提交 → 落在 `involvement in ... submission` 里，违规。
   违规后果适用 academic integrity 条款：`denial or revocation of admission, cancellation of academic credit, suspension, expulsion, or eventual revocation of degree`。

**配套的机制细节**
- 推荐人须用 **professional email address**。
- **不接受 Interfolio 或任何第三方代递服务**，不接受纸质信函（`References sent this way will not be reviewed`）。`Letters of recommendation must be submitted by your reference provider directly.`
- **推荐信不阻塞提交**：`References can be added to your submitted application after the priority deadline, if necessary`，推荐人可在申请提交后把信直接加到申请里。

**⚠️ 第二个"第三方邮箱"字段（容易被漏掉）**
Publications 一项要求：上传论文副本 + 描述本人贡献 + **提供一位可证实其参与的教授或导师的邮箱**。是否触发系统发信**未确认**，但性质上与推荐人邮箱同属红线邻域，产品应一并纳入"AI 不得代填的第三方联系人"字段类。

**文件上传 —— 美国给的是「内容规格」，不是「技术规格」**
- **单文件大小上限与允许格式：公开页完全未给**（未确认）。对照 UCL 的 5MB/.pdf/.docx/.jpeg/.jpg，美国这边反而更含糊。
- 但给了别处没有的**排版规格**（个人陈述）：四边页边距 ≥1 inch 且左右相等、双倍行距、10pt Arial 或 12pt Times New Roman（任何清晰的标准衬线/无衬线字体皆可，禁用手写体花体）、**姓名须出现在每页页眉或页脚**。
- 成绩单：可传 official transcript 复印件或 **student copy**，但 🌟 **明文禁止上传网页学生端截图**（`We ask that you not upload screenshots of your online student portal`）。
- **官方成绩单在录取并接受 offer 之后才寄**，且 `Do not have your institution send us transcripts prior to this`。若院校无法经安全加密系统电子发送，须改由 **WES** 出 Course-by-Course Evaluation + International Credential Advantage Package 直发 `finaldocs@columbia.edu`。
- 翻译件：`must be conducted by a reputable service provider`——措辞比 UCL（禁止本人翻译）松，未给认证机构名录。

**个人陈述的第四种上限形态**
建议 **250–1,000 词**，但 **超出不受负面影响**（`Your application will not be negatively impacted should you exceed this recommendation`），并明说不必来函申请超字数许可。
→ 至此四种完全不同的上限：UCL **3,000 字符 / 两页 A4**、曼大 AMBS **一页**、曼大 CS **半页 A4**、Leeds EPS **一面 A4**、Columbia **250–1000 词且软性**。**没有任何两校可以共用同一份成品。**

**其他 Columbia 特有约束**
- 🌟 **每学期只能申请 SEAS 的一个项目**（含 Columbia Video Network）。违规可能导致申请作废且多付的费用不退，并明文禁止 `Do not create a new application account in order to circumvent this policy`。对照澳洲：UQ/UNSW 一份申请里可填 3 个志愿。
- **Video Interview 是 MS 申请的强制项**，但**只有提交且付费之后**才在 Status Portal 开放：3 道随机行为题，每题 90 秒思考、三题合计 3 分钟录制，官方说无需事先准备；**VPN 可能导致提交失败**。
- 分数**自报 + 上传成绩单副本**，逐科填分并附百分位；🌟 **禁止 superscoring**；录取后才由 ETS 直发官方分（code 2111）。有效期须覆盖到入学首学期：GRE 5 年，TOEFL/IELTS/Duolingo 2 年。
- GRE 在 2026 申请季**不要求**，交与不交都不影响评审。
- 英语豁免国名单：澳、加、加纳、爱尔兰、肯尼亚、新西兰、尼日利亚、新加坡、英、美（本科或硕士学位来自这十国即豁免）。中国大陆被明确点名须交。
- 申请费 **$85**，不可退，仅主要信用卡在线支付。
- 须**声明所交全部信息与文件真实准确**，并可能被要求配合核验。
- **全线上提交，无任何例外**：`No exceptions are made to the requirement.`

---

### C.2 Cornell（Graduate School + CS MEng）（ApplyWeb / CollegeNET）

**平台取证（间接，如实标注）**
康奈尔官方 FAQ 内逐字出现 `ApplyWeb portal`、`ApplyWeb account`、`ApplyWeb (CollegeNet)`，并把推荐人求助指向 `applyweb.collegenet.support`；申请入口 URL 形如 `w.applyweb.com/cgi-bin/app?s=cornellg`。
⚠️ 本次直接 GET `w.applyweb.com/public/account?s=cornellg` **连接失败（HTTP 000）**，`gradschool.cornell.edu` 的 recommendations 页也被 Cloudflare 挡回 **403**（`Enable JavaScript and cookies to continue`）。因此 Cornell 的平台名取证来自**康奈尔自己的官方页面**，不是我亲自读到的 portal HTML。本节所有字段同理，来源均为官方指引页。

**🌟 文件上传规格 —— 美国部分最完整的一份，且与英国规则直接冲突**

| 项 | Cornell | 对照 |
|---|---|---|
| 格式 | **PDF / TIFF / JPEG / GIF** | UCL：.pdf/.docx/.jpeg/.jpg（Cornell 不收 docx，但收 TIFF/GIF） |
| 单文件上限 | **10MB** | UCL 5MB；曼大、Leeds、Columbia 均未公开 |
| 多页处理 | 🔴 **要求合并**：`Combine multiple pages from the same transcript into one file` | 🔴 曼大：`should be uploaded separately and not combined`；Leeds：`do not merge separate qualifications together` |

**这是本次调研中最尖锐的一处跨校冲突**：同一份"多页成绩单"，Cornell 要求合并成一个文件，曼大和 Leeds 要求分开。**一份准备好的 PDF 不可能同时满足两边**——这正是"约束层不可复用"最硬的证据。

**另外三条 Cornell 独有的上传规则**
- 🌟 **隐私脱敏**：`Do not upload transcripts that include a U.S. Social Security Number (SSN). Redact, cross out, or cover your SSN, if applicable, before scanning.` —— 八校中唯一的脱敏要求。
- 🌟 **加密文件必失败**：系统不接受也无法正确显示加密/带密码文件，**官方电子成绩单必须先打印、再扫描后上传**。学生"把学校发来的加密 PDF 直接转上去"必然出错。
- 翻译件要求到 **certified or notarized** 一级（UCL 只要 registered translator，Columbia 只要 reputable service provider）。

**⚠️ 推荐信 —— 八校中机制细节最丰富的一所，且出现三个别处没有的字段**

基本机制：
> `Students must submit the names and contact information for their references directly on the application. These faculty receive an email with a link to an online form to complete the reference. Referees can upload or type directly into the text box provided.`

系统给推荐人发含链接的邮件，推荐人可上传文件**或直接在文本框里打字**。
⚠️ **发信时点公开页未写明**（保存推荐人信息时？还是提交申请时？）——**记未确认**，不套用 UCL 的 on-submit 结论。

**三个别处没有的字段：**

1. 🌟 **FERPA `waive access` 勾选框**（美国特有）
   > `You can waive your right to inspect your recommendations by checking "waive access" below each recommender's address and before you submit the request.`
   勾选 = 放弃入学后查阅推荐信的权利，并让推荐人知道申请人不会看信、让评审委员会知道这是坦率的推荐。**英澳八校中无任何对应字段。**
2. 🌟 **`reference_delivery_method`（online / By Mail），且选错不可逆**
   一旦选了 By Mail 并已提交申请，**推荐人就再也不能改用线上系统**，只能把信直接寄/发给所申 field，且信须用 letterhead 并有签名。
3. 🌟 **官方要求填"占位值"**：康奈尔 CS 在读生只需 1 封推荐信，官方指引是在第 2 位推荐人处 `enter a "filler"`。产品做字段校验时必须容忍这种**官方认可的占位内容**。

**Interfolio：与 Columbia 完全相反**
- Columbia：`We do not accept Interfolio, or other 3rd-party services`。
- Cornell：**接受**，但须所申 graduate field 同意（理由：经 Interfolio 递交的信缺少通常随信的标准推荐表）。
- CS MEng 给出的具体做法尤其值得注意：Interfolio 为每封信生成一个 **custom document e-mail address**，要把它**填进 ApplyWeb 里推荐人邮箱那一栏，取代推荐人本人的邮箱**。
  → 也就是说 `referee_1_email` 这个字段**并不总是装着真人邮箱**。产品若把该字段一律当作"真人推荐人邮箱"来做红线拦截，会在 Cornell + Interfolio 这条合法路径上误判。

**其他推荐信细节**
- 大多数 field 要 2 或 3 封；CS MEng 要 2 封（建议 1 学术 + 1 职业；离开学术界久者 2 封职业信亦可），可再自愿加 1 封。
- 🌟 **要求 3 封但只到 2 封，视为已满足**：`If you requested three letters of recommendation and only two are received at the time of processing, we will consider that the letter of recommendation requirement has been met.`
- 须用 **professional email address**，理由写明 `to maintain the integrity and credibility of the recommendations`。
- 提交后改推荐人：官方指引是**由申请人自行联系全部推荐人**告知变更；系统内能否直接改**未确认**。

**两份文书（不是一份）**
Cornell 要 **Academic Statement of Purpose** 和 **Personal Statement** 两份**独立**文书，各有官方指引页。
- SOP 上限：`Unless otherwise noted, one to two pages in a standard font and size is typical`。
- 🌟 排版要求：`Include your full name and proposed program of study at the top of each page`，理由写明**若评审看纸质版，散页可能被分开**。（对照 Columbia：姓名放**页眉或页脚**。同一个需求，两种落位。）
- Personal Statement 的字数/页数上限：该页未给硬性数字，**未确认**。

**🌟 附加材料政策与 Columbia 完全相反**
> `Publications, award certificates, resumes, theses, and similar materials should not be sent unless prior approval has been given by the field of study to which you are applying.`
获准的材料还须**直接寄给 graduate field，不寄研究生院**。
→ Columbia **主动要**简历与 publications；Cornell 研究生院**默认不收**。"多准备一份材料总没坏处"在 Cornell 是错的。

**🔴 提交即冻结（八校中写得最死的一条）**
> `Paying the application fee or requesting a fee waiver is the final step in submitting your application. ... Once a fee is paid or a fee waiver request is submitted, you will not be able to make changes to your application.`
申请费 **$105** 不可退。免申请费须在 payment page 的 waiver 表内**直接打字**写 `brief but well-reasoned explanation`（可援引失业/低就业、FAFSA 的 EFC、本国经济状况等），且须在截止前**至少 3 个工作日**提交。

**其他**
- 只能申请 major field，一份申请对应一个 field；改投须另联系一个 field 请求转审（对方 deadline 未过且愿审）。
- 官方送分机构代码 **2098**；🌟 不需要 department code，若 ETS 强制要选则选 `0000 undecided`。
- 接受由 **IIE / Amideast** 直接认证上传的成绩单，或经 **SOPHAS / VMCAS / LSAC** 递交——⚠️ 与 Columbia「禁止一切中介与第三方代交」口径不同。
- 提交后更新成绩单须**申请人自己**经 ApplyWeb 的 **transcript update tool** 操作；补交简历或推荐信可邮件请招生办代传，但**成绩单不代传**。

---

### C.3 UIUC Graduate College（Slate / Technolutions）

**平台取证**：抓取到的 portal 页 `<title>Application Management</title>`（Slate 申请人门户的标准标题），HTML 资源域 `choose-illinois-edu.cdn.technolutions.net`、`slate-technolutions-net.cdn.technolutions.net`，`technolutions` 出现 12 次。**与 Columbia SEAS 同平台、不同实例**——但两校的字段结构差异极大，见下。这直接证明：**平台相同不代表字段可复用。**

**🌟 扫描规格与所有人的直觉相反**

> `Please obtain an electronic version or scan a copy of the credentials at the lowest resolution that results in a legible document (we recommend using under 200 dpi whenever possible). Scanning in "gray scale" or black and white may produce the best results. Please be certain that your document is saved as a PDF file or Word document.`

- **要求尽量低分辨率（建议 200 dpi 以下）、灰度或黑白**——目的是压小体积。
- 对照 **Leeds**：`scans should be complete and of a good quality, showing the 4 corners of all pages`（强调质量与完整）。
- 对照 **Cornell**：`Ensure each scanned or saved image is clear and easy to read`。
- → 一份"高分辨率彩色扫描"在 Leeds 是加分，在 UIUC 是被明确劝阻的做法。**扫描参数本身就是不可跨校复用的约束。**
- 格式：**PDF 或 Word**（Cornell 收 PDF/TIFF/JPEG/GIF 但不收 Word；UCL 收 .docx）。
- 内容标识：`The uploaded document must include your name and the institution name`。
- 🌟 系统提供 **view document 按钮**让申请人自查清晰度，不清晰须重传。

**🌟 个人陈述的第五种形态：一组 250 词短答题**

- **Academic statement**：全体必交，**字数上限由所申项目自行设定，范围 500–1000 词**——同一所大学内部不同项目上限不同。
- **Personal statement**：不是一篇长文，而是**一组短答题，每题上限 250 词**；第 1–2 题必答，第 3–4 题选答（明示 `your response is voluntary and not answering these questions will not affect your admissions decision`）。

至此**八校八种文书形态**，没有任何两校能共用同一份成品：

| 学校 | 上限 |
|---|---|
| UCL | 表内 3,000 字符 / 上传两页 A4（12pt 单倍行距） |
| Manchester AMBS | 不超过一页 |
| Manchester CS（modular） | 约半页 A4 |
| Leeds EPS | 不超过一面 A4 |
| Columbia SEAS | 建议 250–1,000 词，超出不罚 |
| Cornell SOP | 一到两页；Personal Statement 未给数字 |
| **UIUC academic statement** | **500–1000 词，具体由项目定** |
| **UIUC personal statement** | **每题 250 词 × 4 题（2 必 2 选）** |

**⚠️ 推荐信 —— 两个别处没有的机制**

1. 🌟 **八校中唯一写清"填推荐人信息"与"提交申请"先后关系的学校**
   > `The application will require this information prior to allowing you to submit your online application. However, you do not need to wait for your recommenders to submit their letters before you submit your online application. You can and should submit your online application prior to your recommenders submitting their letters.`
   即：**不填推荐人信息就不能提交**，但**不必等推荐信到齐**，官方还主动建议先交申请。

2. 🔴 **`import these recommendations`——最需要产品设防的一个功能**
   > `If you have submitted an application to another program or term previously, you are able to import these recommendations to this application. However, you must obtain explicit permission from the letter writer to use their letter for this application. If you are asking these references to provide a new letter, do not import these reference records as they will not receive a new request to submit a new letter.`
   - 旧推荐信可**一键导入**新申请；
   - 官方硬性要求：**必须取得写信人的明示许可**；
   - 且导入后**推荐人不会收到新请求**——学生可能误以为推荐人会重写。

   > 🔴 **这是 UCL 之外的第二条红线，而且性质不同。** UCL 的风险是"AI 触发系统以申请人名义给第三方发信"；UIUC 的风险是 **"AI 代为勾选导入，等于在未取得推荐人明示同意的情况下复用其署名文件"**。前者是冒名发信，后者是**冒名复用**。产品必须把 `reference_import_previous` 与 `referee_1_email` 一并列入 AI 禁止自动操作的字段。

**FERPA waiver 的改动代价（比 Cornell 记得更细）**
逐条推荐记录各问一次是否放弃查阅权；查阅权只对**被录取并实际入读**者生效。
🌟 改主意的唯一办法：**把原推荐人记录 exclude 掉，再新增一条信息完全相同但 waiver 答案不同的记录**——这会重新走一次发信流程。
另外：**只有在推荐信尚未提交前**才能 exclude；被 exclude 的推荐人可在 References 页点其姓名后用灰色 **Reinstate** 按钮恢复。

**🔴 缴费顺序与 Cornell / 曼大相反**

| 学校 | 顺序 |
|---|---|
| Cornell | **付费 = 提交的最后一步**，付完就不能再改 |
| Manchester | `You can't submit your application without paying` |
| **UIUC** | **先提交，后付费**：`Once you have submitted your application, you will be required to pay your application fee by credit card` |

且 UIUC 有一条别处没有的回退规则：`The fee must be paid prior to your program's deadline, or your application will be **unsubmitted**` —— 逾期未付会被**退回未提交状态**。
金额 **$90**（国内国际同价，2026 春季起；2025 秋季国内价 $70），不可退，未付费前不进入评审。

**其他 UIUC 特有**
- **联合学位要交两份独立申请**（一份以 Program A 为 Primary，另一份以 Program B 为 Primary），理由写明 `Each application has program-specific application questions and upload requirements`——**题目与上传要求随项目变**。
- 每所院校都须另附 **transcript legend / university key**（多在成绩单背页）。同一诉求三校三种叫法：Leeds `grading scale`、曼大 `University Grading Scale`、UIUC `transcript legend`。
- 上传件全部视为 **unofficial**；官方件只在**录取后、且在就读第一学期内**提交。
- 美国身份类上传件：LPR 传绿卡，asylee / refugee / parolee 传身份文件（英澳无对应）。
- 推荐人明文排除 `no friends or relatives please`。
- 免申请费**仅限国内申请人**（UIUC 员工、I-Promise、SROP、McNair、美军服役、allied agencies），且证明文件**必须在提交申请之前传好**；国际申请人不可免，除非来自有获批免费条款的交换协议。

---

---

## Part D — 跨国字段复用分析（**本文件最重要的一节**）

> 版本：v1（仅含 AU 四校 143 行数据）。每补一所学校即刷新本节。

### D.1 方法

复用度用 TSV 的 `normalized_key` 列机械计算，不靠肉眼归类：

```sh
tail -n +2 docs/research/portal-fields.tsv | cut -f1,5 | sort -u | cut -f2 | sort | uniq -c | sort -rn
```

（`cut -f1,5 | sort -u` 先按「学校 × 字段」去重，避免同一学校同一字段出现在多个 section 时被重复计数。）

### D.2 v1 结论（AU 内部，四校）

**四校全中（4/4）**：`transcript_upload`、`password`、`application_fee_payment`
**三校中（3/4）**：`given_name`、`family_name`、`email`、`passport_scan`、`personal_statement`、`english_test_report_upload`、`course_preference_1`、`translation_upload`、`transcript_delivery_method`、`genuine_student_declaration`、`agent_used_yn`
**仅一校（school-unique）**：57 个 key 中约 27 个只在单校出现，多为国别政策字段（`gs_funding_source`、`accommodation_under18_nomination`、`credential_verification_id`）与平台特有字段（`flywire_terms_consent`）。

### D.3 ⚠️ 最关键的一条：`normalized_key` 相同 ≠ 约束可复用

AU 数据自身就是反例：UQ 的 `given_name` HTML 属性写 `maxlength="50"`，字段下方帮助文字却写 `Maximum 30 characters.`——**同一个字段，同一所学校，两个数字**。跨校时这种分歧只会更多。

因此"准备包能不能省力"的答案是**两层的**，不是一个扁平的复用/独有清单：

| 层 | 复用度 | 产品含义 |
|---|---|---|
| **内容层**（学生要准备的实际信息与文件本体） | **高** | 姓名、护照、成绩单、英语成绩、个人陈述正文——一次准备，多校通用。准备包应存**规范化的长版内容**。 |
| **约束层**（每个 portal 对该内容的字数/格式/份数/认证要求） | **低** | maxlength、文件 MB 上限、是否要 certified copy、志愿数量上限——逐校不同且互相冲突。必须建**每校截断/改写规则表**，在投递时套用。 |

**设计推论**：准备包不应存"已经按某校要求截断好的成品"，而应存 `canonical content + per-school rendering rules`。否则换一所学校就要重写。

