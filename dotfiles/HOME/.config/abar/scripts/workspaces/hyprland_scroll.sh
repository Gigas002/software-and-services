#!/usr/bin/env bash
# Workspace switching for abar's [workspaces] scroll binds under Hyprland.
# abar runs the bind once per wheel notch, so no debouncing is needed.
# Hyprland's relative "e-1"/"e+1" targets already wrap around.
#
# Usage: hyprland_scroll.sh up|down

set -euo pipefail

if [ "$1" = "down" ]; then
    hyprctl dispatch "hl.dsp.focus({ workspace = 'e+1' })"
else
    hyprctl dispatch "hl.dsp.focus({ workspace = 'e-1' })"
fi
