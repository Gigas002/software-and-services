#!/usr/bin/env bash
# Keyboard layout switch for abar's [keyboard] module under sway.

exec swaymsg input type:keyboard xkb_switch_layout next
