# CLI setup

## manually partition disk

After inseting LiveCD, start by manually partitioning the disk

Refer to gentoo wiki for a comprehensive guide: <https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Disks>

First, locate the disk and partitions:

```sh
sudo fdisk -l
```

It probably would be `/dev/nvme0n1` in `GPT` (if not, re-format whole disk)

The partitions would probably be like:

```sh
/dev/nvme0n1p1 -- fat32 boot partition in /efi or /boot
/dev/nvme0n1p2 -- swap
/dev/nvme0n1p3 -- linux filesystem
```

For correct swap size settings, refer to gentoo guide. TLDR: 16GB for 64GB RAM without hibernation
If your table looks different, run:

```sh
sudo fdisk /dev/nvme0n1
# rewrite all existing partitions with GPT disklabel
g
# boot/efi
n
1
(empty)
+2G
t
1
1
# swap
n
2
(empty)
+16G
t
2
19
# root partition
n
3
(empty)
(empty)
# if you want to change 'Linux filesystem' to 'Linux root'
# not needed generally
# t
# 3
# 23

# write the changes
w
```

Next, create the filesystems on partitions:

```sh
# boot/efi
sudo mkfs.vfat -F 32 /dev/nvme0n1p1
# swap
sudo mkswap /dev/nvme0n1p2
sudo swapon /dev/nvme0n1p2
# root
sudo mkfs.bcachefs --block_size 4k --compression=zstd --background_compression=zstd --data_checksum=crc64 --metadata_checksum=crc64
```

Finally, install the system. When selecting the partition, select `Manual partitioning`, then `/boot` as mounting point for `efi` partition and `/` for `bcachefs`. Select the `keep` option rather than `format`!

## install cachyos

### proxy config

```sh
micro /etc/environment
HTTP_PROXY=http://192.168.11.88:8080
HTTPS_PROXY=http://192.168.11.88:8080
```

And logout from LiveCD

### installtion

- systemd-boot
- American English
- Asia/Tokyo/en-US/ru-RU
- en/Default/alt+shift
- ~~erase disk/bcachefs~~ -> manual partitioning
- plasma

Uncheck the following:

- [x] CachyOS Packages:
  - [ ] cachyos-hello
  - [ ] cachyos-wallpapers
- [X] CachyOS Shell Configuration:
  - [ ] cachyos-zsh-config
- [x] Base:
  - [ ] X-system
  - [x] packages management
    - [ ] octopi
  - [x] Some applications:
    - [ ] btop
    - [ ] duf
    - [ ] fsarchiver
    - [ ] glances
    - [ ] hwinfo
    - [ ] inxi
    - [ ] meld
    - [ ] nano...
    - [ ] vi
    - [ ] wget
    - [ ] ripgrep
    - [ ] nano
    - [ ] vim
- [x] KDE:
  - [ ] cachyos-emerald-kde-theme-git
  - [ ] cachyos-iridiscent-kde
  - [ ] cachyos-nord-kde-theme-git
  - [ ] cachyos-themes-sddm
  - [ ] gwenview
  - [ ] haruna
  - [ ] kate
  - [ ] kdeconnect
  - [ ] konsole
  - [ ] sddm
  - [ ] sddm-kcm
  - [ ] spectacle
- [x] CPU:
  - [ ] Intel

## install AUR helper (arch, docker)

```sh
cd ~
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
paru --gendb
cd ~
rm -rf ~/paru
```

## greeter

```sh
paru -S greetd-tuigreet
# mkdir /etc/greetd
micro /etc/greetd/config.toml
# if you have installed sddm
# sudo systemctl disable sddm.service
sudo systemctl enable greetd.service
```

Note: updating `/etc/sddm.conf` and `/etc/sddm.conf.d/` not required, since cachyos's defaults uses these configs

## fix global configs

```sh
micro /etc/locale.conf
sudo locale-gen
micro /etc/pacman.conf
micro /etc/environment
# not all compositors respect it, but also this can be used
# /etc/profile.d/wayland-env.sh

# disable splitlock for games, see: https://wiki.cachyos.org/configuration/general_system_tweaks/#disabling-split-lock-mitigate
# sudo mkdir /etc/sysctl.d
micro /etc/sysctl.d/99-splitlock.conf

# less writes for journald
micro /etc/systemd/journald.conf
```

## install configs

For CLI:

```sh
mkdir ~/downloads
cd ~/downloads
git clone https://github.com/Gigas002/software-and-services

# manually merge baloofilerc exclude folders and filters
micro ~/.config/baloofilerc
rm ~/downloads/software-and-services/dotfiles/HOME/dotconfig/baloofilerc

# mkdir ~/.config
cp -r ~/downloads/software-and-services/dotfiles/HOME/dotconfig/* ~/.config

# remove kde places, should be overriden with above copy's ~/.config/user-dirs.dirs
mkdir ~/desktop ~/documents ~/downloads ~/music ~/images ~/share ~/templates ~/videos
rm -rf ~/Desktop ~/Documents ~/Downloads/ ~/Music ~/Pictures ~/Public ~/Templates ~/Videos

# instruct cargo to use sccache for re-compilations
mkdir ~/.cargo
# paru -S mold
cp -r ~/downloads/software-and-services/dotfiles/HOME/dotcargo/config.toml ~/.cargo/config.toml
```

For GUI (including above):

```sh
# local scripts, mostly for hyprland
# don't forget to add this to /etc/profile if you're on cachyos
mkdir ~/.local
cp -r ~/downloads/software-and-services/dotfiles/HOME/dotlocal/* ~/.local

# gtk 2.0 color scheme
cp -r ~/downloads/software-and-services/dotfiles/HOME/.gtkrc-2.0 ~/.gtkrc-2.0
```

Remove ones you won't need (e.g. in `docker`):

```sh
cd ~/.config
rm -rf alacritty/ anyrun/ dunst/ flameshot/ foot/ frogminer/ gallery-dl/ gtk-3.0/ gtk-4.0/ hypr/ imgvwr/ imv/ kickoff/ kitty/ Kvantum/ lapce-stable/ lsd/ menus/ mpv/ nano/ neofetch/ oculante/ oh-my-posh/ onagre/ Proton/ qimgv/ qt5ct/ qt6ct/ rofi/ steamtinkerlaunch/ swaylock/ tofi/ VSCodium/ waybar/ wleave/ wlogout/ xdg-desktop-portal/ xsettingsd/ yay/ zed/ zsh/ ashell.yml baloofilerc dolphinrc electron-flags.conf electron20-flags.conf electron21-flags.conf electron22-flags.conf electron23-flags.conf electron24-flags.conf electron25-flags.conf electron26-flags.conf electron27-flags.conf electron28-flags.conf kcminputrc kdeglobals plasmarc user-dirs.dirs nushell/oh-my-posh.nu ff2mpv-rust.json
```

For my GUI (instead of above):

```sh
cd ~/.config
rm -rf anyrun/ flameshot/ imv/ kickoff/ kitty/ lapce-stable/ lsd/ nano/ neofetch/ oh-my-posh/ onagre/ rofi/ steamtinkerlaunch/ swaylock/ waybar/ wlogout/ yay/ zsh/ electron20-flags.conf electron21-flags.conf electron22-flags.conf electron23-flags.conf electron24-flags.conf electron25-flags.conf electron26-flags.conf electron27-flags.conf electron28-flags.conf
```

## install apps

For CLI:

```sh
# improve re-compilations by saving cache
# instructed in ~/.config/pacman/makepkg.conf and ~/.cargo/config.toml
paru -S ccache sccache

# dev
paru -S rust rust-analyzer rust-src cargo-cache

# base cli tools
paru -S atuin bottom fastfetch helix micro nushell starship tealdeer yazi zellij openssh downgrade uutils-coreutils bat onefetch gitui gping

# installing AUR packages requires yazi and micro installation first
paru -S carapace-bin

# install fonts
paru -S ttf-noto-nerd ttf-cascadia-code-nerd ttf-nerd-fonts-symbols ttf-fantasque-nerd ttf-roboto
# This requires manual building, may be needed by wine
# paru -S ttf-ms-win11
```

For GUI (includes above):

```sh
# essential system utilities
paru -S cliphist 7zip apparmor apparmor.d-git fwupd modprobed-db network-manager-applet cachy-chroot cachyos-sysctl-manager

# editors
paru -S code code-marketplace zed

# media
paru -S mpv phonon-qt6-mpv oculante libvips obs-studio mpv-mpris
# optionally install stuff for mpv
# paru -S anime4k-git

# cleanup not needed mpv configurations
rm ~/.config/mpv/mpv-x11.conf
rm ~/.config/mpv/mpv-windows.conf

# office
paru -S libreoffice-fresh

# downloaders
# gallery-dl requires gpg key, see: https://aur.archlinux.org/packages/gallery-dl
gpg --recv-keys 5680CA389D365A88
paru -S yt-dlp gallery-dl qbittorrent

# communications
paru -S telegram-desktop vesktop

# KDE apps and qt6
paru -S kcalc kdialog kf6 qt6 kompare ksystemlog

# other
paru -S proton-vpn-gtk-app thorium-browser-bin ventoy rustdesk-bin sniffnet

# hyprland essentials
paru -S hyprland hyprlock xdg-desktop-portal-hyprland hyprpicker hyprswitch hyprpaper hypridle hyprpolkitagent hyprland-protocols

# manually fix monitor and comment nvidia part in `~/.config/hypr/hyprland.conf`
# See output of `hyprctl monitors all` or use:
# monitor = , preferred, auto, 1
micro ~/.config/hypr/monitors.conf

# productivity hyprland apps
# wleave requires key, see: https://aur.archlinux.org/packages/wleave-git
gpg --recv-keys --keyserver hkps://keyserver.ubuntu.com 4F9434A2EAC21BEC148F3656BF6CB659ADEE60EC
paru -S wleave-git ashell tofi dunst grimblast-git swww brightnessctl playerctl xdg-desktop-portal-gtk xdg-desktop-portal-kde blueman

# remove some qt5, plasma and cachyos stuff
paru -Rns phonon-qt6-vlc kf5 qt5 cachyos-themes-sddm flatpak-kcm cachyos-zsh-config octopi sddm sddm-kcm

# remove other stuff
paru -Rns adobe-source-han-sans-cn-fonts adobe-source-han-sans-jp-fonts adobe-source-han-sans-kr-fonts apparmor apparmor.d-git fwupd otf-aurulent-nerd otf-codenewroman-nerd otf-comicshanns-nerd otf-commit-mono-nerd otf-droid-nerd otf-firamono-nerd otf-geist-mono-nerd otf-hasklig-nerd otf-hermit-nerd otf-monaspace-nerd otf-opendyslexic-nerd otf-overpass-nerd ttf-0xproto-nerd ttf-3270-nerd ttf-agave-nerd ttf-anonymouspro-nerd ttf-arimo-nerd ttf-bigblueterminal-nerd ttf-bitstream-vera ttf-bitstream-vera-mono-nerd ttf-cascadia-mono-nerd ttf-cousine-nerd ttf-d2coding-nerd ttf-daddytime-mono-nerd ttf-dejavu ttf-dejavu-nerd ttf-envycoder-nerd ttf-firacode-nerd ttf-go-nerd ttf-gohu-nerd ttf-hack-nerd ttf-heavydata-nerd ttf-iawriter-nerd ttf-ibmplex-mono-nerd ttf-inconsolata-go-nerd ttf-inconsolata-lgc-nerd ttf-inconsolata-nerd ttf-intone-nerd ttf-iosevka-nerd ttf-iosevkaterm-nerd ttf-iosevkatermslab-nerd ttf-jetbrains-mono-nerd ttf-lekton-nerd ttf-liberation-mono-nerd ttf-lilex-nerd ttf-martian-mono-nerd ttf-meslo-nerd ttf-monofur-nerd ttf-monoid-nerd ttf-mononoki-nerd ttf-mplus-nerd ttf-nerd-fonts-symbols-mono ttf-opensans ttf-profont-nerd ttf-proggyclean-nerd ttf-recursive-nerd ttf-opensans ttf-profont-nerd ttf-proggyclean-nerd ttf-recursive-nerd
```

For gaming:

```sh
# when asked for lib32-vulkan, look at this before selecting: https://wiki.archlinux.org/title/Vulkan

# install proton
paru -S proton-cachyos

# install wine
paru -S wine-cachyos

# or build your own wine
# cd ~/downloads
# git clone https://github.com/Frogging-Family/wine-tkg-git
# cd ~/downloads/wine-tkg-git/wine-tkg-git
# makepkg -si

# hardware utilities
paru -S dualsensectl-git

# libs
paru -S gamemode gamescope gst-plugins-good gstreamer-vaapi vkbasalt vkbasalt-cli vkd3d vkd3d-proton-mingw-git dxvk-mingw-git

# launchers
paru -S steam steam-native-runtime lutris umu-launcher

# utils
paru -S gameconqueror scanmem mangohud protontricks samrewritten-git

# beware, as it installs wine-cachyos-opt
paru -S cachyos-gaming-meta cachyos-gaming-applications
paru -Rdd wine-cachyos-opt heroic-games-launcher-bin

# games, prefer osu-lazer-bin because nuget shits tons of packages in cache on build
paru -S fuzzylite-git vcmi osu-lazer-bin wowup-cf-bin anime-games-launcher
```

### fix config paths

If your username is not `gigas` you'll need to fix some paths:

```sh
# git credentials are also mine
# rm -rf ~/.config/git

# pacman PACKAGER
micro ~/.config/pacman/makepkg.conf

# carapace uses full path in it's nu config
cd ~/.config/nushell
carapace _carapace nushell | save -f carapace.nu
```

That's everything, that is installed above, but better check yourself via `vscode` if you want to install anything else

## install Sweet theme

```sh
# GTK
# paru -S dconf-editor
cd ~/downloads/software-and-services/PKGBUILDs/sweet-gtk-theme-git
makepkg -si

# folder icons
paru -S candy-icons-git
cd ~/downloads/software-and-services/PKGBUILDs/sweet-folders-git
makepkg -si

# KDE
cd ~/downloads/software-and-services/PKGBUILDs/sweet-kde-theme-git
makepkg -si

# kvantum
paru -S kvantum qt6ct-kde
cd ~/downloads/software-and-services/PKGBUILDs/sweet-kvantum-git
makepkg -si

# cursors
cd ~/downloads/software-and-services/PKGBUILDs/sweet-cursors-git
makepkg -si

# hyprcursors
cd ~/downloads/software-and-services/PKGBUILDs/sweet-cursors-hyprcursor-git
makepkg -si
```

Manually applying theme in KDE system settings may also be required. Reboot afterwards

## init repo to track config changes

```sh
cd ~/.config
git init
# check if .gitignore file copied from repo, for fatty stuff like electron!
# micro ~/.config/.gitignore
git add *
git commit -a -m "Initial commit"
```

## `Apparmor` and `systemd-boot` configurations if needed

For details, see: <https://wiki.cachyos.org/configuration/post_install_setup/>

And: <https://github.com/Gigas002/software-and-services/blob/master/dotfiles/boot/README.md>

```sh
# systemd-boot config requires root to enter /boot
sudo su
micro /boot/loader/loader.conf
exit
micro /etc/sdboot-manage.conf
sudo sdboot-manage gen

# warning: apparmor may introduce strange behavior
# like ~/.mozilla being inaccessable
# systemctl enable --now apparmor.service
micro /etc/apparmor/parser.conf
```

## `vscode` extensions

- GitHub Repositories
- vscode-icons
- C/C++
- CMake Tools
- CodeLLDB
- Color Highlight
- Even Better TOML
- GitHub Actions
- GitHub Copilot
- GitHub Copilot Chat
- GitHub Pull Requests
- GitLens
- HTML CSS Support
- Hyprland
- IntelliCode
- Markdown Preview Mermaid Support
- markdownlint
- Path Intellisense
- Prettier
- rust-analyzer
- YAML
- XML
- vscode-nushell-lang

`Hyprland` extension requires language server package:

```sh
paru -S hyprls-git
```

## `firefox` stuff

Locate your profile with on `about:profiles`

Init git repo and pull scripts from arkenfox repos and my `user-overrides.js`. Use `updater.sh`

```sh
cd ~/downloads
git clone https://github.com/arkenfox/user.js

# %profile% is one with -release in dir name
cp ~/downloads/user.js/updater.sh ~/.mozilla/firefox/%profile%
cp ~/downloads/user.js/prefsCleaner.sh ~/.mozilla/firefox/%profile%
cp ~/downloads/software-and-services/dotfiles/HOME/dotmozilla/firefox/profile/user-overrides.js ~/.mozilla/firefox/%profile%
cd ~/.mozilla/firefox/%profile%
chmod +x updater.sh
chmod +x prefsCleaner.sh
./updater.sh
./prefsCleaner.sh
./updater.sh

# init repo
git init
# manually copy .gitignore or edir it via micro
cp ~/downloads/software-and-services/dotfiles/HOME/dotmozilla/firefox/profile/.gitingore ~/.mozilla/firefox/%profile%
git add *
git commit -a -m "Initial commit"

# cleanup
rm -rf ~/downloads/user.js
```

For `ff2mpv`:

```sh
# optionally, check installation guide: https://github.com/ryze312/ff2mpv-rust
paru -S ff2mpv-rust
mkdir ~/.mozilla/native-messaging-hosts
cp -r ~/downloads/software-and-services/dotfiles/HOME/dotmozilla/native-messaging-hosts/* ~/.mozilla/native-messaging-hosts
# or run this instead of cp
# cd ~/.mozilla/native-messaging-hosts
# ff2mpv-rust manifest | save -f ff2mpv.json
```

Extensions:

- [duckduckgo](https://github.com/duckduckgo/duckduckgo-privacy-extension)
- [libredirect](https://github.com/libredirect/browser_extension)
- [plasma-browser-integration](https://github.com/KDE/plasma-browser-integration)
- [smart-referer](https://gitlab.com/smart-referrer/smart-referer)
- [ff2mpv](https://github.com/woodruffw/ff2mpv)
- [stylus](https://github.com/openstyles/stylus/)
- [tabliss](https://github.com/joelshepherd/tabliss) or [tabliss-maintained](https://github.com/BookCatKid/tabliss-maintained)
- [uBlock Origin](https://github.com/gorhill/uBlock)
- [control-panel-for-twitter](https://github.com/insin/control-panel-for-twitter)
- [proton-pass](https://github.com/ProtonPass)
- [violentmonkey](https://github.com/violentmonkey/violentmonkey)

## fancy colors

```sh
# general
paru -S openrgb

# razer
paru -S polychromatic

# corsair
paru -S openlinkhub-bin
```

## OLED

Try to protect OLED display from burn-ins, see usage: <https://github.com/mklan/hyproled>

```sh
paru -S hyproled-git
```

## Performance Tweaks

- Enable `amd_pstate=guided` -- via kernel args in `sdboot-manage`/`/boot/loader/entries/entry` or via `amdpstate-guided` sciprt on cachyos, see: <https://wiki.cachyos.org/features/cachyos_settings/#helper-scripts>
- Use `game-performance` script as launch option for games, see: <https://wiki.cachyos.org/configuration/gaming/#how-to-add-game-performance-to-steam-lutris-heroic-games-launcher-and-bottles>
- Change 3D-V Cache Optimizer mode to `cache` when gaming, see: <https://wiki.cachyos.org/configuration/general_system_tweaks/#amd-3d-v-cache-optimizer>
- Enable `scx_bpfland` or `scx_lavd` in cachyos Kernel Manager GUI. Then, disable ananicy rules, see: <https://wiki.cachyos.org/configuration/sched-ext/#disable-ananicy-cpp>
- Disable all mitigations for kernel with `mitigations=off` -> run `sdboot-manage gen` afterwards

## Add values to PATH

On cachyos `~/.local/bin` is not added to PATH. Though it is not recommended, you can add it to path in `/etc/profile`

## Waydroid

Useful links:

- <https://wiki.archlinux.org/title/Waydroid>
- <https://docs.waydro.id/usage/waydroid-prop-options>
- <https://herz.moe/content/balinux.php>

```sh
# install required packages
paru -S waydroid waydroid-image waydroid-script-git python-pyclip
# init the configs in /var/lib/waydroid
sudo waydroid init
# enable multi windows support
waydroid prop set persist.waydroid.multi_windows true
# enable service
sudo systemctl enable --now waydroid-container.service

# install google, libndk, etc
sudo waydroid-extras install gapps
sudo waydroid-extras install libndk
sudo waydroid-extras install magisk
sudo waydroid-extras hack hidestatusbar

# download patch for ndk via curl
cd ~/downloads
curl -L -o scripton_ndk.sh "https://herz.moe/content/bascripts/scripton_ndk.txt"
chmod +x scripton_ndk.sh
sudo ./scripton_ndk.sh

# if network doesn't work
# sudo ufw allow 53
# sudo ufw allow 67
# sudo ufw default allow FORWARD

# restart service after all the changes
sudo systemctl restart waydroid-container.service

# start new session
waydroid session start
waydroid show-full-ui

# get ID for Google Play certification, follow instructions afterwards
sudo waydroid-extras certified
```
