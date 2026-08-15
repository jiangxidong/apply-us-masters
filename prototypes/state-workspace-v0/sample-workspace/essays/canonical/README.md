# 文书 canonical 层

**当前版永远在稳定路径 `essays/canonical/<name>.md`**，所以 `channels/` 的渲染规则可以直接引用它，不用追版本号。
历史版本进 `_versions/`（见那里的 README）。

## frontmatter 的 `claims:`

每篇 canonical 渲染物的 frontmatter 写 `claims: [c01, c03]`，指向工作区根 `claims.md` 的 `claim_id`。

**这条边只存在消费端**：`claims.md` **不设 `used_in` 列**——两端都存必漂移
（[#21](https://github.com/jiangxidong/EduApplication/issues/21)、
[ADR 0006](https://github.com/jiangxidong/EduApplication/blob/main/docs/adr/0006-claims-are-one-shared-truth-source.md)）。
**文书是从主张清单里选，不是发明主张**，因此全局主张集 ⊇ 任一篇文书用到的集合。

**素材门槛的作用域是「进了成稿的主张」**：`claims.md` 里 `materials` 为空的主张（本样例的 `c04` / `c05`）
**不许出现在这里的任何 `claims:` 里**。跑 `../../../derive-demo.sh` 会把这条当场校出来。

## 本样例里三篇的分工

| 文件 | `render_form` | 存在的理由 |
|---|---|---|
| `long.md` | `long` | 信息量最大的一侧，短版本从它裁、**不反过来** |
| `short-250.md` | `short-250` | **不是长文的摘要**，是独立成篇的 250 词版本 |
| `points.md` | `points` | UIUC 要 4 段互相独立的回答，从长文自动截会得到四段互相重复的碎片 |

## 为什么没有 `per-program/`

`CONTRACT.md` §1.1 第 8 行的 `essays/canonical/per-program/<program_key>.md`
（逐项目 why-this-program 内容，[#18](https://github.com/jiangxidong/EduApplication/issues/18) 定的一项目一文件）
**在本样例里不存在，这是有意的，不是漏填**：

- 虚构申请人的文书阶段停在 canonical 层，尚未为任何 `program_key` 写过 why 段；
- 全工作区一律**不预建空目录**（同 `packets/`、`documents/`）——**目录的缺席本身是信息**；
- why 段的两道闸也还没有可演示的对象：X 半句（学校具名事实）要先落 `channels/` 的
  `## 项目级差异` 并带 `✓`，而本样例那 9 行**全部是 `待核实` 占位行**。
  在这种状态下写 why 段，正是 #18 定的**报错**场景。

`per-program/` 一旦创建，owner 按 §1.4 的前缀继承规则自动归**文书**阶段（最近祖先目录是 `essays/canonical/`），
不需要显式指派。
