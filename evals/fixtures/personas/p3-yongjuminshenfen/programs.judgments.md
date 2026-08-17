# P3 · 判断层（6 列）

**与 `../_shared/programs.facts.md` 按 `program_key` 拼接成完整 13 列 `programs.md`**（`build.sh` 做，见 `../README.md`）。

⚠️ **单元格内禁止出现 `|`**；`tier_basis` / `tier_void_if` / `status_note` 一句话，禁换行；写不满留空、不填占位符。
🔒 **`pseudo_safer` 是纯项目属性**，与 P1/P2 同一 `program_key` 上取值恒等。

## P3 诊断目标

**一人点亮全部五档**（[#14](https://github.com/jiangxidong/EduApplication/issues/14) §3）：TOEFL 105（旧制，R29/L28/S20/W28）、后两年 GPA 3.6。

- **Cornell → `ineligible`**：口语小分 20 低于该项目单项线 22（旧制）——[#22](https://github.com/jiangxidong/EduApplication/issues/22) 的新机械规则在此点火，`tier_basis` 非空（B2/B3）
- **UIUC MCS → `safer`**：GPA 3.6 跨 Siebel `recommended 3.2`（类型 B，不单独判 safer）、TOEFL 105 跨 **Full Status(103)** 且不擦线；三条合取全满足，池内唯一（B4）
- **Columbia → `match`**：GPA 3.6 跨 3.5 这条类型 B 下界，但**该信号无区间上界可越过**，止步 match，不是 safer（B6）
- **UT Dallas → `reach`（终态）**：单线 3.0 已跨，没有第二条线可再跨
- **Northeastern Khoury → `reach`（终态，成因不同）**：只有 `Recommended` 措辞、没有另一条更低的最低线，`recommended` 本身不构成第二条线
- **Michigan → `undecided`**：事实全 `待核实`，写不出依据（B11：离线 / 稀疏池全池退化为 `undecided` 是正确输出，不报错）

| program_key | tier | status | tier_basis | tier_void_if | pseudo_safer | status_note |
|---|---|---|---|---|---|---|
| columbia--seas--cs-ms | match | shortlist | 该项目明写无最低 GPA、且公布已录取者典型 GPA 为 3.5 或以上（类型 B，单点无区间），你后两年 3.6 高于这条下界，落在录取群体区间内，但该信号没有区间上界可越过，故止步 match | 若该 FAQ 公布出区间上界数字，或撤下 3.5 这条描述 | yes |  |
| cornell--gradschool--cs-meng | ineligible | considering | Cornell CS MEng 单项分数线（旧制）要求 Speaking≥22／Reading≥20／Listening≥15／Writing≥20，你的 Speaking 为 20，低于这条线；Reading29/Listening28/Writing28 均达标 | Speaking 子分达到 22（旧制）或等效新制分数即不再是 `ineligible`——不代表届时就录取，升到哪一档要重新走一遍分档合取 | unknown |  |
| uiuc--gradcollege--mcs | safer | shortlist | 研究生院对中国申请人的线是 B Average/80%，你 GPA 显著高于；Siebel 校级最低 3.0/4.0（后两年），你后两年 3.6；TOEFL Full Status（旧制 103），你 105 跨过且不擦线；Siebel `recommended` 3.2（类型 B，单点无区间，不单独判 safer）你后两年 3.6 同样跨过 | 若成绩单换算口径大幅调低你的 GPA，或 TOEFL 复核后总分低于 103 | no |  |
| utdallas--ecs--cs-ms | reach | considering | 该项目仅公布一条线：GPA 3.0 or better is expected，你后两年 3.6 已跨过；没有第二条线可再跨，`reach` 是终态 | 若该项目日后公布第二条更高的门槛线 | no |  |
| northeastern--khoury--cs-ms | reach | considering | Khoury 仅有一条 Recommended 线（TOEFL 90 / IELTS 6.5），GPA 三条并列尺子给的也是单一基准（3.0/4.0）；TOEFL 105 远高于 90，但该线本身不构成可跨的第二条线，`reach` 是终态 | 若 Khoury 日后公布一条更高的第二线 | no |  |
| umich--rackham--cse-ms | undecided | considering |  |  | unknown |  |
