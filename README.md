# Software and services

*What's this?*

This is a list of software, services and some minor tweaks which I use. I made it in for myself to have a backup for most important things and have a quick startup if something breaks.

List mostly targets arch-based linux distributives, but there are also some windows apps. Most part of list if FLOSS and I treat this as default choice, but there are some proprietary apps just in case/no alternative, I'll mark them correspondingly.

A lot of stuff and recommendations on privacy was taken from [privacyguides](https://www.privacyguides.org/). Also a lot of useful software and tweaks for arch-based distributives listed on [arch wiki page](https://wiki.archlinux.org/title/List_of_applications).

## Legend

! marks ! important info about software platforms or states that software is proprietary

$ marks $ shows if software is not completely free

? marks ? needs clarification

TODO: TOC

## OS

- [Manjaro](https://manjaro.org/download/) -- easy to start and use arch distributive
- [Kubuntu](https://kubuntu.org/getkubuntu/) -- in case you prefer debians
- !PROPRIETARY! $PAID$ [Windows](https://www.microsoft.com/en-us/software-download/windows11) -- familiar system for everyone. Requires some tweaks, read below
- [Qubes](https://www.qubes-os.org/downloads/)/[Whonix](https://www.whonix.org/wiki/Download) -- if you REALLY need some privacy

### Windows tweaks

The whole section is !WINDOWS! only

- [MediaCreationTool.bat](https://github.com/AveYo/MediaCreationTool.bat) -- lets you create bootable device on/for unsupported win 11 pc
- [Explorer Patcher](https://github.com/valinet/ExplorerPatcher) -- set of tweaks for win 11 to return win 10's behavior
- [Open Shell Menu](https://github.com/Open-Shell/Open-Shell-Menu) -- more minor tweaks for win 7 - win 10. Not sure if win 11 is supported, but project seems a bit abandoned, since the last commit was in june
- [WindowsSpyBlocker](https://github.com/crazy-max/WindowsSpyBlocker) -- disables telemetry and some services
- !PROPRIETARY! [O&O ShutUp10++](https://www.oo-software.com/en/shutup10) -- portable, free to use app to block lots of tracking stuff and services in windows. Has a GUI
- !PROPRIETARY! [Sysinternals Suite](https://docs.microsoft.com/en-us/sysinternals/downloads/sysinternals-suite) -- set of semi-official tools for windows. It's very useful and I highly recommend it

## Routers firmware

Read [this article](https://www.privacyguides.org/operating-systems/#firmware). I don't use custom firmware because my router isn't supported by these systems yet. If you're lucky to have one of these and you're a proton user, you can configure your router to force all connections through ProtonVPN, see detailed guide [here](https://protonvpn.com/support/installing-protonvpn-on-a-router/).

## Create boot device

- [bootiso](https://github.com/jsamr/bootiso) -- linux only, CLI
- [rufus](https://github.com/pbatard/rufus) -- windows only, GUI

## Internet browsers

**Desktop**

- [Mozilla Firefox](https://www.mozilla.org/en-US/firefox/new/) -- preinstalled browser on most linux distibutives
- Tor Browser [arch](https://aur.archlinux.org/packages/tor-browser/)/[win](https://www.torproject.org/) -- not for everyday use
- [Ungoogled chromium](https://github.com/Eloston/ungoogled-chromium#downloads) -- if you for some reason need another browser, though I'd recommend you to use Firefox's containers feature

**iOS**

- [Mozilla Firefox](https://www.mozilla.org/en-US/firefox/new/) -- official rewrite of firefox for iOS devices. Doesn't support all features of original browser because of apple's shit in mind
- [Onion browser](https://github.com/onionbrowser/onionbrowser) -- TorBrowser for iOS

### Firefox addons

Since I only use firefox as my browser, tools listed here fits only it's ecosystem, but I'm sure there are alternatives for chromium family.

Main extensions:

- [DuckDuckGo Privacy Essentials](https://github.com/duckduckgo/duckduckgo-privacy-extension) -- enables DuckDuckGo search in address bar by default, blocks some trackers and stuff
- [ff2mpv](https://github.com/woodruffw/ff2mpv) -- adds an ability to play any browser video through mpv. Read more in **media players** section below. There's also ready [AUR package](https://aur.archlinux.org/packages/ff2mpv-native-messaging-host-git/) for this
- [Maximize all windows](https://github.com/ericchase/maximize-all-windows) -- useful when using arkenox's user.js, read more below
- [Plasma Integration](https://invent.kde.org/plasma/plasma-browser-integration) -- if you're using KDE desktop; usually KDE suggests it itself
- [Skip redirect](https://github.com/sblask/webextension-skip-redirect) -- as the title says - blocks some annoiying redirects
- [Stylus](https://github.com/openstyles/stylus/) -- style manager. [Here's](https://uso.kkx.one/) open source style archive
- [Tabliss](https://github.com/joelshepherd/tabliss) -- lets you configure your "new tab" page
- [uBlock](https://github.com/gorhill/uBlock) -- ad/malware blocker
- [Privacy Redirects](https://github.com/SimonBrazell/privacy-redirect) -- redirects your queries to normal services (e.g. youtube links opens in FreeTube)

Plus some advices from [arkenfox's wiki](https://github.com/arkenfox/user.js/wiki/4.1-Extensions):

- Don't use **HTTPS Everywhere**, it will be deprecated soon. Just enable HTTPS-only mode in your browser settings
- Don't use NoScript, Ghostery, Disconnect, Privacy Badger, etc -- redundant with uBlock Origin; easily detected; practically abandonware
- Instead of url-shorteners use [Actually Legitimate URL Shortener Tool](https://github.com/DandelionSprout/adfilt/blob/master/LegitimateURLShortener.txt) for uBlock (with `AdGuard URL Tracking Protection`)
- Don't use [Firefox containers](https://github.com/mozilla/multi-account-containers) add-on, it's prebuilt in firefox already, just enable it. Containers are used for multiple accounts in one browser instance

Additional/situative extensions and recommendations:

- [ClearURLs](https://gitlab.com/KevinRoebert/ClearUrls) is actually still better sometimes, but not in all cases
- $FREEMIUM$ [Bitwarden](https://github.com/bitwarden) -- awesome open source password manager with browsers extensions and standalone apps for modern operating systems, including iOS. Slowly migrating here from firefox account...
- [cookies.txt](https://github.com/lennonhill/cookies-txt) -- lets you save your cookies into `.txt` file
- $FREEMIUM$ [Firefox relay](https://github.com/mozilla/fx-private-relay) -- not tested this one yet, but looks interesting; TODO: test and add info
- [Greasemonkey](https://github.com/greasemonkey/greasemonkey) -- open source analogue of tampermonkey and other "monkeys"
- [Terms of Service; Didn’t Read](https://github.com/tosdr/browser-extensions) -- short version of main points in terms of service
- [xBrowserSync](https://github.com/xbrowsersync/api) -- sync browser data securely

Not an addon, but browser service: [pdf-editor](https://github.com/ShizukuIchi/pdf-editor).

### Firefox tweaks

I'm using user.js from this repo in my firefox's everyday life. If you want to see, on which it was based see [arkenfox's user.js](https://github.com/arkenfox/user.js). Don't miss the wiki there, there are plenty of good advices on how to configure your firefox for more privacy.
Plus, I recommend enable DNS over HTTPS in browser/device/router connection settings. Read more in **Networking -> DNS** section below.

User.js is usually located in: `~/.mozilla/firefox/profile-id/`, look at `about:profiles` for exact paths. I mark my changes between arkenfox's one with `// GIGAS` comment and short explanation.

## Networking

### DNS

**Desktop**

Encrypt your DNS queries with *DNS over HTTPS*, *DNS over TLS*, *DNSCrypt* and more. This section mostly refers to corresponding [privacyguides page](https://www.privacyguides.org/providers/dns/).

First, select your DNS provider from the link above. I personally prefer [AdGuard DNS](https://github.com/AdguardTeam/AdGuardDNS/) over Cloudflare since these are open source, support of DoH, DoT, DNSCrypt and it's fast, though keep some logs for 24 hours. As an alternative I use [BlahDNS](https://github.com/ookangzheng/blahdns/) which is said to "not collect any logs", but it's speed is slower, so it's on the second place in priority. Plus, you can enable **DNS over HTTPS** in firefox settings (which is redundant if you've set it up on router level).

**iOS**

I suggest using [DNSCloak](https://github.com/s-s/dnscloak), which is a GUI and wrapper for *dnscrypt-proxy 2*.

### VPN

- $FREEMIUM$ [ProtonVPN](https://protonvpn.com/) -- while it's free plan is not very good, it's paid plans are a good choice. ProtonVPN supports *Secure Core*, *Netshield* and *Kill Switch* on most platofrms. Plus, it has a solid ecosystem, which I'll mention in below sections.

### Anti-virus stuff

It's not recommended to enable scan of downloads for viruses in browser, since it uses google services, but I'd prefer not to have viruses, so I turn it on. Here's mozilla explanation on [how it works](https://support.mozilla.org/en-US/kb/how-does-phishing-and-malware-protection-work).

- [ClamAV](https://github.com/clamwin/clamav) -- open source, CLI, scanning antivirus for Windows/Linux
- !LINUX! [ClamTK](https://github.com/dave-theunsub/clamtk) -- GUI for ClamAV, works only on Linux
- !LINUX! [gufw](https://github.com/costales/gufw) -- firewall for linux systems, which is a GUI for [ufw](https://wiki.archlinux.org/title/Uncomplicated_Firewall)
- !PROPRIETARY! !WINDOWS! Windows defender and firewall (*WIN10+*) -- handles most cases pretty good without any need of additional software

## Email software and providers

Read more about [providers](https://www.privacyguides.org/providers/email/) and [software](https://www.privacyguides.org/software/email/) choice.

**Providers**

- $FREEMIUM$ [ProtonMail](https://github.com/ProtonMail) -- can't say I recommend it's free plan, since it doesn't allow you to do lots of things, but paid plans are awesome. *Plus* plan lets you use [new ProtonDrive service](https://protonmail.com/blog/proton-drive-early-access/), more info about it in **File sync and share** section below
- [Disroot](https://disroot.org/en/services/email) -- free alternative for ProtonMail

**Desktop software**

- [Thunderbird](https://www.thunderbird.net/en-US/) -- supports most email providers. To connect *ProtonMail* with it you should use [ProtonBridge](https://github.com/ProtonMail/proton-bridge) app and have paid plan

**iOS**

Well, here comes nothing.

- [ProtonMail](https://github.com/ProtonMail/ios-mail) -- nice choice, but works only for proton's mail, not other providers
- !PROPRIETARY! ?PAID? [CanaryMail](https://canarymail.io/) -- privacyguides says it's a paid service, but at the moment *20.11.2021* it seems to become free for personal use. I'll update the section when I'll be able to check the app out

## Password Managers and 2FA

- $FREEMIUM$ [Bitwarden](https://github.com/bitwarden) -- awesome open source password manager with browsers extensions and standalone apps for modern operating systems, including iOS. Has 2FA and other good stuff on paid plans, compare [here](https://bitwarden.com/pricing/). Slowly migrating from firefox account...

## File sync and share

Read more [on privacyguides](https://www.privacyguides.org/software/file-sharing/).

- ?PROPRIETARY? $PAID$ [ProtonDrive](https://protonmail.com/blog/proton-drive-early-access/) -- early beta version of file sync service by proton team. Available only for paid (*plus and higher, not basic-paid*) plans. Currently [closed source](https://github.com/ProtonMail/proton-drive/issues/11) (*temporarily?*). No desktop/mobile apps yet either
- [OnionShare](https://github.com/onionshare/onionshare) -- share files and chat with friends using tor network. Desktop only
- [Git](https://git-scm.com/downloads) -- do I really need to explain what git is
- !WINDOWS! [AltStore/AltServer](https://github.com/rileytestut/AltStore) -- gives you an opportunity to install apps not from AppStore
- !PROPRIETARY! !WINDOWS! [iTunes/iCloud](https://support.apple.com/en-us/HT210384) -- unfortunately it's a needed dependency for `AltServer` to work

## Search engines

Read more [on privacyguides](https://www.privacyguides.org/providers/search-engines/).

- [DuckDuckGo](https://github.com/duckduckgo) -- default choice on TorBrowser, supports onion services. Partly proprietary
- [Searx](https://github.com/searx/searx) -- alternative for DuckDuckGo. Completely open source and not located in US. Disroot's default search engine. You can select your instance [here](https://searx.space/)

## Social networks and communication

If you need an alternative for services like twitter/facebook/etc, check out [this article on privacyguides](https://www.privacyguides.org/providers/social-networks/). Here I'll mainly cover some alternative frontends for these mainstream services, not introducing completely new and already good ones.

- [Nitter](https://github.com/zedeus/nitter) -- alternative twitter frontend, focused on privacy. It's still in early beta, so there's not much features released
- [Pawoo](https://github.com/CrossGate-Pawoo/mastodon) -- alternative TO twitter for japanese artists and users, developed by pixiv stuff. Fork of [mastodon](https://github.com/mastodon/mastodon)
- [FreeTube](https://github.com/FreeTubeApp/FreeTube) -- desktop YouTube player built with privacy in mind. Pros: no ads, supports external players, lets you download videos on their pages, export/import your YouTube data easily, doesn't spy on you. Cons: desktop only, lacks playlists support, FUCKING ELECTRON
- !iOS! [EhPanda](https://github.com/tatsuz0u/EhPanda) -- only one good open source app for sad panda on iOS. Installable through `AltServer`

### Messengers

Read more about instant messengers on [privacyguides](https://www.privacyguides.org/software/real-time-communication/)

- !PROPRIETARY! [Telegram](https://github.com/telegramdesktop/tdesktop) -- only app is open source, it lacks encryption by default and has many other problems. But still it's a lightweight client, that smoothly run on every system and even with bad internet connection. It also has a lot of awesome features, that completely open source alternatives doesn't
- [Element](https://github.com/vector-im) -- good replacement for telegram/discord for future. Now lacks lots of features and feels very slow at all tasks

**Discord alternatives**

Discord is shit as is and I would recommend you never use it because it's app VERY slow, has lots of bugs and I personally don't love discord policies. Third-party apps can fix first problems, but last one is in discord itself. Anyway, here's a short list

- [Abaddon](https://github.com/uowuo/abaddon) -- young replacement of discord app on c++ without electron. In very early state, but can be good in future, developer seems really passionate about his program
- !LINUX! [Gtkcord3](https://github.com/diamondburned/gtkcord3) -- discord client on golang. As developer stated, `gtkcord3 won't be receiving any new features`, so I don't think there's a point in using this
- [Fosscord](https://github.com/fosscord/fosscord) -- free open source selfhostable discord compatible communication platform. Looks like an awesome replacement for original discord. It's [client](https://github.com/fosscord/fosscord-client) uses react-native instead of electron
- !WINDOWS! [Unicord](https://github.com/UnicordDev/Unicord) -- UWP client, more feature-complete, than abaddon or gtkcord3, but developes very slow and win-only

## Self-Contained Networks

TODO: explain these and add sources:

tor, i2p, retroshare, https://www.privacyguides.org/software/networks/

## File Encryption Software

TODO: explain these and add sources:

VeraCrypt, https://www.privacyguides.org/software/productivity/#encrypt

## Media stuff

### Image stuff

- [qimgv](https://github.com/easymodo/qimgv) -- awesome lightweight image viewer on c++. Even supports playing videos through `mpv`. I've also created a [fork for arch users](https://aur.archlinux.org/packages/qimgv-qt6-kde-git/), which enables qt6 compilation and KDE support for cmake args. Build script is located here, in `/qimgv-qt6-kde` directory
- !WINDOWS! [ImageGlass](https://github.com/d2phap/ImageGlass) -- good alternative for windows, if you didn't like qimgv. Written on c# with .net framework, .net5+ support planned
- [libvips](https://github.com/libvips/libvips) -- insane fast image processing library on c. Supports huge amount of formats and ImageMagick as plugin
- [ImageMagick](https://github.com/ImageMagick/ImageMagick) -- alternative to libvips, slower on benchmarks but still usable for some tasks
- [pngquant](https://github.com/kornelski/pngquant) -- lossy image-compression command line tool
- !WINDOWS! [AntiDupl](https://github.com/ermig1979/AntiDupl) -- app to scan and remove duplicated images. Based on simd library on c++
- [DigiKam](https://invent.kde.org/graphics/digikam) -- photo management application. IMO handles duplicate-finding worse, than AntiDupl, but has a lot of other features

### Video stuff

- [mpv](https://github.com/mpv-player/mpv) -- IMO best video player nowadays. Supported by a lot of plugins and programs like `ff2mpv`, `freetube`, `qimgv` and more. Has an ability to run sripts. My configs are included in this repo (based on [eXmendiC guide](https://iamscum.wordpress.com/guides/videoplayback-guide/mpv-conf/)). These configs also contains links to the shaders I like
- [vlc](https://github.com/videolan/vlc) -- alternative for mpv. The only good player on iOS (since there is no free mpv players available)
- !WINDOWS! [K-Lite Codec Pack with MPC-HC](https://www.codecguide.com/download_kl.htm) -- collection of DirectShow filters, codecs, and tools. Handles HDR video with MadVR pretty good, comparing to VLC. Need to compare with mpv though
- [ruffle](https://github.com/ruffle-rs/ruffle) -- flash player emulator on rust
- [ffmpeg](https://github.com/FFmpeg/FFmpeg) -- cross-platform solution to record, convert and stream audio and video; CLI

### Editors

- [krita](https://github.com/KDE/krita) -- analogue of photoshop, IMO better than GIMP
- [GIMP](https://github.com/GNOME/gimp) -- analogue of photoshop. While I think it's worse, than krita, I still think it's a good software choice
- [kdenlive](https://github.com/KDE/kdenlive) -- free and open source video editing application

## Games

TODO: explain these and add sources:

open source games list, Cheat Engine, emulators wiki, lutris, steam, proton, wine, protontricks, winetricks, protondb

## Downloaders

- [yt-dlp](https://github.com/yt-dlp/yt-dlp) -- fork of abandoned [youtube-dl](https://github.com/blackjack4494/yt-dlc) for downloading videos (*not only youtube supported*); CLI
- [Open Video Downloader](https://github.com/jely2002/youtube-dl-gui) -- youtube-dl (*actually yt-dlp*) GUI for Windows

TODO: explain these and add sources:

qbittorrent, pixivutil2, fantiadl, hitomi downloader, imgbrd-grabber, vkopt, doujindownloader, curl

## Package managers

TODO: explain these and add sources:

yay, windows package manager?, appimagelauncher, snap, flatpak

## Virtualization

TODO: explain these and add sources:

virtualbox

## Terminals

While bash/zsh on linux works good on it's own, there are alternatives for windows. As KDE user I prefer *konsole* + *zsh*. Only advice to arch users is to uncomment `Color` string in your `/etc/pacman.conf`. Seriously.

- [PowerShell Core aka pwsh](https://github.com/powershell/powershell) -- modern rewrite of windows's proprietary powershell. Works on windows/linux/mac. Be aware, that some commands require you to run pwsh as administrator on windows or even doesn't work in a new version
- !WINDOWS! [Windows Terminal](https://github.com/Microsoft/Terminal) -- terminal for windows system. Supports WSL, git bash, etc and is actually good.

## Text editors and development

TODO: explain these and add sources:

vscodium, notepad++

## Screenshots and screen recording

TODO: explain these and add sources:

Flameshot, OBS, ShareX

## Cleaners

TODO: explain these and add sources:

ccleaner, bleachbit, stacer

## Office software

TODO: explain these and add sources:

libreoffice, onlyoffice

## Archivators

TODO: explain these and add sources:

7z, ark

## Translators

TODO: explain these and add sources:

libretranslate

## Maps

TODO: explain these and add sources:

OpenStreeetMaps

## Themes

TODO: explain these and add sources:

kvantum

## File browsers

TODO: explain these and add sources:

Files (win), dolphin, totalcmd, DB Browser for sqlite

## Driver installers

TODO: explain these and add sources:

Snappy Driver Installer (win)
