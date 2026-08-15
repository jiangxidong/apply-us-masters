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

> 调研中。平台栈结论继承自同 issue 的另一份调研 `docs/research/uk-apply-timeline-deposit.md`（分支 `research/country-delta`），本节不重复取证。

---

## Part C — US 美国

> 调研中。

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

