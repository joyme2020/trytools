# TryTools 推广素材

---

## 1. Reddit — r/webdev

**标题：** I built 9 free browser-side dev tools — no tracking, no uploads, no bullshit

**正文：**

Over the past few weeks I built [trytools.app](https://trytools.app) — a collection of 9 developer tools that all run entirely in your browser.

**What's included:**

| Tool | What it does |
|------|-------------|
| Timestamp Converter | Unix ↔ human dates, natural language ("3 days ago") |
| JSON Formatter | Format/validate/minify + tree view |
| Base64 Encoder | Full Unicode + file-to-dataURL |
| URL Encoder | encodeURIComponent + encodeURI side-by-side |
| UUID Generator | v4, bulk 1–100, crypto-secure |
| Color Converter | HEX/RGB/HSL + named CSS colors |
| Word Counter | Chars/words/sentences + keyword density |
| Case Converter | 7 transformations at once |
| Table Generator | Visual editor → Markdown/HTML/MediaWiki |

**Why I built it this way:**
- Every tool is a single HTML file. Zero dependencies. No framework. No build step.
- All processing happens in your browser. Your data never touches a server.
- Each page has Schema.org structured data so AI crawlers can understand it.

**Tech stack:** Vanilla HTML/CSS/JS. Deployed on Vercel. MIT licensed on [GitHub](https://github.com/joyme2020/trytools).

Would love feedback — especially on the Table Generator and JSON Formatter. What other tools would you want?

---

**发帖时机：** 北京时间周二/周三晚 9 点（对应美国上午，流量高峰）

---

## 2. Dev.to 文章

**标题：** How I Built 9 Browser-Side Developer Tools as Single HTML Files

**Tags:** `#webdev` `#javascript` `#html` `#tutorial` `#showdev`

**Cover image 描述：** 截一张 trytools.app 首页的工具卡片网格，9 个卡片排列

**正文：**

I wanted a set of developer tools that I could trust with sensitive data. No server logs. No tracking. No signup. So I built them myself — as single HTML files.

### The Constraint: One HTML File Per Tool

Each tool is self-contained. The HTML, CSS, and JavaScript all live in one file. No npm install. No webpack. No `node_modules`. Just open the file or deploy it to any static host.

This constraint forced me to:

1. **Keep it simple** — when you can't `import left-pad`, you write only what you need
2. **Stay fast** — no framework overhead, everything loads in under 100ms
3. **Make deployment trivial** — `npx vercel --prod` and you're live

### The Architecture Pattern

Every tool follows the same structure:

```
<!DOCTYPE html>
<html>
<head>
  <!-- Schema.org JSON-LD for AI crawling -->
  <!-- Open Graph + Twitter Card meta tags -->
  <style>/* All CSS */</style>
</head>
<body>
  <!-- Tool UI -->
  <script>/* All JS */</script>
</body>
</html>
```

### Privacy as a Feature

Every tool processes data client-side using browser APIs:

- Text encoding: `TextEncoder` / `TextDecoder`
- UUID generation: `crypto.randomUUID()`
- Timezone conversion: `Intl.DateTimeFormat`
- Clipboard: `navigator.clipboard`

No data ever leaves the browser. This isn't just privacy — it's also speed. No network round-trips means instant results.

### The Tools

**[Table Generator](https://trytools.app/table-generator/)** — the most complex one. Visual grid editor → Markdown/HTML/MediaWiki output. Supports CSV paste, cell merging, rich text formatting, undo/redo, and keyboard navigation. Built because I couldn't find a table generator that worked well with both Markdown and MediaWiki.

**[JSON Formatter](https://trytools.app/json-formatter/)** — format, validate, minify. Includes a collapsible tree view, error hints with line numbers, and 2/4/tab indent options. Auto-formats on paste.

**[Timestamp Converter](https://trytools.app/timestamp-converter/)** — handles natural language like "next Friday at 3pm" or "3 days ago", plus timezone conversion across 9 zones. Supports URL sharing via `?ts=` parameter.

The other 6 tools (Base64, URL, UUID, Color, Word Counter, Case Converter) follow the same philosophy: instant, private, single-file.

### What I Learned

- **Browser APIs are incredibly capable.** You don't need a backend for most dev tools.
- **Structured data matters.** Adding JSON-LD Schema.org markup makes tools discoverable by AI crawlers.
- **One file per tool is liberating.** No routing, no state management, no component libraries. Just HTML.

### Try It

- Live: [trytools.app](https://trytools.app)
- GitHub: [github.com/joyme2020/trytools](https://github.com/joyme2020/trytools)

---

**发布时间：** 北京时间周四/周五（对应美国工作日）

---

## 3. Product Hunt 发布素材

### 基本信息

| 字段 | 内容 |
|------|------|
| **Product Name** | TryTools |
| **Tagline** | Free browser-side developer tools — no tracking, no uploads |
| **URL** | https://trytools.app |
| **GitHub** | https://github.com/joyme2020/trytools |
| **Category** | Developer Tools |
| **Pricing** | Free |

### 产品描述（260 字符限制）

TryTools is a collection of developer tools that run entirely in your browser. Timestamp converter, JSON formatter, Base64 encoder, URL encoder, UUID generator, color converter, word counter, case converter, and table generator. No data ever leaves your device.

### Maker's Comment（发布后第一条评论）

Hey Product Hunt! 👋

I built TryTools because I was tired of pasting sensitive data into online tools that upload everything to a server. Every tool here processes data entirely in your browser — no server round-trips, no logs, no tracking.

**The 9 tools:**
1. Timestamp Converter — natural language support ("next Friday at 3pm")
2. JSON Formatter — tree view, error hints, auto-format
3. Base64 Encoder — full Unicode, file-to-dataURL
4. URL Encoder — shows encodeURIComponent + encodeURI side by side
5. UUID Generator — bulk v4, crypto-secure
6. Color Converter — HEX/RGB/HSL + named CSS colors
7. Word Counter — keyword density analysis included
8. Case Converter — all 7 transformations at once
9. Table Generator — visual editor → Markdown/HTML/MediaWiki

**Tech:** Each tool is a single HTML file. Zero dependencies. Vanilla JS. MIT licensed.

Built this in public over ~2 weeks. Would love your feedback — especially on the Table Generator (the most complex one). What other tools should I add?

### Logo 建议

用一个 emoji 或简单 SVG：
- Primary: `🛠` 或 `🔧` 放在色块上
- 色调：`#6366f1`（和网站 accent 色一致）
- 可以用 Canva 做一个 240x240 的 PNG

### 截图准备（5 张）

| # | 截图内容 | 说明 |
|---|---------|------|
| 1 | 首页工具卡片网格 | 9 个工具卡片排列 |
| 2 | Table Generator | 展示表格编辑+实时预览 |
| 3 | JSON Formatter | 展示格式化+树视图 |
| 4 | Timestamp Converter | 展示自然语言+时区 |
| 5 | 任一工具 + 隐私标识 | 突出 "all processing in browser" |

### 发布 Checklist

- [ ] 周三 00:01 PST（北京时间 15:01）发布
- [ ] 提前 2 天在 PH 上创建草稿（coming soon page）
- [ ] 准备 5 张 1275×760 截图
- [ ] 准备 240×240 logo
- [ ] 提前找 8-10 个朋友/同事在发布后 30 分钟内 upvote
- [ ] 发布后 15 分钟内发 Maker's Comment
- [ ] 当天在 Twitter/Reddit/Dev.to 同步推广
- [ ] 回复每一条评论
