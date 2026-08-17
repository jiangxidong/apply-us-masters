---
channel_key: columbia--seas
school: Columbia University
college: The Fu Foundation School of Engineering and Applied Science (SEAS)
platform: Slate (Technolutions)
season_downgraded:
  选校: 2027fall
  文书: 2027fall
  材料: 2027fall
  推荐信: 2027fall
  准备包: 2027fall
---

# Columbia SEAS — 申请约束

> 事实行首带证据标记。`✓ <url>` = 该条取自这个 URL；`待核实` = 没查 / 查了没找到 / 口径不清。
> 数据取自 2026-08 的调研（#6 原始调研 + #75 stem-cip-designation 补），**演示用，本季必须重查**。
> 本文件与 `prototype/state-layer` 的 `sample-workspace/channels/columbia--seas.md` 内容一致——
> P1 复用它作申请人侧底本，本文件是三个 persona 工作区共享的约束层源（#87）。

## 平台与账号

- `✓ https://apply.engineering.columbia.edu/` 平台 = Slate（Technolutions）
- `✓ 同上` 注册表**只有 4 个输入**：email / first / last / birthdate，**没有密码字段** —— 走邮件确认链接建号
  （这是本次调研中**唯一一条经核验的「字段不存在」**，其余一切缺席都只是「未记录」）

## 🔴 硬约束

- `✓ https://apply.engineering.columbia.edu/` **每学期只能申请 1 个项目**
  → 与 `programs.md` 交互：Columbia 名下若出现第二行，必须提示用户二选一
- `✓ 同上` **明文禁止本人以外任何人代交**（仅 Fulbright / IIE / LASPAU / AMIDEAST / DAF / DAAD / VEF 例外）
  → 中介路径在此校完全关闭
- `✓ 同上` **强制录像面试**（video interview）

## 文书规格

- `✓ 同上` Personal Statement 建议 **250–1000 词，超出不罚**（软性上限）
- → 渲染来源：`essays/canonical/long.md`（裁到 1000 词以内）

## 材料上传

- `待核实` 单文件大小上限（公开页未公开）
- `待核实` 格式白名单（公开页未公开）
- `✓ https://www.engineering.columbia.edu/admissions-aid/graduate-admissions/admissions-faqs` 成绩单：申请阶段上传 **official copy 或 student copy**（🔴 明令禁止学生门户截图），录取后由原院校注册处把认证在线官方件直接发 finaldocs@columbia.edu

## 🔴 推荐信机制 —— 风险 A：冒名发信

- `✓ https://apply.engineering.columbia.edu/` 机制：**系统 → 推荐人**，需 **3 封**
- `待核实` 触发时点：官方页字面是「填入联系方式即联系」，**未明示是保存即发还是提交后发**
  → **产品必须按「填入即已发信」的保守假设设计**，没有「提交前反悔」的窗口
- `✓ 同上` **禁止 Interfolio、禁止纸质**
- `✓ 同上` 禁令范围最宽：`Under no circumstance should you write any portion of the evaluation,
  nor have any involvement in its drafting or submission.` —— **代写、参与起草、参与提交三者皆禁**

**AI 停手点**：`referee_1_email` / `referee_2_email` / `referee_3_email` 一律不填、不代提交。
填入前必须先过 `recommenders.md` 的「已向推荐人本人确认其愿意写」闸口。

## AI 使用政策

- `待核实` **SEAS 本身的 AI 政策未查到**。
  ⚠️ 注意：Columbia **GSAS** 有全美最强禁令（后果：撤 offer = 终身失去 GSAS 全部项目申请资格），
  但 **SEAS 是另一个学院，不能套用**（#5：美国最小分叉粒度是学院不是学校）。
  在查清前，本产品对本项目按 **GSAS 档位从严**处理，并如实告知用户这是保守假设。

## 费用与资格（从 programs.md 下沉至此 —— evidence 列只担保 deadline）

- `待核实` 学费口径（每学分制？总学分数？Bursar 页与项目页常不一致）
- `待核实` 生活费预估
- `✓ https://www.engineering.columbia.edu/admissions-aid/graduate-admissions/how-apply/application-requirements` 申请费 **$85**，不可退：`"$85 non-refundable application fee (payable by a major credit card through the online application system)"`

## 冻结点

- `待核实` 提交后能改什么、不能改什么

## 项目级差异

### `columbia--seas--cs-ms`

#### 学历门槛

- `待核实` GRE 是否**要求** —— 该 FAQ 只回答「有没有最低分」，「要不要考」转指 SEAS 的 application requirements 页，**本次未取回该页**，故这一条不借势填掉
- 🔴 `✓ https://www.cs.columbia.edu/education/ms/appfaq/` `While there is no minimum GPA requirement to apply for admission consideration, the program is highly selective. Successful applicants typically have a GPA of 3.5 or higher.`
- `✓ https://www.cs.columbia.edu/education/ms/appfaq/` GRE 最低分：`No. Most admitted applicants, however, have scores of 750 or higher on the Quantitative section of the test.`
- `待核实` 上面那条 GRE 数字的**口径**：`750` 属 2011-08 之前的 200–800 量表（现行 GRE 数学是 130–170），该页此处疑为陈旧未更新。**未向学校核实**，故不据此做任何判断

> **这一句同时是伪保底的两半**（`CONTEXT.md`「伪保底」要求两半各自有 `✓` 事实行，此处两半住在**同一条**）：
> `no minimum GPA requirement` = 名义门槛低，`highly selective` = 方向极挤 ⇒ `pseudo_safer = yes`。
> ⚠️ 分档侧：类型 **B**（`typically` + `Successful applicants` = 录取结果），且**只给单个下界、无区间** ⇒ 天花板就是 `match`。

**英语**

- `✓ https://www.cs.columbia.edu/education/ms/appfaq/` `For Internet-based TOEFL test, we recommend a total score of 101.` 与 `For IELTS, 7 is the recommended score for admission.`

> ⚠️ **`recommend` 在这里不构成第二条线。** Columbia 在英语这个维度上**没有另一条更低的最低线**——101 是该项目唯一的线。按 `CONTEXT.md`「第二条线」的先例（UT Dallas `3.0 or better is expected`），**无第二条线可跨** ⇒ 这一条**不能**用来给本行立 `safer`，也不构成擦线（只有一条线的维度不存在擦线）。

#### 费用与资格

- `待核实（官网未列）` CIP code（用于判 STEM OPT 资格；STEM 归属是派生视图，渲染时对照 DHS 名单现算，不落盘）
  → 已实际取回 `https://www.cs.columbia.edu/education/ms/`、`https://provost.columbia.edu/content/codes-classification-instructional-programs-cip`、`https://isso.columbia.edu/content/f-1-stem-opt-extension` 三页正文，均无该事实（`research/stem-cip` 分支 2026-08-15 逐页复核结论：「Columbia CS MS 断在第一环，没有任何一次真实取回能给出这个项目的 CIP」）——这不是「没查」，是「查过没有」，故用**官网未列**后缀，不用无后缀
- `✓ https://www.cs.columbia.edu/education/ms/` 学位要求逐字：`Complete a total of 30 points (Courses must be at the 4000 level or above)`、`Take at least 6 points of technical courses at the 6000 level` —— **清单里没有任何 thesis 条目**
- `✓ https://www.cs.columbia.edu/education/ms/` PATHWAY OPTIONS 共**十条**，`MS Thesis (by faculty invite only)` 只是其中之一，与 `Machine Learning` / `Software Systems` 等并列 ⇒ **论文非必需，且需院系邀请**

> ✅ **在切片（coursework / taught master）内**，本行不用动。同一个名字 `MS in Computer Science` 在 UIUC 是 Thesis/Research 皆 Yes 的研究型硕士 —— **学位名不是切片判据**，判据是项目页上「thesis 是否 required」那一句。
