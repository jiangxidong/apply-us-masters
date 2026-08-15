# 材料原件（canonical 层）

**原则：存信息量最大的一侧。降级可逆，升级不可逆。**

| 内容 | canonical 怎么存 | 为什么 |
|---|---|---|
| 成绩单 | `transcript/page-NN.pdf`，**逐页单文件、高分辨率彩色** | 可合并给 Cornell、可降采样给 UIUC；合并件拆不回去，200dpi 灰度也升不回高清 |
| 评分说明 | `transcript/legend.pdf` | UIUC 单列 `transcript_legend_upload` |
| 学位证 / 毕业证 | `degree/` | — |
| 翻译件 | `translation/`，认证等级记在文件旁的 `.md` | Cornell 要 certified **or** notarized |
| 护照 | `identity/` | ⚠️ 敏感 |
| 英语成绩 | `english/` | 送分状态记在 `profile.md` |

**逐校成品不放这里** —— 那是 `packets/<program_key>/` 的事，且是可再生的。

⚠️ **隐私与 `.gitignore` 的约定本票不定**（地图「Not yet specified」里挂着这一条）。
本原型只保证：契约本身**不依赖 git**，所以不放进版本控制也能完整工作。

## 当前状态

- `transcript/` —— **空**（用户尚未提供）
- 其余目录未创建（**用不到就不建空目录**）
