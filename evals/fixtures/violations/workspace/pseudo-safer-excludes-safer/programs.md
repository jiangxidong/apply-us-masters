---
season_downgraded:
  选校: 2027fall
---

# 项目池（翻红夹具：pseudo-safer-excludes-safer）

从 `sample-workspace/programs.md` 抄表头 + 分隔 + 第一条数据行，把该行 tier 改成 `safer`、
pseudo_safer 改成 `yes`（ADR 0015 判「禁止共存」，这一行同时踩两边）。

| program_key | school | college | program | channel_key | tier | deadline | status | evidence | tier_basis | tier_void_if | pseudo_safer | status_note |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| columbia--seas--cs-ms | Columbia University | The Fu Foundation School of Engineering and Applied Science (SEAS) | MS in Computer Science | columbia--seas | safer | 待核实 | shortlist | 待核实 | 该项目明写无最低 GPA、且公布录取者典型 GPA 为 3.5 或以上，你校内换算 3.4 低于这条下界 | 若成绩单换算口径把加权 84.6 判到 3.5 以上，或该 FAQ 撤下 / 改写 3.5 这条下界 | yes |  |
