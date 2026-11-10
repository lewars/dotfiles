#!/usr/bin/env bash
set -euo pipefail

ISPELL_FILE="${1:-$HOME/.ispell_english}"
HARPER_DICT="${2:-$HOME/.config/harper-ls/dictionary.txt}"

mkdir -p "$(dirname "$HARPER_DICT")"
touch "$HARPER_DICT"

TMP_FILE=$(mktemp)
trap 'rm -f "$TMP_FILE"' EXIT

if [[ -f "$ISPELL_FILE" ]]; then
    # Skip the aspell/ispell header line (first line)
    cat <(tail -n +2 "$ISPELL_FILE") "$HARPER_DICT" | sed '/^[[:space:]]*$/d' | sort -u > "$TMP_FILE"
else
    cat "$HARPER_DICT" | sed '/^[[:space:]]*$/d' | sort -u > "$TMP_FILE"
fi

if ! cmp -s "$TMP_FILE" "$HARPER_DICT"; then
    cat "$TMP_FILE" > "$HARPER_DICT"
    chmod 0644 "$HARPER_DICT"
    echo "CHANGED"
fi
