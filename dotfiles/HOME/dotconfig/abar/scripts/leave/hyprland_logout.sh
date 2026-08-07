#!/usr/bin/env bash
# Logout action for abar's [modules] "leave" submenu under Hyprland.

exec hyprctl dispatch "hl.dsp.exit()"
