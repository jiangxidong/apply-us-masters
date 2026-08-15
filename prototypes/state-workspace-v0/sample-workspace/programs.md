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
| columbia--seas--cs-ms | Columbia University | The Fu Foundation School of Engineering and Applied Science (SEAS) | MS in Computer Science | columbia--seas | reach | 待核实 | shortlist | 待核实 | 该项目明写无最低 GPA、且公布录取者典型 GPA 为 3.5 或以上，你校内换算 3.4 低于这条下界 | 若成绩单换算口径把加权 84.6 判到 3.5 以上，或该 FAQ 撤下 / 改写 3.5 这条下界 | yes |  |
| cornell--gradschool--cs-meng | Cornell University | Graduate School / Cornell Bowers CIS | MEng in Computer Science (Ithaca) | cornell--gradschool | undecided | 待核实 | shortlist | 待核实（口径不清） |  |  | unknown |  |
| uiuc--gradcollege--cs-msc | University of Illinois Urbana-Champaign | Graduate College / Siebel School of Computing and Data Science | MS in Computer Science | uiuc--gradcollege | match | 待核实 | considering | 待核实（2026fall 核过：https://grad.illinois.edu/admissions/apply） | 研究生院对中国申请人的线是 B Average/80%，你加权 84.6；Siebel School 公布已录取者平均 GPA 3.2 且明说不是最低线，你校内换算 3.4 高于它 | 若 UIUC 自己换算成绩单后不认这个 3.4，或托福按 2026-01-20 后的 4.0/5.0 新量表重判后未达 Limited Status 线 | unknown | 本行学位存疑：UIUC 的 MS in Computer Science 是带论文的研究型硕士、落在 coursework 切片外，应为 MCS，归 #55；两者门槛数字相同故分档不受影响 |
