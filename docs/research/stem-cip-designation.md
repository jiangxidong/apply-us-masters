<!--
服务于 #34「STEM 指定 / CIP code 在申请阶段可不可取证」。
调研日期：2026-08-15。样例三所：Columbia SEAS CS MS / Cornell CS MEng (Ithaca) / UIUC CS MS。
取证边界：全部为 GET 读取公开页，未注册、未登录、未 POST。
逐页取回状态见本文 §5 的取回日志——「是否本次真实取回」这一列是边抓边记的，不是写稿时回忆的。
-->

# STEM 指定 / CIP code 在申请阶段可不可取证 — Notes

服务于 [#34](https://github.com/jiangxidong/EduApplication/issues/34)。

## 本文回答什么 / 不回答什么

**回答**：`post_grad_intent`「留美」一支想挂的那条事实——**某个项目是不是 STEM 指定 / 它的 CIP code 是多少**——
在**申请阶段**（人还没被录取、还没拿到 I-20）能不能从官方页面上取回，取回后能不能写成
`channels/` 里一条带 `✓ <url>` 的事实行（[ADR 0005](../adr/0005-basis-points-at-an-existing-checked-fact.md) 的准入测试 +
[ADR 0007](../adr/0007-a-checkmark-is-earned-by-a-fetch-not-by-a-capability.md) 的取回闸门），以及它落哪个法定节。

**不回答**：OPT / STEM 延期本身的移民规则（签证链，地图 Out of scope）。
本文出现 OPT 只是因为**学校把 STEM 指定这条事实挂在 OPT 页面上**——那是取证路径，不是本文的主题。
也不回答「回国」一支——[#16](https://github.com/jiangxidong/EduApplication/issues/16) 已排除，#34 票面明确不查。

**一句话结论**：这条事实**在形式上过得了准入测试**（它有一个 `✓`-able 的家），
但**三所样例里只有一所（UIUC）真取得回来**，另两所（Columbia / Cornell）在第一环就断——
学校根本不公布本校项目的 CIP，只让你去看**录取后才有的 I-20**。
详见 §4 的判决，那里把「事实过不过测试」与「`post_grad_intent` 成不成真字段」分成两段写——#34 票面把这两件事合并了，它们不是一件事。

---

## 1. Q1：CIP code 与 STEM 指定在不在可取回的页面上？

### 结论

**三层里没有一层是普遍公布的，而且三校的答案不一样。**

- **项目页 / 研究生院页（第一、二层）：三校三个项目全部零提及**。Columbia CS MS、Cornell CS MEng、UIUC CS MS 的
  院系页 + 大学 catalog / bulletin 页，`STEM` 与 `CIP` 两个词一次都没出现（逐页 grep，见证据）。
- **international office 页（第三层）：三校全部把学生指向 I-20**，不给本校名单。
  I-20 是**录取并缴押金之后**才签发的文件——**申请阶段的人手上没有它**。这是本票最硬的一条发现。
- **第四层（票面没列，实际存在）：大学层的「学术项目清单」**。UIUC 有一份**公开、按项目逐行给 CIP 的清单**，
  Columbia / Cornell 只有**流程说明页**（怎么申请改 CIP），没有清单本身。
- **DHS 的 STEM Designated Degree Program List 反查不了**：那份 PDF 是一份 **CIP 代码表**，不是院校项目表。
  它只回答「11.0701 算不算 STEM」，不回答「Columbia 的 CS MS 是不是 11.0701」。**没有第一环，反查无从起步。**

### 证据

**第一、二层——项目页与 catalog 页零提及。**

| 页面 | STEM 命中 | CIP 命中 |
|---|---|---|
| `https://www.cs.columbia.edu/education/ms/`（215 行） | 0 | 0 |
| `https://www.cs.columbia.edu/education/ms/appfaq/`（382 行） | 0 | 0 |
| `https://bulletin.columbia.edu/columbia-engineering/…/computer-science-ms/` | 0 | 0 |
| `https://www.engineering.columbia.edu/academics/programs/masters-programs/master-science-programs`（46 行） | 0 | 0 |
| `https://www.cs.cornell.edu/master-engineering-computer-science` | 0 | 0 |
| `https://www.cs.cornell.edu/masters`（125 行） | 0 | 0 |
| `https://catalog.cornell.edu/programs/computer-science-cscn-meng/` | 0 | 0 |
| `https://catalog.illinois.edu/graduate/engineering/computer-science-ms/` | 0 | 0 |
| `https://siebelschool.illinois.edu/academics/graduate/ms-program`（129 行） | 0 | 0 |

Cornell 的 catalog 页有一个 `Program Information` 块，字面只有三项——
`Program Mode of Delivery: In Person` / `Program Location: Ithaca, NY` / `Minimum Credits for Degree: 30`。
**没有 CIP 字段**。这不是「没填」，是这张模板里就没有这一格。

**第三层——三所 international office 一致地把人指向 I-20。** 三条字面证据：

- Columbia ISSO：`You successfully completed a Bachelor's, Master's, or doctoral degree in a field on the government's STEM CIP Code List.
  **To check if your degree program is eligible, look at page 1 of your I-20. The code is listed next to your Program Major.**`
  （`https://isso.columbia.edu/content/f-1-stem-opt-extension`）
- Cornell International Services：`You have earned a bachelor's, master's, or Ph.D. degree in the United States in a qualifying STEM field.
  **Check that your Major 1 or Major 2 codes on Form I-20 are on the STEM field list.**`
  （`https://international.globallearning.cornell.edu/employment-and-taxes/opt-stem-extension`）
- UIUC ISSS：`Your major field's CIP code must appears on the STEM designated degree list (PDF).
  **You can find the CIP code for your major in the 'program of study' section on page 1 of your I-20.**`
  （`https://isss.web.illinois.edu/students/employment/f1-opt-stem/`）

三家的口径完全一致，而 I-20 由 DSO 在**录取之后**签发。
**换句话说：三所学校的 international office 都把这条事实定义成一件录取后的事。**
这不是「学校懒得写」，这是这条事实在美国体制里的默认存放位置。

**第四层——大学层清单，三校分裂。**

- **UIUC ✅ 有，且真取得回**。University Office for Planning & Budgeting 的 *University of Illinois Program Inventory*，
  自述 `The programs are listed by national Classification of Instructional Programs (CIP) fields using the CIP assigned codes.
  The Program Inventory includes detailed program information, such as program level, CIP, program name, status, and region`
  （`https://www.pb.uillinois.edu/what-we-do/other-system-services/program-inventory.cfm`）。
  人看的落地页 `https://www.pb.uillinois.edu/reports-public/program-inventory/index.cfm` 是个 Tableau 嵌入，
  **本次抓取只拿到 `Tableau / Unexpected Error`（未取回）**；但同一个 viz 的 CSV 导出端点取回成功，**523 行，逐项目一行**：

  ```
  CIP Code,Degree Level,Program Name,Region number,Status
  11.0701,5,B.S. in Computer Science,7,Active
  11.0701,6,Post-Baccalaureate Certificate in Computing Fundamentals,7,Active
  11.0701,7,M.S. in Computer Science,7,Active
  11.0701,7,Master of Computer Science,7,Active
  11.0701,7,Master of Computer Science,10,Active
  11.0701,17,Ph.D. in Computer Science,7,Active
  ```
  出处：`https://tableau.admin.uillinois.edu/views/Program-Inventory/UofIProgramInventory.csv?Campus=UIUC`

  🔴 **`Campus=UIUC` 这个筛选是实测出来的，不是猜的**：同一端点 `?Campus=UIC` 返回 386 行、含 `Dental`、无 `Veterinary`；
  `?Campus=UIS` 返回 96 行（UIS 自己也有一个 `11.0701 M.S. in Computer Science`）；
  `?Campus=UIUC` 返回 523 行、含 9 条 `Veterinary`、无 `Dental` / `Pharmacy` / `Nursing`——与「Urbana 有兽医学院、UIC 有牙医与药学院」相符。
  ⚠️ **`Region number` 这一列的含义本次未解决**：Codebook 说明页（`https://www.pb.uillinois.edu/what-we-do/other-system-services/codebook.cfm`）
  已取回但不定义它。可确定的只有它**不是校区码**（三个校区各自的行里都有不同 region 值）。
  `Master of Computer Science` 在 region 7 与 region 10 各一行，疑似线下 / 线上两种投放，**未证实**。

- **Columbia ❌ 没有清单，只有流程页**。Provost 的 CIP 页把机制说得很清楚，但**通篇没有一个项目名**：
  `The University assigns a CIP code to all approved programs. … it is our obligation to assign a single best CIP code for each program.`
  `Any such change must be approved unanimously by three offices: the Registrar's Office; the International Students and Scholars Office (ISSO); and the Provost's Office.`
  （`https://provost.columbia.edu/content/codes-classification-instructional-programs-cip`）
  Registrar 那个看起来更对口的地址 `https://www.registrar.columbia.edu/cip-codes` **已单独取回全文**
  （10 606 字符，`metadata.url` 落在 `provost.columbia.edu/content/codes-classification-instructional-programs-cip`）——
  **正文与 Provost 页逐字一致，同样没有名单，链接数组里也没有任何 PDF / xlsx / 清单页**。
  两页唯一的下游链接是一张**内部申请表**（`cognitoforms.com/ColumbiaUniversity3/CIPCodeRequestForm`），面向院系、不面向申请人。

- **Cornell ❌ 同样只有流程页**。IRP 的 CIP 页：
  `Each Cornell program of study (that is, major or graduate field) is associated with a six-digit CIP Code for the purposes of reporting data to the federal government.`
  以及改码流程里那句很有信息量的：
  `If you are seeking a CIP designation that qualifies as STEM, illustrate that more than 50% of the required credits for the degree program provide predominantly STEM content…`
  （`https://irp.dpb.cornell.edu/academic-program-regulation/approval-and-registration/cip-codes`）
  **没有任何一处列出某个项目的 CIP。** IRP 的 Degrees Conferred 页只有按 CIP **汇总的学位授予数**，
  且指向的按-CIP 明细是 **2005–2011 的存档 PDF**（`https://irp.dpb.cornell.edu/degrees-conferred`），对本产品无用。

**DHS 名单本身：取回了，但它救不了缺失的第一环。** `https://www.ice.gov/doclib/sevis/pdf/stemList2024.pdf`（16 页，Last Updated: July 22, 2024）
自述 `a complete list of **fields of study** that DHS considers to be … STEM fields of study`，
`this list designates the following four primary CIP series at the 2-digit CIP code level: Engineering (14), Biological and Biomedical Sciences (26), Mathematics and Statistics (27) and Physical Sciences (40)`，
另按 6 位收录 18 个相关系列。名单里确有 `11 11.0701 Computer Science.`。
**它是一张代码表。** 拿到 CIP 才能查它；查不到 CIP 就用不上它——这正是 Columbia / Cornell 断掉的地方。

**还有一条公开的反查路，但它落不到 `program_key` 上。** NCES College Navigator 逐院校列出 CIP 口径的 Programs/Majors
（`https://nces.ed.gov/collegenavigator/?q=columbia+university&s=NY&id=190150#programs`，本次取回）。
Columbia 的硕士层级同时挂着两行：

```
Computer and Information Sciences, General   ...  600 (Master)
Computer Science                             ...  427 (Master)
```

**你无法判断 SEAS 的 CS MS 属于哪一行**——Columbia 名下有多个 CS 系的硕士口径。
这条路给的是「学校层面有没有这个 CIP 的硕士毕业生」，不是「这个项目的 CIP 是什么」。**对 `program_key` 无效。**

**顺带一条否证：NYSED 的 Inventory of Registered Programs**（纽约州公开库，Columbia / Cornell 都在内，
`http://www.nysed.gov/heds/IRPSL1.html`，本次取回）挂的是 **HEGIS 码**，不是 CIP。
Columbia 的 Provost 页自己承认这是两套码（`The HEGIS and CIP codes should be consistent with one another`）。
**HEGIS 不能拿去查 DHS 名单。**

---

## 2. Q2：粒度对不对得上？

### 结论

**对不上，而且是两头都对不上——CIP 既比 `program_key` 粗，又比 `program_key` 细。**
不是「不同项目 CIP 不同」这么简单的一句。而且它**还带季度维度**，不是一条静态事实。

### 证据

**A. 比 `program_key` 粗——同一个 CIP 罩住多个 `program_key`。**
UIUC 的 `11.0701` 一码之下同时挂着 `M.S. in Computer Science`（研究型）与 `Master of Computer Science`（专业型 MCS），
外加 B.S.、证书、Ph.D. 共六行（见 §1 的 CSV 片段）。
本产品会把 MS 与 MCS 记成**两个 `program_key`**（截止日、学费、是否给 funding 全不同），CIP 却分不开它们。
Cornell 更彻底，IRP 页字面把 CIP 挂在 **`major or graduate field`** 上——
Cornell 的 CS **field** 之下同时有 MEng / MS / PhD，`program_key` 层级在 CIP 那里根本不存在。

**B. 比 `program_key` 细——同一个 `program_key` 之内 CIP 分叉。**
Columbia SIPA 是最干净的反例（`https://www.sipa.columbia.edu/sipa-education/bulletin/academic-policies/STEM`，本次取回）：

- `**Master of Public Administration (MPA)** – Effective for students entering in Fall 2025 and beyond, classified under *Management Sciences and Quantitative Methods, Other* (CIP Code: 52.1399).`
- `**MPA in Economic Policy Management (MPA-EPM)** – … (CIP Code: 45.0603).`
- `**MPA in Development Practice (MPA-DP)** – … (CIP Code: 30.3301).`
- `**MPA in Environmental Science & Policy (MPA-ESP)** – … (CIP Code: 03.0103).`

更细的一层在「已停招但在读学生仍适用」那段里：
`Combined curriculum of the International Finance & Economic Policy Concentration (IFEP) and the Data Analytics & Quantitative Analysis Specialization (DAQA) — applicable to both MIA and MPA degrees, classified under *Econometrics and Quantitative Economics* (CIP Code: 45.0603).`
**决定 CIP 的是「concentration × specialization 的组合」，比学位还细一层。**

同一现象在 Columbia GSAPP 也有（`https://www.arch.columbia.edu/stem`，本次取回）：
M.Arch / M.S.AAD / M.S.AUD 三个项目共用 `04.0902`，而 M.S.CDP 单独是 `11.0899`——**同一个 channel 之内两个不同 CIP**。

**C. 还有季度维度。** SIPA 那句 `Effective for students entering in Fall 2025 and beyond` 说明这条事实**按入学季分叉**。
本产品的 `apply.md` 有 `season` 字段，而 `channels/` 的事实行没有季度限定语法。
**一条随季变的事实写进 `channels/` 就是一条会悄悄过期的事实**，而 [ADR 0001](../adr/0001-evidence-stays-binary-with-a-closed-suffix.md) 的
二元证据标记没有「过期」这个态。

**D. 同一个 `channel_key` 内、甚至同一所大学内，「公不公布」本身就不一致。**
- Cornell 校内：Ithaca 的 CS MEng 页零提及，而 **Cornell Tech**（另一个 `channel_key`，其 FAQ 字面写
  `you may apply to master's programs on the Cornell University campus in Ithaca (Note: the Ithaca campus uses a separate application system…)`）
  给出整校级断言：`Yes, **all Cornell Tech master's programs are STEM-designated, except for the Master of Laws (LLM)**.`
  （`https://tech.cornell.edu/admissions/admissions-faqs/`，本次取回）
- UIUC 校内：CS MS 页零提及，而 MSFE 专门做了一整页 `# STEM-Designated Degree`，正文写
  `Curricular Practical Training (CPT) and Optional Practical Training (OPT) as a STEM designated degree in Operations Research`
  （`https://msfe.illinois.edu/about/why-illinois/stem-degree`，本次取回）——**注意它只说学科名，不给 CIP 数字**。
- Columbia 校内：SEAS 零提及，SIPA 与 GSAPP 各有一整页带 CIP 数字。

**这条差异的性质是营销，不是制度**：公布的都是「需要靠 STEM 招国际生」的项目（SIPA 的 MPA、GSAPP、MSFE）；
CS 项目不需要说这句话，所以不说。**指望它随时间补齐是没有依据的。**

### 对契约的直接后果

CIP 落不到 `##` 层的 `channels/<channel_key>.md` 正文——SIPA / GSAPP 形态（同 channel 多 CIP）当场把它顶下去。
它的家是 **`## 项目级差异` 覆盖层**（`### <program_key>` → `#### <节名>`）。
只有 Cornell Tech 那种**整校级断言**才适合放 `##` 层。
契约已经支持这个形状，[#28](https://github.com/jiangxidong/EduApplication/issues/28) 也已定死
`####` 的合法性只由封闭词表决定、与同名 `##` 是否存在无关——**不需要为粒度新增任何机制，只缺一个节名。**

---

## 3. Q3：它能不能写成一条带 `✓ <url>` 的事实行？

### 结论

**形式上过，覆盖率上不过。** 分开说这两句，因为它们的后果完全不同。

- **形式**：过。链条上每一环都有自己的 `✓`-able 的家，不需要发明新的证据形态。
- **覆盖率**：三所样例只有 UIUC 一所能真填出来。另两所连第一环都取不到，只能是 `待核实`。

### 证据

**UIUC 的完整链条，两行都是本次真实取回的正文：**

```
### uiuc--gradcollege--cs-msc
#### <节名>
- `✓ https://tableau.admin.uillinois.edu/views/Program-Inventory/UofIProgramInventory.csv?Campus=UIUC` CIP = 11.0701（M.S. in Computer Science，Active）
- `✓ https://www.ice.gov/doclib/sevis/pdf/stemList2024.pdf` 11.0701 Computer Science 在 DHS STEM 指定名单上（Last Updated: July 22, 2024）
```

**两环之间的那一步「所以本项目 STEM 指定」是一次封闭表查表，不是判断。**
[ADR 0005](../adr/0005-basis-points-at-an-existing-checked-fact.md) 的判别式是
「它有没有一行带 `✓` 的家」——**两环各有各的家，判别式满足**。
ADR 0005 从来没有要求一条依据只能指向单一事实行；它要求的是不新增第三种标记，而这里一个都没新增。

**Columbia / Cornell 断在第一环。** 没有任何一次真实取回能给出这两个项目的 CIP。
唯一还剩的合法出路是 ADR 0007 已经写好的那一条——**用户自己去查并贴链接**。
但这条路在这里比在 deadline 上难走得多：deadline 用户能在官网上找到，
而**本校项目的 CIP 在 Columbia / Cornell 的公开面上根本不存在**，用户能拿到它的最早时点仍然是 I-20。
实际形态因此是：

```
- `待核实` CIP code / STEM 指定（学校公开面不公布；官方口径为「见录取后的 I-20 第 1 页」）
```

这**不是**要给 [ADR 0001](../adr/0001-evidence-stays-binary-with-a-closed-suffix.md) 的封闭原因后缀加新词。
按 ADR 0001 的判别式「用户的下一步是否不同」——这里用户的下一步就是 `（无）` 的下一步：去官网查。查不到就是查不到。

### 一条关于 `✓` 成本的观察

UIUC 那个 `✓` 指向的是一个 **Tableau CSV 导出端点**，不是人看的页面。
人看的落地页本次**取不回**（Tableau `Unexpected Error`）。
按 ADR 0007，`✓` 只能挂在**正文进过上下文的那个 URL** 上——所以只能写 CSV 端点，
不能把它换成那张更好看的 `.cfm` 落地页。**换 URL 正是 ADR 0007 要禁的那个动作。**
代价是这个 URL 依赖 `?Campus=UIUC` 与 `.csv` 两个导出参数，Tableau 改版就会碎。
这是一条**真实的脆性**，不是实现瑕疵——记在这里，好过让下一个人以为它稳。

---

## 4. Q4：它落哪一个法定节？

### 结论

**现有十个法定节没有一个装得下它。这是继 [#23](https://github.com/jiangxidong/EduApplication/issues/23) 的 `项目内容` 之后
第二个「缺的不是人、是类别」。**
建议新增法定节 **`学位分类`**，owner = **选校**，默认落在 `## 项目级差异` 覆盖层（`#### 学位分类`）。

### 证据：契约自己已经指了 `channels/`，但没给门牌号

这不是我推的，是样例文件自己写的。`sample-workspace/programs.md` 的表头第三行字面是：

> **`evidence` 列只担保 `deadline` 一项。** 学费、门槛、**STEM 资格**、申请费在 `channels/<channel_key>.md`，各带各的标记。

**契约已经把「STEM 资格」派给了 `channels/`**，而 §1.2 的十个法定节里没有一个收它：
`硬约束` 收的是流程性限制（契约原话：「每学期只能申 1 个项目」「禁止本人以外代交」），
`费用与资格` 收的是钱与减免资格。CIP / STEM 是**学位本身的分类属性**，两边都不沾。
按 [ADR 0008](../adr/0008-the-owner-binds-to-a-section-not-a-file.md)，
**「一条事实没有写入者」是两条禁止之一**——现状正好踩在上面。

### owner 判定

§1.2 的归属判据是**消费方，多个阶段消费时归最早的**。
这条事实唯一的消费方是**选校**（用户在「留美」倾向下筛项目）。文书阶段用不上它——
why 段要的是具名的课程 / 实验室 / 教授（那是 `项目内容`），不是六位数分类码。
材料、推荐信、准备包都不消费它。**单一消费方，owner = 选校，没有争议。**

### 节名的两条闸

按 §1.2，节名必须（a）不与词表内任何一项**互为前缀**，（b）有 owner。

对现有十一项（十个法定节 + `项目级差异`）逐一核：
`平台与账号` / `硬约束` / `学历门槛` / `费用与资格` / `AI 使用政策` / `项目内容` / `文书规格` / `材料上传` / `推荐信机制` / `冻结点` / `项目级差异`。
**`学位分类` 与其中任何一项都不互为前缀**（最近的是 `学历门槛`，首字即分叉：学**位** vs 学**历**）。两条闸都过。

⚠️ **一条已知代价**：`学位分类` 与 `学历门槛` 在中文里形近（学位 / 学历），人眼容易串。
这是**可读性成本，不是规则冲突**——机械前缀匹配分得清，读的人可能分不清。

**否决掉的备选**：`CIP 与 STEM 指定`。它无歧义，但把一个**美国专有**的词烙进一张跨国封闭词表
（本 repo 的 `country-delta-uk-us-au.md` / `portal-fields.md` 都覆盖 UK / AU）。
英国的 Graduate Route、澳洲的 Temporary Graduate visa 都不按 CIP 分类——
词表一旦封成 `CIP …`，UK / AU 的同类事实就无处可落，只能再开第三个节。
`学位分类` 是国别中立的容器，能装下「这个学位在目的国的分类身份」这一整类事实。

### 落在哪一层

**默认落 `## 项目级差异` 覆盖层**：`### <program_key>` → `#### 学位分类`。
理由是 §2 的 B 组证据——SIPA 形态下同一个 channel 里四个 CIP，`##` 层放不下。
**只有整校级断言才放 `##` 层**，Cornell Tech 的「除 LLM 外全部 STEM 指定」是本次唯一见到的这种形态。
契约已明写 `####` 的合法性与同名 `##` 是否存在无关，**两种形态并存不需要新规则**。

### 三所样例照这个方案会长成什么样

```
## 项目级差异

### uiuc--gradcollege--cs-msc
#### 学位分类
- `✓ https://tableau.admin.uillinois.edu/views/Program-Inventory/UofIProgramInventory.csv?Campus=UIUC` CIP = 11.0701（M.S. in Computer Science，Active）
- `✓ https://www.ice.gov/doclib/sevis/pdf/stemList2024.pdf` 11.0701 在 DHS STEM 指定名单上（2024-07-22 版）

### columbia--seas--cs-ms
#### 学位分类
- `待核实` CIP code / STEM 指定 —— 学校公开面不公布，ISSO 口径为「见 I-20 第 1 页」（录取后才有）

### cornell--gradschool--cs-meng
#### 学位分类
- `待核实` CIP code / STEM 指定 —— 同上，IRP 只公布改码流程、不公布逐项目 CIP
```

三分之二是 `待核实`。按 ADR 0007 的原话，这**是这条判别式的真实代价，不是实现缺陷**。

---

## 5. 逐校表 + 取回日志

### 5.1 逐校表

| 学校 | 项目 | CIP code | STEM 指定 | 公布层级 | URL | 本次真实取回 |
|---|---|---|---|---|---|---|
| Columbia | SEAS **MS in Computer Science** | **未公布** | **未公布** | 无（项目页 / bulletin / SEAS 硕士页全零提及；Provost & Registrar 只有流程页；ISSO 指向 I-20） | `https://www.cs.columbia.edu/education/ms/` · `https://provost.columbia.edu/content/codes-classification-instructional-programs-cip` · `https://isso.columbia.edu/content/f-1-stem-opt-extension` | ✅ 三页均取回，均无该事实 |
| Columbia | SIPA MPA（对照组，另一 channel） | 52.1399（Fall 2025 起） | 是 | **院系政策页** | `https://www.sipa.columbia.edu/sipa-education/bulletin/academic-policies/STEM` | ✅ |
| Columbia | GSAPP M.Arch / M.S.AAD / M.S.AUD（对照组） | 04.0902 | 是 | **院系 STEM 页** | `https://www.arch.columbia.edu/stem` | ✅ |
| Columbia | GSAPP M.S.CDP（对照组） | 11.0899 | 是 | 同上 | 同上 | ✅ |
| Cornell | Bowers **MEng in Computer Science (Ithaca)** | **未公布** | **未公布** | 无（catalog 的 `Program Information` 块无 CIP 字段；IRP 只有改码流程页；International Services 指向 I-20） | `https://catalog.cornell.edu/programs/computer-science-cscn-meng/` · `https://irp.dpb.cornell.edu/academic-program-regulation/approval-and-registration/cip-codes` · `https://international.globallearning.cornell.edu/employment-and-taxes/opt-stem-extension` | ✅ 三页均取回，均无该事实 |
| Cornell | Cornell Tech 全部硕士（对照组，另一 channel） | 未给数字 | **是**（除 LLM） | **招生 FAQ**，整校级断言 | `https://tech.cornell.edu/admissions/admissions-faqs/` | ✅ |
| UIUC | Grainger / Siebel **MS in Computer Science** | **11.0701** | **是**（经 DHS 名单查表） | **大学层 Program Inventory（Tableau CSV 导出）**；项目页 / catalog / ISSS 均零提及 | `https://tableau.admin.uillinois.edu/views/Program-Inventory/UofIProgramInventory.csv?Campus=UIUC` + `https://www.ice.gov/doclib/sevis/pdf/stemList2024.pdf` | ✅ 两处均取回 |
| UIUC | Master of Computer Science (MCS)（对照组，同 CIP 不同 `program_key`） | 11.0701 | 是 | 同上 | 同上 | ✅ |
| UIUC | MSFE（对照组，同 channel 另一项目） | 未给数字 | 是（自述 "in Operations Research"） | **项目自建 STEM 页** | `https://msfe.illinois.edu/about/why-illinois/stem-degree` | ✅ |

### 5.2 取回日志

**取回成功（正文进过本会话上下文）**

- `https://provost.columbia.edu/content/codes-classification-instructional-programs-cip` — curl 403（Cloudflare），firecrawl 成功
- `https://www.registrar.columbia.edu/cip-codes` — 单独取回全文 10 606 字符，正文与 Provost 页逐字一致
- `https://isso.columbia.edu/content/f-1-stem-opt-extension`
- `https://www.arch.columbia.edu/stem`
- `https://www.sipa.columbia.edu/sipa-education/bulletin/academic-policies/STEM`
- `https://bulletin.columbia.edu/columbia-engineering/academic-departments-programs/computer-science/graduate-programs/computer-science-ms/`
- `https://www.cs.columbia.edu/education/ms/` · `https://www.cs.columbia.edu/education/ms/appfaq/`
- `https://www.engineering.columbia.edu/academics/programs/masters-programs/master-science-programs`
- `https://catalog.cornell.edu/programs/computer-science-cscn-meng/`
- `https://www.cs.cornell.edu/master-engineering-computer-science` · `https://www.cs.cornell.edu/masters`
- `https://irp.dpb.cornell.edu/academic-program-regulation/approval-and-registration/cip-codes` · `https://irp.dpb.cornell.edu/degrees-conferred`
- `https://international.globallearning.cornell.edu/employment-and-taxes/opt-stem-extension`
- `https://tech.cornell.edu/admissions/admissions-faqs/`
- `https://catalog.illinois.edu/graduate/engineering/computer-science-ms/`（含同名 `.pdf`）
- `https://cs.illinois.edu/academics/graduate/ms-program` · `https://siebelschool.illinois.edu/academics/graduate/ms-program`
- `https://isss.web.illinois.edu/students/employment/f1-opt-stem/`
- `https://www.pb.uillinois.edu/what-we-do/other-system-services/program-inventory.cfm` · `…/codebook.cfm`
- `https://tableau.admin.uillinois.edu/views/Program-Inventory/UofIProgramInventory.csv?Campus=UIUC`（另实测 `UIC` / `UIS` 两值）
- `https://www.dmi.illinois.edu/stuenr/Currlist01.html`（**2001 年秋**，含 CIP 列但已过期，不可用）
- `https://msfe.illinois.edu/about/why-illinois/stem-degree`
- `https://www.ice.gov/doclib/sevis/pdf/stemList2024.pdf`（16 页 PDF，curl + pypdf）
- `https://nces.ed.gov/collegenavigator/?q=columbia+university&s=NY&id=190150#programs`
- `http://www.nysed.gov/heds/IRPSL1.html`

**未取回（如实记，不当证据用）**

- `https://gradengineering.columbia.edu/international-students` — **403 Access Denied**
- `https://cvn.columbia.edu/content/graduate-engineering-degree-program-codes` — **404**（搜索结果里的标题看着极对口，实际页面不存在）
- `https://catalog.cornell.edu/programs/computer-science-cscn-meng/computer-science-cscn-meng.pdf` — **HTTP 202，0 字节**（异步生成，未落地）
- `https://www.pb.uillinois.edu/reports-public/program-inventory/index.cfm` — 页面返回 **`Tableau / Unexpected Error`**

---

## 6. ⚠️ 两次二手摘要伪造官方出处（本节是反面教材，不是发现）

本票的主题就是取证标准，所以把这两次记下来。**两条都是搜索引擎的摘要模型编的，两条都被一手页面当场证伪。**

1. 搜索摘要断言：*"Cornell's Master of Engineering (M.Eng.) in Computer Science has the CIP code 11.0701"*，
   并把出处指向 `catalog.cornell.edu` 的项目 PDF。
   **实际**：该 PDF 返回 HTTP 202 / 0 字节，HTML 版正文 `CIP` 零命中。**这个数字没有任何一手来源。**
2. 搜索摘要断言：*"The Computer Science MS program at Columbia University is designated as a STEM field … The information comes directly from Columbia University's official Computer Science department website (cs.columbia.edu)"*。
   **实际**：`cs.columbia.edu/education/ms/`（215 行）与 `appfaq`（382 行）`STEM` 零命中。**该网站没有说过这句话。**

两条摘要都**具名了一个真实的官方域名**——这正是它们危险的地方：
一个只看摘要的 agent 会写出 `✓ https://catalog.cornell.edu/…` 而那一页上根本没有那个数字。
这是 ADR 0007「搜索结果摘要不算取回」这一句的**实证**，不是假想风险。

---

## 7. 对 #34 的准入测试判决

### 判决一（关于事实）：**形式上过，覆盖率上不过。**

- **过**：这条事实**不需要新的证据形态**。当学校公布时，它就是 `channels/` 覆盖层里两行普通的 `✓ <url>`，
  ADR 0005 的判别式（「有没有一行带 `✓` 的家」）满足，ADR 0001 的二元标记不用扩，ADR 0007 的闸门也不用软化。
- **不过**：三所样例的真实取回率是 **1/3**。Columbia 与 Cornell 不是「这次没查到」，
  而是**公开面上根本不存在**——两校 international office 的官方口径都是「见录取后的 I-20」。
  连 ADR 0007 留的那条出路（用户自己查）在这两校也走不通，因为用户在申请阶段同样拿不到。
- 因此这个字段的默认形态是 **`待核实`**。按 ADR 0007 的原话，
  「全表 `待核实` 是常态而非异常……这是这条判别式的真实代价，不是实现缺陷」。

### 判决二（关于 `post_grad_intent`）：**它仍然驱动不了任何东西。**

**这一条与判决一是两回事，#34 票面把它们合并了。** 就算事实过了准入测试，
`post_grad_intent` 也不会因此变成真字段——它是一个**画像偏好**，要驱动决策就得
「用户选了留美 → 据此过滤 / 排序项目」，而这个动作需要**大多数项目上有值**。
1/3 的取回率给不出这个。用一个三分之二为空的属性去过滤项目池，产出的不是决策，是噪音。

**建议**：按 #34 自己给的第二个方向办，但把措辞改准——
不是「本字段目前不驱动任何取证事实」（不准确，UIUC 那条是真取证事实），
而是：

> `post_grad_intent` 的「留美」一支所依赖的 STEM 指定 / CIP 事实**能取证但取不全**：
> 三所样例只有 UIUC 一所在申请阶段可取回，Columbia 与 Cornell 的官方口径是「见录取后的 I-20」。
> 因此本字段**当前不驱动任何筛选或排序**，只作为画像记录留存。

### 判决三（关于契约）：**`学位分类` 这个节应该开，即使字段暂不驱动决策。**

这两件事是解耦的。UIUC 那条事实**现在就是可取证的**，而契约里没有它的家——
`sample-workspace/programs.md` 表头已经把「STEM 资格」派给了 `channels/`，
十个法定节却一个都不收它，这是 ADR 0008 明令禁止的「一条事实没有写入者」。
**先补类别，字段驱不驱动决策是另一张票的事。**
