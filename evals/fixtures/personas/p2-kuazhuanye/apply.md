---
workspace: edu-application
season: 2027fall
country: US
degree_type: coursework-master
created: 2026-08-15
synthetic: true
axes:
  english_score_status: not_taken
  claim_material_coverage: has_zero_material_claim
  sensitive_material: present
  education_entries: one
  slot_completeness: missing
  identity_slot_occupied: empty
  recommender_consent: b_tier_only
  cross_major: yes
---

# 申请工作区 · P2 跨专业应届

> ⚠️ **本目录是回归 fixture，不是产品输出、不是真实用户档案。** `synthetic: true`；
> 申请人及其全部经历、项目、成绩为**完全虚构**，从上面的 `axes:` 八键正向构造。
> 六所目标项目是真实存在的，其申请约束取自 2026-08 的官网调研（见 `../_shared/channels/` 各文件头），**仅供演示，不得当作现行事实使用**。
> 本档案诊断目标、断言映射见 `../assertions.md`；快照日期、播种来源、构建方式见 `../README.md`。

## 这是什么

本目录是 P2 这一季申请的**唯一状态源**。`programs.md` 由 `../build.sh` 从 `../_shared/programs.facts.md`
（六项目事实层，三 persona 共享）与本目录的 `programs.judgments.md`（P2 自己的判断层）拼接生成，**不手改**。

## 目录对照

| 目录 | 是什么 | 你会手改吗 |
|---|---|---|
| `profile.md` | 你的基本信息与学历经历（单一本科，跨专业） | 会 |
| `programs.judgments.md` | 你在六个共享项目上的分档判断（全部 `undecided`——未考英语） | 会 |
| `claims.md` | 主张集（含一条零素材主张） | 会 |
| `materials/` | 文书素材库（含一条敏感素材） | 会 |
| `essays/` | 文书 canonical——本档案仍在骨架阶段，`essays/canonical/` 目录存在但未起任何形态 | 会 |
| `documents/` | 材料原件（**槽位缺件**——单一学历、部分槽位未提供） | 会 |
| `recommenders.md` | 推荐人与各校推荐信状态（**只到 B 档**，无起草授权） | 会 |
| `log.md` | 每次会话做了什么、下一步是什么 | 不用 |

## 申请季与换季

当前申请季：**2027fall**——与 `../_shared/channels/*.md`、本目录 `programs.md` frontmatter 的
`season_downgraded` 一致。

## 当前状态

**不存在这里。** 完成度、待核实清单、推荐信闸口、素材门槛全部是**派生视图**，现算现打，不落盘。
