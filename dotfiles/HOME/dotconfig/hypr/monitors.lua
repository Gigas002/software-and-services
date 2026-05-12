-- Monitor configuration
-- See: https://wiki.hypr.land/Configuring/Basics/Monitors/
-- Fields:      https://wiki.hypr.land/Configuring/Basics/Monitors/#fields
-- Mirroring:   https://wiki.hypr.land/Configuring/Basics/Monitors/#mirrored-displays
-- VRR:         https://wiki.hypr.land/Configuring/Basics/Monitors/#vrr
-- Rotation:    https://wiki.hypr.land/Configuring/Basics/Monitors/#rotating
--
-- To list available monitors: hyprctl monitors all
--
-- All fields beyond `output` are optional.
-- cm presets: auto | srgb | dcip3 | dp3 | adobe | wide | edid | hdr | hdredid
-- transform:  0=normal 1=90° 2=180° 3=270° 4=flip 5=flip+90° 6=flip+180° 7=flip+270°
-- vrr mode:   0=off 1=on 2=fullscreen-only 3=fullscreen with video/game content type

-- PC monitor
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "2560x1440@100",
    position = "auto",
    scale    = 1,
    -- cm       = "srgb",
    -- transform        = 0,
    -- mirror           = "",
    bitdepth = 10,
    -- vrr              = 0,
    -- supports_wide_color = 0,
    -- supports_hdr     = 0,
})

-- Generic fallback — catches any monitor not matched by an explicit rule:
-- hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })

-- Laptop display example:
-- hl.monitor({ output = "eDP-1", mode = "1920x1080@144", position = "0x0", scale = 1 })

-- Left-of-primary secondary example:
-- hl.monitor({ output = "HDMI-A-2", mode = "2560x1440@75", position = "-2560x0", scale = 1 })
