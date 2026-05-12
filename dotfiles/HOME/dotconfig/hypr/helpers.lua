-- Shared helpers: borderless mode.
-- Reference: https://wiki.hypr.land/Configuring/Advanced-and-Cool/Expanding-functionality/
-- Workspace rules: https://wiki.hypr.land/Configuring/Workspace-Rules/

local M = {}


-- ── Constants (keep in sync with themes/Sweet.lua) ────────────────────────

local GAPS_IN          = 3
local GAPS_OUT         = 8
local BORDER_SIZE      = 2
local ROUNDING         = 10
local ACTIVE_OPACITY   = 0.85
local INACTIVE_OPACITY = 0.85
local DIM_INACTIVE     = true
local DIM_STRENGTH     = 0.15


-- ── Internal state ────────────────────────────────────────────────────────

-- workspace IDs (numbers) currently in borderless mode
local borderless_ws = {}


-- ── Internal helpers ──────────────────────────────────────────────────────

-- Structural chrome (gaps, border, rounding) — set via workspace rule so they
-- are scoped to a single workspace and never trigger a config reload.
local function apply_borderless(ws_id)
    hl.workspace_rule({
        workspace   = tostring(ws_id),
        gaps_in     = 0,
        gaps_out    = 0,
        no_border   = true,
        no_rounding = true,
    })
end

local function apply_normal(ws_id)
    hl.workspace_rule({
        workspace   = tostring(ws_id),
        gaps_in     = GAPS_IN,
        gaps_out    = GAPS_OUT,
        no_border   = false,
        no_rounding = false,
    })
end

-- Opacity and dim are global config values — not supported by workspace rules.
-- They are snapped to the active workspace's state on every workspace switch.
local function apply_opacity_dim_borderless()
    hl.config({
        decoration = {
            active_opacity   = 1.0,
            inactive_opacity = 1.0,
            dim_inactive     = false,
        },
    })
end

local function apply_opacity_dim_normal()
    hl.config({
        decoration = {
            active_opacity   = ACTIVE_OPACITY,
            inactive_opacity = INACTIVE_OPACITY,
            dim_inactive     = DIM_INACTIVE,
            dim_strength     = DIM_STRENGTH,
        },
    })
end


-- ── Public: borderless toggle ─────────────────────────────────────────────

--- Toggle borderless mode on the **active workspace only**.
--- First press:  strip gaps, borders, rounding, opacity and dim.
--- Second press: restore all theme values for that workspace.
--- Bind: SUPER + H
function M.toggle_borderless()
    local ws = hl.get_active_workspace()
    if ws == nil then return end

    if borderless_ws[ws.id] then
        borderless_ws[ws.id] = nil
        apply_normal(ws.id)
        apply_opacity_dim_normal()
    else
        borderless_ws[ws.id] = true
        apply_borderless(ws.id)
        apply_opacity_dim_borderless()
    end
end

-- ── Workspace switch: snap opacity/dim to the incoming workspace ──────────
-- Workspace rules (gaps, border, rounding) are applied automatically by
-- Hyprland on switch. Opacity and dim are global, so we update them here.

hl.on("workspace.active", function(ws)
    if borderless_ws[ws.id] then
        apply_opacity_dim_borderless()
    else
        apply_opacity_dim_normal()
    end
end)


return M
