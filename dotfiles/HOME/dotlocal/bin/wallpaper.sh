#!/bin/bash

# default to ~/images
images_dir="${1:-$HOME/images/kamchoolya/}"
# default to 10 minutes
sleep_seconds="${2:-600}"

# killall hyprpaper
# hyprpaper &
# hyprctl hyprpaper unload all

swww query &> /dev/null
if [ $? -ne 0 ] ; then
    swww-daemon --format argb &
fi

# sleep 5

while true; do
    # main output
    # main_output="eDP-1"
    # secondary_output="HDMI-A-1"
    main_output="HDMI-A-1"

    # take random file from directory
    img_path=$(find $images_dir -type f | shuf -n 1)
    echo "$(date): $img_path" >> ~/.config/hypr/wallpaper.log

    swww img -o "$main_output" $img_path --transition-type grow --transition-fps 100 --transition-step 10

    # secondary output is transformed and it's not handled
    # by swww properly
    # hyprctl hyprpaper reload "$secondary_output,tile:$img_path"
	# hyprctl hyprpaper reload "$main_output,$img_path"

    sleep $sleep_seconds
done
