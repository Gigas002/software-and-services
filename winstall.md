# Win

## Default stuff (originally from `ms-store`)

- `windows-terminal` (`Windows Terminal`, <https://github.com/microsoft/terminal>)
- `winget` (`App Installer`, <https://github.com/microsoft/winget-cli>)

### Windows Terminal Theme

Install theme from <https://github.com/Gigas002/awesome-sweet/tree/master/windows-terminal>

## `winget` stuff

```pwsh
# essential
winget install --id=Microsoft.PowerShell  -e

# drivers
winget install --id=Corsair.iCUE.5  -e
winget install --id=RazerInc.RazerInstaller4  -e
# deprecated, Kitfort not in repos yet
# winget install --id=WesternDigital.Dashboard  -e

# virtualization
winget install --id=Microsoft.WSL  -e
# winget install --id=Docker.DockerDesktop  -e
# winget install --id=Oracle.VirtualBox  -e

# only non-portable
winget install --id=Apple.iTunes  -e
winget install --id=Proton.ProtonVPN  -e
winget install --id=CodecGuide.K-LiteCodecPack.Mega  -e
winget install --id=FilesCommunity.Files  -e

# prefer changing PowerToys Run hotkey to win+r
winget install --id=Microsoft.PowerToys  -e

# has context menu/file assotiations
# winget install --id=Giorgiotani.Peazip  -e
# winget install --id=7zip.7zip  -e
# winget install --id=TheDocumentFoundation.LibreOffice  -e
# winget install --id=Microsoft.VisualStudioCode  -e

# has file assotiations
# winget install --id=Mozilla.Firefox  -e
# winget install --id=DuongDieuPhap.ImageGlass  -e

# has system calls, e.g. from browser
# winget install --id=Vencord.Vesktop  -e
# winget install --id=Discord.Discord  -e
# winget install --id=Valve.Steam  -e
# winget install --id=qBittorrent.qBittorrent  -e
# winget install --id=OBSProject.OBSStudio  -e
# winget install --id=Ventoy.Ventoy  -e
# winget install --id=RustDesk.RustDesk  -e

# should be auto-started by system
# winget install --id=Telegram.TelegramDesktop  -e
# winget install --id=Flameshot.Flameshot  -e
# winget install --id=ShareX.ShareX  -e
```

## Install `scoop`

```pwsh
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

## Add buckets to `scoop`

```pwsh
scoop bucket add games
scoop bucket add nerd-fonts
# scoop bucket add sysinternals
scoop bucket add extras
# scoop bucket add java
# scoop bucket add versions
# scoop bucket add nonportable
```

## `scoop` stuff

```pwsh
scoop install main/7zip
# scoop install extras/peazip
scoop install main/git
# np in fact
scoop install extras/vcredist

# font for windows terminal and komorebi
scoop install nerd-fonts/CascadiaMono-NF-Mono

scoop install extras/shutup10

scoop install extras/firefox

scoop install extras/vscode

scoop install extras/telegram
scoop install extras/vesktop
# scoop install extras/discord

scoop install extras/oculante
# scoop install extras/imageglass
scoop install main/ffmpeg
scoop install extras/mpv
scoop install extras/obs-studio
scoop install extras/sharex
# scoop install extras/flameshot

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

scoop install main/gsudo
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
# scoop install main/fastfetch
# scoop install main/libvips

# has winget alternatives
# scoop install nonportable/files-np
# scoop install nonportable/protonvpn-np
# scoop install nonportable/k-lite-codec-pack-mega-np
# scoop install nonportable/virtualbox-np

# scoop install extras/krita
# scoop install extras/kdenlive
```

## Not in repos

- `Playstation Accessories`: <https://controller.dl.playstation.net/controller/lang/en/2100004.html>
- `HoyoPlay`: <https://hoyoplay.hoyoverse.com/> -> Not in the repo yet
- `MSI Center`: <https://www.msi.com/Motherboard/MPG-X870E-CARBON-WIFI/support#utility> -> probably auto-installed by windows as driver utility
- `Western Digital Kitfox`: <https://support-en.wd.com/app/products/downloads/softwaredownloads>

## komorebi setup

See: <https://lgug2z.github.io/komorebi/installation.html>

```sh
# enable long paths
Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1
scoop install komorebi whkd

# this will generate default configs
komorebic quickstart
# komorebic start --whkd --bar

# add auto-start entry
komorebic enable-autostart --whkd --bar
```

Add configs:

```sh
cd $HOME
git clone https://github.com/Gigas002/software-and-services

mkdir $HOME/.config
mkdir $HOME/.local
mkdir $HOME/.local/bin

# copy the configs
cp $HOME/software-and-services/windows/HOME/komorebi.json $HOME/komorebi.json
cp $HOME/software-and-services/windows/HOME/komorebi.bar.json $HOME/komorebi.bar.json
cp $HOME/software-and-services/windows/HOME/dotconfig/whkdrc $HOME/.config/whkdrc
cp $HOME/software-and-services/windows/HOME/dotlocal/bin/pkill.ps1 $HOME/dotlocal/bin/pkill.ps1

# kill whkd & komorebi if it's running and restart
komorebic start --whkd --bar
```

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
