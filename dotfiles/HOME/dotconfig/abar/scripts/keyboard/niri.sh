#!/usr/bin/env bash

get_and_format_layout() {
    # 1. Ask compositor for the active layout name (e.g., "English (US)")
    local raw
    raw=$(niri msg --json keyboard-layouts 2>/dev/null | jq -r '.names[.current_idx]')

    # 2. Map long names to your preferred short custom text format
    local clean
    case "$raw" in
        "English (US)") clean="en-US" ;;
        "Russian")      clean="ru-RU" ;;
        *)              clean="unknown" ;;
    esac

    # 3. Output as JSON for abar to read
    jq -cn --arg label "$clean" '{label: $label}'
}

# --- Keep track of layout changes while alive ---
# niri's event-stream replays the full current state as its first events
# (KeyboardLayoutsChanged among them), so that alone provides the startup emit.
niri msg --json event-stream | while IFS= read -r line; do
    case "$line" in
        *'"KeyboardLayoutSwitched"'*|*'"KeyboardLayoutsChanged"'*)
            get_and_format_layout
            ;;
    esac
done
