---
workspace: edu-application
season: 2027fall
country: US
degree_type: coursework-master
created: 2026-08-15
synthetic: true
axes:
  english_score_status: met
  claim_material_coverage: full
  sensitive_material: none
  education_entries: two
  slot_completeness: complete
  identity_slot_occupied: empty
  recommender_consent: c_tier
  cross_major: no
---

# 申请工作区 · P1 林小雨

> ⚠️ **本目录是回归 fixture，不是产品输出、不是真实用户档案。** `synthetic: true`；
> 申请人「林小雨」及其全部经历、项目、成绩为**完全虚构**，从上面的 `axes:` 八键正向构造——
> 写不出轴值组合的档案就是从某个真人来的（[ADR 0010](../../../../docs/adr/0010-personas-ignite-assertions-they-are-not-examples.md)）。
> 六所目标项目是真实存在的，其申请约束取自 2026-08 的官网调研（见 `../_shared/channels/` 各文件头），**仅供演示，不得当作现行事实使用**。
> 本档案诊断目标、断言映射见 `../assertions.md`；快照日期、播种来源、构建方式见 `../README.md`。

## 这是什么

本目录是 P1 这一季申请的**唯一状态源**。`programs.md` 由 `../build.sh` 从 `../_shared/programs.facts.md`
（六项目事实层，三 persona 共享）与本目录的 `programs.judgments.md`（P1 自己的判断层）拼接生成，**不手改**。

## 目录对照

| 目录 | 是什么 | 你会手改吗 |
|---|---|---|
| `profile.md` | 你的基本信息与学历经历 | 会 |
| `programs.judgments.md` | 你在六个共享项目上的分档判断（`build.sh` 拼进 `programs.md`） | 会 |
| `claims.md` | 主张集：你希望招生官相信的、关于你自己的断言 | 会 |
| `materials/` | 文书素材库 | 会 |
| `essays/` | 文书 canonical（三个形态）+ 逐项目 why 段 + 历史版本 | 会 |
| `documents/` | 成绩单、学位证等原件（本档案两条学历、四个逐院校槽位各两份） | 会 |
| `recommenders.md` | 推荐人与各校推荐信状态（含起草授权声明） | 会 |
| `recommenders/drafts/` | C 档推荐信草稿（受 `recommenders.md` 授权声明门控） | 不直接改，走 skill |
| `log.md` | 每次会话做了什么、下一步是什么 | 不用 |

## 申请季与换季

当前申请季：**2027fall**——与 `../_shared/channels/*.md`、本目录 `programs.md` frontmatter 的
`season_downgraded` 一致（[#14](https://github.com/jiangxidong/EduApplication/issues/14) A6：不一致会让惰性降级静默吃掉预取证 `✓`）。

## 当前状态

**不存在这里。** 完成度、待核实清单、推荐信闸口、素材门槛全部是**派生视图**，现算现打，不落盘。
