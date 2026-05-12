-- Keybindings
-- Binds:          https://wiki.hypr.land/Configuring/Basics/Binds/
-- Dispatchers:    https://wiki.hypr.land/Configuring/Basics/Dispatchers/

local helpers        = require("helpers")

local mainMod        = "SUPER"

-- Application assignments
local term           = "alacritty"
local editor         = "zeditor"
local file_mgr       = "dolphin"
local browser        = "firefox"
local sysmon         = "btm"
local launcher       = "tofi"

-- Complex commands
local lock_cmd       = "hyprlock"
local bar_cmd        = "killall ashell || ashell"
local screenshot_cmd = "wayshot -g | wl-copy"


-- ┌─────────────────────────────────────────┐
-- │  Window / session actions               │
-- └─────────────────────────────────────────┘

-- Window switcher
-- cycle_next: https://wiki.hypr.land/Configuring/Basics/Dispatchers/#window
-- Cycle order follows binds:focus_preferred_method (history / edge-length)
hl.bind("ALT + tab", hl.dsp.window.cycle_next())

-- Close focused window
hl.bind(mainMod .. " + Q", hl.dsp.window.close())

-- Kill Hyprland session
hl.bind(mainMod .. " + Delete", hl.dsp.exit())

-- Toggle float / group / fullscreen
hl.bind(mainMod .. " + W", hl.dsp.window.float({ action = "toggle" }))
hl.bind("ALT + Return", hl.dsp.window.fullscreen())

-- Lock screen
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(lock_cmd))

-- Toggle bar
hl.bind("CTRL + Escape", hl.dsp.exec_cmd(bar_cmd))

-- Screenshot
hl.bind("print", hl.dsp.exec_cmd(screenshot_cmd))

-- Borderless toggle
hl.bind(mainMod .. " + H", function() helpers.toggle_borderless() end)

-- Wallpaper daemon
-- hl.bind(mainMod .. " + SHIFT + P",       hl.dsp.exec_cmd("wallpaper.nu"))


-- ┌─────────────────────────────────────────┐
-- │  Application shortcuts                  │
-- └─────────────────────────────────────────┘

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(term))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(file_mgr))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(editor))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(browser))
hl.bind("CTRL + SHIFT + Escape", hl.dsp.exec_cmd(term .. " -e " .. sysmon))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(launcher))


-- ┌─────────────────────────────────────────┐
-- │  Focus movement                         │
-- └─────────────────────────────────────────┘

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))


-- ┌─────────────────────────────────────────┐
-- │  Workspace switching & window moving    │
-- └─────────────────────────────────────────┘

-- Keys 1–9 map to workspaces 1–9; key 0 maps to workspace 10.
for i = 1, 10 do
    local key = tostring(i % 10)
    hl.bind(mainMod .. " + " .. key,
        hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i }))
end


-- ┌─────────────────────────────────────────┐
-- │  Resize windows (keyboard)              │
-- └─────────────────────────────────────────┘

hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 30, y = 0 }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.resize({ x = -30, y = 0 }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -30 }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 30 }), { repeating = true })


-- ┌─────────────────────────────────────────┐
-- │  Move active window within workspace    │
-- └─────────────────────────────────────────┘

hl.bind(mainMod .. " + SHIFT + CTRL + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + CTRL + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + CTRL + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + CTRL + down", hl.dsp.window.move({ direction = "down" }))


-- ┌─────────────────────────────────────────┐
-- │  Workspace scrolling & mouse binds      │
-- └─────────────────────────────────────────┘

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })


-- ┌─────────────────────────────────────────┐
-- │  Special (scratchpad) workspace         │
-- └─────────────────────────────────────────┘

-- Send focused window to special workspace silently
-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special", silent = true }))

-- Toggle the special workspace
-- hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special())
