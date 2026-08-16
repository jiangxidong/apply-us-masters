---
channel_key: x--test
season_downgraded:
  选校: 2027fall
  文书: 2027fall
---

# 渠道约束层（翻红夹具：subsection-under-program）

## 冻结点

#### 学历门槛

- `待核实` 违规 1：`####` 裸挂在 `## 冻结点` 之下，没有任何 `###` 上下文——subsection-under-program 应翻红
  （`####` 名字本身是否在封闭词表内归 section-prefix-match，不归本条）

## 项目级差异

### `ghost--prog--key`

#### 材料上传

- `待核实` 违规 2：`### ghost--prog--key` 不在 programs.md 的 program_key 集合内（本夹具的 PROGKEYS
  只有 columbia--seas--cs-ms 一项）——应翻红

### `columbia--seas--cs-ms`

#### 学历门槛

- `待核实` 阴性对照：这个 program_key 在 programs.md 里真实存在，`####` 也正确嵌在 `###` 下，不应计入 FAIL
