-- Sweet theme
-- Covers: cursor/GTK env vars, general, group, decoration
-- General:    https://wiki.hypr.land/Configuring/Basics/Variables/#general
-- Group:      https://wiki.hypr.land/Configuring/Basics/Variables/#group
-- Decoration: https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
-- Tearing:    https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/

-- ┌─────────────────────────────────────────┐
-- │  Theme environment variables            │
-- └─────────────────────────────────────────┘

hl.env("GTK_THEME", "Sweet:dark")
hl.env("XCURSOR_THEME", "Sweet-cursors")
hl.env("XCURSOR_SIZE", "30")
hl.env("HYPRCURSOR_THEME", "Sweet-cursors-hyprcursor")
hl.env("HYPRCURSOR_SIZE", "30")
hl.env("XDG_ICON_THEME", "candy-icons")

-- ┌─────────────────────────────────────────┐
-- │  General                                │
-- │  https://wiki.hypr.land/Configuring/Basics/Variables/#general
-- └─────────────────────────────────────────┘

hl.config({
    general = {
        border_size      = 2,
        gaps_in          = 3,
        gaps_out         = 8,

        col              = {
            active_border   = { colors = { "#c74dedff", "#ed254eff" }, angle = 45 },
            inactive_border = { colors = { "#00c1e4cc", "#7cb7ffcc" }, angle = 45 },
        },

        -- layout = "dwindle",
        resize_on_border = true,
        allow_tearing    = true,
    },
})


-- ┌─────────────────────────────────────────┐
-- │  Group (tab containers)                 │
-- │  https://wiki.hypr.land/Configuring/Basics/Variables/#group
-- └─────────────────────────────────────────┘

hl.config({
    group = {
        col = {
            border_active          = { colors = { "#c74dedff", "#ed254eff" }, angle = 45 },
            border_inactive        = { colors = { "#00c1e4cc", "#7cb7ffcc" }, angle = 45 },
            border_locked_active   = { colors = { "#c74dedff", "#ed254eff" }, angle = 45 },
            border_locked_inactive = { colors = { "#00c1e4cc", "#7cb7ffcc" }, angle = 45 },
        },
    },
})


-- ┌─────────────────────────────────────────┐
-- │  Decoration                             │
-- │  https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
-- └─────────────────────────────────────────┘

hl.config({
    decoration = {
        rounding         = 10,
        active_opacity   = 0.85,
        inactive_opacity = 0.85,
        dim_inactive     = true,
        dim_strength    = 0.15,
        dim_special      = 0.3,
        -- border_part_of_window = true,

        blur             = {
            size          = 6,
            passes        = 3,
            -- xray = false,
            special       = true,
            popups        = true,
            input_methods = true,
        },

        shadow = {
            enabled = false,
            sharp = true,
        },
    },
})
