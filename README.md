# 美国授课型硕士申请工作台

[English version](README.en.md)

## 产品陈述

申请美国授课型硕士（coursework master）的人，面前只有两条路——昂贵且不透明的中介，或独自面对分散在几十个学校官网上的要求、随申请季变化的截止日期、互相矛盾的材料规格。这套 agent skills 提供一个跨会话不丢状态的申请工作台：进度全部落盘在你自己指定的一个目录里，每条学校侧事实都要求可追溯的出处，硬停在「点提交」之前——不替你登录、不替你付费、不替你点提交。它以 agent skills 的形态分发，跑在你自己的 Claude Code 或 Codex 里，不是一个托管服务，你的申请材料不会离开你自己的机器。

---

## 整体流程

七个阶段，从冷启动到网申准备包，硬停在提交之前：

```mermaid
flowchart LR
    A[冷启动] --> B[画像]
    B --> C[选校]
    C --> D[文书]
    D --> E[材料]
    E --> F[推荐信]
    F --> G[准备包]
```

---

## 安装

两个运行时都走同一条路径：先把本仓库加为 marketplace，再安装其中的插件。四个技能是一个整体分发单元——marketplace 条目不列子目录，装了会一起出现，不存在"只装一半"。

### Claude Code

```
/plugin marketplace add jiangxidong/EduApplication
/plugin install edu-application@jiangxidong-edu
```

- **怎么验证装上了**：在 `/plugin` 面板里能看到 `edu-application` 已启用；或者直接用自然语言说"我要开始准备申请了"，看它是否触发 `apply-us-master`。
- **快照日期**：以上命令于 2026-08-16 用 Claude Code 2.1.233 实测跑通（中英触发各一条）。

### Codex

```
codex plugin marketplace add jiangxidong/EduApplication
codex plugin add edu-application@jiangxidong-edu
```

- **怎么验证装上了**：`codex plugin list` 能看到 `edu-application@jiangxidong-edu` 状态为 `installed, enabled`；或用自然语言触发同上。
- **快照日期**：以上命令于 2026-08-16 用 codex-cli 0.144.1 实测跑通（中英触发各一条）。

---

## 四个技能

按产品流程的自然阶段划分，一个阶段对应一个技能——每个技能具体做什么、怎么做，见它自己的技能说明。四个技能均已落盘。

| 阶段 | skill |
|---|---|
| 冷启动 + 画像 | [`apply-us-master`](skills/apply-us-master/SKILL.md) |
| 选校 | [`pick-programs`](skills/pick-programs/SKILL.md) |
| 文书 | [`write-essays`](skills/write-essays/SKILL.md) |
| 材料 + 推荐信 + 准备包 | [`assemble-packet`](skills/assemble-packet/SKILL.md) |

---

## 隐私与停手线

**单向阀**：内容只能从这套产品流向你的工作区，反向绝不——工作区里的任何内容都不会被带回产品自己的代码仓库。

**停手线，三类十条**（产品明令不做的事）：

- **动作类（6）**：替你登录 / 上传敏感文件 / 代签法律声明 / 付申请费 / 点提交 / 以推荐人名义发邀请。
- **数据类（3）**：不读取身份证件类文件的内容 / 不删除工作区的任何文件 / 不把工作区的任何内容带进产品自己的代码仓库（含改写过的）。
- **取证类（1）**：绝不由 agent 凭记忆产生任何一行 `✓`——`✓` 只认两条来源：本次会话真的取回过页面正文，或者你自己提供了事实与链接；搜索摘要不算取回。

**禁读区**：身份类文件是唯一不被读取内容的一类文件，判据是"读了也没用"，不是"敏感"——只做存在性与格式检查，绝不把文件内容读进上下文。

---

## 验收资产

本仓库随附一套确定性检查与样例工作区（在仓库的 `evals/` 目录下），用于复现"这四个技能产出的文件是否合规"这类验收断言——它面向想要复核这套产品的人，不是安装流程的一部分，也不需要你运行它才能使用这四个技能。

---

## License

[MIT](LICENSE)
