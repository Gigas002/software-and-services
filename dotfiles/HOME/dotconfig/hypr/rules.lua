-- Window, layer, and workspace rules
-- Window rules:   https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- Window props:   https://wiki.hypr.land/Configuring/Basics/Window-Rules/#window-rule-properties
-- Layer rules:    https://wiki.hypr.land/Configuring/Basics/Window-Rules/#layer-rules
-- Workspace rules:https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
--
-- To inspect open windows: hyprctl clients


-- ┌─────────────────────────────────────────┐
-- │  Opacity rules                          │
-- │  opacity = "active inactive"            │
-- │  opacity = "active override inactive override"  (force, bypass global)  │
-- └─────────────────────────────────────────┘

hl.window_rule({
    name    = "windowrule-steam",
    match   = { class = "^(steam)$" },
    opacity = "0.80 0.80",
})

hl.window_rule({
    name    = "windowrule-steam-webhelper",
    match   = { class = "^(steamwebhelper)$" },
    opacity = "0.80 0.80",
})

hl.window_rule({
    name    = "windowrule-dolphin",
    match   = { class = "^(org.kde.dolphin)$" },
    opacity = "0.80 0.80",
})

hl.window_rule({
    name    = "windowrule-xdg-desktop-portals",
    match   = { class = "^(xdg-desktop-portal-gtk|xdg-desktop-portal-kde|xdg-desktop-portal-hyprland)(.*)$" },
    opacity = "0.80 0.80",
})

hl.window_rule({
    name    = "windowrule-qt5ct",
    match   = { class = "^(qt5ct)$" },
    opacity = "0.80 0.80",
})

hl.window_rule({
    name    = "windowrule-qt6ct",
    match   = { class = "^(qt6ct)$" },
    opacity = "0.80 0.80",
})

hl.window_rule({
    name    = "windowrule-kvantum",
    match   = { class = "^(kvantummanager)$" },
    opacity = "0.80 0.80",
})

hl.window_rule({
    name    = "windowrule-obs",
    match   = { class = "^(com.obsproject.Studio)$" },
    opacity = "0.80 0.80",
})

hl.window_rule({
    name    = "windowrule-discord",
    match   = { class = "^(discord)$" },
    opacity = "0.80 0.80",
})

hl.window_rule({
    name    = "windowrule-yad",
    match   = { class = "^(yad)$" },
    float   = true,
    opacity = "0.80 0.80",
})

hl.window_rule({
    name    = "windowrule-pavucontrol",
    match   = { class = "^(pavucontrol)$" },
    float   = true,
    opacity = "0.80 0.70",
})

hl.window_rule({
    name    = "windowrule-blueman",
    match   = { class = "^(blueman-manager)$" },
    float   = true,
    opacity = "0.80 0.70",
})

hl.window_rule({
    name    = "windowrule-networkmanager",
    match   = { class = "^(nm-applet)$" },
    float   = true,
    opacity = "0.80 0.70",
})

hl.window_rule({
    name    = "windowrule-nm-connection-editor",
    match   = { class = "^(nm-connection-editor)$" },
    float   = true,
    opacity = "0.80 0.70",
})

hl.window_rule({
    name    = "windowrule-polkit",
    match   = { class = "^(polkit-gnome-authentication-agent-1|hyprpolkitagent|org.kde.polkit-kde-authentication-agent-1)(.*)$" },
    float   = true,
    opacity = "0.80 0.70",
})

-- Force full opacity for everything on workspace 9 (e.g. gaming workspace)
hl.window_rule({
    name    = "windowrule-ignore-opacity",
    match   = { workspace = 9 },
    opacity = "1.0 override 1.0 override",
})


-- ┌─────────────────────────────────────────┐
-- │  Float rules                            │
-- │  https://wiki.hypr.land/Configuring/Basics/Window-Rules/#window-rule-properties
-- └─────────────────────────────────────────┘

hl.window_rule({
    name  = "windowrule-floating-dolphin-progress",
    match = { class = "^(org.kde.dolphin)$", title = "^(Progress Dialog — Dolphin)$" },
    float = true,
})

hl.window_rule({
    name  = "windowrule-floating-dolphin-copying",
    match = { class = "^(org.kde.dolphin)$", title = "^(Copying — Dolphin)$" },
    float = true,
})

hl.window_rule({
    name  = "windowrule-floating-portals",
    match = { class = "^(org.freedesktop.impl.portal.desktop.kde|xdg-desktop-portal-gtk|xdg-desktop-portal-kde|xdg-desktop-portal-hyprland)(.*)$" },
    float = true,
})

hl.window_rule({
    name  = "windowrule-floating-pip",
    match = { title = "^(Picture-in-Picture)$" },
    float = true,
})

hl.window_rule({
    name  = "windowrule-floating-save-dialog",
    match = { title = "^(Save File)$" },
    float = true,
})

hl.window_rule({
    name  = "windowrule-floating-rename",
    match = { title = "^(Enter name of file.*)" },
    float = true,
})

hl.window_rule({
    name  = "windowrule-floating-save-image",
    match = { title = "^(Save Image)$" },
    float = true,
})

hl.window_rule({
    name  = "windowrule-floating-open-dialog",
    match = { title = "^(Open File)$" },
    float = true,
})

hl.window_rule({
    name  = "windowrule-floating-firefox-library",
    match = { class = "^(firefox)$", title = "^(Library)$" },
    float = true,
})

hl.window_rule({
    name  = "windowrule-floating-ark",
    match = { class = "^(org.kde.ark)$" },
    float = true,
})


-- ┌─────────────────────────────────────────┐
-- │  Layer rules                            │
-- │  https://wiki.hypr.land/Configuring/Basics/Window-Rules/#layer-rules
-- └─────────────────────────────────────────┘

hl.layer_rule({
    name         = "layerrule-notifications",
    match        = { namespace = "notifications" },
    blur         = true,
    ignore_alpha = 0,
})

hl.layer_rule({
    name  = "layerrule-logout",
    match = { namespace = "logout_dialog" },
    blur  = true,
})
