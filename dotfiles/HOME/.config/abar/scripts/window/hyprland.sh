#!/bin/env bash

emit_window() {
    local title
    title=$(hyprctl activewindow -j 2>/dev/null | jq -r '.title // ""')
    jq -cn --arg text "$title" '{text: $text}'
}

# Emit current active window title on startup.
emit_window

# Listen for active-window change events and re-emit on each change.
SOCKET_PATH="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

socat -U - UNIX-CONNECT:"$SOCKET_PATH" | while read -r line; do
    if [[ "$line" == activewindow* || "$line" == activewindowv2* ]]; then
        emit_window
    fi
done
