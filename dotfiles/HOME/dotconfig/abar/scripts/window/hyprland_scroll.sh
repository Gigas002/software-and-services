#!/usr/bin/env bash
# Window focus scroll for abar's [window] module under Hyprland.
# Usage: hyprland_scroll.sh up|down

set -euo pipefail

if [ "$1" = "down" ]; then
    hyprctl dispatch "hl.dsp.window.cycle_next({})"
else
    hyprctl dispatch "hl.dsp.window.cycle_next({ next = false })"
fi
