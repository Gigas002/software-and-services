#!/usr/bin/env bash

emit_window() {
    local title
    title=$(niri msg --json focused-window 2>/dev/null | jq -r '.title // ""')
    jq -cn --arg text "$title" '{text: $text}'
}

# niri's event-stream replays the full current state as its first events
# (WindowsChanged among them), so that alone provides the startup emit.
niri msg --json event-stream | while IFS= read -r line; do
    case "$line" in
        *'"WindowFocusChanged"'*|*'"WindowsChanged"'*| \
        *'"WindowOpenedOrChanged"'*|*'"WindowClosed"'*)
            emit_window
            ;;
    esac
done
