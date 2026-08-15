# 文书素材库

**七字段**（[#10](https://github.com/jiangxidong/EduApplication/issues/10) 的六字段 +
[#17](https://github.com/jiangxidong/EduApplication/issues/17) 的 `敏感`）：

| 字段 | 落在哪 | 本样例 |
|---|---|---|
| 时间/场景 | 正文「具体」列表 | ✓ |
| 我的具体动作 | 正文「具体」列表 | ✓ |
| 结果或转折 | 正文「具体」列表 | ✓ |
| 可验证性 | 正文「谁能证实」 | ✓ |
| 已用于 | — | 🔴 **两个文件都没有，见下** |
| 原始出处 | 正文「原始出处」 | ✓ |
| `敏感` | frontmatter，**ASCII 二元 `yes` / `no`** | ✓ 两条均 `no` |

frontmatter 的 `usable_for` **不是**「已用于」——它说的是「可以用在哪类文书」，是判断；
「已用于」说的是「实际用在了哪几篇、哪些学校」，是事实。两者不能互相顶替。

🔴 **`已用于` 有意留空**：它每写一篇文书就要被改写一次，按状态层的镜像判别式该杀，
但 #10 给了它一字段两用途（防跨校开头雷同 + 推荐信差异化）。
是删是留 → [#30](https://github.com/jiangxidong/EduApplication/issues/30) 裁决，本样例**不就地拍板**。

**素材门槛**（地图已锁定的质量硬约束）：**3–5 个具体素材**。
「具体」的判据是**三问**（什么时候 / 你做了什么动作 / 结果是什么），见每个素材文件的 frontmatter `concrete` 字段与正文。

⚠️ **「谁能证实」不在判据里**（[#13](https://github.com/jiangxidong/EduApplication/issues/13) 定稿）——可验证性是素材的**独立属性**，供 `recommenders.md` 选人用。
无人可证的自学项目、个人作品**照样是合格素材**，把它塞进判据会把它们错判为不合格。

当前条数与是否达标：跑 `../derive-demo.sh` 现算。**不写在这里** —— 写下来就要靠改写维持为真。

判定与采集方式（访谈式、批量问、可跳过已知项）归
[#10 文书的双模式与素材门槛怎么共存](https://github.com/jiangxidong/EduApplication/issues/10)。
本票（#4）只定素材落在哪、以什么结构落。
