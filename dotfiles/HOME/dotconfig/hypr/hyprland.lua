-- Getting started: https://wiki.hypr.land/Configuring/Start/
-- All variables:   https://wiki.hypr.land/Configuring/Basics/Variables/
-- Example config:  https://github.com/hyprwm/Hyprland/blob/main/example/hyprland.lua
--
-- Source order matters; environment variables should be set before autostart.
--
-- File layout:
--   General       -> themes/Sweet.lua
--   Decoration    -> themes/Sweet.lua
--   Group         -> themes/Sweet.lua
--   Animations    -> animations.lua
--   Input         -> input.lua
--   Misc          -> misc.lua
--   Helpers       -> helpers.lua
--   Binds         -> keybindings.lua
--   XWayland      -> xwayland.lua
--   Render        -> render.lua
--   Layouts       -> layouts.lua
--   Rules         -> rules.lua

require("monitors")
require("env")
require("autostart")
require("xwayland")
require("render")
require("input")
require("animations")
require("helpers")
require("keybindings")
-- require("font")
require("themes.Sweet")
require("misc")
require("rules")
require("layouts")
