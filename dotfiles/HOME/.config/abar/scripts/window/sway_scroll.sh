#!/usr/bin/env bash
# Window focus scroll for abar's [window] module under sway.
# Usage: sway_scroll.sh up|down

set -euo pipefail

if [ "$1" = "down" ]; then
    swaymsg focus next
else
    swaymsg focus prev
fi
