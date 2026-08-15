# 文书 canonical 层

**当前版永远在稳定路径 `essays/canonical/<name>.md`**，所以 `channels/` 的渲染规则可以直接引用它，不用追版本号。
历史版本进 `_versions/`（见那里的 README）。

## frontmatter 的 `claims:`

每篇 canonical 渲染物的 frontmatter 写 `claims: [c01, c03]`，指向工作区根 `claims.md` 的 `claim_id`。

**这条边只存在消费端**：`claims.md` **不设 `used_in` 列**——两端都存必漂移
（[#21](https://github.com/jiangxidong/EduApplication/issues/21)、
[ADR 0006](https://github.com/jiangxidong/EduApplication/blob/main/docs/adr/0006-claims-are-one-shared-truth-source.md)）。
**文书是从主张清单里选，不是发明主张**，因此全局主张集 ⊇ 任一篇文书用到的集合。

**素材门槛的作用域是「进了成稿的主张」**：`claims.md` 里 `materials` 为空的主张
**不许出现在这里的任何 `claims:` 里**。跑 `../../../derive-demo.sh` 会把这条当场校出来。

## 三种形态的分工

**形态轴与版本轴正交，别塌成一维**：一篇文书换个形态不是换个版本。

| 文件 | 存在的理由 |
|---|---|
| `long.md` | 信息量最大的一侧，短版本从它裁、**不反过来** |
| `short-250.md` | **不是长文的摘要**，是独立成篇的 250 词版本——摘要读起来像目录 |
| `points.md` | 短答题结构（如 UIUC 4×250）要的是互相独立的回答，从长文自动截会得到四段互相重复、且都缺头缺尾的碎片 |

形态由**文件名**承载（`CONTRACT.md` §5），frontmatter **不另存**形态键。

有哪几篇、各是什么形态，`ls` 一看就知道，**不在这里记**。

## 为什么没有 `per-program/`

`CONTRACT.md` §1.1 第 8 行的 `essays/canonical/per-program/<program_key>.md`
（逐项目 why-this-program 内容，[#18](https://github.com/jiangxidong/EduApplication/issues/18) 定的一项目一文件）
**目录缺席说明还没为任何 `program_key` 写过 why 段，不说明漏填**：

- 全工作区一律**不预建空目录**（同 `packets/`、`documents/`）——**目录的缺席本身是信息**；
- why 段有**前置条件**，不是随时能写：X 半句（学校具名事实——课程号、教授、实验室）
  必须先带 `✓` 落进 `channels/` 的 `## 项目级差异`，散文只引用。
  该项目的那几行还停在 `待核实` 时写 why 段，正是 #18 定的**报错**场景，不是可以先写着的东西。

`per-program/` 一旦创建，owner 按 §1.4 的前缀继承规则自动归**文书**阶段（最近祖先目录是 `essays/canonical/`），
不需要显式指派。
