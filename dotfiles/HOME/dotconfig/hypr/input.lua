-- Input, gestures, and bind-behaviour configuration
-- Input:          https://wiki.hypr.land/Configuring/Basics/Variables/#input
-- Per-device:     https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/
-- Gestures:       https://wiki.hypr.land/Configuring/Basics/Variables/#gestures
-- Gesture system: https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/

-- ┌─────────────────────────────────────────┐
-- │  Input                                  │
-- │  https://wiki.hypr.land/Configuring/Basics/Variables/#input
-- └─────────────────────────────────────────┘

hl.config({
    input = {
        -- ── Keyboard ──────────────────────────────────
        kb_layout          = "us,ru",
        kb_options         = "grp:alt_shift_toggle",
        numlock_by_default = true,

        -- ── Mouse ─────────────────────────────────────
        sensitivity        = 0.5,
        -- force_no_accel         = true,
    },
})


-- ┌─────────────────────────────────────────┐
-- │  Gestures                               │
-- │  https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/
-- │  https://wiki.hypr.land/Configuring/Basics/Variables/#gestures
-- └─────────────────────────────────────────┘

-- 3-finger horizontal swipe to switch workspaces (replaces old workspace_swipe_fingers)
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
