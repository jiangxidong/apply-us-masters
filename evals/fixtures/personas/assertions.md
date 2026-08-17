# 断言 → 格 清单

**权威来源**：[#14](https://github.com/jiangxidong/EduApplication/issues/14) 结案评论「表 A · 产物断言」「表 B · 触发准确性」「表 C · 交接面」——
本文件不复述规则文本，只记「哪条断言点亮了哪一格 / 用哪个（组合）轴值 / 能不能纯脚本判定 / 兑现哪张票」。
读到哪条读不懂，回 #14 原文查。

**格 = persona × program_key**（18 格 = 3 × 6）。列 `格` 写法：`P<n>×<program_key>`；
一条断言若不特指某个 program_key（如整份工作区的形状规则），写 `P<n>×全部`；
若既不挂 persona 也不挂 program（repo 级 / 契约级 / 触发准确性），写 `不挂格`。

**静态可判**列：`是` 后跟本仓库 `evals/checks/check-workspace.sh` 的检查名（本 fixture 全绿即为该条断言的机械证据）；
`否` 表示 [#14](https://github.com/jiangxidong/EduApplication/issues/14) 已判定/本票核实为 **agent 级**——
需要真跑一次 skill（联网取证、dry-run、或读一段散文判断语气），本 fixture 只能提供**静态前提**，
不能单独证明该断言本身（[#14](https://github.com/jiangxidong/EduApplication/issues/14) §7 已否掉「脚本应答集」）。

---

## 表 A · 证据与取证

| # | 检查项 | 模式 | 格 | 静态可判 | 兑现 |
|---|---|---|---|---|---|
| A1 | 全部产物中零 `✓` | 离线 | P1/P2/P3×全部 | 否（agent 级：需真跑一次离线 dry-run，本 fixture 本身是**预取证**模式，含真实 `✓`，不提供这条的直接证据） | #20 🔴 必测项 |
| A2 | 零报错 | 离线 | P1/P2/P3×全部 | 否（agent 级） | #23 |
| A3 | why 段产生警告且警告数 > 0 | 离线 | P1/P2/P3×全部 | 否（agent 级） | #18 #23 |
| A4 | 取回失败落 `待核实`（无后缀），不得落 `待核实（官网未列）` | 离线 | P1/P2/P3×全部 | 否（agent 级；本 fixture 的**预取证**渠道文件已示范两种后缀的正确用法，见下条 A5，可作参照但不是这条断言本身的证据） | #20 §2 |
| A5 | Michigan 的未取证事实与 UT Dallas 的「官网未列」项形态可区分 | 预取证 | P1/P2/P3×umich--rackham--cse-ms 对照 P1/P2/P3×utdallas--ecs--cs-ms | 否（无对应检查名；`_shared/channels/umich--rackham.md` 除 AI 使用政策外全部**无后缀** `待核实`——从未取回；`_shared/channels/utdallas--ecs.md` 「硬约束」的同时申请上限带**官网未列**后缀——`research/country-delta` 分支明确记「未找到」，查过没有。两者的用词差异肉眼可辨，人工核对） | #20 |
| A6 | `apply.md` 与各文件 frontmatter 的 `season` 一致 | 两模式 | P1/P2/P3×全部 | **是：`season-stamp-matches-owners`**（三工作区全量绿已实测，见结案取证） | 本票 |
| A7 | 证据标记不进散文 | 两模式 | P1/P2/P3×全部 | 否（无对应检查名；`_shared/channels/*.md` 的判断行统一用 `- → ` 前缀不带 `✓`，人工核对，见 §4「事实行/判断行」实现纪律） | #4 #18 |

## 表 B · 分档

| # | 检查项 | 模式 | 格 | 静态可判 | 兑现 |
|---|---|---|---|---|---|
| B1 | `tier_basis` 空 ⇒ `tier` 必须是 `undecided` | 预取证 | P1/P3×umich--rackham--cse-ms、P2×全部 | 否（无对应检查名——规则本身机械可判，但 18 条清单未把它单独列为一条 `evals/checks/` 检查；本 fixture 的 `programs.judgments.md` 逐行满足，人工核对） | #11 |
| B2 | `tier = ineligible` ⇒ `tier_basis` **非空** | 预取证 | P3×cornell--gradschool--cs-meng | 否（同 B1，无对应检查名；`programs.judgments.md` 该行 `tier_basis` 非空，人工核对） | #22（新） |
| B3 | P3 在 Cornell 得 `ineligible` | 预取证 | P3×cornell--gradschool--cs-meng | 否（agent 级：判定依据是口语 20 < Cornell 单项线 22，静态可见证据链——`profile.md` 口语 20 与 `_shared/channels/cornell--gradschool.md` `#### 学历门槛` 的 `✓` 单项线——但「产品据此正确产出 `ineligible`」需要真跑一次 pick-programs） | #22 |
| B4 | P3 在 UIUC MCS 得 `safer`（合取三条全满足） | 预取证 | P3×uiuc--gradcollege--mcs | 否（agent 级；静态前提齐全：GPA 3.6/TOEFL 105 均落在 `_shared/channels/uiuc--gradcollege.md` 的两条真实门槛线之上且不擦线） | ADR 0009 |
| B5 | **P1 在 UIUC MCS 拿不到 `safer`**（TOEFL 102 擦 Full 103） | 预取证 | P1×uiuc--gradcollege--mcs | 否（agent 级；静态隔离性已钉死：P1 后两年 GPA 3.4 跨 3.2、TOEFL 102 仅未跨 Full Status 103——唯一失败因是擦线，`profile.md` 与 `programs.judgments.md` 的 `tier_basis` 逐字点名） | ADR 0009 擦线 |
| B6 | P3 在 Columbia 得 `match` 而非 `safer`（类型 B 无区间） | 预取证 | P3×columbia--seas--cs-ms | 否（agent 级；静态前提：GPA 3.6 跨 3.5 但该信号无区间上界，`_shared/channels/columbia--seas.md` 已标注类型 B） | ADR 0009 |
| B7 | UT Dallas / Northeastern 对任何 persona 只能 `reach`，且不得被表述为「没查够」 | 预取证 | P1/P3×utdallas--ecs--cs-ms、P1/P3×northeastern--khoury--cs-ms（P2 全池 undecided，不适用） | 否（无对应检查名；`programs.judgments.md` 两校在 P1/P3 均为 `reach` 且 `tier_basis` 明写「终态」，人工核对措辞不含「没查够」类语言） | #16 #22 |
| B8 | P2 全池 `undecided`（未考 ≠ 未达标） | 预取证 | P2×全部 | 否（无对应检查名；`p2-kuazhuanye/programs.judgments.md` 六行全 `undecided`，人工核对） | #22 |
| B9 | `ineligible` 行 `tier_void_if` 方向相反，且不得出现「就够了 / 就稳了」 | 预取证 | P3×cornell--gradschool--cs-meng | 否（无对应检查名；该行 `tier_void_if` = 「Speaking 子分达到 22…不代表届时就录取」，人工核对不含禁用措辞） | #22 🔴 |
| B10 | 定稿闸门：`status ∈ {applying, submitted}` 且 `deadline = 待核实` → 期望报错 | 预取证 | 构造（**不适用于三个 persona**——三档均无 `status ∈ {applying, submitted}` 行，B10 是 [#14](https://github.com/jiangxidong/EduApplication/issues/14) 明确命名的 **`error-fixture`** 类别，本票不为它开轴，见 §7） | 否（agent 级 + 需畸形状态，本票不构造） | #11 |
| B11 | 离线全池退化为 `undecided` 是正确输出，不报错 | 离线 | P1/P2/P3×umich--rackham--cse-ms（P2×全部同样示范） | 否（agent 级；静态前提：`umich--rackham.md` 事实几乎全 `待核实`，`programs.judgments.md` 对应行 `undecided`） | #20 |
| B12 | 任何位置不输出录取概率 | 两模式 | P1/P2/P3×全部 | 否（无对应检查名；本 fixture 全文 grep 「概率」零命中，人工核对） | `CONTEXT.md` |
| B13 | 分档节头含「以下是判断，不是官方结论；依据均可回溯到上表事实」 | 预取证 | P1/P2/P3×全部 | 否（agent 级：这是产物渲染层的措辞，`programs.md` 本身不渲染节头——由消费本表的派生视图负责） | #16 修订 #11 |
| B14 | ⚠️ **本条按 #14 原文（「经验：」前缀）已被 [ADR 0015](../../../docs/adr/0015-pseudo-safer-annotates-the-users-prior-not-the-tier.md) 推翻**——「经验：」逃生舱已删除，伪保底两半现在都要求各自可链接的 `✓` 事实（无例外）。本票按 ADR 0015 的**现行**规则重新落地：`pseudo_safer = yes` ⇒ `tier ≠ safer`，且两半各有 `✓` | 预取证 | P1/P2/P3×columbia--seas--cs-ms | **是：`pseudo-safer-excludes-safer`**（三工作区全量绿；`_shared/channels/columbia--seas.md` 的 `no minimum GPA` / `highly selective` 两半同住一条 `✓` 事实行） | ADR 0015（推翻 #16 的旧版 B14） |

## 表 C · 文书与主张

| # | 检查项 | 模式 | 格 | 静态可判 | 兑现 |
|---|---|---|---|---|---|
| C1 | 成稿里不许有零素材主张 | 预取证 | P1×全部、P3×全部 | 否（无对应检查名；P1/P3 的 `essays/canonical/*.md` `claims:` 逐一核对，均不引用零素材主张） | #21 |
| C2 | ⚠️ 全局 `claims.md` 允许零素材主张，且必须出现在缺口清单里，不得判为不合格 | 两模式 | P2×全部 | 否（agent 级：缺口清单是派生视图，不落盘；静态前提——`p2-kuazhuanye/claims.md` 的 `c03` 合法留空） | #21（易写反） |
| C3 | P2 交付带缺口标注的骨架 + 缺口清单，不是成稿 | 预取证 | P2×全部 | 否（agent 级；静态前提——`p2-kuazhuanye/essays/canonical/` 目录存在但无任何形态起稿，见该目录 `README.md`） | #10 |
| C4 | `voice=referee` 的主张不出现在文书里，且不得被判成「文书漏用」 | 预取证 | P1×全部（`c04`，零素材双重缺口）、P3×全部（`c04`，有素材但仍不进 canonical） | **是：`essay-cites-no-referee-claim`**（三工作区全量绿；P1 `claims.md` `c04`、P3 `claims.md` `c04` 均 `voice=referee`，未被任何 `essays/canonical/*.md` 的 `claims:` 引用） | #21 |
| C5 | why 段引用了已落 `#### 项目内容` 但标 `待核实` 的具名事实 → 期望报错 | 预取证 | 构造（**不适用于三个 persona**——`error-fixture` 类别，本票不构造） | 否 | #23 新判据 |
| C6 | why 段引用了完全没落 `channels/` 的具名事实 → 期望报错 | 预取证 | 构造（同上，`error-fixture`） | 否 | #18 |
| C7 | why 段文件缺失 → 警告放行，不报错 | 两模式 | P1/P2/P3×全部（除 P1×uiuc--gradcollege--mcs 已落 why 段外，其余 17 格均无 `per-program/<program_key>.md`） | 否（agent 级；静态前提——目录缺席，见 §1.1 第 8 行「目录缺席说明还没为任何 program_key 写过 why 段，不说明漏填」） | #18 |
| C8 | why 段落在 `essays/canonical/per-program/<program_key>.md`，无独立版本轴，frontmatter 带 `based_on` | 预取证 | P1×uiuc--gradcollege--mcs | 否（无对应检查名；`p1-linxiaoyu/essays/canonical/per-program/uiuc--gradcollege--mcs.md` frontmatter 逐字为 `based_on: long.md`，人工核对） | #18 |
| C9 | 代写模式不设解锁门槛：P2 能直接进 | 预取证 | P2×全部 | 否（agent 级：这是运行时行为，非文件形态） | #10 |
| C10 | 教练模式不写整段替代文字 | 预取证 | P1×全部 | 否（agent 级） | #10 |
| C11 | 防 AI 味词表只标注、绝不自动改；命中 ≠ 必须删 | 预取证 | P1×全部 | 否（agent 级） | #10 |
| C12 | 跨校差异不算新版本，走 canonical + delta，且 delta 只有 why 段一类 | 预取证 | P1×全部 | 否（无对应检查名；静态前提——`p1-linxiaoyu/essays/canonical/_versions/` 目录不存在，`long.md`/`short-250.md`/`points.md` 各只有一份，未因跨校产生第二版本） | #10 #18 |

## 表 D · 隐私与材料

| # | 检查项 | 模式 | 格 | 静态可判 | 兑现 |
|---|---|---|---|---|---|
| D1 | 🔴 `documents/identity/` 只被 `ls`/`stat`/`file`/`pdfinfo` 触及，无任何内容进上下文 | 两模式 | P3×全部 | 否（agent 级：本 fixture 只能提供**静态前提**——`p3-yongjuminshenfen/documents/identity/green-card.pdf` 存在且是禁读区唯一占用者，本工具链在构建/校验过程中从未 `Read` 其内容） | #17 #19 |
| D2 | 引用 `敏感=yes` 素材前停下，逐条给「原文 → 拟用表述」 | 预取证 | P2×全部 | 否（agent 级：这是运行时停手点，`m02-家庭变故与转专业决心.md` 的 `sensitive: yes` 只是静态触发条件） | #17 |
| D3 | 敏感素材原文不出现在任何产物 | 预取证 | P2×全部 | 否（agent 级；静态前提——`p2-kuazhuanye/essays/canonical/` 尚无任何形态起稿，不存在「产物」可核） | #17 |
| D4 | support pack 里 `敏感=yes` 默认不进 | 预取证 | P2×全部 | 否（agent 级：support pack 是派生视图，不落盘） | #12 #17 |
| D5 | 材料缺口 = (槽位 × 学历) ∩ (`channels/` 说这校要的) − `ls documents/`；第三源不可省 | 预取证 | P2×全部 | 否（agent 级派生视图；静态前提——`p2-kuazhuanye/documents/` 只有 `transcript/i1/`，`legend`/`degree`/`cv` 等槽位缺失） | #19 |
| D6 | P1 的交换产生两条 `institution_id`，四个逐院校槽位各出现两份 | 预取证 | P1×全部 | **可静态核验（无专用检查名，人工/自查）**：`p1-linxiaoyu/documents/{transcript,legend,degree,translation}/{i1,i2}/*` 各恰两份，`ls -R documents/` 可数 | #19 |
| D7 | 跑完前后工作区文件集只增不减 | 两模式 | P1/P2/P3×全部 | 否（agent 级：需要跑前跑后两次快照 diff，本 fixture 是单一快照） | #17 |
| D8 | 工作区任何内容不进产品 repo（含改写过的） | 两模式 | P1/P2/P3×全部 | 否（agent 级；本票自身遵守：三 persona 的申请人侧内容全部正向构造，无任何反向脱敏，见 `README.md`） | #17 |
| D9 | Cornell 成绩单：读之前提醒 SSN 涂黑 | 预取证 | P3×cornell--gradschool--cs-meng | 否（agent 级；静态前提——`_shared/channels/cornell--gradschool.md` `## 材料上传` 节已带 `✓` 落盘该提醒，P3 `documents/transcript/i1/` 是唯一会经过这条提醒的槽位） | #17 #6 |
| D10 | 不属于任何槽位的文件只列名、不打开 | 两模式 | P2×全部 | 否（agent 级；本 fixture 未构造「不属于任何槽位的文件」这一具体场景——三个工作区的 `documents/` 内容全部落在七槽位内，D10 落空转，不构成缺陷） | #19 |
| D11 | 兜底 = 留在原地 + 记 `log.md`；不得建 `unsorted/` | 预取证 | P2×全部 | **可静态核验**：`p2-kuazhuanye/` 全树 `find . -iname 'unsorted*'` 零命中 | #19 |

## 表 E · 推荐信

| # | 检查项 | 模式 | 格 | 静态可判 | 兑现 |
|---|---|---|---|---|---|
| E1 | `recommenders/drafts/` 存在 ⇒ `recommenders.md` 含授权声明（两道闸） | 预取证 | P1×全部 | **是：`drafts-imply-consent`**（三工作区全量绿；P1 的 `recommenders/drafts/r2.md` 对应 `recommenders.md` 授权声明表内 `r2 \| 2026-08-16` 一行） | #12 #23 |
| E2 | P2/P3 无授权 ⇒ `recommenders/drafts/` 不存在 | 预取证 | P2×全部、P3×全部 | **是：`drafts-imply-consent`**（P2/P3 均无该目录，PASS 分支为「存在性闸空转」） | #12 |
| E3 | support pack 里不出现任何以推荐人第一人称写的英文句子 | 预取证 | P1/P2/P3×全部 | 否（agent 级：support pack 是派生视图，不落盘） | #12 |
| E4 | pack 每推荐人一份且不落盘（派生视图） | 预取证 | P1×全部 | 否（agent 级） | #12 |
| E5 | 🔴 UIUC 一键导入：告知推荐人收不到新请求，但不设闸口 | 预取证 | P1/P2/P3×uiuc--gradcollege--mcs | 否（agent 级；静态前提——`_shared/channels/uiuc--gradcollege.md` `## 🔴 推荐信机制` 已带 `✓` 落盘该规则原文） | #12 |
| E6 | 不做推荐人排序建议 | 预取证 | P1/P2/P3×全部 | 否（agent 级） | #12 |
| E7 | 缺口三类齐备（缺素材 / 缺人 / 缺放行），且第三类不给倾向性建议 | 预取证 | P2×全部 | **可静态核验（无专用检查名）**：P2 的 `c03`=缺素材、`m01 verifiable_by: []`=缺人、`m02 sensitive:yes + verifiable_by: []`=缺人兼缺放行，三类均有具体实例，见 `recommenders.md` 与 `claims.md` 的说明段 | #12 |

## 表 F · 状态层与派生视图

| # | 检查项 | 模式 | 格 | 静态可判 | 兑现 |
|---|---|---|---|---|---|
| F1 | 派生视图零落盘 | 两模式 | P1/P2/P3×全部 | 否（无对应检查名；三工作区全树 grep「缺口清单」「待核实清单」「support pack」等词零命中，人工核对） | #4 #12 |
| F2 | 写入 `programs.md` 的值含 `\|` → 期望报错（不静默转义） | 预取证 | 构造（**不适用于三个 persona**——`error-fixture`） | 否 | #11 |
| F3 | 被聚合的列只含 ASCII；计数用 `awk` 关联数组、去重用 `!s[$0]++` | 两模式 | P1/P2/P3×全部 | **可静态核验（build.sh 本身即实践）**：`tier`/`status`/`pseudo_safer` 三列全 ASCII 枚举值，`build.sh` 的 join 逻辑用 `awk` 关联数组按 `program_key`（ASCII）做键，未用 `uniq`/`sort -u`/CJK 上的 `==` | #4（BSD CJK 坑） |
| F4 | 全产品不出现第二个路径字面量 | 两模式 | 不挂格（被测对象是 repo 文档，非工作区——[ADR 0016](../../../docs/adr/0016-the-checklist-holds-names-and-pointers.md) 已把它归为 `no-second-path-literal`，被测对象 = `CONTEXT.md`/`skills/`，不测 `evals/fixtures/personas/`） | 是：`no-second-path-literal`（`evals/checks/check-docs.sh`，不属本票交付范围，已在 main 上跑） | #4 §0 |
| F5 | `dropped` 项目文件永不删，且 `status_note` 必填 | 预取证 | 构造（**不适用于三个 persona**——三档均未把任何行切到 `dropped`，`error-fixture` 类别） | 否 | #11 #18 |
| F6 | 不主动建议 git 化；会话启动检测 git 并查 `git ls-files` | 两模式 | P1/P2/P3×全部 | 否（agent 级：这是会话行为，与工作区快照无关） | #17 |
| F7 | `log.md` 只记动作与指针、不记内容 | 两模式 | P1/P2/P3×全部 | 否（无对应检查名；三份 `log.md` 人工核对——只记「做了什么/下一步/卡在哪」，不复述素材原文或渠道正文） | #17 |
| F8 | 换季惰性降级：只改 `apply.md` 的 `season`，各阶段下次进入才就地降级自己的节 | 预取证 | P1×全部 | 否（agent 级：本 fixture 是首季快照，不含跨季操作；静态前提——三工作区 `season_downgraded` 均恰为 2027fall，无陈旧戳） | #23 |

## 表 G · 静态检查

| # | 检查项 | 格 | 静态可判 | 兑现 |
|---|---|---|---|---|
| G1 | ❌ **已作废**——被 [ADR 0016](../../../docs/adr/0016-the-checklist-holds-names-and-pointers.md) 接管，权威搬到 `section-prefix-match`（见下） | — | — | ADR 0016 |
| G2 | ❌ **已作废**——权威搬到 `subsection-under-program`（见下） | — | — | ADR 0016 |
| G3 | ❌ **已作废**——权威搬到 `no-prebuilt-empty-section`（见下） | — | — | ADR 0016 |
| — | 每个 `##`/`####` 节名前缀匹配封闭词表恰好一个；`## 项目级差异` 覆盖层不带 owner | P1/P2/P3×全部 | **是：`section-prefix-match`** | 曾用号 G1 |
| — | 每个 `####` 嵌在存在的 `###` 下，且该 `program_key` 在 `programs.md` 中存在 | P1/P2/P3×全部 | **是：`subsection-under-program`** | 曾用号 G2 |
| — | 只建自己 owner 的节，预建空节 = 失败 | P1/P2/P3×全部 | **是：`no-prebuilt-empty-section`** | 曾用号 G3 |
| G4 | 每个 persona 文件头带 `synthetic: true` + 轴值组合 | P1/P2/P3×全部 | **可静态核验（无专用检查名，人工/自查）**：三份 `apply.md` frontmatter 均含 `synthetic: true` 与 `axes:` 八键 | #17 ADR 0010 |
| G5 | 无任何 `SKILL.md` 引用 `evals/` | 不挂格（被测对象是 repo `skills/`） | 是：`skills-never-cite-evals`（`evals/checks/check-docs.sh`，不属本票交付范围，已在 main 上跑） | ADR 0010 |

## 18 格覆盖计数（逐格 ≥ 1 条，自查）

| 格 | 至少命中的断言 |
|---|---|
| P1×columbia--seas--cs-ms | B14（`pseudo-safer-excludes-safer`）、C1、C4 |
| P1×cornell--gradschool--cs-meng | D9（渠道事实）、C1、C4 |
| P1×uiuc--gradcollege--mcs | **B5**、C1、C4、C8、E5 |
| P1×utdallas--ecs--cs-ms | B7（reach 终态实例一）、C1、C4 |
| P1×northeastern--khoury--cs-ms | B7（reach 终态实例二）、C1、C4 |
| P1×umich--rackham--cse-ms | B1、B11、C1、C4 |
| P2×columbia--seas--cs-ms | B8、B14（pseudo_safer 恒等）、C2 |
| P2×cornell--gradschool--cs-meng | B8、C2 |
| P2×uiuc--gradcollege--mcs | B8、C2、E5 |
| P2×utdallas--ecs--cs-ms | B8、C2 |
| P2×northeastern--khoury--cs-ms | B8、C2 |
| P2×umich--rackham--cse-ms | B1、B8、B11、C2 |
| P3×columbia--seas--cs-ms | **B6**、B14、C1 |
| P3×cornell--gradschool--cs-meng | **B2**、**B3**、**B9**、D9 |
| P3×uiuc--gradcollege--mcs | **B4**、C1、E5 |
| P3×utdallas--ecs--cs-ms | B7（reach 终态实例一） |
| P3×northeastern--khoury--cs-ms | B7（reach 终态实例二） |
| P3×umich--rackham--cse-ms | B1、B11 |

**18/18 格全部有 ≥1 条断言命中**——加粗的六条（B2/B3/B4/B5/B6/B9）是「一人点亮五档」与「B5 隔离性」两组设计目标的直接落点。
点不亮任何断言的轴值组合未引入（[#14](https://github.com/jiangxidong/EduApplication/issues/14) 已否掉预算、申请学校数量、目标项目类型三个候选轴）。

## 表 B（触发准确性）与表 C（交接面）——不属本票交付范围

[#14](https://github.com/jiangxidong/EduApplication/issues/14) 原文表 B「触发准确性」（T1–T10）测的是 `SKILL.md` frontmatter，
与工作区状态无关，**本票不构造对话脚本**（#14 §7 已否掉「脚本应答集」）；表 C「交接面」（X1–X5）
只挂 P1，需要真跑一次 `pick-programs → write-essays → assemble-packet` 链路，**是 agent 级**，
本 fixture 只提供其**静态前提**：X1（`p1-linxiaoyu/essays/canonical/per-program/uiuc--gradcollege--mcs.md`
文件名与 `programs.md` 的 `uiuc--gradcollege--mcs` 主键字面一致）、X2（该文件虽未设 `claims:` frontmatter——
per-program 契约字段是 `based_on`，`claims:` 仅属三形态——故 X2 落空转，不适用于 per-program 层）。
