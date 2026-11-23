#!/usr/bin/env bash
# Workspace switching for abar's [workspaces] scroll binds under sway.
# abar runs the bind once per wheel notch, so no debouncing is needed.
# sway's `workspace prev`/`next` already wrap around.
#
# Usage: sway_scroll.sh up|down

set -euo pipefail

if [ "$1" = "down" ]; then
    swaymsg workspace next
else
    swaymsg workspace prev
fi
