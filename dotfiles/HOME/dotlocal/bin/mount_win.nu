#!/usr/bin/env nu

# Mounts the Windows NTFS partition (nvme1n1p3) using the kernel's ntfs3 driver.
const win_uuid = "C84823B74823A364"

def main [
    path?: path # mount point, defaults to ~/windows
] {
    let path = ($path | default ($env.HOME | path join "windows") | path expand)
    let device = $"/dev/disk/by-uuid/($win_uuid)"

    if not ($device | path exists) {
        print $"(ansi red)✘ Windows partition ($win_uuid) not found(ansi reset)"
        exit 1
    }

    let already = (
        open /proc/mounts
        | lines
        | any { |l| ($l | split row " " | get 1) == $path }
    )

    if $already {
        print $"(ansi yellow)Already mounted at ($path)(ansi reset)"
        return
    }

    mkdir $path

    let uid = (^id -u | str trim)
    let gid = (^id -g | str trim)
    let options = $"rw,uid=($uid),gid=($gid),umask=0022,windows_names"

    let result = (^sudo mount -t ntfs3 -o $options $device $path | complete)

    if $result.exit_code == 0 {
        print $"(ansi green)✔ Mounted ($device) at ($path)(ansi reset)"
    } else {
        print $"(ansi red)✘ Failed to mount: ($result.stderr)(ansi reset)"
        exit 1
    }
}
