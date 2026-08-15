# 材料原件（canonical 层）

**原则：存信息量最大的一侧。降级可逆，升级不可逆。**

**一个槽位 = 一个一级目录 = 一个敏感级**（[#19](https://github.com/jiangxidong/EduApplication/issues/19)）。
目录形状是「按槽位分层、院校在下」——反过来会让「槽位自带敏感级」当场失效（得下钻一层才知道能不能读）。

| 槽位 | canonical 怎么存 | 为什么 |
|---|---|---|
| `transcript/<institution_id>/page-NN.pdf` | **逐页单文件、高分辨率彩色** | 可合并给 Cornell、可降采样给 UIUC；合并件拆不回去，200dpi 灰度也升不回高清。**按院校分组**才答得出「哪几页属于 X 校」 |
| `legend/<institution_id>.pdf` | 评分说明，**逐院校一份** | UIUC 单列 `transcript_legend_upload` 且**必填**；多所院校装不进一个 `legend.pdf` |
| `degree/<institution_id>.pdf` | 学位证 / 毕业证 | — |
| `translation/<institution_id>/…` | 翻译件，公证 / 认证等级记在文件旁的 `.md` | Cornell 要 certified **or** notarized |
| `english/` | 语言成绩 | 送分状态记在 `profile.md` |
| `cv/` | 简历 | **canonical 不是渲染物**——排版与措辞从 `profile.md` 重建不出来 |
| `identity/` | 绿卡 / asylee / refugee / parolee 等身份文件 | 🔴 **唯一禁读槽位**，见下 |

`<institution_id>` 是 ASCII 主键，**定义权在 `profile.md` 的学历条目**，这里的目录名只是引用。
中文校名永不进目录名（`CONTRACT.md` §4.5 的 CJK 坑）。

## 🔴 `identity/` 是禁读区

**只做存在性与规格检查，绝不让内容进上下文。**
允许 `ls` / `stat` / `file` / `pdfinfo` 这类只碰元数据的操作；
禁止 Read 读 PDF·图片、`pdftotext`、OCR、截图、缩略图。

**判据是「读了也没用」，不是「敏感」**——agent 对身份文件真正需要的只有存在性（准备包 checklist 打勾）与规格。
所以**成绩单不进禁读区**：算 GPA、填学历列表都得读内容。

⚠️ **三校在申请阶段都不要求上传护照**（#6 的 303 行字段表实查）。护照并入 `identity/` 只作可选，
用途是**姓名拼写核对**。真正逐校要的是绿卡 / 庇护 / 难民 / 假释这类美国特有的身份材料。

## 规格不住这里

**槽位不带规格维**：规格逐渠道（Cornell 要合并清晰 / UIUC 要 <200dpi 灰度，物理上互斥），槽位跨渠道，
两个维度不对齐——规格一律住 `channels/<channel_key>.md` 的 `## 材料上传` 节。
文件**自身**属性（翻译件是否公证）仍记在旁边的 `.md`，它答的是「这是什么」，不是「学校要什么」。

**逐校成品不放这里** —— 那是 `packets/<program_key>/` 的事，且是可再生的。

## 兜底

不属于任何槽位的文件：**只列名问用户归到哪个槽位、不打开**，归类前一律按最严处理。
用户答不上来时**留在原地 + 记进 `log.md`**（唯一的镜像豁免——它是历史观察值）。
否掉 `unsorted/`（把位置当分类断言 = 镜像）与「每次重问」。

**用不到就不建空目录。** 哪些材料到位了，跑 `../derive-demo.sh` 或 `ls` 现看 —— 不在这里记镜像状态。
