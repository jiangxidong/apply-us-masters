# 竞品调研：5 个留学申请类 Agent Skills

调研日期：2026-08-14。方法：5 个 subagent 并行 clone + 逐文件分析。
本文是索引与横向对比；每个 repo 的完整分析见下方分节。

## 横向对比表

| repo | star | 定位切片 | 国家/地区 | 架构 | 文件规模 | 状态持久化 | 联网依赖 | 最后代码更新 | License |
|---|---|---|---|---|---|---|---|---|---|
| `Harry-Sun0529/euro-grad-apply` | **72** | 全流程知识库（选国→落地→永居） | 欧陆（明确排除英国）+ KAUST 飞地 | 单 SKILL.md + 26 references，**3 条 GitHub Action** | ~6.6k 行 / 310KB | ❌ 无 | 强依赖但**未声明 allowed-tools** | 2026-07-09 | ❌ 无 |
| `lafalin/application-essay-skill` | **45** | 选校研究 + 申请规划（文书仅占 27%） | 未明说，实为美国研究生 | 单 SKILL.md + 9 references | ~1.2k 行 | ❌ 无（`.gitignore` 预留了 `drafts/` 却无人写入） | 强依赖，未声明 | 2026-06-28 | ❌ 无 |
| `sznnnnn/taught-master-applications-skill` | 9 | 授课硕全链条规划（不含提交） | 声明 7 地区，**实为零国别知识** | 单 SKILL.md(16KB) + 18 references + docx 模板 | ~2k 行 | ⚠️ **4 套路径互相冲突** | 100% 实时检索，零缓存 | 2026-06-03 | ❌ 无（README 挂 MIT 徽章） |
| `PZQ-ship-it/.../academic-program-application` | 0 | 北美研究生 advisory（6 模式路由） | 北美，偏人文/神学 | SKILL.md(115行) + 12 refs + 7 examples | 952 行 | ❌ 无 | 有降级说明 | 2026-06-11（单 commit 后冻结） | ❌ 无 |
| `Haadhi76/SOP_Consultant` | 1 | **纯 SOP/PS 写作** | 隐含英美 | SKILL.md(231行) + 12 refs（core/use-case/fluency 三层 delta） | ~1.5k 行 | ❌ 无 | 弱 | 2026-06-15（单日 21 commit 后冻结） | MIT ✅ |

## 五条共性结论

1. **全部无状态**。5/5 没有任何产物落盘约定（唯一尝试的 taught-master 分叉成 4 套互相冲突的路径）。而申请季跨度 6-12 个月、10+ 项目、多轮材料迭代——这是整个赛道最大的、被一致忽略的空缺。
2. **全部是单人 7 天冲刺后冻结**。最长活跃期两周，之后 0 issue、0 fork 的二次开发、无 CI（euro-grad-apply 例外）、无 eval、无测试。内容成熟度普遍远高于工程成熟度。
3. **4/5 无 License**，法律上默认 all rights reserved，无法合法复用。
4. **防幻觉普遍做了，防 AI 味只有 2/5 做了**。且两件事经常被混为一谈（taught-master 明确混淆）。
5. **无一个覆盖网申填表/提交**。最接近的是 euro-grad-apply 的 `application-systems.md`（Uni-assist/Studielink 操作步骤）和 taught-master 的 agent-ready-pack（列出 6 个必须暂停等人工的动作）。

## 值得抄的机制（按价值排序）

1. **三级证据标签进表结构 + Checked At 列**（taught-master `reference-scout.md:82-89` + `output-schema.md`）——证据等级不是提示语而是输出表格的强制列。
2. **来源用途矩阵 use-for / do-NOT-use-for**（taught-master `reference-scout.md:17-24`）——把小红书/Pinterest 纳入而非排除，靠用途隔离控风险。
3. **四级源可靠性阶梯 + 六标签不确定性系统**（academic-program-application `source-reliability-rules.md`）——`Not found`（搜过没找到）与 `Unclear`（官方信息模糊/矛盾）的细分是实务经验的体现。
4. **"先问毕业目标再谈选校"作为强制第 0 步**（euro-grad-apply `SKILL.md:68-84`）——把用户没说出口的目标函数显式化，切成 4 条权重完全不同的路径。
5. **快速诊断模式 / First-Reply Contract**（euro-grad-apply `SKILL.md:32-36`、taught-master `SKILL.md:95-100`）——反 20 问综合症：先给可用草案 + 只问一个问题 + 提供表单出口。
6. **每条都配 failure mode 的修订 checklist**（SOP_Consultant `revision-checklist.md`）——20 条 checkbox，每条括号里写明失败长什么样。
7. **明确的 AI 味黑名单**（SOP_Consultant：delve/tapestry/testament/realm/... + 句式黑名单"It's not just X — it's Y"；euro-grad-apply：4 条 AI 文本可检测特征）。
8. **delta 可组合的 reference 架构**（SOP_Consultant：core 三件套 + use-case delta + fluency delta，多个 delta 可叠加）。
9. **英语水平作为独立正交维度**（SOP_Consultant 三个 fluency 文件）——对中国申请人直接适用；native 层的风险被定义为"流畅的文字更容易滑进 generic"。
10. **敏感动作暂停点清单**（taught-master `agent-ready-pack.md:15-22`）：建账号/上传敏感文件/法律声明/付款/最终提交/发推荐信邀请。
11. **可选集成绝不成为硬依赖**（taught-master `export-strategy.md:39-46`）：Notion 无授权→本地 Markdown+CSV，不阻塞。
12. **推荐信只做 support pack 不做成稿 + "推荐人能否证实"列**（taught-master `recommendation-letter-workflow.md`）——把伦理约束翻译成可执行的表格操作。
13. **CI 化的知识时效性运维**（euro-grad-apply 三条 Action：自动合并单文件 + 月度 lychee 链接体检 + 半年复审自动开 issue，issue 正文预置按易过时程度分级的文件清单）。
14. **"假保底"具名反例**（euro-grad-apply `safety-schools.md:46-53`：TU Eindhoven CS、KU Leuven AI 是"排名不高但方向极挤"的伪保底）——反直觉的具名反例比正面清单值钱。
15. **正面处理 AI 代写伦理边界**（SOP_Consultant hard rule：不提供规避检测技术，引导按项目规则披露）。

## 明确的坑（别踩）

1. **无状态 + 长周期 = 每次会话重新 intake**（5/5 都中）。
2. **句式模板会制造 AI 味**（application-essay-skill `essay_style_patterns.md` 提供完形填空句式，与自身"反 generic"立论直接矛盾，且 revision checklist 里没有一条核验模板痕迹）。
3. **references 写了但 SKILL.md 不引用 = 死资产**（academic-program-application：5 个 genre guide 共 195 行 + 整个 `examples/` 254 行在 SKILL.md 中零引用）。
4. **路由表复制两份必然漂移**（taught-master `SKILL.md` 与 `workflow-map.md` 双份路由，后者已出现两个 `## 0.`）。
5. **示例简历过于具体，当模板复用会形状污染**（taught-master 的 `cv-preview-stem.md` 自称匿名模板，却含 MyBatis/具体爬虫项目这类高特异性细节，且被指示当作 preview shape → 这种特异性会串进别人的 CV）。
6. **Checked At 有字段无失效规则**——上一申请季打了"官网已核查"的条目比"待官网确认"更危险。
7. **强依赖联网却不声明 allowed-tools、无离线降级**（euro-grad-apply、application-essay-skill、taught-master 都中）。
8. **举例领域高度集中**（application-essay-skill 全是环境/设计/政策；academic-program-application 7 个 example 全是"现代中国基督教史"）——泛化性存疑。
9. **合并单文件与散文件同时被安装** → 知识库里每条事实索引两遍，检索互相稀释（euro-grad-apply README 自己推荐的路径就有这个坑）。
10. **名实不符导致触发失败**（application-essay-skill：repo 名讲 essay，frontmatter `name: graduate-application-research`，description 写着 "before writing essays"）。

## 空白地带（没人做的）

- **状态层 / 申请 tracker**：跨会话的 profile、program pool、deadline、材料版本、offer 决策。
- **网申填表与提交**：只有零星的系统操作说明，无端到端。
- **本科申请**：Common App / UCAS 全部缺席（application-essay-skill 明确劝退本科）。
- **英国**：euro-grad-apply 明确排除，taught-master 声明但无内容。
- **理工科/CS/PhD 套磁**：application-essay-skill 完全缺席，academic-program-application 偏人文。
- **面试准备、offer 比较、waitlist 策略、签证后续**：仅 euro-grad-apply 覆盖到签证与落地。
- **可复跑的 eval / 质量下限**：5/5 全无。

---

## 关于原始材料

本文是 5 个 subagent 逐文件分析后的综述，**每个 repo 的完整分析报告未逐字保留**——
上表与上述条目已提取全部可行动结论。需要复核时直接 clone 原仓库对照文件行号即可：

```
Harry-Sun0529/euro-grad-apply
lafalin/application-essay-skill
sznnnnn/taught-master-applications-skill
PZQ-ship-it/codex-research-workflow-html   # skills/academic-program-application
Haadhi76/SOP_Consultant                    # skills/statement-of-purpose
```

注意：除 SOP_Consultant（MIT）外均无 License，法律上不可直接复用其文本。
