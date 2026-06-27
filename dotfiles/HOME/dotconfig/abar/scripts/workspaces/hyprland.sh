#!/bin/env bash

# Pango foreground colors for active/inactive workspaces.
# Override by setting these in your environment before launching abar.
ACTIVE_COLOR="${ABAR_WS_ACTIVE_COLOR:-#00c1e4}"
INACTIVE_COLOR="${ABAR_WS_INACTIVE_COLOR:-#c0caf5}"

emit_workspaces() {
    local active_id
    active_id=$(hyprctl activeworkspace -j | jq '.id')

    local text
    text=$(hyprctl workspaces -j | jq -r \
        --argjson active "$active_id" \
        --arg ac "$ACTIVE_COLOR" \
        --arg ic "$INACTIVE_COLOR" '
        sort_by(.id) |
        map(
            (.name | gsub("&"; "&amp;") | gsub("<"; "&lt;") | gsub(">"; "&gt;")) as $n |
            if .id == $active then
                "<span foreground=\"\($ac)\">\($n)</span>"
            else
                "<span foreground=\"\($ic)\">\($n)</span>"
            end
        ) |
        join("  ")
    ')

    jq -cn --arg text "$text" '{text: $text, markup: true}'
}

# Emit current state on startup.
emit_workspaces

# Listen for workspace events and re-emit on changes.
SOCKET_PATH="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

socat -U - UNIX-CONNECT:"$SOCKET_PATH" | while read -r line; do
    if [[ "$line" == workspace* || "$line" == createworkspace* || \
          "$line" == destroyworkspace* || "$line" == moveworkspace* ]]; then
        emit_workspaces
    fi
done
