#!/usr/bin/env bash

emit_window() {
    local title
    title=$(swaymsg -t get_tree | jq -r '
        .. | select(.type? != null) | select(.focused == true) | .name // ""
    ' | head -1)
    jq -cn --arg text "$title" '{text: $text}'
}

# Emit current active window title on startup.
emit_window

# Listen for window events and re-emit on focus/title/open/close changes.
#
# swaymsg's JSON output always has spaces after ':'/',' (no --raw/--pretty
# combination removes them), so matching raw substrings like
# '"change":"focus"' silently never matches. Parse the field with jq instead.
swaymsg -t subscribe -m '["window"]' | while IFS= read -r line; do
    change=$(jq -r '.change // ""' <<< "$line")
    case "$change" in
        focus|title|new|close)
            emit_window
            ;;
    esac
done
