I wanted a set of developer tools that I could trust with sensitive data. No server logs. No tracking. No signup. So I built them myself — as single HTML files.

---

## One HTML File Per Tool

Each tool is self-contained — HTML, CSS, and JavaScript all in one file. No npm. No webpack. No build step.

This constraint forced me to keep things simple, stay fast, and make deployment a one-command affair.

---

## The 9 Tools

| # | Tool | What it does |
|---|------|-------------|
| 1 | **Timestamp Converter** | Unix timestamps with natural language support |
| 2 | **JSON Formatter** | Format, validate, minify with tree view |
| 3 | **Base64 Encoder** | Full Unicode, file-to-dataURL, URL-safe decode |
| 4 | **URL Encoder** | encodeURIComponent and encodeURI side by side |
| 5 | **UUID Generator** | Bulk v4, crypto-secure, format options |
| 6 | **Color Converter** | HEX, RGB, HSL plus named CSS colors |
| 7 | **Word Counter** | Words, chars, sentences, keyword density |
| 8 | **Case Converter** | All 7 transformations at once |
| 9 | **Table Generator** | Visual grid to Markdown, HTML, or MediaWiki |

**[→ Try them all at trytools.app](https://trytools.app)**

---

## Why Browser-Side?

Every tool processes data using browser APIs — `TextEncoder`, `crypto.randomUUID()`, `Intl.DateTimeFormat`.

**No data ever leaves your device.** No server logs. No tracking pixels. No analytics scripts.

---

## The Table Generator

The most complex tool. A visual grid editor with three output formats:

- Paste CSV from Excel — it auto-fills the grid
- Shift+click to select cells, right-click to merge
- Rich text: **bold**, *italic*, text color
- Built-in undo/redo, keyboard navigation, auto-save
- Parse existing Markdown, HTML, or MediaWiki tables

Built because I couldn't find a single tool that handled all three formats well.

---

## What I Learned

- Browser APIs are powerful enough for most dev tools
- JSON-LD structured data makes tools discoverable by AI crawlers
- Single-file approach keeps things fast and trivial to deploy

---

**[Live Site → trytools.app](https://trytools.app)**  
**[Source Code → github.com/joyme2020/trytools](https://github.com/joyme2020/trytools)** (MIT)

Feedback welcome — what tools should I build next?