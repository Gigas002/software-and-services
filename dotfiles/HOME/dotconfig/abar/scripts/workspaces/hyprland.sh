#!/bin/env bash

# abar sets these from the theme's [workspaces] section: the colors of the
# active and the other workspaces, and whether to list every monitor's
# workspaces ("all_monitors") or only the focused monitor's ("monitor_specific").
ACTIVE_COLOR="${ABAR_WS_ACTIVE_COLOR:-#00c1e4}"
INACTIVE_COLOR="${ABAR_WS_INACTIVE_COLOR:-#c0caf5}"
VISIBILITY="${ABAR_WS_VISIBILITY:-all_monitors}"

emit_workspaces() {
    local active active_id active_mon
    active=$(hyprctl activeworkspace -j)
    active_id=$(jq '.id' <<<"$active")
    active_mon=$(jq -r '.monitor' <<<"$active")

    local text
    text=$(hyprctl workspaces -j | jq -r \
        --argjson active "$active_id" \
        --arg mon "$active_mon" \
        --arg vis "$VISIBILITY" \
        --arg ac "$ACTIVE_COLOR" \
        --arg ic "$INACTIVE_COLOR" '
        map(select($vis != "monitor_specific" or .monitor == $mon)) |
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
          "$line" == destroyworkspace* || "$line" == moveworkspace* || \
          "$line" == focusedmon* ]]; then
        emit_workspaces
    fi
done
