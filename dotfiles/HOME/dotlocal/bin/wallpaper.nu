#!/usr/bin/env nu

def main [
    images_dir?: string
    sleep_seconds?: int
] {
    # default to ~/images
    let images_dir = ($images_dir | default ($env.HOME | path join "images/kamchoolya"))
    # default to 10 minutes
    let sleep_seconds = ($sleep_seconds | default 600)

    # ensure awww daemon is running
    if (awww query | complete | get exit_code) != 0 {
        job spawn { ^awww-daemon --format argb }
        sleep 1sec
    }

    # killall hyprpaper
    # hyprpaper &
    # hyprctl hyprpaper unload all

    while true {
        # main output
        # main_output="eDP-1"
        # secondary_output="HDMI-A-1"
        let main_output = "HDMI-A-1"

        let img_path = (
            glob $"($images_dir)/**/*"
            | where { |p| ($p | path type) == "file" }
            | shuffle
            | first
        )

        if $img_path == null {
            sleep ($sleep_seconds | into duration --unit sec)
            continue
        }

        let log_line = $"(date now | format date '%H:%M:%S'): ($img_path)\n"
        $log_line | save --append ($env.HOME | path join ".config/hypr/wallpaper.log")

        (
            awww img
                -o $main_output
                $img_path
                --transition-type grow
                --transition-fps 100
                --transition-step 10
        )

        # secondary output is transformed and it's not handled
        # by awww properly
        # hyprctl hyprpaper reload "$secondary_output,tile:$img_path"
    	# hyprctl hyprpaper reload "$main_output,$img_path"

        sleep ($sleep_seconds | into duration --unit sec)
    }
}
