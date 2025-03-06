# CLI setup

## install cachyos

For proxy config:

```sh
micro /etc/environment
HTTP_PROXY=http://192.168.11.88:8080
HTTPS_PROXY=http://192.168.11.88:8080
```

And logout from LiveCD

- systemd-boot
- American English
- Asia/Tokyo/en-US/ru-RU
- en/Default/alt+shift
- erase disk/bcachefs
- plasma

```md
- [x] CachyOS Packages:
    - [ ] cachy-browser
    - [ ] cachyos-hello
    - [ ] cachyos-zsh-config
    - [ ] cachyos-wallpapers
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
    - [ ] cachyos-nord-kde-theme-git
    - [ ] cachyos-iridiscent-kde
    - [ ] cachyos-emerald-kde-theme-git
    - [ ] cachyos-themes-sddm
    - [ ] gwenview
    - [ ] konsole
    - [ ] kate
    - [ ] spectacle
    - [ ] sddm
    - [ ] sddm-kcm
    - [ ] phonon-qt6-vlc
CPU:
    - [ ] Intel
- [x] Firefox
```

## install AUR helper (docker)

```sh
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
paru --gendb
cd ../
rm -rf paru
```

## greeter

```sh
paru -S greetd-tuigreet
mkdir /etc/greetd
micro /etc/greetd/config.toml
# if you have installed sddm
sudo systemctl disable sddm.service
sudo systemctl enable greetd.service
```

Note: updating `/etc/sddm.conf` and `/etc/sddm.conf.d/` not required, since cachyos's defaults uses these configs

## `Apparmor` and `systemd-boot` configurations if needed

See: <https://wiki.cachyos.org/configuration/post_install_setup/>
See <https://github.com/Gigas002/software-and-services/blob/master/dotfiles/boot/README.md>

```sh
systemctl enable --now apparmor.service
micro /etc/apparmor/parser.conf
```

## fix global configs

```sh
micro /etc/locale.conf
sudo locale-gen
micro /etc/pacman.conf
micro /etc/environment
# not all compositors respect it, but also this can be used
# /etc/profile.d/wayland-env.sh
```

## install configs

For CLI:

```sh
mkdir ~/downloads
cd ~/downloads
git clone https://github.com/Gigas002/software-and-services

# manually merge baloofilerc exclude folders and filters
rm ~/downloads/software-and-services/dotfiles/dotconfig/baloofilerc

mkdir ~/.config
cp -r ~/downloads/software-and-services/dotfiles/dotconfig/* ~/.config

# remove kde places, should be overriden with above copy's ~/.config/user-dirs.dirs
mkdir ~/desktop ~/documents ~/downloads ~/music ~/images ~/share ~/templates ~/videos
rm -rf ~/Desktop ~/Documents ~/Downloads/ ~/Music ~/Pictures ~/Public ~/Templates ~/Videos

mkdir ~/.cargo
cp -r ~/downloads/software-and-services/dotfiles/dotcargo/config.toml ~/.cargo/config.toml
```

For GUI (including above):

```sh
mkdir ~/.local
cp -r ~/downloads/software-and-services/dotfiles/dotlocal/* ~/.local
cp -r ~/downloads/software-and-services/dotfiles/.gtkrc-2.0 ~/.gtkrc-2.0
```

Remove ones you won't need (e.g. for docker container I do this):

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
paru -S ccache sccache cargo-cache

# dev
paru -S rust rust-analyzer rust-src

# base cli tools
paru -S atuin bottom fastfetch helix micro nushell starship tealdeer yazi zellij openssh downgrade uutils-coreutils bat

# installing AUR packages requires yazi and micro installation first
paru -S carapace-bin

# optionally, install fonts
paru -S nerd-fonts
# This requires manual building, may be needed by wine
# paru -S ttf-ms-win11
```

For GUI (includes above):

```sh
# essential system utilities
paru -S cliphist 7zip apparmor apparmor.d-git fwupd modprobed-db network-manager-applet cachy-chroot cachyos-sysctl-manager

# editors
paru -S code zed

# fix code configs
mkdir '~/.config/Code - OSS'
cp -r ~/.config/VSCodium/product.json '~/.config/Code - OSS'
cp -r ~/.config/VSCodium/User/settings.json '~/.config/Code - OSS/User'
rm -rf ~/.config/VSCodium

# media
paru -S mpv phonon-qt6-mpv oculante libvips obs-studio
# optionally install stuff for mpv
# paru -S anime4k-git

# cleanup not needed mpv configurations
rm ~/.config/mpv/mpv-x11.conf
rm ~/.config/mpv/mpv-windows.conf

# office
paru -S libreoffice-fresh

# downloaders
paru -S yt-dlp gallery-dl qbittorrent

# communications
paru -S telegram-desktop vesktop

# KDE apps and qt6
paru -S kcalc kdialog kf6 qt6

# other
paru -S proton-vpn-gtk-app thorium-browser-bin ventoy rustdesk-bin

# hyprland essentials
paru -S hyprland hyprlock xdg-desktop-portal-hyprland hyprpicker hyprswitch hyprpaper hypridle hyprpolkitagent hyprland-protocols

# manually fix monitor and comment nvidia part in `~/.config/hypr/hyprland.conf`
# See output of `hyprctl monitors all` or use:
# monitor = , preferred, auto, 1
micro ~/.config/hypr/hyprland.conf

# productivity hyprland apps
paru -S wleave-git ashell tofi dunst grimblast-git swww brightnessctl

# remove some qt5, plasma and cachyos stuff
paru -Rns phonon-qt6-vlc kf5 cachyos-themes-sddm flatpak-kcm cachyos-zsh-config octopi sddm sddm-kcm
```

For gaming:

```sh
paru -S dualsensectl-git gameconqueror gamemode gamescope gst-plugins-good gstreamer-vaapi steam steam-native-runtime proton-cachyos fuzzylite-git vcmi lutris umu-launcher mangohud osu-lazer-bin protontricks samrewritten-git scanmem vkbasalt vkbasalt-cli vkd3d vkd3d-proton-mingw-git wowup-cf-bin cachyos-gaming-meta

# build wine
cd ~/downloads
git clone https://github.com/Frogging-Family/wine-tkg-git
cd ~/downloads/wine-tkg-git/wine-tkg-git
makepkg -si
```

### fix config paths

If your username is not `gigas` you'll need to fix some paths:

```sh
# rm -rf ~/.config/git
cd ~/.config/nushell
carapace _carapace nushell | save -f carapace.nu
```

That's everything, I guess, but better check yourself via `vscode`


## install Sweet theme

```sh
# GTK
paru -S ttf-roboto ttf-ubuntu-font-family
cd ~/downloads/software-and-services/PKGBUILDs/gtk-theme-sweet-git
makepkg -si

# icons
paru -S candy-icons-git sweet-folders-icons-git

# KDE
paru -S kvantum qt6ct-kde
cd ~/downloads/software-and-services/PKGBUILDs/plasma-themes-sweet-kde-git
makepkg -si

# Cursors
# This includes hyprcursors
cd ~/downloads/software-and-services/PKGBUILDs/sweet-cursors-git
makepkg -si
```

Manually applying theme in KDE system settings may also be required. Reboot afterwards

## init repo to track config changes

```sh
cd ~/.config
git init
# create a .gitignore files for fatty stuff like electron
micro ~/.config/.gitignore
git add *
git commit -a -m "Initial commit"
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

## `firefox` sfuff

Locate your profile with on `about:profiles`. Init git repo and pull scripts from arkenfox repos and my `user-overrides.js`. Use `updater.sh`

```sh
cd ~/downloads
git clone https://github.com/arkenfox/user.js
cp ~/downloads/user.js/updater.sh ~/.mozilla/firefox/%profile%
cp ~/downloads/user.js/prefsCleaner.sh ~/.mozilla/firefox/%profile%
cp ~/downloads/software-and-services/userjs/user-overrides.js ~/.mozilla/firefox/%profile%
cd ~/.mozilla/firefox/%profile%
chmod +x updater.sh
chmod +x prefsCleaner.sh
./updater.sh
./prefsCleaner.sh
./updater.sh
git init
git add *
git commit -a -m "Initial commit"
```

```sh
# optionally, check installation guide: https://github.com/ryze312/ff2mpv-rust
paru -S ff2mpv-rust
mkdir ~/.mozilla/native-messaging-hosts
cd ~/.mozilla/native-messaging-hosts
ff2mpv-rust manifest | save -f ff2mpv.json
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
