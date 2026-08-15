# 历史版本

开新版前：把 `essays/canonical/<name>.md` 拷成 `_versions/<name>.vN.md`，然后**原地改**当前版。

- 当前版永远在稳定路径 `essays/canonical/<name>.md` —— 所以 `channels/` 的渲染规则可以直接引用它，不用追版本号
- 历史版本**只增不改不删**
- **不依赖 git 历史**：用户可能根本不在 git 仓里跑这套东西

当前无历史版本（`long.md` / `short-250.md` / `points.md` 都还是 v1）。

何时该开新版本、两版怎么对比 → [#10](https://github.com/jiangxidong/EduApplication/issues/10)。
