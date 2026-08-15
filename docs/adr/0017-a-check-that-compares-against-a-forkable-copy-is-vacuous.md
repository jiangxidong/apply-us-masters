# ADR 0017：参照物与被检对象同处一个可分叉副本时，检查恒真

- 状态：已接受
- 日期：2026-08-15
- 来源：[#46 prototype/application-packet 上的 CONTRACT.md 与样例已落后一整轮裁决](https://github.com/jiangxidong/EduApplication/issues/46)

## 背景

同一个缺陷在本仓库**已经出现两次**，两次都是「机械检查全绿，而被检对象是错的」：

1. **[#31](https://github.com/jiangxidong/EduApplication/issues/31)**：`derive-demo.sh` 的列数检查写成 `if (!...)` 形式的**自相对**断言——
   它拿表头的列数去校验数据行的列数。表头少一列时，数据行也少一列，检查照样过。
   `programs.md` 停在 9 列而 [#11](https://github.com/jiangxidong/EduApplication/issues/11) 要求 13 列，脚本一声没吭。
2. **#46（本条）**：`trace-packet.sh` 检查 [4] 用 `source_fingerprint` 比对包与真相源的 `cksum`。
   在 `prototype/application-packet` 分支上跑，**14 行指纹全绿**——而这个分支的 `CONTRACT.md`
   与 `sample-workspace/` 停在 merge-base `237aae8`，落后 `prototype/state-layer` 一整轮裁决
   （[#31](https://github.com/jiangxidong/EduApplication/issues/31) 的 13 列、[#32](https://github.com/jiangxidong/EduApplication/issues/32) 的 `points.md` 改写、[#21](https://github.com/jiangxidong/EduApplication/issues/21) 的 `claims.md`）。
   包和它比对的真相源**是被同一次分叉一起冻住的**，所以它们当然一致。

第二例的取证（`ca3a509` 合入前后各跑一次同一个脚本）：

```
# 合入前（分支自带的冻结副本）
=== [4] source_fingerprint 是否与当前真相源一致（陈旧包检测） ===
--- uiuc--gradcollege--cs-msc
✅ apply.md ✅ profile.md ✅ programs.md ✅ recommenders.md
✅ essays/canonical/long.md ✅ essays/canonical/points.md ✅ channels/uiuc--gradcollege.md
（两个包共 14 行，全绿）

# 合入 state-layer(ca3a509) 之后
🔴 apply.md 已变（包内 776643646-1914 → 现在 3317995117-2102）→ 整包重生成
🔴 programs.md 已变（包内 1431628522-1419 → 现在 2317211434-2250）→ 整包重生成
（14 行中 12 行 🔴）
```

**同一个脚本、同一份包、同一天，结论从「全新鲜」翻成「全陈旧」**，翻转的唯一变量是参照物换成了权威版本。

## 决定

**一个检查，若它的参照物与被检对象同处一个可整体冻结的副本之中，则该检查恒真，不构成任何保障。**

「可整体冻结的副本」在本仓库已见三种形态：

- **分支**——feature 分支自带一份真相源的私有拷贝，随分叉一起停在过去（#46）；
- **同一份产物内部**——表头与数据行互校（#31）；
- **fixture 快照**——回归 fixture 与它断言的对象取自同一次快照。

推论三条：

1. **落盘的检查必须能说出它的参照物在副本之外的什么地方。** 说不出，这个检查就是装饰。
2. **「全绿」不是证据。** 报告一次通过时，必须同时报出参照物是什么、取自哪里；
   只贴 ✅ 行等于把一个恒真断言当成取证结果——这是 [ADR 0007](0007-a-checkmark-is-earned-by-a-fetch-not-by-a-capability.md)
   「`✓` 由取回赚得，不由能力赚得」在**机械检查**这一层的同一条规矩。
3. **具体到 `packets/`**：`trace-packet.sh` 检查 [4] 只有在 `packets/` 与真相源同处
   **带着契约 head 的那棵树**时才有意义。因此在 `prototype/application-packet` 上做任何与包有关的工作之前，
   **先合入 `prototype/state-layer`**——否则检查 [4] 的输出是无信息的。

## 为什么不选另外两条

**让检查跨分支/跨远端取参照物**（例如 `git show origin/prototype/state-layer:<path>` 再比对）：
把一个纯本地、纯 `awk`/`grep` 的检查变成需要网络与远端状态的检查，
而 [#14](https://github.com/jiangxidong/EduApplication/issues/14) 已判定回归检查里「须跑 agent／须联网」的那些不进 CI。
更糟的是它只修了**分支**这一种形态，对 #31 那种同产物内部自相对无效——治标不治本。

**靠人记得「跟上」**：这正是已经失败过的方案。#46 的分叉不是谁疏忽了，
是**分叉期间没有任何信号**——检查全绿、README 没警告、包看起来是新的。
一个只在人记得的时候才生效的保障，在并行 session 下等于没有（见地图 Notes 的四条硬约束）。

## 代价

- **本条判死了一批看起来在干活的检查。** 逐条复核存量脚本的参照物来源是实打实的工作量，
  且复核的产出多半是「这条检查一直没用」——负向的、不好看的结论。
- **`prototype/application-packet` 上的工作从此多一步前置合并**，忘了这步的代价是拿到一份无信息的绿。
- 本条**没有给出机械的自检办法**：判断「参照物在不在副本之外」目前只能靠人读脚本。
  想自动化就要给每条检查标注参照物来源，那是一层新元数据，暂不做。

## 作废条件

- 若 `prototypes/` 的两个分支合并为一个、或契约与样例上了 `main`，
  推论 3 的「先合入」当场作废（分叉这个形态消失了），但推论 1、2 仍然成立。
- 若将来给每条检查加上「参照物来源」的显式标注并能机械校验，本条从人肉纪律降级为工具约束，
  正文的推论 1 应改写为对那层标注的要求。
