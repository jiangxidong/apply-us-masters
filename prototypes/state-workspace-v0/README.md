# 状态层工作区原型 v0

**这是 throwaway 原型，不是产品代码。** 服务于
[#4 状态层的文件契约长什么样](https://github.com/jiangxidong/EduApplication/issues/4)，
只活在 `prototype/state-layer` 分支上，**不进 main**。

## 怎么读

1. **`CONTRACT.md`** —— 契约本体。文件清单 + owner、两层数据结构、主键粒度、证据与换季语义、
   与相邻票的边界、**已决议的 4 个分叉**。先读这个。
2. **`sample-workspace/`** —— 填满了的样例工作区。
3. **`./derive-demo.sh`** —— 跑一下，看派生视图（待核实清单 / 闸口 / 素材门槛）如何机械算出而不落盘。

## 样例数据的来源与边界

- **申请人「林小雨」及其全部经历、成绩、项目、推荐人：完全虚构。**
  （竞品坑 #5：`taught-master` 自称匿名模板却泄露了真实个人项目，还被指示当作 preview shape 复用。）
- **三所项目是真实的，其申请约束取自 2026-08 的 #6 调研**（303 行字段表，10 所学校）。
  用真约束是有意的：只有真数据里那些**互相拉扯**的要求，才能检验契约撑不撑得住。
  （原句写的是「物理上无法同时满足」，[#14](https://github.com/jiangxidong/EduApplication/issues/14) 已推翻：
  一份合并的灰度低分辨率 PDF 同时满足 Cornell 与 UIUC，美国池内唯一的硬冲突是**文件格式**且交集 PDF 存在。
  两层结构的正当性来自**降级不可逆**，不来自「存在无法同时满足的约束」。这里是 #14 漏回填的一处，由 #31 补。）
  这些约束**仅供演示，不得当作现行事实**——带 `✓` 的行标的是「**2026-08 调研时该 URL 上是这么写的**」，
  **不是**「本季仍然如此」；`channels/` 每个文件抬头都写着「演示用，本季必须重查」。
  （原句写的是「原型里它们全部标着 `待核实`」，与样例里的 **50 条** `✓` 直接打架——
  边界没变，仍然不得当作现行事实，改的是把执行方式说对。[#31](https://github.com/jiangxidong/EduApplication/issues/31)）

## 原型验到了什么

| 检验点 | 结果 |
|---|---|
| canonical + rendering rules 两层结构撑得住成绩单扫描的相反要求吗？ | ✅ Cornell 要合并清晰 vs UIUC 要 <200dpi 灰度 —— 存高清逐页单文件，两边都能降级渲染 |
| 撑得住文书形态的三选一吗？ | ✅ 需要 `points.md` 这个第三渲染物；Columbia 长文 / Cornell 两篇 / UIUC 4×250 短答题，从长文自动截会失败 |
| 三种推荐信机制能落进同一张表吗？ | ✅ 但必须区分**风险 A 冒名发信**与**风险 B 冒名复用**，只拦发信会完全漏掉 UIUC 的导入 |
| 派生视图真能不落盘吗？ | ✅ `derive-demo.sh` 跑通 |
| 中文内容下 shell 派生视图可靠吗？ | ⚠️ **`uniq` 与 `sort -u` 都坏** —— 前者数错、后者直接丢行，`LC_ALL` 修不好。**与格式无关**（对 Markdown 表和 TSV 一样坏）。计数/去重改用 awk，见 `CONTRACT.md` §4.5 |
| 判断层四列（#11）能和二元证据体系共存吗？ | ✅ 共存。**代价是「没查过 = `undecided`」会大面积出现**：#31 建这四列时 `channels/` 里的 `✓` 全是机制类事实，承载分档的只有 UIUC 一条硬门槛 → Columbia / Cornell 点名不出事实 → `tier_basis` 空 → 机械判别式压成 `undecided`。**规则在数据上咬人的样子，正是这张表要验的东西**（#31）。⚠️ 那一屏的 `undecided` 是**取证欠账**、不是规则的终点——#45 补了两次真取回后，Columbia 当场从 `undecided` 变成有依据的 `reach` |
| 五档里 `safer` 那一档，在真数据上产得出来吗？ | ❌ **产不出来，且不是「这次没查到」** —— #45 真取回了 ADR 0009 点名的两条候选第二条线，两条都判为**类型 B 且无离散度**（UIUC 的 `3.2` 被学校自己的 FAQ 解释成「已录取者平均分、不是最低线」；Columbia 的 `3.5` 是 `Successful applicants typically`），按 `CONTEXT.md`「第二条线」⚠️ 第二条**都不判 `safer`**。UIUC 还叠了第二道独立的闸：英语维度**擦线**（Full Status 103 未跨过）。**五所样本里 `safer` 产出为零**，比 ADR 0009 预计的更极端（→ #54） |
| 那 `match` 呢？ | ✅ **演到了，但演在票面没预期的那一行** —— UIUC 的 3.2 判为类型 B 之后**恰好**成了 `match` 的合法依据（你 3.4 高于已录取者平均 3.2），UIUC 行 `reach → match`；而票面预期出 `match` 的 Columbia，因画像 3.4 **低于**其公布的 3.5 下界，连 `match` 都够不着，落 `reach`。**两档都演到了，落在对调的两行上**（#45） |
| 伪保底这一列在真数据上立得住吗？ | ✅ Columbia CS MS 的同一句话里既有 `no minimum GPA requirement` 又有 `the program is highly selective` —— **两半住在同一条 `✓` 事实行上**，`pseudo_safer` 由 `unknown` 改为 `yes`，且机械判别式 `pseudo_safer = yes ⇒ tier ≠ safer` 在该行成立（`reach`）。这是 `CONTEXT.md`「伪保底」词条点名的那个例子被真取回坐实（#45） |
| 补 4 列会不会打断已有的派生视图？ | ✅ 不会 —— 判断层四列**追加在末尾**，`awk` 按竖线切开后 `$7`/`$9`/`$10` 取值不变，`derive-demo.sh` **一行未改**即从「9 列」自动打印成「13 列」（它的列数检查是自相对的，不硬编码列数） |
| 「二元证据标记 + 仅一列」这条锁定决策成立吗？ | ❌ **不成立** —— 按行级合取规则造不出一条合法的 `✓` 行（deadline / 学费 / STEM 资格从不在同一页）。**已决议**：`evidence` 只担保 deadline，其余下沉 `channels/` |
| 「coursework master」这条切片边界，在真数据上判得动吗？ | ⚠️ **判得动，但必须逐项目取回一句话，不能按学位名推** —— UIUC 的 `MS in Computer Science` 是 Thesis/Research 皆 Yes 的研究型硕士（#31 建行时按名字填错、#45 取回时撞出、#55 改判），同校的 `MCS` 才是学校自称的 `coursework-only degree`。另两行复核后都在切片内：Columbia 的 MS 是 30 points 且 `MS Thesis` 只是十条 pathway 之一并需受邀，Cornell 的 MEng 是 `coursework with a capstone project`。**同一个名字在两校分属两侧、同一所学校的两个学位分居两侧 ⇒ 学位名不是判据**（#55） |

## 不在本原型范围内

`packets/` 里装什么（→ #8）、`programs.md` 的中文措辞（→ #11；**列清单已落 `CONTRACT.md` §4.6**）、
何时开新文书版本（→ #10）、词汇定义（→ #13）、隐私与 `.gitignore`（仍是地图上的 fog）。
