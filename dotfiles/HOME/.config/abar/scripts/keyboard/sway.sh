#!/usr/bin/env bash

format_layout() {
    case "$1" in
        "English (US)") echo "en-US" ;;
        "Russian")      echo "ru-RU" ;;
        *)              echo "unknown" ;;
    esac
}

emit_layout() {
    jq -cn --arg label "$(format_layout "$1")" '{label: $label}'
}

# --- Ask about current layout on startup ---
raw=$(swaymsg -t get_inputs | jq -r '[.[] | select(.type == "keyboard")][0].xkb_active_layout_name // ""')
emit_layout "$raw"

# --- Keep track of layout changes while alive ---
# The xkb_layout input event already carries the new layout name, no need
# for a second get_inputs round-trip per change.
#
# swaymsg's JSON output always has spaces after ':'/',' (no --raw/--pretty
# combination removes them), so matching the raw substring '"change":"xkb_layout"'
# silently never matches. Parse the field with jq instead.
swaymsg -t subscribe -m '["input"]' | while IFS= read -r line; do
    change=$(jq -r '.change // ""' <<< "$line")
    if [ "$change" = "xkb_layout" ]; then
        raw=$(jq -r '.input.xkb_active_layout_name // ""' <<< "$line")
        emit_layout "$raw"
    fi
done
