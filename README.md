<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://img.shields.io/badge/tools-9-6366f1?style=for-the-badge">
  <img src="https://img.shields.io/badge/tools-9-6366f1?style=for-the-badge" alt="9 tools">
</picture>
<a href="https://trytools.app"><img src="https://img.shields.io/badge/live-trytools.app-10b981?style=for-the-badge" alt="live demo"></a>
<a href="LICENSE"><img src="https://img.shields.io/badge/license-MIT-blue?style=for-the-badge" alt="MIT"></a>

# TryTools

**9 free online developer tools. All run in your browser — no uploads, no tracking, no signup.**

[trytools.app](https://trytools.app)

---

### Tools

| # | Tool | Description |
|---|------|-------------|
| 1 | **[Timestamp Converter](https://trytools.app/timestamp-converter/)** | Unix timestamps ↔ human dates. Natural language (`3 days ago`, `next Friday noon`), 9 timezones, ISO 8601. |
| 2 | **[JSON Formatter](https://trytools.app/json-formatter/)** | Format, validate, minify JSON. Tree view, error hints, 2/4/tab indent. |
| 3 | **[Base64 Encoder](https://trytools.app/base64/)** | Encode/decode Base64 with full Unicode support. File upload → data URL. URL-safe decoding. |
| 4 | **[URL Encoder](https://trytools.app/url-encoder/)** | URL-encode/decode. Shows both `encodeURIComponent` and `encodeURI` results side by side. |
| 5 | **[UUID Generator](https://trytools.app/uuid-generator/)** | Generate UUID v4 in bulk (1–100). Uppercase/lowercase, with/without hyphens. Crypto-secure. |
| 6 | **[Color Converter](https://trytools.app/color-converter/)** | Convert between HEX, RGB, HSL. Named CSS colors supported. Live preview + color picker. |
| 7 | **[Word Counter](https://trytools.app/word-counter/)** | Count words, chars, sentences, paragraphs. Reading time estimate + keyword density analysis. |
| 8 | **[Case Converter](https://trytools.app/case-converter/)** | UPPER, lower, Title, Sentence, tOGGLE, aLtErNaTiNg — all 7 transformations at once. |
| 9 | **[Table Generator](https://trytools.app/table-generator/)** | Visual table editor → Markdown / HTML / MediaWiki. Paste CSV, merge cells, rich text formatting. |

### Why TryTools?

**Privacy by design.** Every tool processes data entirely in the browser using JavaScript. Your text, files, timestamps, and JSON never leave your device. No server round-trips, no logs, no tracking.

**One file per tool.** Each tool is a single HTML file with CSS + JS embedded. No frameworks, no build step, no npm. Drop it on any static host.

**AI-friendly.** Every tool includes structured data (Schema.org JSON-LD), semantic HTML, Open Graph tags, and `<noscript>` fallback content — designed to be understood by search engines and AI crawlers.

### Project Structure

```
trytools/
├── index.html                # Homepage with tool cards
├── robots.txt / sitemap.xml  # SEO
├── vercel.json               # Vercel deployment config
├── timestamp-converter/      # Tool 1
├── json-formatter/           # Tool 2
├── base64/                   # Tool 3
├── url-encoder/              # Tool 4
├── uuid-generator/           # Tool 5
├── color-converter/          # Tool 6
├── word-counter/             # Tool 7
├── case-converter/           # Tool 8
├── table-generator/          # Tool 9
└── privacy/                  # Privacy policy
```

### Deploy Your Own

```bash
# Clone and deploy to Vercel (free)
git clone https://github.com/joyme2020/trytools.git
cd trytools
npx vercel --prod
```

Works on any static host: GitHub Pages, Netlify, Cloudflare Pages, S3 — no build step.

### Built With

- Zero dependencies, no frameworks
- Plain HTML + CSS + vanilla JavaScript
- Browser APIs: `crypto.randomUUID()`, `Intl.DateTimeFormat`, `TextEncoder/Decoder`, `navigator.clipboard`
- Schema.org structured data for AI crawling

### License

MIT — use, modify, and deploy freely.
