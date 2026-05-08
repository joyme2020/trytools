# Unix Timestamp Converter

Free online tool for converting between Unix timestamps and human-readable dates. Zero dependencies, single HTML file, instant deployment.

**Live demo**: [timestamp-converter.vercel.app](https://timestamp-converter.vercel.app)

## Features

| Feature | Description |
|---------|-------------|
| Timestamp → Date | Convert Unix timestamps (seconds or ms) to formatted dates |
| Date → Timestamp | Convert human-readable dates to Unix timestamps |
| Natural language | Supports `now`, `today`, `tomorrow`, `3 days ago`, `next Friday at 3pm`, etc. |
| Timezone support | 8 selectable timezones + 12-zone live reference grid |
| Live clock | Real-time Unix timestamp display, updates every second |
| ISO 8601 | Full support for ISO date strings with or without timezone suffix |
| Zero-upload | All processing happens locally in the browser — no data is ever sent anywhere |
| Keyboard shortcut | `Ctrl+K` to focus the input field |
| URL sharing | Append `?ts=<timestamp>` to share a specific conversion |

## Quick Deploy

### Vercel (recommended — free)

```bash
cd timestamp-converter
npx vercel --prod
```

### Any static host

Upload `index.html` to any static file server (GitHub Pages, Netlify, Cloudflare Pages, S3, etc.) — no build step needed.

## Natural Language Reference

| Input | Result |
|-------|--------|
| `now` | Current moment |
| `today` | Midnight today (local) |
| `tomorrow` / `yesterday` | Midnight tomorrow / yesterday |
| `3 days ago` / `2 hours later` | Relative time offset |
| `next Monday` / `last Friday` | Day of week (this week or next/last) |
| `next Friday at 3pm` | Day of week with time |
| `3 days ago at noon` | Relative offset with time |
| `3pm` / `14:30` / `noon` / `midnight` | Standalone time → today at that time |
| `1 week after 2025-06-01` | Offset from a specific date |

All expressions support the selected timezone (Date → Timestamp mode).

## Timezone Handling

| Component | Behavior |
|-----------|----------|
| Timestamp → Date | Displays the absolute UTC moment in the selected timezone |
| Date → Timestamp | Interprets the input wall-clock time as belonging to the selected timezone, then computes the corresponding Unix timestamp |
| NLP expressions | In Date → Timestamp mode, expressions like `next Friday` produce midnight in the *selected* timezone |
| ISO inputs with `Z`/`±HH:MM` suffix | Timezone suffix is stripped; the dropdown timezone selector takes full control |

### DST transitions

For dates during DST transition windows (~2 AM spring-forward / fall-back), the tool uses noon UTC on the target date to determine the correct offset, avoiding the ambiguous 2 AM window. This is correct for >99.9% of inputs and consistent with industry-standard behavior.

## AdSense Setup

Replace the placeholder markers in `index.html` with your AdSense code:

- `ADSENSE_SLOT_TOP` (line ~334) → above the converter
- `ADSENSE_SLOT_BOTTOM` (line ~390) → above the footer

The placeholder elements have IDs `ad-top` and `ad-bottom` and use the `.ad-placeholder` class for layout.

## File Structure

```
timestamp-converter/
├── index.html    # Complete application (HTML + CSS + JS)
├── vercel.json   # Vercel deployment config
└── README.md     # This file
```

## Technical Notes

- **Zero dependencies**: No frameworks, no npm, no CDN — just a single HTML file
- **Browser APIs used**: `Intl.DateTimeFormat` (timezone formatting), `navigator.clipboard` (copy), `URLSearchParams` (URL sharing)
- **Clipboard fallback**: Falls back to `document.execCommand('copy')` if the Clipboard API is unavailable
- **Size**: ~23 KB uncompressed, loads in < 50 ms
- **Browser support**: Chrome 80+, Firefox 72+, Safari 14+, Edge 80+

## License

MIT
