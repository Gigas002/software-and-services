#!/usr/bin/env bash
# Sets ABAR_OUTPUT to the focused output under niri, then hands off to the
# compositor-agnostic tray-menu.sh. Use as [tray] on_left_click under niri.

export ABAR_OUTPUT="$(niri msg --json focused-output | jq -r .name)"
exec "$(dirname "$0")/tray-menu.sh" "$@"
