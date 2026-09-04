#!/usr/bin/env nu

def main [
    path?: path # mount point, defaults to ~/windows
] {
    let path = ($path | default ($env.HOME | path join "windows") | path expand)

    let mounted = (
        open /proc/mounts
        | lines
        | any { |l| ($l | split row " " | get 1) == $path }
    )

    if not $mounted {
        print $"(ansi yellow)Nothing mounted at ($path)(ansi reset)"
        return
    }

    let result = (^sudo umount $path | complete)

    if $result.exit_code == 0 {
        print $"(ansi green)✔ Unmounted ($path)(ansi reset)"
    } else {
        print $"(ansi red)✘ Failed to unmount: ($result.stderr)(ansi reset)"
        exit 1
    }
}
