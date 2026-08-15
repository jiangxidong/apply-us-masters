# 「依据」是指向已有 `✓` 事实的指针，不是新的证据形态

> 本 ADR 由 [#16 分档的「依据」到底能填什么](https://github.com/jiangxidong/EduApplication/issues/16) 拟定，
> 交给 [#13](https://github.com/jiangxidong/EduApplication/issues/13) 时后者已关闭，草稿滞留在评论里，
> 由 [#21](https://github.com/jiangxidong/EduApplication/issues/21) 补落盘。内容按原草稿，未改。

分档需要「依据」，而分档单元格永远拿不到 `✓`（[#5](https://github.com/jiangxidong/EduApplication/issues/5)：五所样本无一公开院校分级名单）。
最自然的做法是给判断发明第三种标记——但地图已锁定证据标记为二元，
[`0001`](0001-evidence-stays-binary-with-a-closed-suffix.md) 也刚为「查了没找到」选择了后缀而非第三态。

决定：**不新增标记。一个信号可以进 `tier_basis`，当且仅当它已经是、
或能被写成 `channels/` 里一条带 `✓ <url>` 的事实行，或 `programs.md` 的 `deadline` 列。**
「事实 vs 判断」的判别式因此不是人的判断，而是**它有没有一行带 `✓` 的家**。

## Consequences

强制了顺序：**想给一个项目分档，必须先把支撑事实收集进 `channels/`**——
分档成为收集事实的副产品，而不是它的替代品。这正是「凭经验」最难混进来的地方。

`tier_basis` 放不下 URL（一句话、禁 `|`、禁换行），所以它只**点名**事实，
URL 住在 `channels/` 那条事实行上。依据与出处物理分离，但由 `✓` 连接。

唯一的例外是伪保底的 `经验：` 从句，它**不得单独成立**、且只在 `pseudo_safer=yes` 的行上合法。

## 后续

上面那条例外已由 [`0015`](0015-pseudo-safer-annotates-the-users-prior-not-the-tier.md) **删除**——正文一字未改，这里只补指针。

`0015` 把伪保底判在分档机器之外（`pseudo_safer = yes` ⇒ `tier ≠ safer`），
它的两半各自要求 `channels/` 里一条 `✓` 事实行，不再借用 `tier_basis`。
于是本 ADR 的准入测试**不再有任何例外**：`tier_basis` 里不存在零出处从句。
