#!/usr/bin/env bash
# Wrap-around workspace switching for abar's [workspaces] scroll binds.
# abar runs the bind once per wheel notch, so no debouncing is needed, but
# niri's focus-workspace-up/down clamp at the first/last workspace instead of
# wrapping, so this wraps manually.
#
# Usage: niri_scroll.sh up|down

set -euo pipefail

dir="$1"

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
