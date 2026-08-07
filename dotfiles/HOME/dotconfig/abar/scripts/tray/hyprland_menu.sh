#!/usr/bin/env bash
# Sets ABAR_OUTPUT to the focused output under Hyprland, then hands off to the
# compositor-agnostic tray-menu.sh. Use as [tray] on_left_click under Hyprland.

export ABAR_OUTPUT="$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')"
exec "$(dirname "$0")/tray-menu.sh" "$@"
