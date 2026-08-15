# 项目池是唯一实体，`status` 是唯一状态轴

[#11](https://github.com/jiangxidong/EduApplication/issues/11) 的原型草拟过一个 `决定` 列（`投` / `待定` / `不投`），与 [#4](https://github.com/jiangxidong/EduApplication/issues/4) 已有的 `status` 列并存。两者断言的是同一件事，留着必然漂移——用户改了一边不改另一边，就出现「决定=投、status=considering」这种无法裁决的行。

决定：**只有项目池一个实体，`status` 一个状态轴**。`决定` 列废弃。「选校清单」与「投递名单」不是另外的表，是项目池按 `status` 过滤出的**派生视图**，不落盘。

`shortlist → applying` 的切换点定在**做出「投」这个决定的那一刻**，不是坐下来填网申的那一刻。

## Consequences

[#11](https://github.com/jiangxidong/EduApplication/issues/11) 定的定稿闸门（`status ∈ {applying, submitted}` 且 `deadline = 待核实` → 报错）因此在**拍板时**响，而不是在填表时响。这是选这个切换点的主要理由：等到填表才告知「你连截止日都没核实」，那时文书已经写完，纠正成本最高。
