# 美国授课型硕士申请工作台 / US Coursework Master's Application Workbench

## 产品陈述 Product Statement

**中文**：申请美国授课型硕士（coursework master）的人，面前只有两条路——昂贵且不透明的中介，或独自面对分散在几十个学校官网上的要求、随申请季变化的截止日期、互相矛盾的材料规格。这套 agent skills 提供一个跨会话不丢状态的申请工作台：进度全部落盘在你自己指定的一个目录里，每条学校侧事实都要求可追溯的出处，硬停在「点提交」之前——不替你登录、不替你付费、不替你点提交。它以 agent skills 的形态分发，跑在你自己的 Claude Code 或 Codex 里，不是一个托管服务，你的申请材料不会离开你自己的机器。

**English**: If you're applying to a US coursework master's program on your own, you're choosing between an expensive, opaque agency and facing dozens of program requirements, shifting deadlines, and contradictory material specs by yourself. This is a set of agent skills that gives you a cross-session application workbench: progress is saved as plain files in a directory you choose, every school-side fact is required to carry a traceable source, and the product hard-stops before you click submit — it never logs in, pays, or submits for you. It ships as agent skills that run inside your own Claude Code or Codex install; there is no hosted service, and your material never leaves your machine.

---

## 安装 Installation

两个运行时都走同一条路径：先把本仓库加为 marketplace，再安装其中的插件。四个技能是一个整体分发单元——marketplace 条目不列子目录，装了会一起出现，不存在"只装一半"。**目前仓库里实际落盘的只有 `apply-us-master` 一个**；其余三个随各自的实现票落盘后，会自动出现在同一个已安装条目里，不需要重新安装。

Both runtimes use the same two-step path: add this repo as a marketplace, then install the plugin from it. The four skills ship as one distribution unit — the marketplace entry doesn't list subdirectories, so whatever exists installs together, never half. **Only `apply-us-master` is built today**; the other three will appear under the same installed entry as their own implementation tickets land, with no reinstall needed.

### Claude Code

```
/plugin marketplace add jiangxidong/EduApplication
/plugin install edu-application@jiangxidong-edu
```

- **怎么验证装上了 / How to verify**：在 `/plugin` 面板里能看到 `edu-application` 已启用；或者直接用自然语言说"我要开始准备申请了" / "help me start my US master's application"，看它是否触发 `apply-us-master`。
- **快照日期 / Snapshot date**：以上命令于 2026-08-16 用 Claude Code 2.1.233 实测跑通（中英触发各一条）。

### Codex

```
codex plugin marketplace add jiangxidong/EduApplication
codex plugin add edu-application@jiangxidong-edu
```

- **怎么验证装上了 / How to verify**：`codex plugin list` 能看到 `edu-application@jiangxidong-edu` 状态为 `installed, enabled`；或用自然语言触发同上。
- **快照日期 / Snapshot date**：以上命令于 2026-08-16 用 codex-cli 0.144.1 实测跑通（中英触发各一条）。

---

## 四个技能 The Four Skills

按产品流程的自然阶段划分，一个阶段对应一个技能，零路径字面量——每个技能具体做什么、怎么做，见它自己的技能说明。

Mapped one skill per natural product stage, with zero path literals — what each skill actually does lives in its own skill instructions.

| 阶段 Stage | Skill | 一句话 One line |
|---|---|---|
| 冷启动 + 画像 Cold start & profile | `apply-us-master` | 新开或续上一个跨会话的申请工作区，先做 git 安全检测，产出一份只反映你自己这一侧的画像与主张初稿。Start or resume a cross-session workspace, git-safety check first, then a profile & claims mirror of you — not of the schools. |
| 选校 Shortlisting | `pick-programs` | 建立项目池，给出证据支撑、可辩护的分档判断——是依据，不是概率。Build the program pool and give evidence-backed, defensible tiering — grounds, never odds. |
| 文书 Essays | `write-essays` | 从素材到主张、再到 canonical 文书与逐项目内容，帮你把故事立在证据上。From raw material to claims to canonical essays and per-program content, all grounded in evidence. |
| 材料 + 推荐信 + 准备包 Materials, recommenders & packet | `assemble-packet` | 材料归位、推荐信协调、逐项目网申准备包，停在点提交之前。Slot materials, coordinate recommenders, and assemble a per-program submission packet — stopping before the submit click. |

---

## 隐私与停手线 Privacy & Stop-Lines

**单向阀 One-way valves**：内容只能从这套产品流向你的工作区，反向绝不——工作区里的任何内容都不会被带回产品自己的代码仓库。Content only flows from this product into your workspace, never back — nothing in your workspace is ever carried back into this product's own repository.

**停手线，三类十条 Ten stop-lines in three categories**（产品明令不做的事 / things this product will never do）：

- **动作类 Actions（6）**：替你登录 / 上传敏感文件 / 代签法律声明 / 付申请费 / 点提交 / 以推荐人名义发邀请。— Log in for you / upload sensitive files / sign legal declarations on your behalf / pay application fees / click submit / send invitations in a recommender's name.
- **数据类 Data（3）**：不读取身份证件类文件的内容 / 不删除工作区的任何文件 / 不把工作区的任何内容带进产品自己的代码仓库（含改写过的）。— Never read the contents of identity documents / never delete any file in your workspace / never carry anything from your workspace into this product's own repository, rewritten or not.
- **取证类 Evidence（1）**：绝不由 agent 凭记忆产生任何一行 `✓`——`✓` 只认两条来源：本次会话真的取回过页面正文，或者你自己提供了事实与链接；搜索摘要不算取回。— The agent never produces a `✓` line from memory. A `✓` has exactly two legitimate sources: a real fetch of the page body in this session, or a fact and link you supplied yourself. A search-result snippet does not count as a fetch.

**禁读区 No-read zone**：身份类文件是唯一不被读取内容的一类文件，判据是"读了也没用"，不是"敏感"——只做存在性与格式检查，绝不把文件内容读进上下文。Identity documents are the one file type whose contents are never read — the test is "reading it wouldn't help," not "it's sensitive." Only existence/format checks are performed; contents never enter the model's context.

---

## 验收资产 Acceptance Assets

本仓库随附一套确定性检查与样例工作区（在仓库的 `evals/` 目录下），用于复现"这四个技能产出的文件是否合规"这类验收断言——它面向想要复核这套产品的人，不是安装流程的一部分，也不需要你运行它才能使用这四个技能。

This repo ships a set of deterministic checks and sample workspaces (under the repo's `evals/` directory) that let anyone reproduce the compliance claims behind the four skills. It's for people auditing this product, not a step in installation — you don't need to run anything there to use the four skills.

---

## License

[MIT](LICENSE)
