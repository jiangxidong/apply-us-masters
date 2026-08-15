# 项目池

**主键 = `program_key`**（`<school>--<college>--<program>`）。每行一个项目 —— 最小分叉粒度是项目，不是学校。

**`evidence` 列只担保 `deadline` 一项。** 学费、门槛、STEM 资格、申请费在 `channels/<channel_key>.md`，各带各的标记。
**判断层四列（`tier_basis` / `tier_void_if` / `pseudo_safer` / `status_note`）一律不被 `evidence` 担保**——它们是判断，永远拿不到 `✓`。

`tier` / `status` 是 ASCII 枚举，中文标签属展示层。**取值与判别式全在 `CONTEXT.md`，本文件不复述**——
复述过一次就得跟着 [#22](https://github.com/jiangxidong/EduApplication/issues/22) 的五档改一次，那正是镜像判别式要删掉的东西。
13 列的完整 schema 见 `CONTRACT.md` §4.6。

⚠️ **单元格内禁止出现 `|`**（转义的 `\|` 也会被解析器切开）。需要写散文的内容一律进 `channels/`。
自由文本三列写不满就**留空**，不填 `无` / `N/A` 之类的占位符——占位符会被「有值没值」这类检查当成有值。

| program_key | school | college | program | channel_key | tier | deadline | status | evidence | tier_basis | tier_void_if | pseudo_safer | status_note |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| columbia--seas--cs-ms | Columbia University | The Fu Foundation School of Engineering and Applied Science (SEAS) | MS in Computer Science | columbia--seas | undecided | 待核实 | shortlist | 待核实 |  |  | unknown |  |
| cornell--gradschool--cs-meng | Cornell University | Graduate School / Cornell Bowers CIS | MEng in Computer Science (Ithaca) | cornell--gradschool | undecided | 待核实 | shortlist | 待核实（口径不清） |  |  | unknown |  |
| uiuc--gradcollege--cs-msc | University of Illinois Urbana-Champaign | Graduate College / Siebel School of Computing and Data Science | MS in Computer Science | uiuc--gradcollege | reach | 待核实 | considering | 待核实（2026fall 核过：https://grad.illinois.edu/admissions/apply） | 研究生院对中国申请人的线是 B Average/80%，你加权 84.6 | Siebel School 另设了高于研究生院的项目级门槛，或成绩单换算口径不是 80/100 制 | unknown |  |
