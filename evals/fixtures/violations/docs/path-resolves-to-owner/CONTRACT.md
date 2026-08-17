# 状态层文件契约（故意写坏的夹具：path-resolves-to-owner）

`path-resolves-to-owner` 必须对本文件翻红，否则它是恒真的（ADR 0017 推论 2）。
违规点：① `notes.md` 一行 owner 列留空——§1.4 要求契约里出现的每个路径都能解析到一个
owner 阶段（自身或祖先目录），空 owner 落不到任何阶段（爪 1）；② 正文散文里出现
`scratch/tmp.md`——它不落本表任何一条路径的祖先前缀，是一条找不到 owner 的路径字面量（爪 2）。

## 1. 文件清单与归属

### 1.1 四个文件（极小形状，仅供本夹具测试）

| # | 路径 | 格式 | 真相源身份 | owner 阶段 |
|---|---|---|---|---|
| 1 | `apply.md` | frontmatter | 工作区标识 | **冷启动** |
| 2 | `log.md` | Markdown，append-only | 跨会话交接 | `append-only` |
| 3 | `drafts/<recommender_id>.md` | Markdown | C 档推荐信草稿 | **推荐信** |
| 4 | `notes.md` | Markdown | 随手记 |  |

**阴性对照**（合法，不应计入 FAIL）：`drafts/r1.md`、`drafts/r2.md`、`drafts/r3.md`、
`drafts/r4.md` 都落在 `drafts/<recommender_id>.md` 派生出的前缀之下，应正常解析——本夹具
故意多写几条合法引用，避免候选总数撞见「候选 <5 = exit 2」这条提取活性自证阈值。

散文里混进一条不属于任何声明路径的引用——`scratch/tmp.md` 只是随手写的调试文件，
不在上表任何一条路径的祖先目录/自身范围内，理应翻红。
