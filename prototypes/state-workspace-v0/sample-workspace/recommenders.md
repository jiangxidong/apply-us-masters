# 推荐人（🔴 红线区）

> **AI 在本文件里只做两件事：整理素材、记录状态。**
> 不代填推荐人邮箱、不代提交、不代勾选导入、不以推荐人名义发任何邮件。

## 候选人

| id | 姓名（虚构） | 关系 | 能证实什么 | 已确认愿意写 | 联系方式在手 |
|---|---|---|---|---|
| R1 | 王教授 | 本科毕设导师 | 素材 02 的学术表现；毕设全过程 | ❌ **未确认** | 是 |
| R2 | 陈 leader | 现直属主管 | 素材 01 的全部四要素 | ❌ **未确认** | 是 |
| R3 | 李老师 | 交换期间授课教师 | 素材 02 的课堂表现 | ❌ **未确认** | 否 |

**「推荐人能否证实这条主张？」是一列，不是一句提醒。** 写不进这一列的主张，不要写进推荐信素材包。

## 🔴 提交前人工确认闸口

> **必须由申请人本人向推荐人确认其愿意写，并在此打勾，agent 才允许进入任何涉及推荐人邮箱的步骤。**

- [ ] R1 已确认
- [ ] R2 已确认
- [ ] R3 已确认

**闸口未全部打勾 → 三校推荐信流程一律阻塞。**（当前打勾数跑 `../derive-demo.sh` 现算，不写在这里。）
这与官方指引方向一致（UCL 反复强调 `contact your nominated referee(s) before starting your application`）。

## 逐校机制状态（三校三种机制，不能一刀切）

| 项目 | 机制 | 风险类型 | 需要几封 | AI 停手在哪 |
|---|---|---|---|---|
| `columbia--seas--cs-ms` | 系统 → 推荐人，**填入即可能已发** | A 冒名发信 | 3 | 不填 `referee_*_email`；禁 Interfolio |
| `cornell--gradschool--cs-meng` | 系统 → 推荐人；接受 Interfolio | A 冒名发信 | 在读生 1 封，第 2 位官方允许填 `filler` | 不填邮箱；**`reference_delivery_method` 选错不可逆，不代选** |
| `uiuc--gradcollege--cs-msc` | 系统 → 推荐人；**可导入旧申请的信** | **B 冒名复用** | 待核实 | 不填邮箱；**不代勾 `reference_import_previous`**；不代勾 `ferpa_waiver_checkbox` |

## AI 停手字段清单（全局）

`referee_*_email` / `referee_details` / `reference_import_previous` / `ferpa_waiver_checkbox` /
`reference_delivery_method` / `publication_verifier_email`

⚠️ 最后一个极易被漏：Columbia 的 Publications 项要求填**一位可证实参与的教授邮箱**——
这是同一份申请里的**第二个第三方邮箱字段**。

## 两个必须容忍的合法例外（否则会误判）

1. **Cornell + Interfolio**：官方指引就是把 Interfolio 生成的 custom document e-mail address
   填进推荐人邮箱栏。一律当真人邮箱拦截会在合法路径上误判。
2. **Cornell 占位值**：在读生只需 1 封，官方指引在第 2 位推荐人处 `enter a "filler"`。

支持深度（support pack 还是草稿、中国场景下教授让学生自己起草怎么办、多封信如何差异化）
→ [#12 推荐信在 v1 里做到什么程度](https://github.com/jiangxidong/EduApplication/issues/12)。
