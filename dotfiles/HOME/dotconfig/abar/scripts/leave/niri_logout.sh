#!/usr/bin/env bash
# Logout action for abar's [modules] "leave" submenu under niri.
# -s skips niri's own confirmation prompt since this submenu already is one.

exec niri msg action quit -s
