# P1 · 判断层（6 列）

**与 `../_shared/programs.facts.md` 按 `program_key` 拼接成完整 13 列 `programs.md`**（`build.sh` 做，见 `../README.md`）。
本文件只装**判断**：`tier` / `status` / `tier_basis` / `tier_void_if` / `pseudo_safer` / `status_note`——
六列全部随申请人变化，三个 persona 各自一份，不共享。

⚠️ **单元格内禁止出现 `|`**；`tier_basis` / `tier_void_if` / `status_note` 一句话，禁换行；写不满留空、不填占位符。
🔒 **`pseudo_safer` 是纯项目属性**（`CONTEXT.md`「伪保底」：「两半都在项目侧、零申请人输入」），
三个 persona 在同一 `program_key` 上的取值因此**恒等**——本文件的 `pseudo_safer` 列与 P2/P3 同一行逐字相同，
差的只是 `tier` / `status` / `tier_basis` / `tier_void_if` / `status_note`。

## P1 诊断目标

完整 happy path：TOEFL 102（旧制）在 UIUC MCS **擦 Full Status(103) 线**——① GPA 3.4 跨 UIUC 硬门槛 3.0 与 MCS `recommended` 3.2 ②
UT Dallas / Northeastern 两处**终态 `reach`**，成因不同 ③ Cornell 语言小分**全部达标**（与 P3 同一维度、不同结果，形成对照）。

| program_key | tier | status | tier_basis | tier_void_if | pseudo_safer | status_note |
|---|---|---|---|---|---|---|
| columbia--seas--cs-ms | reach | shortlist | 该项目明写无最低 GPA、且公布录取者典型 GPA 为 3.5 或以上（类型 B，单点无区间），你后两年换算 3.4 低于这条下界 | 若成绩单换算口径把加权 84.6 判到 3.5 以上，或该 FAQ 撤下/改写 3.5 这条下界 | yes |  |
| cornell--gradschool--cs-meng | reach | shortlist | Cornell CS MEng 单项分数线（旧制）要求 Speaking≥22／Reading≥20／Listening≥15／Writing≥20，你的 S22/R28/L27/W25 全部达标；该维度只有一条线，不构成可跨的第二条线，也不擦线 | 若该项目公布 GPA 或其他维度的硬门槛且你未达标 | unknown |  |
| uiuc--gradcollege--mcs | reach | considering | 研究生院对中国申请人的线是 B Average/80%，你加权 84.6；Siebel 校级最低 3.0/4.0（后两年），你后两年 3.4；TOEFL 102（旧制）跨过 Limited Status(79) 但**未跨过 Full Status(103)**——该维度擦线，合取第③项不满足 | 若下一次 TOEFL 复核分数达到 103（Full Status），仍需重新走一遍分档合取，不直接升 safer | no |  |
| utdallas--ecs--cs-ms | reach | considering | 该项目仅公布一条线：GPA 3.0 or better is expected，你后两年 3.4 已跨过；没有第二条线可再跨，`reach` 是终态 | 若该项目日后公布第二条更高的门槛线 | no |  |
| northeastern--khoury--cs-ms | reach | considering | Khoury 仅有一条 Recommended 线（TOEFL 90 / IELTS 6.5），GPA 三条并列尺子给的也是单一基准（3.0/4.0）；没有第二条更高的公开线可跨，`reach` 是终态，不因分数高而改变 | 若 Khoury 日后公布一条更高的第二线 | no |  |
| umich--rackham--cse-ms | undecided | considering |  |  | unknown |  |
