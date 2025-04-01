# Win

## Default stuff (originally from `ms-store`)

- `windows-terminal` (`Windows Terminal`, <https://github.com/microsoft/terminal>)
- `winget` (`App Installer`, <https://github.com/microsoft/winget-cli>)

## `winget` stuff

```sh
# essential
winget install --id=Microsoft.PowerShell -e

# drivers
winget install --id=Corsair.iCUE.5 -e
winget install --id=RazerInc.RazerInstaller4 -e
# MSI Center
winget install --id=9NVMNJCR03XV -e
# deprecated, Kitfort not in repos yet
# winget install --id=WesternDigital.Dashboard -e

# virtualization
# winget install --id=Microsoft.WSL -e
# winget install --id=Docker.DockerDesktop -e
# winget install --id=Oracle.VirtualBox -e

# only non-portable
# winget install --id=Apple.iTunes -e
winget install --id=Proton.ProtonVPN -e
winget install --id=CodecGuide.K-LiteCodecPack.Mega -e
# winget install --id=FilesCommunity.Files -e

# prefer changing PowerToys Run hotkey to win+r
winget install --id=Microsoft.PowerToys -e

# has context menu/file assotiations
# winget install --id=7zip.7zip -e
# winget install --id=TheDocumentFoundation.LibreOffice -e
# winget install --id=Microsoft.VisualStudioCode -e

# has file assotiations
# winget install --id=Mozilla.Firefox -e
# winget install --id=DuongDieuPhap.ImageGlass -e

# has system calls, e.g. from browser
# winget install --id=Vencord.Vesktop -e
# winget install --id=Discord.Discord -e
# winget install --id=Valve.Steam -e
# winget install --id=qBittorrent.qBittorrent -e
# winget install --id=OBSProject.OBSStudio -e
# winget install --id=Ventoy.Ventoy -e
# winget install --id=RustDesk.RustDesk -e

# should be auto-started by system
# winget install --id=Telegram.TelegramDesktop -e
```

## Install `scoop`

```pwsh
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# enable long paths
Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1
```

## Add buckets to `scoop`

```sh
scoop bucket add games
scoop bucket add nerd-fonts
# scoop bucket add sysinternals
scoop bucket add extras
# scoop bucket add java
# scoop bucket add versions
# scoop bucket add nonportable
```

## `scoop` stuff

```sh
scoop install main/7zip
scoop install main/git
# np in fact
scoop install extras/vcredist

# fonts for windows terminal and komorebi
scoop install nerd-fonts/Noto-NF-Mono
scoop install nerd-fonts/CascadiaCode-NF-Mono

scoop install extras/shutup10

scoop install extras/firefox

scoop install extras/vscode
scoop install extras/zed

scoop install extras/telegram
scoop install extras/vesktop
# scoop install extras/discord

scoop install extras/oculante
# scoop install extras/imageglass
scoop install main/ffmpeg
scoop install extras/mpv
scoop install extras/obs-studio

scoop install extras/cheat-engine
scoop install games/steam
# scoop install games/battlenet

# scoop install main/gallery-dl
# scoop install main/yt-dlp
# scoop install main/curl
# scoop install extras/qbittorrent

scoop install extras/libreoffice
scoop install extras/ventoy
scoop install extras/rustdesk
# scoop install extras/snappy-driver-installer-origin

# consider using in-system sudo
# scoop install main/gsudo
# scoop install main/python
# scoop install java/openjdk
# scoop install main/dotnet-sdk
# scoop install main/rust-gnu
# scoop install main/rust-analyzer
# scoop install main/nodejs

# scoop install main/nu
# scoop install extras/onefetch
# scoop install extras/carapace-bin
# scoop install main/starship
scoop install main/micro
scoop install main/yazi
scoop install main/bottom
scoop install main/fastfetch
# scoop install main/libvips

# has winget alternatives
# scoop install nonportable/files-np
# scoop install nonportable/protonvpn-np
# scoop install nonportable/k-lite-codec-pack-mega-np
# scoop install nonportable/virtualbox-np

# optional editors
# scoop install extras/krita
# scoop install extras/kdenlive

# komorebi
scoop install extras/whkd
scoop install extras/komorebi
```

## Not in repos

- `Playstation Accessories`: <https://controller.dl.playstation.net/controller/lang/en/2100004.html> -> to update dualsense firmware
- `HoyoPlay`: <https://hoyoplay.hoyoverse.com/> -> not in the repos yet
- `AMD Adrenalin`: <https://www.amd.com/en/support/download/drivers.html>
- `Western Digital Kitfox`: <https://support-en.wd.com/app/products/downloads/softwaredownloads> -> useless shit

## Configs

Copy the config repos

```sh
cd $HOME
git clone https://github.com/Gigas002/awesome-sweet
git clone https://github.com/Gigas002/software-and-services
git clone https://github.com/arkenfox/user.js

cp $HOME/software-and-services/dotfiles/HOME/dotconfig/git/config $HOME/.gitconfig
mkdir $HOME/AppData/Roaming/Code/User
cp $HOME/software-and-services/dotfiles/HOME/dotconfig/VSCodium/User/settings.json $HOME/AppData/Roaming/Code/User/settings.json
mkdir $HOME/AppData/Roaming/mpv
cp $HOME/software-and-services/dotfiles/HOME/dotconfig/mpv/mpv-windows.conf $HOME/AppData/Roaming/mpv/mpv.conf
cp $HOME/software-and-services/dotfiles/HOME/dotconfig/mpv/input.conf $HOME/AppData/Roaming/mpv/input.conf
mkdir $HOME/.config/micro
cp -r $HOME/software-and-services/dotfiles/HOME/dotconfig/micro/* $HOME/.config/micro
mkdir $HOME/.config/yazi
cp -r $HOME/software-and-services/dotfiles/HOME/dotconfig/yazi/* $HOME/.config/yazi
mkdir $HOME/.config/bottom
cp -r $HOME/software-and-services/dotfiles/HOME/dotconfig/bottom/* $HOME/.config/bottom
mkdir $HOME/.config/fastfetch
cp -r $HOME/software-and-services/dotfiles/HOME/dotconfig/fastfetch/* $HOME/.config/fastfetch
```

### Windows Terminal

For reference, also see: `$HOME/software-and-services/windows/windows-terminal/settings.json`

Manually apply theme:

```sh
# theme at $HOME/awesome-sweet/windows-terminal/Sweet.json
# add this part to shemes settings.json
micro $HOME/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json
```

### `firefox` stuff

Locate your profile with on `about:profiles`

Init git repo and pull scripts from arkenfox repos and my `user-overrides.js`. Use `updater.sh`

```sh
# %profile% is one with -release in dir name
cp $HOME/user.js/updater.bat $HOME/AppData/Roaming/Mozilla/Firefox/Profiles/%profile%/updater.bat
cp $HOME/user.js/prefsCleaner.sh $HOME/AppData/Roaming/Mozilla/Firefox/Profiles/%profile%/prefsCleaner.bat
cp $HOME/software-and-services/dotfiles/HOME/dotmozilla/firefox/profile/user-overrides.js $HOME/AppData/Roaming/Mozilla/Firefox/Profiles/%profile%/user-overrides.js
cd $HOME/AppData/Roaming/Mozilla/Firefox/Profiles/%profile%
& updater.bat
& prefsCleaner.bat
& updater.bat

# init repo
git init
# manually copy .gitignore
cp $HOME/software-and-services/dotfiles/HOME/dotmozilla/firefox/profile/.gitingore $HOME/AppData/Roaming/Mozilla/Firefox/Profiles/%profile%/.gitignore
git add *
git commit -a -m "Initial commit"
```

Extensions:

- [duckduckgo](https://github.com/duckduckgo/duckduckgo-privacy-extension)
- [libredirect](https://github.com/libredirect/browser_extension)
- [smart-referer](https://gitlab.com/smart-referrer/smart-referer)
- [stylus](https://github.com/openstyles/stylus/)
- [tabliss](https://github.com/joelshepherd/tabliss) or [tabliss-maintained](https://github.com/BookCatKid/tabliss-maintained)
- [uBlock Origin](https://github.com/gorhill/uBlock)
- [control-panel-for-twitter](https://github.com/insin/control-panel-for-twitter)
- [proton-pass](https://github.com/ProtonPass)
- [violentmonkey](https://github.com/violentmonkey/violentmonkey)

### komorebi

See: <https://lgug2z.github.io/komorebi/installation.html>

```sh
# this will generate default configs
komorebic quickstart
# komorebic start --whkd --bar

# add auto-start entry
komorebic enable-autostart --whkd --bar
```

Add configs:

```sh
mkdir $HOME/.local/bin

# copy the configs
cp $HOME/software-and-services/windows/HOME/komorebi.json $HOME/komorebi.json
cp $HOME/software-and-services/windows/HOME/komorebi.bar.json $HOME/komorebi.bar.json
cp $HOME/software-and-services/windows/HOME/dotconfig/whkdrc $HOME/.config/whkdrc
cp $HOME/software-and-services/windows/HOME/dotlocal/bin/pkill.ps1 $HOME/.local/bin/pkill.ps1

# kill whkd & komorebi if it's running and restart
komorebic start --whkd --bar
```

### Cleanup

```sh
Remove-Item -Path $HOME/awesome-sweet -Recurse -Force
Remove-Item -Path $HOME/software-and-services -Recurse -Force
Remove-Item -Path $HOME/user.js -Recurse -Force
```

## Screenshoting

Use `Snip Tool` from `msstore` (pre-installed), but configure the screenshots saving location on disk

## `vscode` extensions

- Remote Development
- Remote Explorer
- Remote Repositories
- Color Highlight
- Docker
- GitHub Copilot
- GitHub Copilot Chat
- GitLens
- markdownlint
- Path Intellisense
- PowerShell
- Prettier
