# List of minor linux tweks

**Export list of installed packages:**

See: <https://www.reddit.com/r/archlinux/comments/kfrdqa/export_then_reinstall_packages_installed_with_yay/>
and: <https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#List_of_installed_packages>

```sh
yay -Qqe > installs.txt
```

or:

```sh
pacman -Qqe > installs.txt
```

**Reinstall packages from list of installs:**

```sh
yay -S --needed - < installs.txt
```

or:

```sh
pacman -S --needed - < pkglist.txt
```

**yay first run:**

```sh
yay -Y --gendb
yay -Y --devel --save
```

**/etc/pacman.conf options for yay:**

```text
UseSyslog
Color
CheckSpace
VerbosePkgLists
```

**Rebuild packages after python update:**

```sh
yay -S $(pacman -Qoq /usr/lib/python3.9) --answerclean All
```

**Force linux to use local time:**

```sh
timedatectl set-local-rtc 1 --adjust-system-clock
```

**Cleanup cache:**

```sh
yay -Sc
```

or:

```sh
paru -Sc
```

**Remove unneeded dependencies:**

```sh
yay -Yc
```

or:

```sh
paru -Rns $(paru -Qtdq)
```

**Force program to run with specific language:**

```sh
LANG=en_US.UTF-8 yay
```

**Always add choice to edit PKGBUILD:**

```sh
yay --editmenu --save
```

**Remove withour checking for installed dependencies:**

```sh
yay -Rdd
```

**Create new package for AUR:**

First, add your `ssh` key to aur account. Then you can clone the empty (non-existant) repo and start making the package:

```sh
git clone ssh://aur@aur.archlinux.org/package-name.git
```

Now you can create PKGBUILD file in this directory. To generate `.SRCINFO` file before pushing commit, use:

```sh
makepkg --printsrcinfo >.SRCINFO
```

**Update binary package sums before pushing the new version:**

```sh
updpkgsums
```

**Enable NumLock on SDDM in /etc/sddm.conf:**

```text
[General]
...
Numlock=on
```

**Grub tweaks in /etc/default/grub:**

```text
GRUB_TIMEOUT=2
GRUB_TIMEOUT_STYLE=menu
```

Run `sudo update-grub` afterwards

**Use dolphin for vscode:**

See: <https://github.com/microsoft/vscode/issues/50386#issuecomment-1035081994>

**Check journalctl logs size:**

```sh
journalctl --disk-usage
```

**Remove outdated journalctl logs, leaving last 500Mb of logs:**

```sh
journalctl --vacuum-size=500M
```

**Show only critical log messages from previous boot:**

```sh
journalctl --boot=-1 --priority=3
```

**Add submodule for git repo:**

```sh
git submodule add https://aur.archlinux.org/package_name.git arch-packages/package_name
```

**Change author of last X commits:**

```sh
git rebase -i HEAD~44 -x "git commit --amend --no-edit --reset-author"
```

**Restart plasma session:**

```sh
kquitapp5 plasmashell || killall plasmashell && kstart5 plasmashell
```

## pacdiff

Sometimes you'll need to run `pacdiff` on your system, e.g. when updating `grub` package. In these cases you'll need to diff and merge the `.pacnew` file with your current config. Run the program as follows:

```sh
sudo -E DIFFPROG=meld pacdiff
```

The selection of `diff` tool is up to you, but be sure it supports running with `sudo`

## downgrade package

```sh
sudo downgrade mpv
```

## Wayland tweaks

Electron apps: <https://wiki.archlinux.org/title/Wayland>; `code`/`vscodium` requires running from cli: `code --ozone-platform=wayland`;

Native wayland support for `SDDM` is currently available only in `SDDM-git` package. Example of `/etc/sddm.conf.d/10-wayland.conf`:

```conf
[General]
DisplayServer=wayland
GreeterEnvironment=QT_WAYLAND_SHELL_INTEGRATION=layer-shell
Numlock=on

[Wayland]
CompositorCommand=kwin_wayland --no-lockscreen
```

Set environment variables for wayland only by writing them into `/etc/profile.d/wayland-env.sh`. Example:

```sh
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
  export GDK_BACKEND=wayland
#  export QT_AUTO_SCREEN_SCALE_FACTOR=1
#  export QT_SCALE_FACTOR=1
  export GTK_USE_PORTAL=0
  export MOZ_ENABLE_WAYLAND=1
#  export GBM_BACKEND=nvidia-drm
  export __GLX_VENDOR_LIBRARY_NAME=nvidia
  export __NV_PRIME_RENDER_OFFLOAD=1
  export __VK_LAYER_NV_optimus=NVIDIA_only
  export QT_QPA_PLATFORM="wayland;xcb"
#  export QT_QPA_PLATFORM="wayland"
  export SDL_VIDEODRIVER=wayland
fi
```

`Flameshot` is slow on resizing selection: use version `12.1.0` until [PR](https://github.com/flameshot-org/flameshot/pull/3059) is merged

## Connect to 2nd pc in same network

```sh
sudo systemctl start sshd

# Look for your Wi-Fi adapter (e.g., wlp3s0)
ip a | grep inet
# e.g.: inet 10.0.2.15/24 brd 10.0.2.255 scope global dynamic noprefixroute enp0s3

# on PC, in Dolphin:
sftp://user@ip

# this will open fs root in dolphin
```

## In case `vulkan` doesn't work

Sometimes (e.g. on VMs) you can't use `vulkan` and have to fallback to use `opengl` or cairo. Here's a way to force it with env var:

```sh
export GSK_RENDERER= # vulkan for vulkan, ngl for opengl, the worst one is cairo
```

## bcachefs

See: <https://bcachefs-docs.readthedocs.io/en/latest/options.html>

```sh
# format new bcachefs partition:
mkfs.bcachefs --block_size 4k /dev/sda3
# after format
bcachefs set-fs-option --compression=zstd --background_compression=zstd --data_checksum=crc64 --metadata_checksum=crc64
# check changes
bcachefs show-super /dev/sda3
# create snapshot
mkdir -p /snapshots
bcachefs subvolume snapshot / /snapshots/root-20250620144900000_1
```
