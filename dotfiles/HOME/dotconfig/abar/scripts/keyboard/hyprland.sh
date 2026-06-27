#!/bin/env bash

get_and_format_layout() {
    # 1. Ask compositor for layout (returns e.g., "English (US)")
    RAW=$(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap')

    # 2. Map long names to your preferred short custom text format
    case "$RAW" in
        "English (US)")  CLEAN="en-US" ;;
        "Russian")       CLEAN="ru-RU" ;;
        *)               CLEAN="unknown" ;;
    esac

    # 3. Output as JSON for abar to read
    echo "{\"label\": \"$CLEAN\"}"
}

# --- Ask about current layout on startup ---
get_and_format_layout

# --- Keep track of layout changes while alive ---
# Connect to Hyprland's continuous event socket
SOCKET_PATH="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

socat -U - UNIX-CONNECT:"$SOCKET_PATH" | while read -r line; do
    # When the user presses Alt+Shift or runs switchxkblayout,
    # Hyprland fires an "activelayout" event down this socket
    if [[ "$line" == activelayout* ]]; then
        # Wake up instantly and print the updated JSON down the pipe to abar
        get_and_format_layout
    fi
done
