---
name: apply-us-master
description: 极小 frontmatter，仅供 skills-never-cite-evals 夹具测试
license: MIT
allowed-tools: Read
---

# apply-us-master（故意写坏的夹具：skills-never-cite-evals）

样例见 `evals/fixtures/personas/`——本句违反 ADR 0010 流向红线：任何 `SKILL.md` 不得引用 evals/；样例档案的「活」来自回归套件每次跑它，不来自被 `SKILL.md` 引用（流向方向是「测试 → 产物」，不是「产物 → 示例」）。

回归测试见 `evals/checks/check-workspace.sh` 的输出——本句同样违反同一条红线，是本夹具刻意写坏的第二处。
