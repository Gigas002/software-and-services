#!/usr/bin/env bash

# Pango foreground colors for active/inactive workspaces.
# Override by setting these in your environment before launching abar.
ACTIVE_COLOR="${ABAR_WS_ACTIVE_COLOR:-#00c1e4}"
INACTIVE_COLOR="${ABAR_WS_INACTIVE_COLOR:-#c0caf5}"

emit_workspaces() {
    local text
    text=$(swaymsg -t get_workspaces | jq -r \
        --arg ac "$ACTIVE_COLOR" \
        --arg ic "$INACTIVE_COLOR" '
        sort_by(.num) |
        map(
            (.name | gsub("&"; "&amp;") | gsub("<"; "&lt;") | gsub(">"; "&gt;")) as $n |
            if .focused then
                "<span foreground=\"\($ac)\">\($n)</span>"
            else
                "<span foreground=\"\($ic)\">\($n)</span>"
            end
        ) |
        join("  ")
    ')

    jq -cn --arg text "$text" '{text: $text, markup: true}'
}

# Emit current state on startup — unlike niri's event-stream, sway's
# SUBSCRIBE reply is just an ack and does not replay current state.
emit_workspaces

# Listen for workspace events and re-emit on changes.
swaymsg -t subscribe -m '["workspace"]' | while IFS= read -r line; do
    emit_workspaces
done
