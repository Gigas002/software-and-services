# Software and services

*What's this?*

This is a list of software, services and some minor tweaks which I use. I made it for myself to have a backup for most important things and have a quick startup if something completely breaks or to try a new distro.

List mostly targets arch-based linux distributives, but there are also some windows apps. Most part of list is FLOSS and I treat this as default choice, but there are some proprietary apps just in case/no alternative, I'll mark them correspondingly. If you're more into iOS platform, [here's](https://github.com/dkhamsing/open-source-ios-apps) a comprehensive list of open source software for you. And an analogue for android users is [here](https://github.com/pcqpcq/open-source-android-apps).

A lot of stuff and recommendations on privacy was taken from [privacyguides](https://www.privacyguides.org/en/search-engines/en/). Also a lot of useful software and tweaks for arch-based distributives listed on [arch wiki page](https://wiki.archlinux.org/title/List_of_applications).

## Legend

! marks ! important info about software platforms or states that software is proprietary

$ marks $ shows if software is not completely free

? marks ? needs clarification

## TOC

- [Software and services](#software-and-services)
  * [Legend](#legend)
  * [Linux distros](#linux-distros)
  * [Wayland compositors](#wayland-compositors)
  * [Linux-misc](#linux-misc)
  * [Windows-misc](#windows-misc)
  * [Routers firmware](#routers-firmware)
  * [Create boot device](#create-boot-device)
  * [Internet browsers](#internet-browsers)
    + [Firefox addons and tweaks](#firefox-addons-and-tweaks)
    + [Firefox tweaks](#firefox-tweaks)
  * [Networking](#networking)
    + [DNS](#dns)
    + [VPN](#vpn)
    + [Anti-virus stuff](#anti-virus-stuff)
  * [Email software and providers](#email-software-and-providers)
  * [Password Managers and 2FA](#password-managers-and-2fa)
  * [File sync, share, version control, remote desktop](#file-sync--share--version-control--remote-desktop)
  * [Search engines](#search-engines)
  * [Social networks and communication](#social-networks-and-communication)
    + [Messengers](#messengers)
  * [Self-Contained Networks](#self-contained-networks)
  * [File Encryption Software](#file-encryption-software)
  * [Media stuff](#media-stuff)
    + [Image stuff](#image-stuff)
    + [Video stuff](#video-stuff)
    + [Editors](#editors)
  * [Games](#games)
  * [Downloaders](#downloaders)
  * [Package managers](#package-managers)
  * [Virtualization](#virtualization)
  * [Terminals](#terminals)
  * [Text editors and development](#text-editors-and-development)
  * [Diff tools](#diff-tools)
  * [Screenshots and screen recording](#screenshots-and-screen-recording)
  * [Cleaners](#cleaners)
  * [Office software](#office-software)
  * [Archivers](#archivers)
  * [Theme engines](#theme-engines)
  * [File browsers](#file-browsers)
  * [Driver installers](#driver-installers)
  * [Development](#development)
  * [Android](#android)
  * [Database stuff](#database-stuff)
  * [Fonts](#fonts)

<small><i><a href='http://ecotrust-canada.github.io/markdown-toc/'>Table of contents generated with markdown-toc</a></i></small>

## Awesome lists

Prefer using these, rather than looking on my shit, these are created for people, not only for me:

- [open-source-ios-apps](https://github.com/dkhamsing/open-source-ios-apps)
- [privacy focused apps](https://github.com/privacyguides/privacyguides.org)
- [awesome hyprland](https://github.com/hyprland-community/awesome-hyprland)
- [awesome rust](https://github.com/rust-unofficial/awesome-rust)
- [awesome yarr](https://github.com/Shakil-Shahadat/awesome-piracy)
- [awesome-wayland](https://github.com/natpen/awesome-wayland) -- dead

## OSes and compositors

- [CachyOS](https://cachyos.org/) -- arch-based high-performant distro
- [RedoxOS](https://gitlab.redox-os.org/redox-os/redox/) -- independent microkernel OS completely on rust

You can skip this part, if you're using a complete [DE](https://wiki.archlinux.org/title/Desktop_environment), e.g. KDE Plasma, Gnome, etc. List below includes only compositors without DE and ones I'm interested in. I'm not going to dig deep into the wayland-specific apps (like `wlgreet`, etc), you'll have to figure out which ones suits you best on your own. You can use the [awesome-wayland](https://github.com/natpen/awesome-wayland) list for this.

- [hyprland](https://github.com/hyprwm/Hyprland) -- a highly customizable dynamic tiling Wayland compositor. Read it's [docs](https://wiki.hyprland.org/Getting-Started/Master-Tutorial/) and [arch wiki](https://wiki.archlinux.org/title/Hyprland) for more info on troubleshooting and configurations. See the [awesome-hyprland](https://github.com/hyprland-community/awesome-hyprland) and [community tools](https://github.com/orgs/hyprland-community/repositories) for some basic apps and configurations too
- [sway](https://github.com/swaywm/sway) -- i3-compatible Wayland compositor

I tried [theseus-ship](https://github.com/winft/theseus-ship) project as replacement for default `KWin`, but it doesn't seem to be stable at all, so I can't recommend it now, though it's always good to have alternatives and I hope it will evolve

I also want to note the `Pop!_OS` [COSMIC DE](https://github.com/pop-os/cosmic-epoch), which is quite fast and not so resource-intensive. It works the best on a `vbox` installation of all other `DE`s for me

## Linux-specific

- [optimus-manager](https://github.com/Askannz/optimus-manager) -- a program, that provides a solution for GPU switching on Optimus laptops (i.e laptops with a dual Nvidia/Intel or Nvidia/AMD configuration). [Has](https://github.com/Shatur/optimus-manager-qt) an unofficial gui on Qt
- [pipewire](https://github.com/PipeWire/pipewire) -- PipeWire is a server and user space API to deal with multimedia pipelines. If you're planning on replacing `pulseaudio` with `pipewire`, you should also use `pipewire-pulse` packages. On manjaro it's recommended to use `manjaro-pipewire` meta package. It's also recommended to use `manjaro-bluetooth` meta package, if you're using bluetooth audio devices
- [openrazer](https://github.com/openrazer/openrazer) -- open source, linux-native driver for razer devices
- [polychromatic](https://github.com/polychromatic/polychromatic/) -- open source RGB lighting management front-end application to customise OpenRazer peripherals on GNU/Linux
- [yay](https://github.com/Jguer/yay) -- AUR helper for Arch-based distros. I prefer it over `paru` and `aura` for some configuration differencies

## Windows-specific

Some tweaks and tools for Windows. Prefer using package manager, like `scoop`, to manage applications on windows

- [win-debloat-tools](https://github.com/LeDragoX/Win-Debloat-Tools) -- re-imagining Windows like a minimal OS install, already debloated with minimal impact for most functionality
- [gsudo](https://github.com/gerardog/gsudo) -- `sudo` for windows
- [scoop](https://github.com/ScoopInstaller/Scoop) -- a command-line installer for Windows
- [PowerToys](https://github.com/microsoft/PowerToys) -- official system utilities to maximize productivity
- [MediaCreationTool.bat](https://github.com/AveYo/MediaCreationTool.bat) -- lets you create bootable device on/for unsupported win 11 pc
- [Explorer Patcher](https://github.com/valinet/ExplorerPatcher) -- set of tweaks for win 11 to return win 10's behavior
- [Open Shell Menu](https://github.com/Open-Shell/Open-Shell-Menu) -- more minor tweaks for win 7-11
- [WindowsSpyBlocker](https://github.com/crazy-max/WindowsSpyBlocker) -- disables telemetry and some services
- !PROPRIETARY! [O&O ShutUp10++](https://www.oo-software.com/en/shutup10) -- portable, free to use app to block lots of tracking stuff and services in windows. Has a GUI
- !PROPRIETARY! [Sysinternals Suite](https://docs.microsoft.com/en-us/sysinternals/downloads/sysinternals-suite) -- set of semi-official tools for windows. It's very useful and I highly recommend it
- [GoodbyeDPI](https://github.com/ValdikSS/GoodbyeDPI) -- Deep Packet Inspection circumvention utility (for Windows)
- [7zip-zstd](https://github.com/mcmilk/7-Zip-zstd) -- 7zip with zstd support for windows

## Routers firmware

Read [this article](https://www.privacyguides.org/en/search-engines/en/router/). I don't use custom firmware because my router isn't supported by these systems. If you're lucky to have one of these and you're a proton user, you can configure your router to force all connections through ProtonVPN, see detailed guide [here](https://protonvpn.com/support/installing-protonvpn-on-a-router/).

## Create boot device

- [ventoy](https://github.com/ventoy/Ventoy) -- a tool to create a bootable devices
- [rufus](https://github.com/pbatard/rufus) -- a tool to create a bootable devices **on windows**

## Internet browsers

**Desktop**

- [Mozilla Firefox](https://ftp.mozilla.org/pub/firefox/releases/) -- preinstalled browser on most linux distibutives
- Tor Browser [arch](https://aur.archlinux.org/packages/tor-browser/)/[win](https://www.torproject.org/) -- not for everyday use. Also there's a rust fork, named [Arti](https://gitlab.torproject.org/tpo/core/arti), that will replace current C tor implementation. Rust [crate's page](https://docs.rs/arti/latest/arti/#using-arti-with-tor-browser) describes a way to use it with tor right now, but keep in mind that's an early beta
- [Brave](https://github.com/brave/brave-browser) -- if you for some reason need chromium browser, recommended by [privacyguides](https://www.privacyguides.org/en/search-engines/en/browsers/#brave)
- [thorium](https://github.com/Alex313031/thorium) -- chromium fork with various nice patches, especially for linux
- [pulse-browser](https://github.com/pulse-browser/browser) -- yet another `firefox` fork, targeting minimalistic design and performance. Uses [betterfox](https://github.com/yokoffing/Betterfox) tweaks
- [carbonyl](https://github.com/fathyb/carbonyl) -- chromium-based browser built to run in a terminal. Just for fun. I find it a better soultion, than [browsh](https://github.com/browsh-org/browsh)
- [verso](https://github.com/versotile-org/verso) -- [servo](https://github.com/servo/servo) based browser. In early state of development, not yet usable

**iOS**

- [Mozilla Firefox](https://www.mozilla.org/en-US/firefox/new/) -- official rewrite of firefox for iOS devices. Doesn't support all features of original browser because of differencies in iPhone-specific impementations
- [Onion browser](https://github.com/onionbrowser/onionbrowser) -- TorBrowser for iOS

### Firefox addons

Since I only use `firefox` as my browser, tools listed here fits only it's ecosystem, but I'm sure there are alternatives for `chromium` family. When using my version of `user.js`, keep in mind, that it's mostly a **linux-only**, plus I'm using some experimental features

Main extensions:

- [DuckDuckGo Privacy Essentials](https://github.com/duckduckgo/duckduckgo-privacy-extension) -- enables DuckDuckGo search in address bar by default, blocks some trackers and stuff
- [ff2mpv](https://github.com/woodruffw/ff2mpv) -- adds an ability to play any browser video through mpv. Read more in **media players** section below. There's also ready [AUR package](https://aur.archlinux.org/packages/ff2mpv-native-messaging-host-git/) for this
- [Maximize all windows](https://github.com/ericchase/maximize-all-windows) -- useful when using arkenox's user.js, read more below
- [Plasma Integration](https://invent.kde.org/plasma/plasma-browser-integration) -- if you're using KDE desktop; usually KDE suggests it itself
- [Skip redirect](https://github.com/sblask/webextension-skip-redirect) -- as the title says - blocks some annoiying redirects
- [Stylus](https://github.com/openstyles/stylus/) -- style manager. [Here's](https://uso.kkx.one/) open source style archive
- [Tabliss](https://github.com/joelshepherd/tabliss) -- lets you configure your "new tab" page
- [uBlock Origin](https://github.com/gorhill/uBlock) -- ad/malware blocker
- [Libredirect](https://github.com/libredirect/browser_extension) -- redirects your queries to normal services (e.g. youtube links opens in Invidious)
- [control-panel-for-twitter](https://github.com/insin/control-panel-for-twitter) -- gives you more control over your Twitter timeline and adds missing features and UI improvements
- $FREEMIUM$ [ProtonPass](https://github.com/ProtonPass) -- cross-platform password manager from Proton team, IMO more reliable, than having passwords in a Firefox account

Additional/situative extensions and recommendations:

- $FREEMIUM$ [Bitwarden](https://github.com/bitwarden) -- great alternative for **ProtonPass**
- [cookies.txt](https://github.com/lennonhill/cookies-txt) -- lets you save your cookies into `.txt` file
- [ViolentMonkey](https://github.com/violentmonkey/violentmonkey) -- provides userscripts support for browsers. It works on browsers with WebExtensions support. Seems more "alive", than [GreaseMonkey](https://github.com/greasemonkey/greasemonkey)
- [Terms of Service; Didn’t Read](https://github.com/tosdr/browser-extensions) -- short version of main points in terms of service
- [xBrowserSync](https://github.com/xbrowsersync/api) -- sync browser data securely
- [darkreader](https://github.com/darkreader/darkreader) -- analyzes web pages and aims to reduce eyestrain while browsing the web. Slows your browser, so decide by yourself

### Firefox tweaks

- [betterfox](https://github.com/yokoffing/Betterfox) -- some perf-oriented tweaks
- [arkenfox](https://github.com/arkenfox/user.js) -- privacy-oriented tweaks. Check out the [extensions](https://github.com/arkenfox/user.js/wiki/4.1-Extensions) wiki page also

`user.js` file is usually located in: `~/.mozilla/firefox/profile-id/`, look at `about:profiles` for your paths

## Networking

### DNS

**Desktop**

Encrypt your DNS queries with *DNS over HTTPS*, *DNS over TLS*, *DNSCrypt* and more. This section mostly refers to corresponding [privacyguides page](https://www.privacyguides.org/en/search-engines/en/dns/)

First, select your DNS provider from the link above. I personally prefer [AdGuard DNS](https://github.com/AdguardTeam/AdGuardDNS/) over Cloudflare since these are open source, support of `DoH`, `DoT`, `DNSCrypt` and it's fast, though keep some logs for 24 hours. As an alternative I use [BlahDNS](https://github.com/ookangzheng/blahdns/) which is said to "not collect any logs", but it's speed is slower, so it's on the second place in priority. Plus, you can enable **DNS over HTTPS** in `firefox` settings (which is redundant if you've set it up on router level)

- [Pi-Hole](https://github.com/pi-hole/pi-hole) -- a DNS sinkhole that protects your devices from unwanted content without installing any client-side software

**iOS**

I suggest using [DNSCloak](https://github.com/s-s/dnscloak), which is a GUI and wrapper for *dnscrypt-proxy 2*

### VPN

- $FREEMIUM$ [ProtonVPN](https://github.com/ProtonVPN) -- while it's free plan is not very good, it's paid plans are a good choice. ProtonVPN supports *Secure Core*, *Netshield* and *Kill Switch* on most platofrms. Plus, it has a solid ecosystem, which I'll mention in below sections

### Anti-virus stuff

It's not recommended to enable scan of downloads for viruses in browser, since it uses google services, but I'd prefer not to have viruses, so I turn it on. Here's mozilla explanation on [how it works](https://support.mozilla.org/en-US/kb/how-does-phishing-and-malware-protection-work)

- [ClamAV](https://github.com/Cisco-Talos/clamav) -- open source, CLI, scanning antivirus for Windows/Linux
- !LINUX! [ClamTK](https://github.com/dave-theunsub/clamtk) -- GUI for ClamAV, works only on Linux
- !LINUX! [gufw](https://github.com/costales/gufw) -- firewall for linux systems, which is a GUI for [ufw](https://wiki.archlinux.org/title/Uncomplicated_Firewall)
- !PROPRIETARY! !WINDOWS! Windows defender and firewall -- handles most cases pretty good without any need of additional software

## Email software and providers

Read more about [providers](https://www.privacyguides.org/en/search-engines/en/email/) and [software](https://www.privacyguides.org/en/search-engines/en/email-clients) choice

**Providers**

- $FREEMIUM$ [ProtonMail](https://github.com/ProtonMail) -- can't say I recommend it's free plan, since it doesn't allow you to do lots of things, but paid plans are awesome

**Desktop software**

- [Thunderbird](https://www.thunderbird.net/en-US/) -- supports most email providers. To connect *ProtonMail* with it you should use [ProtonBridge](https://github.com/ProtonMail/proton-bridge) app and have paid plan

## Password Managers and 2FA

- $FREEMIUM$ [ProtonPass](https://github.com/ProtonPass) -- cross-platform password manager from Proton team, IMO more reliable, than having passwords in a Firefox account
- $FREEMIUM$ [Bitwarden](https://github.com/bitwarden) -- great alternative for **ProtonPass**
- [Ente Auth](https://github.com/ente-io/ente/tree/main/auth) -- end-to-end encrypted, cross platform and free app for storing your 2FA codes with cloud backups

## File sync, share, version control, remote desktop

Read more [on privacyguides](https://www.privacyguides.org/en/search-engines/en/file-sharing/)

- $FREEMIUM$ [ProtonDrive](https://github.com/ProtonMail/WebClients) -- E2EE general file storage service. Available on iOS and Android as apps, through browser on desktop
- [OnionShare](https://github.com/onionshare/onionshare) -- share files and chat with friends using tor network. Desktop only
- [Syncthing](https://github.com/syncthing/syncthing) -- open source file synchronization tool
- [Git](https://git-scm.com/downloads) -- a common version control system
- !WINDOWS! [AltStore/AltServer](https://github.com/rileytestut/AltStore) -- gives you an opportunity to install apps not from AppStore. Has an [unofficial app](https://github.com/powenn/AltServer-Linux-ShellScript) for linux, but that one didn't worked out for me yet
- !PROPRIETARY! !WINDOWS! [iTunes/iCloud](https://support.apple.com/en-us/HT210384) -- unfortunately it's a needed dependency for `AltServer` to work
- [rustdesk](https://github.com/rustdesk/rustdesk) -- open source virtual/remote desktop infrastructure for everyone! The open source TeamViewer/AnyDesk alternative

## Search engines

Read more [on privacyguides](https://www.privacyguides.org/en/search-engines/)

- [DuckDuckGo](https://github.com/duckduckgo) -- default choice on TorBrowser, supports onion services. Partially proprietary

## Social networks and communication

Here I'll mainly cover some alternative frontends for these mainstream services, not introducing completely new and already good ones. Check out the [Project Segfault](https://projectsegfau.lt/) website for some instances of below websites

- [Nitter](https://github.com/zedeus/nitter) -- alternative twitter frontend, focused on privacy. It's still in early beta, so there's not much features released
- [control-panel-for-twitter](https://github.com/insin/control-panel-for-twitter) -- browser extension for better twitter experience
- [Pawoo](https://github.com/CrossGate-Pawoo/mastodon) -- alternative TO twitter for japanese artists and users, developed by pixiv stuff. Fork of [mastodon](https://github.com/mastodon/mastodon)
- [Libreddit](https://github.com/spikecodes/libreddit) -- private front-end for Reddit
- [Invidious](https://github.com/iv-org/invidious) -- alternative front-end to YouTube
- [Bibliogram](https://github.com/Booteille/bibliogram) -- alternative front-end for Instagram
- [Wikiless](https://codeberg.org/orenom/Wikiless) -- alternative Wikipedia front-end focused on privacy
- [SimplyTranslate](https://github.com/Simple-Web-Project/SimplyTranslate-Web) -- alternative to google translate, that can use Google, DeepL, ICIBA and LibreTranslate APIs to translate text. Not very convenient for hieroglyphic languages
- [OpenStreetMap](https://github.com/openstreetmap/openstreetmap-website) -- alternative to google maps
- [FreeTube](https://github.com/FreeTubeApp/FreeTube) -- desktop YouTube player built with privacy in mind. Pros: no ads, supports external players, lets you download videos on their pages, export/import your YouTube data easily, doesn't spy on you. Cons: desktop only, lacks playlists support, FUCKING ELECTRON. Can use [invidious](https://github.com/iv-org/invidious) API
- !iOS! [EhPanda](https://github.com/tatsuz0u/EhPanda) -- open source app for sad panda on iOS, written with Swift. Installable through `AltServer`
- !iOS! [FEhViewer](https://github.com/honjow/FEhViewer) -- another sad panda app for iOS. Has better support, than `EhPanda`, but written using flutter
- [Syncplay](https://github.com/Syncplay/syncplay) -- client/server app to synchronize media playback on mpv/VLC/MPC-HC/MPC-BE. Analogue for services like synctube, discord's youtube together, etc
- [Owncast](https://github.com/owncast/owncast) -- self-hosted streaming platform (alternative for twitch). Requires you to have a static IP address or server (e.g. digital ocean)
- [PeerTube](https://github.com/Chocobozzz/PeerTube) -- decentralized and federated video platform developed as an alternative to other platforms that centralize our data and attention, such as YouTube, Dailymotion or Vimeo
- [EH-Page-Scrobbler](https://github.com/Meldo-Megimi/EH-Page-Scrobbler) -- browser script to return pages on sadpanda website
- [danbooru](https://github.com/danbooru/danbooru) -- taggable image board written in Rails
- [waifu2x](https://github.com/nagadomi/nunif) -- upscaler for anime pictures on neural nets

### Messengers

Read more about instant messengers on [privacyguides](https://www.privacyguides.org/en/search-engines/en/real-time-communication/)

- !PROPRIETARY! [Telegram](https://github.com/telegramdesktop/tdesktop) -- only app is open source, it lacks encryption by default and has many other problems. But still it's a lightweight client, that smoothly run on every system and even with bad internet connection. It also has a lot of awesome features, that completely open source alternatives doesn't
- [SimpleX](https://github.com/simplex-chat/simplex-chat) -- messaging platform that has no user identifiers of any kind
- [Element](https://github.com/vector-im) -- good replacement for telegram/discord for future. Now lacks lots of features and feels very slow at all tasks
- [Session](https://github.com/oxen-io/session-desktop) -- Onion routing based messenger. Fork of [Signal](https://github.com/signalapp/Signal-Desktop). that doesn't require any personal data for registration

**Discord alternatives and tweaks**

Discord is shit as is and I would recommend you never use it because it's app VERY slow, has lots of bugs and I personally don't love discord policies. Third-party apps can fix first problems, but last one is in discord itself. Anyway, here's a short list

- [vesktop](https://github.com/Vencord/Vesktop) -- alternative `discord` client with linux-specific fixes
- [discordo](https://github.com/ayn2op/discordo) -- a lightweight, secure, and feature-rich Discord terminal client 
- [Abaddon](https://github.com/uowuo/abaddon) -- young replacement of discord app on c++ without electron. In very early state, but can be good in future, developer seems really passionate about his program
- !LINUX! [dissent](https://github.com/diamondburned/dissent) -- discord client on golang
- [Undiscord](https://github.com/victornpb/deleteDiscordMessages) -- greasemonkey script to remove all your discord history. Theoretically can be the reason to ban you, but hey, I guess that's not a big problem

## Self-Contained Networks

If you - for some reason - want to browse the dark web, than you definetely need to read the page about self-constained networks on [privacyguides](https://www.privacyguides.org/en/search-engines/en/self-contained-networks/). Long story short, you can use onion services, listed in this README (onionshare, tor, etc) or these:

- [i2p](https://github.com/i2p/i2p.i2p) -- tor analogue
- [retroshare](https://github.com/RetroShare/RetroShare) -- onionshare p2p analogue with more complex UI and lots of possibilities

## File Encryption Software

It's very important to have your storages encrypted. Even microsoft's BitLocker is better than nothing. Here's full list of recommendations from [privacygides](https://www.privacyguides.org/en/search-engines/en/encryption/). My choice is following:

- [VeraCrypt](https://github.com/veracrypt/VeraCrypt) -- simple, efficient and secure encryption tool

## Media stuff

### Image stuff

- [qimgv](https://github.com/easymodo/qimgv) -- awesome lightweight image viewer on c++. Even supports playing videos through `mpv`. I've also created a [fork for arch users](https://aur.archlinux.org/packages/qimgv-qt6-kde-git/), which enables qt6 compilation and KDE support for cmake args. Build script is located here, in `/qimgv-qt6-kde` directory
- [oculante](https://github.com/woelper/oculante) -- minimalistic crossplatform image viewer written in rust. Native wayland support included
- !WINDOWS! [ImageGlass](https://github.com/d2phap/ImageGlass) -- good alternative for windows, if you didn't like qimgv
- [libvips](https://github.com/libvips/libvips) -- insane fast image processing library on c. Supports huge amount of formats and ImageMagick as plugin
- [ImageMagick](https://github.com/ImageMagick/ImageMagick) -- alternative to libvips, slower on benchmarks but still usable for some tasks
- [pngquant](https://github.com/kornelski/pngquant) -- lossy image-compression command line tool
- !WINDOWS! [AntiDupl](https://github.com/ermig1979/AntiDupl) -- app to scan and remove duplicated images, based on simd library on c++
- [DigiKam](https://invent.kde.org/graphics/digikam) -- photo management application. IMO handles duplicate-finding worse, than AntiDupl, but has a lot of other features and a best choice on linux

### Video stuff

- [mpv](https://github.com/mpv-player/mpv) -- IMO best video player nowadays. Supported by a lot of plugins and programs like `ff2mpv`, `freetube`, `qimgv` and more. Has an ability to run sripts. My configs are included in this repo (based on [eXmendiC guide](https://iamscum.wordpress.com/guides/videoplayback-guide/mpv-conf/)). These configs also contains links to the shaders I like
- [vlc](https://github.com/videolan/vlc) -- alternative for mpv
- !WINDOWS! [K-Lite Codec Pack with MPC-HC](https://www.codecguide.com/download_kl.htm) -- collection of DirectShow filters, codecs, and tools. Handles HDR video with MadVR pretty good, comparing to VLC. Need to compare with mpv though
- [ruffle](https://github.com/ruffle-rs/ruffle) -- flash player emulator on rust
- [ffmpeg](https://github.com/FFmpeg/FFmpeg) -- cross-platform solution to record, convert and stream audio and video; CLI
- [libplacebo](https://github.com/haasn/libplacebo) -- core rendering algorithms and ideas of mpv rewritten as an independent library
- !iOS! [Yattee](https://github.com/yattee/yattee) -- Alternative YouTube frontend for iOS (iPhone, iPad), macOS and tvOS (Apple TV) built with Invidious and Pipedgit 

### Editors

- [krita](https://github.com/KDE/krita) -- analogue of photoshop, IMO better than GIMP
- [GIMP](https://github.com/GNOME/gimp) -- analogue of photoshop. While I think it's worse, than krita, I still think it's a good software choice
- [kdenlive](https://github.com/KDE/kdenlive) -- free and open source video editing application
- [handbrake](https://github.com/HandBrake/HandBrake) -- open-source video transcoder

## Games and emulation

Games are rarely released open source, but still there are a lot of good and complete ones, and ESPECIALLY open source engines for existing games (e.g. openmw, openjk, openrct, etc). This section won't give you exact games, but some lists and tools for it.

- [Open source games on github](https://github.com/leereilly/games) -- list of open source game projects, hosted on github
- [Open source games](https://github.com/Trilarion/opensourcegames) -- alternative for list above
- [Open source game clones](https://github.com/opengaming/osgameclones) -- list, targeting only game-clones (e.g. open source diablo engine)
- [Emulation wiki](https://emulation.gametechwiki.com/index.php/Main_Page) -- a complete and improving wiki of emulators of any platform. Writes pros and cons for each emulator, writes about updates and much more. Cons are that they doesn't always write about forks about unsupported emulators (e.g. [Mesen-X](https://github.com/NovaSquirrel/Mesen-X) -- fork of awesome, but archived [Mesen](https://github.com/SourMesen/Mesen) is not listed here)
- [Poi](https://github.com/poooi/poi) -- scalable browser and tool set for Kantai Collection(KanColle)
- [Cheat Engine](https://github.com/cheat-engine/cheat-engine) -- ultimate -- and more safe, than trainers -- solution if you need cheats in games. Only works through wine and `ceserver`
- !LINUX! [scanmem/gameconqueror](https://github.com/scanmem/scanmem) -- native analogue of **Cheat Engine** for linux
- !LINUX! [Pince](https://github.com/korcankaraokcu/PINCE) -- yet another native analogue of **Cheat Engine** for linux. Supports cheat tables (but not **cheat engine** ones, has it;s own format)
- !LINUX! [Lutris](https://github.com/lutris/lutris) -- helper for installation and playing video games from all eras and from most gaming systems
- !LINUX! [Wine/Wine-staging](https://github.com/wine-mirror/wine) -- you've probably heard it before, but **Wine Is Not an Emulator**!
- !LINUX! [Wine-Tkg](https://github.com/Frogging-Family/wine-tkg-git) -- customizable wine builds
- !LINUX! [Wine-Mono](https://github.com/madewokherd/wine-mono) -- package containing Mono and other projects, intended as a replacement for the .NET Framework (4.x and earlier) in Wine. Dependency for a lot of games
- !LINUX! [Proton](https://github.com/ValveSoftware/Proton) -- Valve's fork of wine, that's used in steam
- !LINUX! [Proton-GE](https://github.com/GloriousEggroll/proton-ge-custom) -- popular fork of **proton** with some additional tweaks. Recommended to trying out, if wine/proton couldn't handle running your game
- !LINUX! [Winetricks](https://github.com/Winetricks/winetricks) -- lets you install a lot of usefull stuff for your wine instance
- !LINUX! [Protontricks](https://github.com/Matoking/protontricks) -- cli of **winetricks** for **proton**
- [ProtonDB](https://www.protondb.com/) -- database of reports of gamers about games being playable with **proton**
- [dxvk](https://github.com/doitsujin/dxvk) -- Vulkan-based implementation of D3D9, D3D10 and D3D11. Can be used on Windows too (and sometimes shows significant performance improvements)
- [vkd3d-proton](https://github.com/HansKristian-Work/vkd3d-proton) -- implementation of Direct3D 12 API on top of Vulkan
- [innoextract](https://github.com/dscharrer/innoextract) -- tool to unpack installers created by Inno Setup (e.g. GOG games)
- !LINUX! [mangohud](https://github.com/flightlessmango/MangoHud) -- A Vulkan and OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load and more
- !LINUX! [goverlay](https://github.com/benjamimgois/goverlay) -- GUI settings manager for **mangohud**, [vkBasalt](https://github.com/DadSchoorse/vkBasalt) and [ReplaySorcery](https://github.com/matanui159/ReplaySorcery)
- !LINUX! [gamemode](https://github.com/FeralInteractive/gamemode) -- daemon/lib combo for Linux that allows games to request a set of optimisations be temporarily applied to the host OS and/or a game process
- !LINUX! [steamtinkerlaunch](https://github.com/frostworx/steamtinkerlaunch) --  Linux wrapper tool for use with the Steam client for custom launch options and 3rd party programs
- !LINUX! [darling](https://github.com/darlinghq/darling) -- analogue of wine which targets macos behavior on linux
- [Heroic Games Launcher](https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher) -- A Native GOG, Amazon and Epic Games Launcher for Linux, Windows and Mac

## Downloaders

- [curl](https://github.com/curl/curl) -- a command line tool and library for transferring data
- [yt-dlp](https://github.com/yt-dlp/yt-dlp) -- fork of abandoned [youtube-dl](https://github.com/ytdl-org/youtube-dl) for downloading videos (*not only youtube supported*); CLI
- [youtube-dl-gui](https://github.com/StefanLobbenmeier/youtube-dl-gui) -- youtube-dl (*actually yt-dlp*) GUI
- [qBitTorrent](https://github.com/qbittorrent/qBittorrent) -- simple and fast bittorrent client on qt. Sometimes preinstalled on linux systems
- [gallery-dl](https://github.com/mikf/gallery-dl) -- awesome command-line program to download stuff from a [huge](https://github.com/mikf/gallery-dl/blob/master/docs/supportedsites.md) variaty of websites. Configs are usually located in `~/.config/gallery-dl/config.json` (create one if you don't have any)
- [pixivutil2](https://github.com/Nandaka/PixivUtil2) -- CLI on python to download stuff from pixiv, alternative for gallery-dl for pixiv only (*gallery-dl supports pixiv too*) Supports authentication, pixiv FANBOX, downloading videos (through ffmpeg). Has an AUR package. Config is located in `~/.local/share/PixivUtil2`
- !PROPRIETARY! !WINDOWS! [Hitomi Downloader](https://github.com/KurtBestor/Hitomi-Downloader) -- [partially closed-source](https://github.com/KurtBestor/Hitomi-Downloader/issues/2226) software for downloading galleries, alternative to gallery-dl with GUI. Though it's [mentioned](https://github.com/KurtBestor/Hitomi-Downloader/issues/885) to work on linux with **Wine** I couldn't run it myself
- [DoujinDownloader](https://github.com/Gigas002/DoujinDownloader) -- my own tool to organize doujins repo using `.md` or `.json` files. It's not actually a downloader, since there are a lot of better tools for this, but it's capable of parsing undownloaded list of links into file, that downloaders like **gallery=dl** can handle
- [imgbrd-grabber](https://github.com/Bionus/imgbrd-grabber) -- imageboard/booru downloader with rich GUI and lots of features, including adding your own data sources

## Virtualization

- [Docker](https://www.docker.com/get-started) -- popular CLI containerization application. Has free community edition and paid enterprise, more explanation on this regards [here](https://askinglot.com/is-docker-a-open-source)
- [Virtual Box](https://www.virtualbox.org/wiki/Downloads) -- most basic and simple to use virtualization application
- !WINDOWS! [wslg](https://github.com/microsoft/wslg) -- enable support for running Linux GUI applications (X11 and Wayland) on Windows. Requires win11+ and special drivers (read more on their github page)

## Terminals/shells

- [shellcheck](https://github.com/koalaman/shellcheck) -- a static analysis tool for shell scripts
- [nushell](https://github.com/nushell/nushell) -- a new type of shell
- [atuin](https://github.com/atuinsh/atuin) -- terminal history made easy
- [alacritty](https://github.com/alacritty/alacritty) -- a cross-platform, OpenGL terminal emulator
- [oh-my-posh](https://github.com/JanDeDobbeleer/oh-my-posh) -- implement themes for your shells
- !LINUX! [foot](https://github.com/DanteAlighierin/foot) -- terminal emulator for wayland
- [zellij](https://github.com/zellij-org/zellij) -- a terminal workspace. Useful with foot/alacritty
- [PowerShell Core](https://github.com/powershell/powershell) -- modern rewrite of windows's proprietary powershell. Works on windows/linux/mac. Be aware, that some commands require you to run pwsh as administrator on windows or even doesn't work in a new version
- !WINDOWS! [Windows Terminal](https://github.com/Microsoft/Terminal) -- terminal for windows system. Supports WSL, git bash, theming, etc and is actually very good

## Text editors and development

- [vscodium](https://github.com/VSCodium/vscodium) -- VS Code without MS branding/telemetry/licensing
- [notepad++](https://github.com/notepad-plus-plus/notepad-plus-plus) -- fast (hey, it's not a *browser*) and extensible source code editor on C++
- !LINUX! [nano](https://nano-editor.org/) -- I prefer it over `vim` because of it's ease of usage
- [micro](https://github.com/zyedidia/micro) -- modern `nano` alternative
- [lapce](https://github.com/lapce/lapce) -- vscode alternative on rust. Alpha-quality for now

## Diff tools

The `code`/`vscodium` isn't bad, but it's not recommended to run it with `sudo` (cases like `pacdiff`), so tools here must be able to run with `sudo` without problems.

- [kompare](https://github.com/KDE/kompare) -- diff tool by KDE
- [meld](https://github.com/GNOME/meld) -- visual diff and merge tool targeted at developers

## Screenshots and screen recording

- [flameshot](https://github.com/flameshot-org/flameshot) -- cross-platform screenshoting tool on C++
- !LINUX! [wayshot](https://github.com/waycrate/wayshot) -- screenshoting tool for `wlroots` based compositors
- !LINUX! [watershot](https://github.com/Kirottu/watershot) -- analogue of flameshot on rust for `wlroots` based compositors
- !WINDOWS! [ShareX](https://github.com/ShareX/ShareX) -- windows-only analogue of flameshot on C#. Can shot videos with `ffmpeg` and supports additional task (e.g. convert your screenshots to `.webp` before saving)
- [OBS Studio](https://github.com/obsproject/obs-studio) -- free and open source software for live streaming and screen recording. MUCH better, than default windows 10's screen recording through game bar

## Cleaners

- [czkawka](https://github.com/qarmin/czkawka) -- a simple, fast and free app to remove unnecessary files from your computer. Written with Rust
- [BleachBit](https://github.com/bleachbit/bleachbit) -- app, that cleans files to free disk space and to maintain privacy. Cleans less stuff on windows, than ccleaner
- !LINUX! [Stacer](https://github.com/oguzhaninan/Stacer) -- system cleaner, primarily targeting debian-based linux systems

## Office software

- [LibreOffice](https://github.com/LibreOffice) -- alternative to MS Office. More or less supports microsot data formats, but mainly targets support of it's own `.ods` and other formats
- $FREEMIUM$ [OnlyOffice](https://github.com/ONLYOFFICE) -- cloud-based alternative to MS Office. Primarily targets MS data formats support

## Archivers

- !LINUX! [p7zip-zstd](https://github.com/p7zip-project/p7zip) -- fork of modern 7zip (22.00+) and outdated [p7zip](https://sourceforge.net/projects/p7zip/) with support for major modern codecs such as Brotli, Fast LZMA2, LZ4, LZ5, Lizard and Zstd
- [7z](https://www.7-zip.org/) -- fast archiver with a high compression ratio. Since 21.01 officially supports linux build (was used on linux as p7zip before)
- !WINDOWS! [7-zip-zstd](https://github.com/mcmilk/7-Zip-zstd) -- 7z's fork with support for [zstandard](https://github.com/facebook/zstd/), [brotli](https://github.com/google/brotli/), [lz4](https://github.com/lz4/lz4/), [lz5](https://github.com/lz4/lz4/), [lizard](https://github.com/inikep/lizard/) and [fast-lzma2](https://github.com/conor42/fast-lzma2). Has GUI app for windows only, supports linux build as [p7zip's fork](https://github.com/jinfeihan57/p7zip), though I wouldn't recommend that one
- !LINUX! [Ark](https://github.com/KDE/ark) -- file archiver by KDE , can be also used as GUI for 7zip and other archivers

## Theme engines

- !LINUX! [kvantum](https://github.com/tsujan/Kvantum/tree/master/Kvantum) -- SVG-based theme engine for Qt, tuned to KDE and LXQt, with an emphasis on elegance, usability and practicality
- !LINUX! [qt5ct/qt6ct](https://github.com/trialuser02/qt6ct) -- required for theming of qt apps on some compositors. Prefer using `-kde` patched versions if possible

## File browsers

- !LINUX! [Dolphin](https://github.com/KDE/dolphin) -- KDE file manager
- !WINDOWS! [Files](https://github.com/files-community/Files) -- better file explorer for windows 10+
- !WINDOWS! $FREEMIUM$ !PROPRIETARY! [Total Commander](https://www.ghisler.com/) -- customizable file explorer for windows with rich set of features. Free for first 30 days
- [yazi](https://github.com/sxyazi/yazi) -- terminal file manager

## Driver installers

- !WINDOWS! [Snappy Driver Installer Origin](https://www.snappy-driver-installer.org/) -- open source driver installer/updater for windows systems

## Development

You're probably familiar with this, since you're on github and know what to use and why. But for other users (especially windows ones) some things aren't always clear, e.g. not even everyone knows about openjdk and oracle's java builds. I'll only list basic things here, not mentioning minor stuff for developemtnt, like IDEs, libraries, package managers, etc. Plus, I'm only (mostly) aware about `c++`/`c#` stuff, which advanced developers knows anyways

- [CPython](https://github.com/python/cpython) -- the most popular implementation of python standards. Yes, there are more efficient ones (for some tasks, at leasts), but I'd prefer stability, since a lot of various software bind to this version
- [RustPython](https://github.com/RustPython/RustPython) -- experimental rust python implementation
- [OpenJDK](https://github.com/openjdk/jdk) -- open source java builds without oracle's shit
- [dotnet](https://github.com/dotnet/sdk) -- official microsoft implementation of .NET language family. Alternative to [mono project](https://github.com/mono/mono) that is an open source of older (closed source) .NET Framework. See [compatibility page](https://www.mono-project.com/docs/about-mono/compatibility/) for more info
- !LINUX! [base-devel](https://archlinux.org/groups/x86_64/base-devel/) -- set of must-have development tools for linux distributives. Can have another name on other (not arch) dists, but still will contain `make`, `sudo`, `gcc` and others
- !WINDOWS! [MSYS2](https://github.com/msys2) -- alternative to above **base-devel** for windows with lots of linux tools, like `mingw`. You can also try [cygwin](https://github.com/cygwin/cygwin) if this didn't work in your case
- [dotdevelop](https://github.com/dotdevelop/dotdevelop) -- wip fork of abandoned **monodevelop** project, that aims to create an open-source and cross-platform IDE for dotnet developers
- [netcoredbg](https://github.com/Samsung/netcoredbg) -- open-source debugger for dotnet core
- [csharpier](https://github.com/belav/csharpier) -- FLOSS formatter for dotnet code

## Android

As the name implies, the whole section is about android apps or android emulation

- !LINUX! [anbox](https://github.com/anbox/anbox) -- a container-based approach to boot a full Android system on a regular GNU/Linux system
- !LINUX! [waydroid](https://github.com/waydroid/waydroid) -- analogue of **anbox**, uses `wayland`
- [LineageOS](https://github.com/LineageOS/android) -- a free and open-source operating system for various devices, based on the Android mobile platform
- [GrapheneOS](https://github.com/GrapheneOS) -- build with security and privacy in mind fork of android. Currently supports only Google Pixel devices
- [DivestOS](https://github.com/Divested-Mobile/DivestOS-Build) -- a soft-fork of LineageOS. DivestOS inherits many supported devices from LineageOS. It has signed builds, making it possible to have verified boot on some non-Pixel devices
- [Aegis](https://github.com/beemdevelopment/Aegis) -- a free, secure and open source app for Android to manage your 2-step verification tokens
- [GmsCore](https://github.com/microg/GmsCore) -- free implementation of Google Play Services
- [Magisk](https://github.com/topjohnwu/Magisk) -- a suite of open source software for customizing Android
- [K-9](https://github.com/thundernest/k-9) -- Open Source Email App for Android
- [AdAway](https://github.com/AdAway/AdAway) -- a free and open source ad blocker for Android
- [AuroraStore](https://gitlab.com/AuroraOSS/AuroraStore) -- an unofficial FOSS client to Google Play with an elegant design and privacy
- [FDroid](https://github.com/f-droid/fdroidclient) -- Free Software repository system for Android
- [LoliSnatcher](https://github.com/NO-ob/LoliSnatcher_Droid) -- a booru client with support for batch downloading 
- [mpv-android](https://github.com/mpv-android/mpv-android) -- a video player for Android based on libmpv
- [Pix-EzViewer](https://github.com/ultranity/Pix-EzViewer) -- a third-party Pixiv Android client with modern design and many other enhancements

## Database stuff

- [PostgreSQL](https://github.com/postgres/postgres) -- a free and open-source relational database management system (RDBMS) emphasizing extensibility and SQL compliance
- [MariaDB](https://github.com/MariaDB/server) -- a community-developed, commercially supported fork of the MySQL, intended to remain free and open-source software under the GNU General Public License
- [dbeaver](https://github.com/dbeaver/dbeaver) -- free multi-platform database tool for developers, SQL programmers, database administrators and analysts
- [DB Browser for SQLite](https://github.com/sqlitebrowser/sqlitebrowser) -- standalone browser for SQLite databases

## Fonts

- [nerd-fonts](https://github.com/ryanoasis/nerd-fonts) -- a project that patches developer targeted fonts with a high number of glyphs (icons). Personally I prefer using *CaskaydiaMono Nerd Font Mono*, which is based on [Cascadia Code](https://github.com/microsoft/cascadia-code) by microsoft, for my terminal

## AI stuff

I hate any kind of ridiculous censorship, so here's the list of AI-related tools/services I use \w pros and cons

- [ZLUDA](https://github.com/lshqqytiger/ZLUDA) -- CUDA on AMD GPUs 

### LLMs

- [ollama](https://github.com/ollama/ollama) -- lets you run lots of LLMs locally on your PC. Can work even on GPU-less setups, though considerably slower
- [Cognitive Computation models aka Dolphin](https://huggingface.co/cognitivecomputations) -- open-source, free from censorship LLMs by Cognitive Computations group. Also see it's founder's, [Eric Hartford's blog](https://erichartford.com/) for details and some interesting articles

As for cloud alternatives, I'm not aware of any FLOSS services that could provide `dolphin` models, but there are some paywalled ones

### Stable Diffusion

First, it's very important to note, that at current point of time (`SD3 Medium` release) only uncesored (good) base models are `SD1.5` and `SDXL` and their derivatives, so keep that in mind when selecting your model

- [Stability Matrix](https://github.com/LykosAI/StabilityMatrix) -- package manager, made it easier to manage different models, plugins, UIs and virtual environments for stable diffusion instances

For usage tips and overall guidance on how Stable Diffusion works under the hood and why, I recommend reading the articles on [Stable Diffusion Art](https://stable-diffusion-art.com/) website, here are some basic ones:

- [How Stable Diffusion works?](https://stable-diffusion-art.com/how-stable-diffusion-work)
- Inpaint guides: [basics](https://stable-diffusion-art.com/inpainting_basics/), [more specific example](https://stable-diffusion-art.com/change-clothes-ai)
- [Samplers and Schedulers](https://stable-diffusion-art.com/samplers)
- [Basic model selecting guide](https://stable-diffusion-art.com/models)
- Prompting: [basics](https://stable-diffusion-art.com/how-to-come-up-with-good-prompts-for-ai-image-generation/), [fine-tuning](https://stable-diffusion-art.com/fine-tune-your-ai-images-with-these-simple-prompting-techniques), [anime examples](https://docs.google.com/document/d/1NAVTmZXq7xRXKnFMyiAeJ2IyYN5QsgbSEaL7knv_xbs/edit#heading=h.lf3n2mefp672)
- [Embeddings/Textual Inversions](https://stable-diffusion-art.com/embedding/)
- [Hypernetworks](https://stable-diffusion-art.com/hypernetwork/)
- [LORA](https://stable-diffusion-art.com/lora/)
- [LyCORIS](https://stable-diffusion-art.com/lycoris/)
- [VAE](https://stable-diffusion-art.com/how-to-use-vae/)
- [ComfyUI basics](https://stable-diffusion-art.com/comfyui/)

#### UI

- [AUTOMATIC1111's Stable Diffusion WebUI](https://github.com/AUTOMATIC1111/stable-diffusion-webui) -- most popular, easiest to use web UI for Stable Diffusion. Probably also has most number of different plugins
- [Stable Diffusion WebUI Forge](https://github.com/lllyasviel/stable-diffusion-webui-forge) -- fork of A1111's UI, made for compatibility with AMD GPUs and some nice perf improvements
- [SD.Next](https://github.com/vladmandic/automatic) -- so far the only (?) UI that allows running on AMD GPUs with [ZLUDA](https://github.com/vosen/ZLUDA)
- [ComfyUI](https://github.com/comfyanonymous/ComfyUI) -- advanced UI, that offers best performance, but requires some knowledge of how Stable Diffusion works under the hood and learing to use these nodes. Also has a lot of useful extensions, making it capabilities on par with A1111. Has an ability to export/import any run configurations! Also **never** install/update unknown nodes without checking them out. There are already security incedents occured in the past

As for cloud solution, I use [thinkdiffusion](https://www.thinkdiffusion.com/), it's the cheapest one I could found, but still not free. And I highly recommend you to get some learning/practice before you start using it just to not throw away your money

#### Models

I'm not interested in not-anime models, so these are not listed here

Always check the parameters and prompting guide for each and every model/lora/etc you download so you won't get shitty results

**SDXL**

Base `SDXL` models are trained on `1024x1024` resolution images, so you shouldn't generate smaller images if you want something with decent quality and relevance to your prompt. This also means you'll need a better GPU with decent amount of VRAM

Basic parameters for running `SDXL1.0` models are: `Steps: 20-30`, `Sampler: DPM++ 2M SDE`, `Schedule type: Karras`, `CFG Scale: 6-7`
Note, that `SDXL Lightning`/`Turbo` models need different running parameters, usually something like this: `Steps: 6-8`, `Sampler: DPM++ SDE`, `Schedule type: Karras`, `CFG Scale: 2-4`

- [Kohaku-XL Epsilon](https://civitai.com/models/399873) and other models by [kblueleaf](https://civitai.com/user/kblueleaf) -- models, trained on large amount of data from danbooru. Optimal parameters: `Clip Skip: 1`
- [Animagine XL](https://civitai.com/models/260267) -- analogue of `Kohaku-XL`. I personally like it lesser, but it still gives good results too. `Clip skip: 2`, also recommended to use bundled `VAE`
- [Anything XL](https://civitai.com/models/9409) -- mix of data of several great models, including `Kohaku-XL` and `Animagine XL`. Gives very decent results, maybe the best of three. `Clip skip: 2`
- [XL_VAE_C](https://civitai.com/models/152040) -- custom VAE for anime models. Not a requirement
- [NegativeXL](https://civitai.com/models/118418) -- negative embeddings for anime `SDXL` models
- [Useful Quality Embeddings XL](https://civitai.com/models/144327) -- more great negative embeddings for anime SDXL models

**SD1.5**

Probably the only good reason to use `SD1.5` over `SDXL` based models is the availability of some `LORA`/`LyCORIS` only for `SD1.5`, e.g. [Kagamihara Nadeshiko](https://civitai.com/search/models?sortBy=models_v9&query=Kagamihara%20Nadeshiko) `LORA`s are available only for `SD1.5` or `Pony` (can't generate lolis, so it's a no-no).

As for resolution, you use classic `512x512` at least and apply `hires fix` if you need something better

- [Kohaku V5](https://civitai.com/models/220068) -- model, trained on large amount of data from danbooru
- [Anything XL v5](https://civitai.com/models/9409?modelVersionId=30163) -- note, that you should select `V5` to use `SD1.5` and not `SDXL`
- [ClearVAE](https://civitai.com/models/22354) -- custom VAE for anime models. Not a requirement
- [EasyNegative](https://civitai.com/models/7808) -- negative embeddings for anime `SD1.5` models
- [badhandv4](https://civitai.com/models/16993) -- negative embeddings for anime `SD1.5` models, and especially hands
