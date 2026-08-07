#!/usr/bin/env bash
# Window focus scroll for abar's [window] module under niri.
# Usage: niri_scroll.sh up|down

set -euo pipefail

if [ "$1" = "down" ]; then
    niri msg action focus-window-down
else
    niri msg action focus-window-up
fi
