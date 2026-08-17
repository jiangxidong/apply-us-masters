# 共享项目池 · 事实层（7 列）

**本文件与 `programs.judgments.md`（各 persona 目录下，6 列）由 `build.sh` 按 `program_key` 拼接成完整 13 列
`programs.md`**（`CONTRACT.md` §4.6）。列序拼接后必须是：
`program_key | school | college | program | channel_key | tier | deadline | status | evidence | tier_basis | tier_void_if | pseudo_safer | status_note`——
判断层四列（此处只贡献 `tier` / `status` 之外的 `tier_basis` / `tier_void_if` / `pseudo_safer` / `status_note`）追加在事实列之后。

🔒 **事实层与判断层的切分依据是 `CONTRACT.md` §4.6 的「被 `evidence` 担保」列**：`school` / `college` / `program` / `channel_key` /
`deadline` / `evidence` 六列是**关于项目本身的、与申请人无关**的事实，三个 persona 应当逐字相同——这正是 [#14](https://github.com/jiangxidong/EduApplication/issues/14) §6
「`channels/` 与 `programs.md` 的事实列只写一份，构建脚本展开成三个完整工作区」那条决定在 `programs.md` 侧的落地。
`tier` / `status` / `tier_basis` / `tier_void_if` / `pseudo_safer` / `status_note` 六列是**每个 persona 自己的判断**，住
`programs.judgments.md`，不在本文件。

⚠️ **单元格内禁止出现 `|`**（转义的 `\|` 也会被解析器切开）。需要写散文的内容一律进 `channels/`。
`deadline` 与 `evidence` 两列**全部留 `待核实`**——本次调研没有任何一条能对齐到 `2027fall` 这一季（沿用/新增的原始调研均发生在
更早或更晚的申请周期，把它们贴到 `2027fall` 头上会是凭记忆造 `✓`，见票面「任何与规则源不符停手回报」纪律）；
六渠道文件各自的 `冻结点` / `硬约束` 节里如有可独立于具体日期成立的机制事实（如 Northeastern 的「固定截止 + 滚动出结果并存」），
已带各自的 `✓` 落在渠道文件，不在本文件重复。

| program_key | school | college | program | channel_key | deadline | evidence |
|---|---|---|---|---|---|---|
| columbia--seas--cs-ms | Columbia University | The Fu Foundation School of Engineering and Applied Science (SEAS) | MS in Computer Science | columbia--seas | 待核实 | 待核实 |
| cornell--gradschool--cs-meng | Cornell University | Graduate School / Cornell Bowers CIS | MEng in Computer Science (Ithaca) | cornell--gradschool | 待核实 | 待核实（口径不清） |
| uiuc--gradcollege--mcs | University of Illinois Urbana-Champaign | Graduate College / Siebel School of Computing and Data Science | Master of Computer Science (MCS, Urbana-Champaign) | uiuc--gradcollege | 待核实 | 待核实（2026fall 核过：https://grad.illinois.edu/admissions/apply） |
| utdallas--ecs--cs-ms | The University of Texas at Dallas | Erik Jonsson School of Engineering and Computer Science (ECS) | MS in Computer Science | utdallas--ecs | 待核实 | 待核实 |
| northeastern--khoury--cs-ms | Northeastern University | Khoury College of Computer Sciences | MS in Computer Science | northeastern--khoury | 待核实 | 待核实 |
| umich--rackham--cse-ms | University of Michigan | Rackham Graduate School / College of Engineering (CSE) | MS in Computer Science and Engineering | umich--rackham | 待核实 | 待核实 |
