---
program_key: cornell--gradschool--cs-meng
channel_key: cornell--gradschool
season: 2027fall
generated: 2026-08-15
source_fingerprint:
  apply.md: 1721676589-2821
  profile.md: 2531006322-2654
  programs.md: 3219980832-2660
  claims.md: 2294360780-5454
  recommenders.md: 3627732816-11901
  essays/canonical/long.md: 1603118701-364
  essays/canonical/points.md: 470119277-1264
  channels/cornell--gradschool.md: 3355008193-8617
---

# 提交动线 — Cornell MEng in Computer Science

> 🔴 **这一层整包重生成，绝不就地改。** 在本包里直接改内容，下次重生成时**静默丢失**。
> 要改内容改真相源（`essays/canonical/` / `profile.md` / `channels/`），然后重生成。
> 上面 `source_fingerprint` 记的是**生成那一刻源是什么样**（历史观察值，同 `log.md` 的豁免），
> 进入准备包阶段先比对：不一致 → 整包删了重生成；一致 → 直接用。

> 🔴 **读法**：**本包只渲染本季（2027fall）已取证的约束。** 凡真相源里尚未取证的，在包里一律以 **⬜** 出现。
> 包里不出现 `✓`，也不出现「待核实」这四个字——那两个词是真相源的词汇，转述进来就是镜像。
> 每条学校约束都带 `←` 指针指回真相源；渲染时缺一条约束**不能就地补在这里**，
> 必须回 `channels/` 的对应节，那一节不归准备包阶段就转缺口清单（#23 §11.3）。
> 跑 `../../trace-packet.sh` 机械检查。

> ⚠️ 上面 frontmatter 的 `season` 是**标签，不是判据**（`CONTRACT.md` §4）。它只说「这个包是哪一季生成的」。
> 判据是各真相源 frontmatter 里 `season_downgraded` 的行与 `apply.md` 的 `season` 之差 —— 见文末「本季待复核」。

> **本包停在提交前。** 最后一段是「你自己点提交」，agent 不越过它。

## 怎么用

电脑上左右并排：左边 portal，右边本文件，从上往下走。每段标题带一个状态标记：

| 标记 | 含义 |
|---|---|
| 🟢 | **可直接粘贴** —— 答案已备好 |
| 🛑 | **交还控制权** —— 停手线字段。agent 只说该做什么，**不给可粘贴的值** |
| ⬜ | **缺** —— 没有答案。括号里是缺的原因与下一步 |
| ⛔ | **本校明令不收** —— 别交，交了违规 |

⚠️ 这里不写「已完成 12/17」这类计数——那是镜像，靠改写才能维持为真（`CONTRACT.md` §1 判别式）。

## 🛑 本包的交还点（共 3 处）

| 段 | 为什么交还 | 不可逆？ |
|---|---|---|
| **1. 平台与账号** | 停手线动作类 ①「替用户登录」 | 否 |
| **4. Recommendations** | 停手线动作类 ⑥「以推荐人名义发邀请」 | 🔴 **是**——信发出去收不回 |
| **8. Submission** | 停手线动作类 ④⑤「付申请费 / 点提交」 | 🔴 **是**——本校付费即冻结 |

🔴 **第 4 段在 portal 上排第 4，但在时间上必须最先想清楚**：本包两个不可逆点里，先撞上的是它。

---

## 0. 冻结点 —— 🔴 先读这一段再动手

- **付费 = 提交的最后一步；付费或提交 waiver 之后完全不能再改**
  ← `channels/cornell--gradschool.md § 冻结点`

**这一校没有「提交后再补」的窗口**，所以下面每一段的 ⬜ 都必须在走到第 8 段之前清掉。
（对照：UIUC 是先提交后付费，语义相反 —— 见 `packets/uiuc--gradcollege--cs-msc/README.md` 第 0 段。）

---

## 1. 平台与账号 🛑

- 平台 = ApplyWeb（CollegeNET） ← `channels/cornell--gradschool.md § 平台与账号`
- ⬜ 注册表字段（登录墙后，公开页拿不到） ← 同上

**🛑 注册、建号、登录全部由你本人完成。** 建好号后回来继续第 2 段。

---

## 2. Program 🟢

| portal 上的字段 | 你填什么 | 来源 |
|---|---|---|
| `apply to major fields only` / Program | MEng in Computer Science (Ithaca) | ← `programs.md:cornell--gradschool--cs-meng` |

---

## 3. Transcripts 🟢 ⬜

**该校规格** ← `channels/cornell--gradschool.md § 材料上传`：

- 同一份成绩单的多页**必须合并成一个文件**
- 格式 PDF / TIFF / JPEG / GIF，**不收 Word**
- 单文件 ≤ **10MB**
- 质量 `clear and easy to read`；加密件必须先打印再扫描
- 申请阶段传**非官方件**，官方件录取后才交
- 翻译件认证等级：**certified or notarized**
- 🔴 **含 SSN 的成绩单禁止上传** —— 涂黑 / 划掉 / 遮盖要在**扫描之前**做，扫完再涂等于没涂
- 🔴 **加密 / 密码保护的文件系统不接受** —— 这是上面「加密件必须先打印再扫描」那条的**原因**。
  直接转发学校发来的加密官方电子成绩单（e-transcript）会失败
- 🟢 **第三方渠道也收**：由 IIE、Amideast 认证并直接上传，或经 SOPHAS / VMCAS / LSAC 提交的成绩单，本校接受。
  ⚠️ 与 Columbia「明文禁止本人以外任何人代交」口径**相反**——「中介路径是否关闭」逐校不同，别写一套通用判断

| 要交的东西 | 从 canonical 怎么来 | 状态 |
|---|---|---|
| 本科成绩单 | `documents/transcript/<institution_id>/page-NN.pdf` → **合并成一个 PDF**、保持清晰 | ⬜ `documents/transcript/` 为空 |
| 交换成绩单 | 同上，交换院校单独一份 | ⬜ 同上 |
| 学位证 | `documents/degree/<institution_id>.pdf` | ⬜ 条件必填（境外学历） |
| 翻译件 | `documents/translation/<institution_id>/`，需 certified 或 notarized | ⬜ ← `profile.md § 待补充的 canonical 事实` 第 2 项 |

**降级方向**：canonical 是逐页高分辨率彩色，给这里**合并 + 保清晰**；给 UIUC 反向降到 <200dpi 灰度。
降级可逆，升级不可逆 —— 别反过来存。

🔴 **SSN 那条的落点是「落槽位时」提醒，不是「不读」**（`CONTRACT.md` §1.3）：成绩单不在禁读区，
但凡提醒能提前到打开文件之前就必须提前——误读不可补救。

---

## 4. Recommendations 🛑 —— 🔴 本包最早必须想清楚的一段

**该校机制** ← `channels/cornell--gradschool.md § 推荐信机制`：

- 系统 → 推荐人（发含链接的在线表单）
- ⬜ 触发时点（官方页未写何时发信）→ **按「填入即已发信」的保守假设操作**
- 需要 **2–3 封**，按 field 定
- 接受 **Interfolio**（CS M.Eng. apply 页专属指引）；🔴 不要勾 "Letter will be mailed"——勾了系统就不给推荐人发请求

**🛑 以下字段 agent 一律不填、不代选，本包不给可粘贴的值**：

| portal 字段 | 为什么停手 |
|---|---|
| `referee_details` / `referee_1..3_email` | 填入即可能触发发信 |
| `reference_delivery_method`（Interfolio / 在线 / By Mail） | 🔴 **AI 不得代选；选错后能否更正官方页未写** ← `channels/cornell--gradschool.md § 推荐信机制` |
| `ferpa_waiver_checkbox` | 影响推荐人对保密性的预期，不代勾 |

**两个必须容忍的合法例外** ← `channels/cornell--gradschool.md § 推荐信机制`：

1. 用 Interfolio 时，官方指引就是把 **Interfolio 生成的 custom document e-mail address 填进推荐人邮箱栏**，
   取代推荐人本人邮箱。这是合法路径，别当成异常。
2. 在读生只需 1 封，官方指引在第 2 位推荐人处 `enter a "filler"`。占位内容是官方认可的。

**你现在要做的**：先向 r1 / r2 / r3 本人确认愿意写，回 `recommenders.md` 打勾。
⬜ **三人当前都是「未确认」** ← `recommenders.md § 提交前人工确认闸口` → 闸口未全部打勾，这一段不能动。

**给推荐人的 support pack** 每**推荐人**一份、跨项目复用，是不落盘的派生视图，**不在本包里**。

---

## 5. Statements 🟢 ⬜

**该校规格** ← `channels/cornell--gradschool.md § 文书规格`：
**两篇独立文书，不是一篇**。Academic Statement of Purpose 一到两页；Personal Statement 另一篇，分工不同。

| portal 字段 | 交什么 | 状态 |
|---|---|---|
| `statement_of_purpose` | `essays/academic-sop.md` | 🟢 已渲染（源 `essays/canonical/long.md` v1，裁到两页、去掉个人动机段） |
| `personal_statement` | `essays/personal-statement.md` | ⬜ 源 `essays/canonical/points.md` 只有 `§ 个人背景 / 逆境` 可用，`§ 多样性 / 贡献` 与 `§ 职业目标` 是空节 |

⚠️ **why this program 段缺失 = 警告放行，不报错**（← [#18](https://github.com/jiangxidong/EduApplication/issues/18) 两级闸门）。
`essays/canonical/per-program/cornell--gradschool--cs-meng.md` 不存在。
本校 portal 没有单独一问；若要嵌进 SOP，拼接配方归 `channels/ § 文书规格`，**不进本包**（#18 §6 / #23 §11.1）。

---

## 6. 附加材料 ⛔ —— 本校明令不收

`Publications, award certificates, resumes, theses, and similar materials` —— 除非 field 事先批准，否则不允许；
获批的材料要**直接寄给 graduate field**，不寄 Graduate School。
← `channels/cornell--gradschool.md § 材料上传`

🔴 **连简历都不收**（准确说：`不允许(除非 field 事先批准)`）。对照 UIUC：`cv_upload` 是 `条件必填(多数项目)`。
同一个 `documents/cv/` 槽位，**两校默认值相反**——这是「canonical + 逐校 rendering rules」
而不是「逐校成品」最直观的那条理由。
⚠️ 两边都带条件，**不要把它说成「互斥」**；正当性锚在**降级不可逆**（#14），不锚在互斥。

---

## 7. Test Scores 🟢 ⬜

| portal 字段 | 你填什么 | 来源 / 状态 |
|---|---|---|
| `english_test_report_upload` | TOEFL iBT 102（R28 L27 S22 W25，2025-12-06） | ← `profile.md § 英语`。⬜ 本校 speaking 单项下限 |
| `test_score_institution_code` | 🟢 **2098** | ← `channels/cornell--gradschool.md § 材料上传` |
| `gre_score` | — | ⬜ GRE 是否要求 ← `channels/cornell--gradschool.md § 项目级差异` |

⚠️ 送分**不需要 department code**；ETS 若强制要选，官方允许选 `"0000 undecided"`。同一条约束，同一个指针。
🔴 机构代码这条**归 `## 材料上传`，不归 `## 费用与资格`**（[#39](https://github.com/jiangxidong/EduApplication/issues/39) 改派）：
判据是 `CONTRACT.md` §1.2 的「归属判据是消费方」——选校阶段不依赖一个 ETS 机构代码做任何决策，
而它与同节的第三方成绩单渠道**同形状**（第三方 + 一份材料 + 一条渠道地址）。

---

## 8. Submission 🛑 —— agent 到此为止

| portal 字段 | 为什么停手 |
|---|---|
| `application_fee_payment` | 停手线动作类 ④「付申请费」。⬜ 金额与减免条件 ← `channels/cornell--gradschool.md § 费用与资格` |
| `application_fee_waiver` | 需你本人陈述资格 |
| **点提交** | 停手线动作类 ⑤ |

🔴 **本校付费即冻结。** 走到这一步之前，把上面所有 ⬜ 清掉。

---

## 本次渲染发现的缺口（🔴 已转缺口清单，不在本包里补）

按 #23 §11.3：准备包阶段渲染时发现缺一条约束，**不得就地补进 `packets/`**。
回 `channels/` 的对应节；那一节不归准备包阶段就转缺口清单，并在下表列出。

| 缺的约束 | 该落哪个节 | 该节 owner | 出处 |
|---|---|---|---|

🔴 **空表是本次重生成的正确结果，不是漏填。** 上一版列的五条（SSN 涂黑 / 加密件禁传 /
附加材料禁止 / 送分机构代码 / 第三方成绩单渠道）已由 [#39](https://github.com/jiangxidong/EduApplication/issues/39)
全部回填进 `channels/cornell--gradschool.md § 材料上传`，本次渲染没有再长出任何一条 `channels/` 里没有的约束。
⚠️ 上一版第 4 行把送分机构代码的节与 owner **都写错了**（`## 费用与资格` / 选校），#39 已改派；
本次不是「把那一行划掉」，是整包按现行 `channels/` 重生成。

⚠️ `documents/` 的路径要 `institution_id`，定义权在 `profile.md` 的学历条目（`CONTRACT.md` §1.1；
样例学历表已有该列，值 `i1` / `i2`）。本包 `documents/` 表格用 `<institution_id>` 占位——
逐院校展开发生在真正准备材料时，包不预展开、不自己发明值。

## 本季待复核（🔴 与上面那张表不是一回事）

按 `CONTRACT.md` §4：某个 owner 的 `season_downgraded` 行**落后于** `apply.md` 的 `season` 时，
它那几节的证据是上一季取的，本包里由它供着的断言必须渲染成**带上季链接的 ⬜**——不是裸 ⬜，
更不是原样断言。缺口表答「`channels/` 少了什么」，本表答「`channels/` 有的东西过没过期」，两件事。

| 落后的 owner | 它在本包里供着哪几段 | 落后到哪一季 |
|---|---|---|

🔴 **空表是本次重生成的正确结果。** `channels/cornell--gradschool.md` 的五行与 `programs.md` 的一行
`season_downgraded` **全部是 2027fall**，与 `apply.md` 的 `season` 齐平，没有任何 owner 落后。
机械凭据：`../../trace-packet.sh` 第 [5] 项对这两个文件都不打 ⏳ 行。
