#!/usr/bin/env bash
# Sets ABAR_OUTPUT to the focused output under sway, then hands off to the
# compositor-agnostic tray-menu.sh. Use as [tray] on_left_click under sway.

export ABAR_OUTPUT="$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')"
exec "$(dirname "$0")/tray-menu.sh" "$@"
