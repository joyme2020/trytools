# Reddit 分发方案（安全版）

**核心原则：**
- Text post，不發 Link post
- 标题讲动机和过程，不讲产品
- 标题不提域名、不说 free、不打广告腔
- 正文先讲故事，再自然带出链接
- 发前 2-3 天先在目标 sub 和同类帖子里正常互动 5-10 条

---

## 1. r/SideProject（今天发）

**标题：** I got tired of pasting sensitive data into random online tools, so I built my own

**正文：**

I work with timestamps, JSON, and API payloads daily. Every time I Googled "timestamp converter" or "json formatter", I'd paste my data into some random site and immediately wonder — where is this being sent?

So I spent a few weekends building replacements. The rule I set for myself: everything must run in the browser. No backend. No server. No tracking scripts. Just HTML files I can read and verify.

Ended up with 9 tools:

- **Timestamp Converter** — handles natural language like "next Friday at 3pm" and 9 timezones
- **JSON Formatter** — format, validate, tree view, error hints
- **Base64 Encoder** — full Unicode, file-to-dataURL
- **URL Encoder** — shows both encodeURIComponent and encodeURI results
- **UUID Generator** — bulk v4, crypto-secure
- **Color Converter** — HEX/RGB/HSL + named CSS colors
- **Word Counter** — keyword density analysis included
- **Case Converter** — all 7 transformations at once
- **Table Generator** — visual editor → Markdown/HTML/MediaWiki

Each tool is a single HTML file. Zero dependencies. I open-sourced everything under MIT.

[Source on GitHub](https://github.com/joyme2020/trytools)

Curious what other tools you'd find useful — or if you've built similar things for the same reason.

---

## 2. r/programming（明天发）

**标题：** What I learned building 9 browser-side tools as single HTML files with zero dependencies

**正文：**

Over the past few weeks I challenged myself to build a set of developer tools under one constraint: each tool must be a single HTML file. No frameworks. No build tools. No npm.

The motivation was privacy — I was uncomfortable pasting work data into random online converters. If I built my own, I'd know exactly where the data goes (nowhere).

**Technical takeaways:**

1. **Browser APIs have come a long way.** `crypto.randomUUID()` for UUID generation. `Intl.DateTimeFormat` for timezone-aware date display. `TextEncoder/TextDecoder` for Unicode-safe encoding. You can build real tools without a server.

2. **Structured data is the new SEO.** Every tool has JSON-LD Schema.org markup (FAQPage, HowTo, BreadcrumbList). This makes tools readable by AI crawlers like ChatGPT and Perplexity — which are increasingly how people find tools.

3. **Single-file means zero friction.** No routing decisions. No state management libraries. No component trees. Just a textarea, some buttons, and the logic in between.

4. **autoDetect is a UX cheat code.** Instead of making users choose between encode/decode modes, auto-detect based on input patterns. The JSON formatter auto-detects from `%XX` patterns whether to decode. Small detail, huge UX win.

The tools: timestamp converter, JSON formatter, Base64 encoder/decoder, URL encoder/decoder, UUID generator, color converter, word counter, case converter, and a table generator that outputs Markdown/HTML/MediaWiki.

Open source under MIT: [github.com/joyme2020/trytools](https://github.com/joyme2020/trytools)

Has anyone else tried the single-file approach for tooling? Curious about your experience.

---

## 3. r/internetisbeautiful（后天发）

**标题：** A collection of dev tools where nothing leaves your browser — not even a ping

**正文：**

Most online tools send your input to a server. This one doesn't.

It's a collection of 9 utilities — timestamps, JSON formatting, Base64 encoding, UUID generation, color conversion, word counting — and every single one processes data locally in your browser using JavaScript.

No analytics. No tracking. No signup. Open source. You can actually read the source to verify it's not phoning home.

Been quietly useful for quick conversions without worrying about where sensitive work data might end up.

---

## 4. r/webdev（周六发——Showoff Saturday）

**标题：** Built 9 browser-side dev tools with zero dependencies — lessons from the single-file approach

**正文：**

I built a collection of 9 developer tools where everything runs in the browser. Each tool is exactly one HTML file.

The constraint started as an experiment: what can you build with just HTML, CSS, and vanilla JS — no framework, no build step, no backend?

Turns out, quite a lot. The tools handle timestamps, JSON, Base64, URLs, UUIDs, colors, word counts, and table generation (with Markdown/HTML/MediaWiki output).

**What surprised me:**
- Client-side processing is fast enough that users don't notice the difference
- `contenteditable` + `document.execCommand` gives you a surprisingly capable rich text editor for the table generator
- JSON-LD structured data has been a quiet game changer for AI crawler discoverability

Everything is MIT licensed on [GitHub](https://github.com/joyme2020/trytools).

Happy to answer questions about the implementation — especially the table generator (that one got complex quickly).

---

## 发布节奏

| 天数 | Sub | 状态 |
|------|-----|------|
| 今天 | r/SideProject | 先发 |
| 明天 | r/programming | 隔 24h |
| 后天 | r/internetisbeautiful | 隔 24h |
| 周六 | r/webdev | Showoff Saturday |

每个帖子之间至少隔 24 小时，避免被 Reddit 全局 spam filter 关联。
