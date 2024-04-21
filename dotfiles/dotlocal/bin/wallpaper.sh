#!/bin/bash

# default to ~/images
images_dir="${1:-$HOME/images/kamchoolya/}"
# default to 15 minutes
sleep_seconds="${2:-900}"

swww query &> /dev/null
if [ $? -ne 0 ] ; then
    swww-daemon --format xrgb &
fi

while true; do
    # take random file from directory
    img_path=$(find $images_dir -type f | shuf -n 1)

    # hyprctl hyprpaper unload all
    # hyprctl hyprpaper preload $img_path
    # hyprctl hyprpaper wallpaper "eDP-1,$img_path"

    swww img $img_path --transition-type grow --transition-fps 144 --transition-step 10

    sleep $sleep_seconds
done
