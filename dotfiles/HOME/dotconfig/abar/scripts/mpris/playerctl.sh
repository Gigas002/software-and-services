#!/usr/bin/env bash
# MPRIS media info script for abar using playerctl.
#
# Emits one JSON line on startup and on every metadata change.
# Requires: playerctl, jq
#
# Env vars:
#   ABAR_MPRIS_FORMAT   playerctl format string (default: {{artist}} — {{title}})

# Assign the default with single quotes so bash never misparses the {{...}} playerctl
# template syntax as brace-tracking delimiters inside ${var:-...}.
[ -z "$ABAR_MPRIS_FORMAT" ] && ABAR_MPRIS_FORMAT='{{artist}} — {{title}}'

json_text() {
    jq -cn --arg t "$1" '{text: $t}'
}

# Emit current state immediately on startup.
json_text "$(playerctl metadata --format "$ABAR_MPRIS_FORMAT" 2>/dev/null)"

# Stream metadata changes until the player exits.
# abar's exec handler restarts this script automatically on exit.
playerctl --follow metadata \
    --format "$ABAR_MPRIS_FORMAT" 2>/dev/null |
    while IFS= read -r line; do
        json_text "$line"
    done
