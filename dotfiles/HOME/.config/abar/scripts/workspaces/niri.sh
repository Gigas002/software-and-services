#!/usr/bin/env bash

# abar sets these from the theme's [workspaces] section: the colors of the
# active and the other workspaces, and whether to list every monitor's
# workspaces ("all_monitors") or only the focused monitor's ("monitor_specific").
ACTIVE_COLOR="${ABAR_WS_ACTIVE_COLOR:-#00c1e4}"
INACTIVE_COLOR="${ABAR_WS_INACTIVE_COLOR:-#c0caf5}"
VISIBILITY="${ABAR_WS_VISIBILITY:-all_monitors}"

emit_workspaces() {
    local text
    text=$(niri msg --json workspaces | jq -r \
        --arg ac "$ACTIVE_COLOR" \
        --arg ic "$INACTIVE_COLOR" \
        --arg vis "$VISIBILITY" '
        (map(select(.is_focused)) | .[0].output) as $mon |
        map(select($vis != "monitor_specific" or .output == $mon)) |
        sort_by([.output, .idx]) |
        map(
            ((.name // (.idx | tostring)) | gsub("&"; "&amp;") | gsub("<"; "&lt;") | gsub(">"; "&gt;")) as $n |
            if .is_focused then
                "<span foreground=\"\($ac)\">\($n)</span>"
            else
                "<span foreground=\"\($ic)\">\($n)</span>"
            end
        ) |
        join("  ")
    ')

    jq -cn --arg text "$text" '{text: $text, markup: true}'
}

# niri's event-stream replays the full current state as its first events
# (WorkspacesChanged among them), so that alone provides the startup emit.
niri msg --json event-stream | while IFS= read -r line; do
    case "$line" in
        *'"WorkspacesChanged"'*|*'"WorkspaceActivated"'*| \
        *'"WorkspaceActiveWindowChanged"'*|*'"WorkspaceUrgencyChanged"'*)
            emit_workspaces
            ;;
    esac
done
