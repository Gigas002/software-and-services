-- Environment variables
-- See: https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

-- XDG Desktop Portal / session type
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Render wlroots-based apps via Vulkan
hl.env("WLR_RENDERER", "vulkan")

-- copy-pastes from /etc/profile.d/wayland-env.sh
-- and /etc/environment
-- specifically for hyprland
-- Backend variables
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland,x11")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")

-- GTK theming
hl.env("GTK_USE_PORTAL", "1")

-- Qt theming
-- hl.env("QT_QPA_PLATFORMTHEME", "hyprqt6engine")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")

-- HiDPI scaling
hl.env("GDK_SCALE", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_ENABLE_HIGHDPI_SCALING", "1")

-- Default terminal
hl.env("TERMINAL", "alacritty")
