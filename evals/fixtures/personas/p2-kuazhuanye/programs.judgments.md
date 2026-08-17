# P2 · 判断层（6 列）

**与 `../_shared/programs.facts.md` 按 `program_key` 拼接成完整 13 列 `programs.md`**（`build.sh` 做，见 `../README.md`）。

⚠️ **单元格内禁止出现 `|`**；`tier_basis` / `tier_void_if` / `status_note` 一句话，禁换行；写不满留空、不填占位符。
🔒 **`pseudo_safer` 是纯项目属性**，与 P1/P3 同一 `program_key` 上取值恒等。

## P2 诊断目标

**全池 `undecided`**（[#14](https://github.com/jiangxidong/EduApplication/issues/14) 断言 B8：未考 ≠ 未达标）。P2 尚未参加任何英语考试，
`profile.md` 的英语节因此**没有可比较的分数**——按 `CONTEXT.md`「分档」的切分「**还没考托福 = `undecided`**」，
六个项目在这一维度上全部停在 `undecided`；GPA 3.1 虽已知，但**判据是合取**，单一维度已知不足以支撑任何一档判断，
`tier_basis` 因此保持空——这与「查不到就是没有」的 `ineligible` 不同，是「有一半输入还没交」的 `undecided`。

| program_key | tier | status | tier_basis | tier_void_if | pseudo_safer | status_note |
|---|---|---|---|---|---|---|
| columbia--seas--cs-ms | undecided | considering |  |  | yes |  |
| cornell--gradschool--cs-meng | undecided | considering |  |  | unknown |  |
| uiuc--gradcollege--mcs | undecided | considering |  |  | no |  |
| utdallas--ecs--cs-ms | undecided | considering |  |  | no |  |
| northeastern--khoury--cs-ms | undecided | considering |  |  | no |  |
| umich--rackham--cse-ms | undecided | considering |  |  | unknown |  |
