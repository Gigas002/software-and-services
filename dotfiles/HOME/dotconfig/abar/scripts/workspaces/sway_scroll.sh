#!/usr/bin/env bash
# Debounced workspace switching for abar's [workspaces] scroll binds under sway.
#
# abar dispatches a shell command on every raw wl_pointer axis event, and mice
# with high-resolution scroll wheels emit several of those per physical notch.
# Without debouncing, one notch fires `workspace prev/next` 2+ times, which
# looks like it "skips" a workspace (see workspaces/niri_scroll.sh for the
# same bug under niri). Unlike niri's focus-workspace-up/down, sway's
# `workspace prev`/`next` already wrap around at the first/last workspace,
# so no manual wraparound logic is needed here.
#
# Usage: sway_scroll.sh up|down

set -euo pipefail

dir="$1"
cooldown_ms=150
stamp="${XDG_RUNTIME_DIR:-/tmp}/abar-workspace-scroll-sway.stamp"
lock="${stamp}.lock"

# abar spawns each scroll dispatch as an independent async process, so a
# plain check-then-write on the stamp file is a TOCTOU race: when one
# physical notch fires several raw axis events within microseconds of each
# other, multiple instances of this script can all read the old timestamp
# before any of them writes the new one, and all decide the cooldown has
# expired — producing 1, 2, or 3 workspace switches per notch depending on
# scheduling, which looks "random". flock makes the check-and-set atomic.
exec 9>"$lock"
flock 9

now=$(date +%s%3N)
if [ -f "$stamp" ]; then
    last=$(cat "$stamp")
    if (( now - last < cooldown_ms )); then
        exit 0
    fi
fi
echo "$now" > "$stamp"

if [ "$dir" = "down" ]; then
    swaymsg workspace next
else
    swaymsg workspace prev
fi
