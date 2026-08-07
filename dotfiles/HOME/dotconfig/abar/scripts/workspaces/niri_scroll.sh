#!/usr/bin/env bash
# Debounced, wrap-around workspace switching for abar's [workspaces] scroll binds.
#
# abar dispatches a shell command on every raw wl_pointer axis event, and mice
# with high-resolution scroll wheels emit several of those per physical notch.
# Without debouncing, one notch fires focus-workspace-up/down 2+ times, which
# looks like it "skips" a workspace. niri's focus-workspace-up/down also clamp
# at the first/last workspace instead of wrapping, so this also wraps manually.
#
# Usage: scroll.sh up|down

set -euo pipefail

dir="$1"
cooldown_ms=150
stamp="${XDG_RUNTIME_DIR:-/tmp}/abar-workspace-scroll-niri.stamp"
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

ws_json=$(niri msg --json workspaces)

out=$(jq -r '.[] | select(.is_focused) | .output' <<< "$ws_json")
current=$(jq -r '.[] | select(.is_focused) | .idx' <<< "$ws_json")
[ -z "$out" ] && exit 0

mapfile -t idx_list < <(jq -r --arg out "$out" '
    map(select(.output == $out)) | sort_by(.idx) | .[].idx
' <<< "$ws_json")

count=${#idx_list[@]}
(( count == 0 )) && exit 0

pos=0
for i in "${!idx_list[@]}"; do
    if [ "${idx_list[$i]}" = "$current" ]; then
        pos=$i
        break
    fi
done

if [ "$dir" = "down" ]; then
    next_pos=$(( (pos + 1) % count ))
else
    next_pos=$(( (pos - 1 + count) % count ))
fi

niri msg action focus-workspace "${idx_list[$next_pos]}"
