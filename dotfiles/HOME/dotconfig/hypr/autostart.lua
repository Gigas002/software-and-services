-- Autostart — programs launched once on session start
-- See:      https://wiki.hypr.land/Configuring/Basics/Autostart/
-- XDPH:     https://wiki.hypr.land/Hypr-Ecosystem/xdg-desktop-portal-hyprland/

-- hyprpolkit
-- local polkit = "systemctl --user start hyprpolkitagent"
-- kde polkit
local polkit = "/usr/lib/polkit-kde-authentication-agent-1"

local bar = "ashell"
local bluetooth_applet = "blueman-applet"
local network_applet = "nm-applet --indicator"
local notification_daemon = "dunst"
-- See: https://wiki.hypr.land/Useful-Utilities/Clipboard-Managers/#cliphist
local clipboard_text = "wl-paste --type text --watch cliphist store"
local clipboard_images = "wl-paste --type image --watch cliphist store"
-- See: https://wiki.hypr.land/Useful-Utilities/Clipboard-Managers/#clipvault
local clipvault = "wl-paste --watch clipvault store"

-- for awww
-- local wallpaper = "wallpaper.nu"
local wallpaper = "hyprpaper"

local idle = "hypridle"

hl.on("hyprland.start", function()
    hl.exec_cmd(polkit)
    hl.exec_cmd(bar)
    -- hl.exec_cmd(bluetooth_applet)
    hl.exec_cmd(network_applet)
    hl.exec_cmd(notification_daemon)
    -- hl.exec_cmd(clipboard_text)
    -- hl.exec_cmd(clipboard_images)
    hl.exec_cmd(wallpaper)
    hl.exec_cmd(idle)
end)
