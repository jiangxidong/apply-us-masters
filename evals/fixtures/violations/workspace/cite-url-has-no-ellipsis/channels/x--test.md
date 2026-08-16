# 渠道约束层（翻红夹具：cite-url-has-no-ellipsis，作用域 a）

- `✓ https://example.edu/…/admissions` 违规行：顶层 bullet 首行，URL 内含省略号（U+2026），应翻红
  这是缩进续行，带省略号 … 但不是顶层 bullet 首行——天然排除，不应计入命中
> `✓ https://example.edu/…/quote-block` 引用块：同一行同时含 checkmark、URL 与省略号，但不是顶层 bullet（同真实样例 uiuc--gradcollege.md:41 撞过的形态）——天然排除
- 同上一条阴性对照：`✓ 同上` 没有 URL 可判——天然放行
- 待核实阴性对照：这行没有 checkmark——天然放行
