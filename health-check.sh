#!/bin/bash
# health-check.sh — Health checks for all TryTools.app tool pages
# Usage: bash health-check.sh [--headed] [--screenshots]
# Requires: playwright-cli (npm install -g @playwright/cli@latest)

HEADED=""
SCREENSHOTS=""
SERVER_URL="${SERVER_URL:-http://localhost:3333}"
OUTDIR=".playwright-cli/health-check"
rm -rf "$OUTDIR"
mkdir -p "$OUTDIR"

for arg in "$@"; do
  case $arg in
    --headed) HEADED="--headed" ;;
    --screenshots) SCREENSHOTS="1" ;;
  esac
done

# Use system Edge if available
if [ -f "/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" ]; then
  export PLAYWRIGHT_MCP_BROWSER=msedge
fi

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'
PASS=0; FAIL=0; RESULTS=""

# Eval helpers
get_title() {
  local raw
  raw=$(playwright-cli eval "document.title" --raw 2>&1)
  echo "$raw" | tr -d '"' | head -1
}

get_console_errors() {
  local json
  json=$(playwright-cli console error --json 2>&1)
  echo "$json" | grep -o 'Errors: [0-9]*' | grep -o '[0-9]*'
}

click_by_text() {
  local text=$1
  playwright-cli click "getByRole('button', { name: /$text/ })" --raw > /dev/null 2>&1
}

type_text() {
  local text=$1
  playwright-cli type "$text" --raw > /dev/null 2>&1
}

fill_text() {
  # Replace existing text content (uses Ctrl+A + type)
  local text=$1
  playwright-cli press Control+a --raw > /dev/null 2>&1
  playwright-cli type "$text" --raw > /dev/null 2>&1
}

check_page() {
  local slug=$1
  local expected_title=$2
  local test_func=${3:-}

  printf "  %-22s " "$slug"

  # Open page
  playwright-cli open "$SERVER_URL/$slug/" > /dev/null 2>&1

  # Title check
  local title
  title=$(get_title)
  if echo "$title" | grep -qi "$expected_title"; then
    printf "${GREEN}title✓${NC} "
  else
    printf "${RED}title✗${NC} "
    RESULTS+="  ${RED}FAIL${NC} $slug: title mismatch (got: ${title:0:60})\n"
    FAIL=$((FAIL+1)); return
  fi

  # Console errors
  local errors
  errors=$(get_console_errors)
  if [ -z "$errors" ] || [ "$errors" -eq 0 ]; then
    printf "${GREEN}js✓${NC} "
  else
    printf "${RED}js($errors)✗${NC} "
    RESULTS+="  ${RED}FAIL${NC} $slug: $errors console errors\n"
    FAIL=$((FAIL+1)); return
  fi

  # Dark mode
  local has_dark_btn
  has_dark_btn=$(playwright-cli eval "!!document.querySelector('[data-theme], .dark-mode-toggle, [aria-label*=\"dark\" i], [aria-label*=\"toggle\" i], button:has(svg)')" --raw 2>&1 | tr -d '"')
  if [ "$has_dark_btn" = "true" ] || [ "$has_dark_btn" = "1" ]; then
    printf "${GREEN}dark✓${NC} "
  else
    printf "${YELLOW}dark?${NC} "
  fi

  # Function test
  if [ -n "$test_func" ]; then
    if $test_func; then
      printf "${GREEN}func✓${NC}"
    else
      printf "${RED}func✗${NC}"
      RESULTS+="  ${RED}FAIL${NC} $slug: function test failed\n"
      FAIL=$((FAIL+1)); return
    fi
  fi

  # Screenshot
  if [ -n "$SCREENSHOTS" ]; then
    playwright-cli screenshot --filename="$OUTDIR/$slug.png" --raw > /dev/null 2>&1
    printf " 📷"
  fi

  echo ""
  PASS=$((PASS+1))
}

# --- Tool-specific tests ---

test_index() { true; }

test_base64() {
  type_text "Hello World"
  playwright-cli click "#convertBtn" --raw > /dev/null 2>&1
  sleep 0.5
  playwright-cli eval "document.querySelector('.output-area')?.textContent?.trim()?.length > 0" --raw 2>&1 | grep -q true
}

test_case_converter() {
  # Auto-converts on input
  type_text "hello world"
  sleep 0.5
  playwright-cli eval "document.body.textContent.includes('HELLO WORLD') || document.body.textContent.includes('Hello World')" --raw 2>&1 | grep -q true
}

test_color_converter() {
  playwright-cli eval "document.querySelector('input[type=color]') !== null" --raw 2>&1 | grep -q true
}

test_json_formatter() {
  fill_text '{"hello":"world"}'
  playwright-cli click "getByRole('button', { name: /Format/ })" --raw > /dev/null 2>&1
  sleep 0.5
  playwright-cli eval "document.querySelector('.output-area')?.textContent?.includes('hello')" --raw 2>&1 | grep -q true
}

test_table_generator() {
  playwright-cli eval "document.querySelector('table') !== null || document.querySelectorAll('input').length > 0" --raw 2>&1 | grep -q true
}

test_timestamp_converter() {
  playwright-cli eval "document.querySelectorAll('input').length > 0" --raw 2>&1 | grep -q true
}

test_url_encoder() {
  type_text "https://example.com/test?q=hello"
  playwright-cli click "#convertBtn" --raw > /dev/null 2>&1
  sleep 0.5
  playwright-cli eval "document.querySelector('.output-area')?.textContent?.includes('%')" --raw 2>&1 | grep -q true
}

test_uuid_generator() {
  playwright-cli click "getByRole('button', { name: '1' })" --raw > /dev/null 2>&1
  sleep 0.3
  playwright-cli eval "document.querySelector('span.value')?.textContent?.length > 30" --raw 2>&1 | grep -q true
}

test_word_counter() {
  type_text "hello world test"
  sleep 0.5
  playwright-cli eval "document.body.textContent.includes('3')" --raw 2>&1 | grep -q true
}

# --- Main ---

echo "TryTools.app Health Check"
echo "Server: $SERVER_URL"
echo "========================="

# Start server if needed
if ! curl -s -o /dev/null "$SERVER_URL/" 2>/dev/null; then
  echo "Starting dev server..."
  npx --yes serve -l 3333 > /dev/null 2>&1 &
  sleep 3
fi

echo ""
echo "Core:"
check_page "" "TryTools" test_index

echo ""
echo "Tools:"
check_page "base64" "Base64" test_base64
check_page "case-converter" "Case Converter" test_case_converter
check_page "color-converter" "Color Converter" test_color_converter
check_page "json-formatter" "JSON" test_json_formatter
check_page "table-generator" "Table Generator" test_table_generator
check_page "timestamp-converter" "Timestamp" test_timestamp_converter
check_page "url-encoder" "URL" test_url_encoder
check_page "uuid-generator" "UUID" test_uuid_generator
check_page "word-counter" "Word Counter" test_word_counter

echo ""
echo "========================="
echo -e "Results: ${GREEN}$PASS passed${NC}, ${RED}$FAIL failed${NC}"
[ -n "$RESULTS" ] && echo -e "\nFailures:\n$RESULTS"
[ -n "$SCREENSHOTS" ] && echo "Screenshots saved to $OUTDIR/"
echo ""

exit $FAIL
