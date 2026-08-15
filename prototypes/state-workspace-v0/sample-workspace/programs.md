# 项目池

**主键 = `program_key`**（`<school>--<college>--<program>`）。每行一个项目 —— 最小分叉粒度是项目，不是学校。

**`evidence` 列只担保 `deadline` 一项。** 学费、门槛、STEM 资格、申请费在 `channels/<channel_key>.md`，各带各的标记。
`tier` / `status` 是 ASCII 枚举（中文标签属展示层）：`reach` / `match` / `safer`，`considering` / `shortlist` / `applying` / `submitted`。

⚠️ **单元格内禁止出现 `|`**（转义的 `\|` 也会被解析器切开）。需要写散文的内容一律进 `channels/`。

| program_key | school | college | program | channel_key | tier | deadline | status | evidence |
|---|---|---|---|---|---|---|---|---|
| columbia--seas--cs-ms | Columbia University | The Fu Foundation School of Engineering and Applied Science (SEAS) | MS in Computer Science | columbia--seas | reach | 待核实 | shortlist | 待核实 |
| cornell--gradschool--cs-meng | Cornell University | Graduate School / Cornell Bowers CIS | MEng in Computer Science (Ithaca) | cornell--gradschool | reach | 待核实 | shortlist | 待核实 |
| uiuc--gradcollege--cs-msc | University of Illinois Urbana-Champaign | Graduate College / Siebel School of Computing and Data Science | MS in Computer Science | uiuc--gradcollege | match | 待核实 | considering | 待核实（2026fall 核过：https://grad.illinois.edu/admissions/apply） |
