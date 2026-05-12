-- Shared helpers: smart gaps, borderless mode.
-- Reference: https://wiki.hypr.land/Configuring/Advanced-and-Cool/Expanding-functionality/
-- Events:    https://wiki.hypr.land/Configuring/Advanced-and-Cool/Expanding-functionality/#events
-- Timers:    https://wiki.hypr.land/Configuring/Advanced-and-Cool/Expanding-functionality/#timers

local M = {}


-- ── Constants (keep in sync with themes/Sweet.lua) ────────────────────────

local GAPS_IN          = 3
local GAPS_OUT         = 8
local BORDER_SIZE      = 2
local ROUNDING         = 10
local ACTIVE_OPACITY   = 0.85
local INACTIVE_OPACITY = 0.85

-- Subtle dim applied to inactive windows in normal mode.
-- Toggled off by toggle_borderless(), back on when restored.
local DIM_INACTIVE = true
local DIM_STRENGTH = 0.15


-- ── Internal state ────────────────────────────────────────────────────────

-- workspace IDs (numbers) currently in borderless mode
local borderless_ws = {}


-- ── Internal config helpers ───────────────────────────────────────────────

-- local function count_tiled(ws)
--     local n = 0
--     for _, w in ipairs(hl.get_workspace_windows(ws)) do
--         if not w.floating and not w.fullscreen then
--             n = n + 1
--         end
--     end
--     return n
-- end

-- Full "borderless" look: no chrome, full opacity, no dim.
local function apply_borderless()
    hl.config({
        general = {
            gaps_in     = 0,
            gaps_out    = 0,
            border_size = 0,
        },
        decoration = {
            rounding         = 0,
            active_opacity   = 1.0,
            inactive_opacity = 1.0,
            dim_inactive     = false,
        },
    })
end

-- Normal look: restore theme values, respect smart-gap rule, enable dim.
local function apply_normal(ws)
    -- local tiled = ws and count_tiled(ws) or 0
    hl.config({
        general = {
            -- gaps_in     = tiled <= 1 and 0 or GAPS_IN,
            -- gaps_out    = tiled <= 1 and 0 or GAPS_OUT,
            gaps_in     = GAPS_IN,
            gaps_out    = GAPS_OUT,
            border_size = BORDER_SIZE,
        },
        decoration = {
            rounding         = ROUNDING,
            active_opacity   = ACTIVE_OPACITY,
            inactive_opacity = INACTIVE_OPACITY,
            dim_inactive     = DIM_INACTIVE,
            dim_strength     = DIM_STRENGTH,
        },
    })
end


-- ── Public: borderless toggle ─────────────────────────────────────────────

--- Toggle borderless mode on the active workspace.
--- First press: strip all chrome and undim for a fully immersive view.
--- Second press: restore borders, gaps, rounding and window dimming.
--- Bind: SUPER + H
function M.toggle_borderless()
    local ws = hl.get_active_workspace()
    if ws == nil then return end
    if borderless_ws[ws.id] then
        borderless_ws[ws.id] = nil
        apply_normal(ws)
    else
        borderless_ws[ws.id] = true
        apply_borderless()
    end
end


-- ── Smart gaps + borderless workspace switch ──────────────────────────────
-- These handlers replace the smart-gaps block that used to live in events.lua.
-- They are registered once when this module is first require()'d.

-- hl.on("window.open", function(_)
--     local ws = hl.get_active_workspace()
--     if ws == nil or borderless_ws[ws.id] then return end
--     apply_normal(ws)
-- end)

-- -- window.destroy fires after the close animation — no jarring flicker.
-- hl.on("window.destroy", function(_)
--     local ws = hl.get_active_workspace()
--     if ws == nil or borderless_ws[ws.id] then return end
--     apply_normal(ws)
-- end)

-- hl.on("workspace.active", function(ws)
--     if borderless_ws[ws.id] then
--         apply_borderless()
--     else
--         apply_normal(ws)
--     end
-- end)

-- hl.on("hyprland.start", function()
--     local ws = hl.get_active_workspace()
--     if ws then apply_normal(ws) end
-- end)


return M
