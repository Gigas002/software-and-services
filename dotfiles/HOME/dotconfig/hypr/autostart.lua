-- Autostart — programs launched once on session start
-- See:      https://wiki.hypr.land/Configuring/Basics/Autostart/
-- XDPH:     https://wiki.hypr.land/Hypr-Ecosystem/xdg-desktop-portal-hyprland/

-- hyprpolkit
local polkit = "systemctl --user start hyprpolkitagent"
-- kde polkit
-- local polkit = "/usr/lib/polkit-kde-authentication-agent-1"

local tray_daemon = "trayd"
local bar = "abar --config ~/.config/abar/hyprland_config.toml"
local notification_daemon = "notred"
local notification_presenter = "poshanka"

-- for awww
-- local wallpaper = "wallpaper.nu"
local wallpaper = "hyprpaper"

local idle = "hypridle"

hl.on("hyprland.start", function()
    hl.exec_cmd("systemctl --user start hyprland-session.target")
    hl.exec_cmd(polkit)
    hl.exec_cmd(tray_daemon)
    hl.exec_cmd(bar)
    hl.exec_cmd(notification_daemon)
    hl.exec_cmd(notification_presenter)
    hl.exec_cmd(wallpaper)
    hl.exec_cmd(idle)
end)

hl.on("hyprland.shutdown", function()
    os.execute("systemctl --user stop hyprland-session.target && sleep 0.1")
end)
