#!/usr/bin/env bash
# tray-menu.sh — Pick a tray app with tofi, then open its trayctl submenu.
#
# Use as on_left_click (or on_right_click) in [tray] in config.toml.
# Clicking any tray icon opens a tofi picker of all active apps;
# selecting one invokes `trayctl menu --app-id` for that app.
#
# Requires: trayctl, jq, tofi
#
# Env vars:
#   DMENU_CMD   override the dmenu command passed to trayctl
#               (default: "tofi --mode dmenu")

DMENU_CMD="${DMENU_CMD:-tofi --mode dmenu}"

# When called with an app_id argument (feed_id = true in config), open its
# menu directly without going through the picker.
if [ -n "$1" ]; then
    trayctl menu --app-id "$1" --dmenu-cmd "$DMENU_CMD"
    exit $?
fi

items=$(trayctl items 2>/dev/null) || exit 1
[ -z "$items" ] && exit 0

# Build a display list: prefer title, fall back to app_id.
display=$(printf '%s' "$items" | jq -r '.[] | (.title // .app_id)')
[ -z "$display" ] && exit 0

selected=$(printf '%s\n' "$display" | tofi --mode dmenu 2>/dev/null)
[ -z "$selected" ] && exit 0

# Map display name back to app_id (first match).
app_id=$(printf '%s' "$items" \
    | jq -r --arg sel "$selected" \
        '.[] | select((.title // .app_id) == $sel) | .app_id' \
    | head -1)
[ -z "$app_id" ] && exit 0

trayctl menu --app-id "$app_id" --dmenu-cmd "$DMENU_CMD"
