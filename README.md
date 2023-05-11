# Software and services

*What's this?*

This is a list of software, services and some minor tweaks which I use. I made it for myself to have a backup for most important things and have a quick startup if something breaks.

List mostly targets arch-based linux distributives, but there are also some windows apps. Most part of list is FLOSS and I treat this as default choice, but there are some proprietary apps just in case/no alternative, I'll mark them correspondingly. If you're more into iOS platform, than desktop, [here's](https://github.com/dkhamsing/open-source-ios-apps) more preferrable list of open source software for you. And an analogue for android users [here](https://github.com/pcqpcq/open-source-android-apps).

A lot of stuff and recommendations on privacy was taken from [privacyguides](https://www.privacyguides.org/). Also a lot of useful software and tweaks for arch-based distributives listed on [arch wiki page](https://wiki.archlinux.org/title/List_of_applications).

## Legend

! marks ! important info about software platforms or states that software is proprietary

$ marks $ shows if software is not completely free

? marks ? needs clarification

## TOC

- [Software and services](#software-and-services)
  * [Legend](#legend)
  * [TOC](#toc)
  * [OS](#os)
    + [Windows tweaks](#windows-tweaks)
  * [Routers firmware](#routers-firmware)
  * [Create boot device](#create-boot-device)
  * [Internet browsers](#internet-browsers)
    + [Firefox addons](#firefox-addons)
    + [Firefox tweaks](#firefox-tweaks)
  * [Networking](#networking)
    + [DNS](#dns)
    + [VPN](#vpn)
    + [Anti-virus stuff](#anti-virus-stuff)
  * [Email software and providers](#email-software-and-providers)
  * [Password Managers and 2FA](#password-managers-and-2fa)
  * [File sync and share](#file-sync-and-share)
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
  * [Screenshots and screen recording](#screenshots-and-screen-recording)
  * [Cleaners](#cleaners)
  * [Office software](#office-software)
  * [Archivers](#archivers)
  * [Theme engines](#theme-engines)
  * [File browsers](#file-browsers)
  * [Driver installers](#driver-installers)

## OS

This section will cover the OSes I've used or use now

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

## Linux tweaks

The whole section is !LINUX! only

- [optimus-manager](https://github.com/Askannz/optimus-manager) -- a program, that provides a solution for GPU switching on Optimus laptops (i.e laptops with a dual Nvidia/Intel or Nvidia/AMD configuration). [Has](https://github.com/Shatur/optimus-manager-qt) an unofficial gui on Qt
- [pipewire](https://github.com/PipeWire/pipewire) -- PipeWire is a server and user space API to deal with multimedia pipelines. If you're planning on replacing `pulseaudio` with `pipewire`, you should also use `pipewire-pulse` packages. On manjaro it's recommended to use `manjaro-pipewire` meta package. It's also recommended to use `manjaro-bluetooth` meta package, if you're using bluetooth audio devices

## Routers firmware

Read [this article](https://www.privacyguides.org/router/). I don't use custom firmware because my router isn't supported by these systems yet. If you're lucky to have one of these and you're a proton user, you can configure your router to force all connections through ProtonVPN, see detailed guide [here](https://protonvpn.com/support/installing-protonvpn-on-a-router/).

## Create boot device

- [bootiso](https://github.com/jsamr/bootiso) -- linux only, CLI
- [rufus](https://github.com/pbatard/rufus) -- windows only, GUI

## Internet browsers

**Desktop**

- [Mozilla Firefox](https://ftp.mozilla.org/pub/firefox/releases/) -- preinstalled browser on most linux distibutives
- Tor Browser [arch](https://aur.archlinux.org/packages/tor-browser/)/[win](https://www.torproject.org/) -- not for everyday use. Also keep in mind, that there's a rust fork, named [Arti](https://gitlab.torproject.org/tpo/core/arti), that will replace current C tor implementation. Rust [crate's page](https://docs.rs/arti/latest/arti/#using-arti-with-tor-browser) describes a way to use it with tor right now, but keep in mind that's an early beta
- [Brave](https://github.com/brave/brave-browser) -- if you for some reason need chromium browser, recommended by [privacyguides](https://www.privacyguides.org/browsers/#brave)
- [thorium](https://github.com/Alex313031/thorium) -- chromium fork with various nice patches, especially for linux
- [carbonyl](https://github.com/fathyb/carbonyl) -- chromium-based browser built to run in a terminal. Just for fun. I find it a better soultion, than [browsh](https://github.com/browsh-org/browsh)

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
- [Libredirect](https://github.com/libredirect/libredirect) -- redirects your queries to normal services (e.g. youtube links opens in Invidious)
- [control-panel-for-twitter](https://github.com/insin/control-panel-for-twitter) -- gives you more control over your Twitter timeline and adds missing features and UI improvements

Plus some advices from [arkenfox's wiki](https://github.com/arkenfox/user.js/wiki/4.1-Extensions):

- Don't use **HTTPS Everywhere**, it will be deprecated soon. Just enable HTTPS-only mode in your browser settings
- Don't use NoScript, Ghostery, Disconnect, Privacy Badger, etc -- redundant with uBlock Origin; easily detected; practically abandonware
- Instead of url-shorteners use [Actually Legitimate URL Shortener Tool](https://github.com/DandelionSprout/adfilt/blob/master/LegitimateURLShortener.txt) for uBlock (with `AdGuard URL Tracking Protection`). Be sure to add it in `Filter list`, not in `My filters` page
- Don't use [Firefox containers](https://github.com/mozilla/multi-account-containers) add-on, it's prebuilt in firefox already, just enable it. Containers are used for multiple accounts in one browser instance

Additional/situative extensions and recommendations:

- $FREEMIUM$ [Bitwarden](https://github.com/bitwarden) -- awesome open source password manager with browsers extensions and standalone apps for modern operating systems, including iOS. Slowly migrating here from firefox account...
- [cookies.txt](https://github.com/lennonhill/cookies-txt) -- lets you save your cookies into `.txt` file
- $FREEMIUM$ [Firefox relay](https://github.com/mozilla/fx-private-relay) -- not tested this one yet, but looks interesting; TODO: test and add info
- [ViolentMonkey](https://github.com/violentmonkey/violentmonkey) -- provides userscripts support for browsers. It works on browsers with WebExtensions support. Seems more "alive", than [GreaseMonkey](https://github.com/greasemonkey/greasemonkey)
- [Terms of Service; Didn’t Read](https://github.com/tosdr/browser-extensions) -- short version of main points in terms of service
- [xBrowserSync](https://github.com/xbrowsersync/api) -- sync browser data securely

### Firefox tweaks

I'm using user.js from this repo in my firefox's everyday life. If you want to see, on which it was based see [arkenfox's user.js](https://github.com/arkenfox/user.js). Don't miss the wiki there, there are plenty of good advices on how to configure your firefox for more privacy. **And don't just blindly apply that user.js if you're not sure, that will purge all your cookies, etc!**
Plus, I recommend enable DNS over HTTPS in browser/device/router connection settings. Read more in **Networking -> DNS** section below.

User.js is usually located in: `~/.mozilla/firefox/profile-id/`, look at `about:profiles` for exact paths. I mark my changes between arkenfox's one with `// GIGAS` comment and short explanation.

## Networking

### DNS

**Desktop**

Encrypt your DNS queries with *DNS over HTTPS*, *DNS over TLS*, *DNSCrypt* and more. This section mostly refers to corresponding [privacyguides page](https://www.privacyguides.org/dns/).

First, select your DNS provider from the link above. I personally prefer [AdGuard DNS](https://github.com/AdguardTeam/AdGuardDNS/) over Cloudflare since these are open source, support of DoH, DoT, DNSCrypt and it's fast, though keep some logs for 24 hours. As an alternative I use [BlahDNS](https://github.com/ookangzheng/blahdns/) which is said to "not collect any logs", but it's speed is slower, so it's on the second place in priority. Plus, you can enable **DNS over HTTPS** in firefox settings (which is redundant if you've set it up on router level).

**iOS**

I suggest using [DNSCloak](https://github.com/s-s/dnscloak), which is a GUI and wrapper for *dnscrypt-proxy 2*.

### VPN

- $FREEMIUM$ [ProtonVPN](https://github.com/ProtonVPN) -- while it's free plan is not very good, it's paid plans are a good choice. ProtonVPN supports *Secure Core*, *Netshield* and *Kill Switch* on most platofrms. Plus, it has a solid ecosystem, which I'll mention in below sections.

### Anti-virus stuff

It's not recommended to enable scan of downloads for viruses in browser, since it uses google services, but I'd prefer not to have viruses, so I turn it on. Here's mozilla explanation on [how it works](https://support.mozilla.org/en-US/kb/how-does-phishing-and-malware-protection-work).

- [ClamAV](https://github.com/Cisco-Talos/clamav) -- open source, CLI, scanning antivirus for Windows/Linux
- !LINUX! [ClamTK](https://github.com/dave-theunsub/clamtk) -- GUI for ClamAV, works only on Linux
- !LINUX! [gufw](https://github.com/costales/gufw) -- firewall for linux systems, which is a GUI for [ufw](https://wiki.archlinux.org/title/Uncomplicated_Firewall)
- !PROPRIETARY! !WINDOWS! Windows defender and firewall (*WIN10+*) -- handles most cases pretty good without any need of additional software

## Email software and providers

Read more about [providers](https://www.privacyguides.org/email/) and [software](https://www.privacyguides.org/email-clients) choice.

**Providers**

- $FREEMIUM$ [ProtonMail](https://github.com/ProtonMail) -- can't say I recommend it's free plan, since it doesn't allow you to do lots of things, but paid plans are awesome

**Desktop software**

- [Thunderbird](https://www.thunderbird.net/en-US/) -- supports most email providers. To connect *ProtonMail* with it you should use [ProtonBridge](https://github.com/ProtonMail/proton-bridge) app and have paid plan

**iOS**

Well, here comes nothing.

- [ProtonMail](https://github.com/ProtonMail/ios-mail) -- nice choice, but works only for proton's mail, not other providers
- !PROPRIETARY! ?PAID? [CanaryMail](https://canarymail.io/) -- privacyguides says it's a paid service, but at the moment *20.11.2021* it seems to become free for personal use. I'll update the section when I'll be able to check the app out

## Password Managers and 2FA

- $FREEMIUM$ [Bitwarden](https://github.com/bitwarden) -- awesome open source password manager with browsers extensions and standalone apps for modern operating systems, including iOS. Has 2FA and other good stuff on paid plans, compare [here](https://bitwarden.com/pricing/). Slowly migrating from firefox account...
- !iOS! [Raivo OTP](https://github.com/raivo-otp/ios-application) -- A native, lightweight and secure one-time-password solution

## File sync and share

Read more [on privacyguides](https://www.privacyguides.org/file-sharing/).

- $FREEMIUM$ [ProtonDrive](https://github.com/ProtonMail/WebClients) -- E2EE general file storage service. Available on iOS and Android as apps, through browser on desktop
- [OnionShare](https://github.com/onionshare/onionshare) -- share files and chat with friends using tor network. Desktop only
- [Syncthing](https://github.com/syncthing/syncthing) -- open source file synchronization tool
- [Git](https://git-scm.com/downloads) -- do I really need to explain what git is
- !WINDOWS! [AltStore/AltServer](https://github.com/rileytestut/AltStore) -- gives you an opportunity to install apps not from AppStore. Has an [unofficial app](https://github.com/powenn/AltServer-Linux-ShellScript) for linux, but that one didn't worked out for me yet
- !PROPRIETARY! !WINDOWS! [iTunes/iCloud](https://support.apple.com/en-us/HT210384) -- unfortunately it's a needed dependency for `AltServer` to work
- [rustdesk](https://github.com/rustdesk/rustdesk) -- open source virtual/remote desktop infrastructure for everyone! The open source TeamViewer/AnyDesk alternative

## Search engines

Read more [on privacyguides](https://www.privacyguides.org/search-engines/).

- [DuckDuckGo](https://github.com/duckduckgo) -- default choice on TorBrowser, supports onion services. Partly proprietary
- [Searx](https://github.com/searx/searx) -- alternative for DuckDuckGo. Completely open source and not located in US. Disroot's default search engine. You can select your instance [here](https://searx.space/)

## Social networks and communication

Here I'll mainly cover some alternative frontends for these mainstream services, not introducing completely new and already good ones.

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
- [vkopt](https://github.com/VkOpt/VkOpt) -- if you're still using vk (**you shouldn't!**) that's a good script for greasemonkey to download all your music/video/etc and leave from vk forever
- [PeerTube](https://github.com/Chocobozzz/PeerTube) -- decentralized and federated video platform developed as an alternative to other platforms that centralize our data and attention, such as YouTube, Dailymotion or Vimeo
- !iOS! [Yattee](https://github.com/yattee/yattee) -- Alternative YouTube frontend for iOS (iPhone, iPad), macOS and tvOS (Apple TV) built with Invidious and Piped. Available through testflight
- [EH-Page-Scrobbler](https://github.com/Meldo-Megimi/EH-Page-Scrobbler) -- browser script to return pages on sadpanda website
- [danbooru](https://github.com/danbooru/danbooru) -- taggable image board written in Rails


### Messengers

Read more about instant messengers on [privacyguides](https://www.privacyguides.org/real-time-communication/)

- !PROPRIETARY! [Telegram](https://github.com/telegramdesktop/tdesktop) -- only app is open source, it lacks encryption by default and has many other problems. But still it's a lightweight client, that smoothly run on every system and even with bad internet connection. It also has a lot of awesome features, that completely open source alternatives doesn't
- [Element](https://github.com/vector-im) -- good replacement for telegram/discord for future. Now lacks lots of features and feels very slow at all tasks
- [Session](https://github.com/oxen-io/session-desktop) -- Session Desktop - Onion routing based messenger. Fork of [Signal](https://github.com/signalapp/Signal-Desktop). that doesn't require any personal data for registration

**Discord alternatives and tweaks**

Discord is shit as is and I would recommend you never use it because it's app VERY slow, has lots of bugs and I personally don't love discord policies. Third-party apps can fix first problems, but last one is in discord itself. Anyway, here's a short list

- [discordo](https://github.com/ayn2op/discordo) -- a lightweight, secure, and feature-rich Discord terminal client 
- [Abaddon](https://github.com/uowuo/abaddon) -- young replacement of discord app on c++ without electron. In very early state, but can be good in future, developer seems really passionate about his program
- !LINUX! [Gtkcord4](https://github.com/diamondburned/gtkcord4) -- discord client on golang
- [Undiscord](https://github.com/victornpb/deleteDiscordMessages) -- greasemonkey script to remove all your discord history. Theoretically can be the reason to ban you, but hey, I guess that's not a big problem

## Self-Contained Networks

If you - for some reason - want to browse the dark web, than you definetely need to read the page about self-constained networks on [privacyguides](https://www.privacyguides.org/self-contained-networks/). Long story short, you can use onion services, listed in this README (onionshare, tor, etc) or these:

- [i2p](https://github.com/i2p/i2p.i2p) -- tor analogue
- [retroshare](https://github.com/RetroShare/RetroShare) -- onionshare p2p analogue with more complex UI and lots of possibilities

## File Encryption Software

It's very important to have your storages encrypted. Even microsoft's BitLocker is better than nothing. Here's full list of recommendations from [privacygides](https://www.privacyguides.org/encryption/). My choice is following:

- [VeraCrypt](https://github.com/veracrypt/VeraCrypt) -- simple, efficient and secure encryption tool

## Media stuff

### Image stuff

- [qimgv](https://github.com/easymodo/qimgv) -- awesome lightweight image viewer on c++. Even supports playing videos through `mpv`. I've also created a [fork for arch users](https://aur.archlinux.org/packages/qimgv-qt6-kde-git/), which enables qt6 compilation and KDE support for cmake args. Build script is located here, in `/qimgv-qt6-kde` directory
- !WINDOWS! [ImageGlass](https://github.com/d2phap/ImageGlass) -- good alternative for windows, if you didn't like qimgv. Written on c# with .net framework, .net5+ support planned
- [libvips](https://github.com/libvips/libvips) -- insane fast image processing library on c. Supports huge amount of formats and ImageMagick as plugin
- [ImageMagick](https://github.com/ImageMagick/ImageMagick) -- alternative to libvips, slower on benchmarks but still usable for some tasks
- [pngquant](https://github.com/kornelski/pngquant) -- lossy image-compression command line tool
- !WINDOWS! [AntiDupl](https://github.com/ermig1979/AntiDupl) -- app to scan and remove duplicated images. Based on simd library on c++. It's kind of abandoned, so I'd suggest you find an alternative. I [tried](https://github.com/Gigas002/AntiDupl/tree/change_structs) to upgrade program to modern systems -- merged .NET Core 3.1 patch into original repo and developed modernized .NET 5.0+ fork, but when I decided to touch the UI's code (to rewrite it with avalonia) I gave up, since it requires a LOT of time and I just don't have enough passion. Feel free to contribute though
- [DigiKam](https://invent.kde.org/graphics/digikam) -- photo management application. IMO handles duplicate-finding worse, than AntiDupl, but has a lot of other features

### Video stuff

- [mpv](https://github.com/mpv-player/mpv) -- IMO best video player nowadays. Supported by a lot of plugins and programs like `ff2mpv`, `freetube`, `qimgv` and more. Has an ability to run sripts. My configs are included in this repo (based on [eXmendiC guide](https://iamscum.wordpress.com/guides/videoplayback-guide/mpv-conf/)). These configs also contains links to the shaders I like
- [vlc](https://github.com/videolan/vlc) -- alternative for mpv. The only good player on iOS (since there is no free mpv players available)
- !WINDOWS! [K-Lite Codec Pack with MPC-HC](https://www.codecguide.com/download_kl.htm) -- collection of DirectShow filters, codecs, and tools. Handles HDR video with MadVR pretty good, comparing to VLC. Need to compare with mpv though
- [ruffle](https://github.com/ruffle-rs/ruffle) -- flash player emulator on rust
- [ffmpeg](https://github.com/FFmpeg/FFmpeg) -- cross-platform solution to record, convert and stream audio and video; CLI
- [libplacebo](https://github.com/haasn/libplacebo) -- core rendering algorithms and ideas of mpv rewritten as an independent library

### Editors

- [krita](https://github.com/KDE/krita) -- analogue of photoshop, IMO better than GIMP
- [GIMP](https://github.com/GNOME/gimp) -- analogue of photoshop. While I think it's worse, than krita, I still think it's a good software choice
- [kdenlive](https://github.com/KDE/kdenlive) -- free and open source video editing application
- [handbrake](https://github.com/HandBrake/HandBrake) -- open-source video transcoder

## Games

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
- !LINUX! [Wine-Mono](https://github.com/madewokherd/wine-mono) -- package containing Mono and other projects, intended as a replacement for the .NET Framework (4.x and earlier) in Wine. Dependency for a lot of games
- !LINUX! [Proton](https://github.com/ValveSoftware/Proton) -- Valve's fork of wine, that's used in steam
- !LINUX! [Proton-GE/Wine-GE](https://github.com/GloriousEggroll/proton-ge-custom) -- popular fork of **proton** with some additional tweaks. Recommended to trying out, if wine/proton couldn't handle running your game
- !LINUX! [Winetricks](https://github.com/Winetricks/winetricks) -- lets you install a lot of usefull stuff for your wine instance
- !LINUX! [Protontricks](https://github.com/Matoking/protontricks) -- cli of **winetricks** for **proton**
- [ProtonDB](https://www.protondb.com/) -- database of reports of gamers about games being playable with **proton**
- [dxvk](https://github.com/doitsujin/dxvk) -- Vulkan-based implementation of D3D9, D3D10 and D3D11. Can be used on Windows too (and sometimes shows significant performance improvements)
- [dxvk-async](https://github.com/Sporif/dxvk-async) -- async version of dxvk (use it only for single-player games)
- [vkd3d/vkd3d-proton](https://github.com/lutris/vkd3d) -- implementation of Direct3D 12 API on top of Vulkan (link to lutris builds repo)
- [innoextract](https://github.com/dscharrer/innoextract) -- tool to unpack installers created by Inno Setup (e.g. GOG games)
- !LINUX! [mangohud](https://github.com/flightlessmango/MangoHud) -- A Vulkan and OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load and more
- !LINUX! [goverlay](https://github.com/benjamimgois/goverlay) -- GUI settings manager for **mangohud**, [vkBasalt](https://github.com/DadSchoorse/vkBasalt) and [ReplaySorcery](https://github.com/matanui159/ReplaySorcery)
- !LINUX! [gamemode](https://github.com/FeralInteractive/gamemode) -- daemon/lib combo for Linux that allows games to request a set of optimisations be temporarily applied to the host OS and/or a game process
- !LINUX! [steamtinkerlaunch](https://github.com/frostworx/steamtinkerlaunch) --  Linux wrapper tool for use with the Steam client for custom launch options and 3rd party programs

## Downloaders

- [curl](https://github.com/curl/curl) -- first and most important app for this section. I hope I don't even need to explain why and how it can be used
- [yt-dlp](https://github.com/yt-dlp/yt-dlp) -- fork of abandoned [youtube-dl](https://github.com/ytdl-org/youtube-dl) for downloading videos (*not only youtube supported*); CLI
- [Open Video Downloader](https://github.com/jely2002/youtube-dl-gui) -- youtube-dl (*actually yt-dlp*) GUI for Windows
- [qBitTorrent](https://github.com/qbittorrent/qBittorrent) -- simple and fast bittorrent client on qt. Sometimes preinstalled on linux systems
- [gallery-dl](https://github.com/mikf/gallery-dl) -- awesome command-line program to download stuff from a [huge](https://github.com/mikf/gallery-dl/blob/master/docs/supportedsites.md) variaty of websites. Configs are usually located in `~/.config/gallery-dl/config.json` (create one if you don't have any)
- [pixivutil2](https://github.com/Nandaka/PixivUtil2) -- CLI on python to download stuff from pixiv, alternative for gallery-dl for pixiv only (*gallery-dl supports pixiv too*) Supports authentication, pixiv FANBOX, downloading videos (through ffmpeg). Has an AUR package. Config is located in `~/.local/share/PixivUtil2`
- !PROPRIETARY! !WINDOWS! [Hitomi Downloader](https://github.com/KurtBestor/Hitomi-Downloader) -- [partially closed-source](https://github.com/KurtBestor/Hitomi-Downloader/issues/2226) software for downloading galleries, alternative to gallery-dl with GUI. Though it's [mentioned](https://github.com/KurtBestor/Hitomi-Downloader/issues/885) to work on linux with **Wine** I couldn't run it myself
- [DoujinDownloader](https://github.com/Gigas002/DoujinDownloader) -- my own tool to organize doujins repo using `.md` or `.json` files. It's not actually a downloader, since there are a lot of better tools for this, but it's capable of parsing undownloaded list of links into file, that downloaders like **Hitomi Downloader** can handle
- [imgbrd-grabber](https://github.com/Bionus/imgbrd-grabber) -- imageboard/booru downloader with rich GUI and lots of features, including adding your own data sources

## Package managers

- !WINDOWS! [winget](https://github.com/microsoft/winget-cli) -- windows package manager. It's good to have at least something on windows
- !LINUX! [yay](https://github.com/Jguer/yay) -- awesome helper for arch's pacman
- !LINUX! [flatpak](https://github.com/flatpak/flatpak) -- application sandboxing and distribution framework. Better, than `snap`, but I still prefer `yay` or `appimages`
- !LINUX! [snap](https://github.com/snapcore/snapd) -- if you don't have an alternative
- !LINUX! [AppImageLauncher](https://github.com/TheAssassin/AppImageLauncher) -- not a package manager, but an organizer for your AppImages

## Virtualization

I'm not an expert on this question and used only `vmware` and `vbox`

- [Docker](https://www.docker.com/get-started) -- popular CLI containerization application. Has free community edition and paid enterprise, more explanation on this regards [here](https://askinglot.com/is-docker-a-open-source)
- [Virtual Box](https://www.virtualbox.org/wiki/Downloads) -- most basic and simple to use virtualization application
- !WINDOWS! [wslg](https://github.com/microsoft/wslg) -- enable support for running Linux GUI applications (X11 and Wayland) on Windows. Requires win11+ and special drivers (read more on their github page)

## Terminals

While bash/zsh on linux works good on it's own, there are alternatives for windows. As KDE user I prefer *konsole* + *zsh*. Only advice to arch users is to uncomment `Color` string in your `/etc/pacman.conf`. Seriously.

- [PowerShell Core aka pwsh](https://github.com/powershell/powershell) -- modern rewrite of windows's proprietary powershell. Works on windows/linux/mac. Be aware, that some commands require you to run pwsh as administrator on windows or even doesn't work in a new version
- !WINDOWS! [Windows Terminal](https://github.com/Microsoft/Terminal) -- terminal for windows system. Supports WSL, git bash, etc and is actually good.

## Text editors and development

- [vscodium](https://github.com/VSCodium/vscodium) -- VS Code without MS branding/telemetry/licensing
- [notepad++](https://github.com/notepad-plus-plus/notepad-plus-plus) -- fast (hey, it's not a *browser*) and extensible source code editor on C++
- !LINUX! [nano](https://nano-editor.org/) -- I prefer it over `vim` because of tragic incident in childhood, when I was trapped inside of it...

## Screenshots and screen recording

- [flameshot](https://github.com/flameshot-org/flameshot) -- cross-platform screenshoting tool on C++
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

## File browsers

- !LINUX! [Dolphin](https://github.com/KDE/dolphin) -- KDE file manager
- !WINDOWS! [Files](https://github.com/files-community/Files) -- better file explorer for windows 10+
- !WINDOWS! $FREEMIUM$ !PROPRIETARY! [Total Commander](https://www.ghisler.com/) -- customizable file explorer for windows with rich set of features. Free for first 30 days

## Driver installers

- !WINDOWS! [Snappy Driver Installer](https://sdi-tool.org/) -- open source driver installer/updater for windows systems

## SDKs and runtimes

You're probably familiar with this, since you're on github and know what to use and why. But for other users (especially windows ones) some things aren't always clear, e.g. not even everyone knows about openjdk and oracle's java builds. I'll only list basic things here, not mentioning minor stuff for developemtnt, like IDEs, libraries, package managers, etc. Plus, I'm only (mostly) aware about `c++`/`c#` stuff, which advanced developers knows anyways

- [CPython](https://github.com/python/cpython) -- the most popular implementation of python standards. Yes, there are more efficient ones (for some tasks, at leasts), but I'd prefer stability, since a lot of various software bind to this version
- [OpenJDK](https://github.com/openjdk/jdk) -- open source java builds without oracle's shit
- [dotnet](https://github.com/dotnet/sdk) -- official microsoft implementation of .NET language family. Alternative to [mono project](https://github.com/mono/mono) that is an open source of older (closed source) .NET Framework. See [compatibility page](https://www.mono-project.com/docs/about-mono/compatibility/) for more info
- !LINUX! [base-devel](https://archlinux.org/groups/x86_64/base-devel/) -- set of must-have development tools for linux distributives. Can have another name on other (not arch) dists, but still will contain `make`, `sudo`, `gcc` and others
- !WINDOWS! [MSYS2](https://github.com/msys2) -- alternative to above **base-devel** for windows with lots of linux tools, like `mingw`. You can also try [cygwin](https://github.com/cygwin/cygwin) if this didn't work in your case

## Android

- !LINUX! [anbox](https://github.com/anbox/anbox) -- a container-based approach to boot a full Android system on a regular GNU/Linux system
- !LINUX! [waydroid](https://github.com/waydroid/waydroid) -- analogue of **anbox**, uses `wayland`
- !ANDROID! [LineageOS](https://github.com/LineageOS/android) -- a free and open-source operating system for various devices, based on the Android mobile platform
- !ANDROID! [GrapheneOS](https://github.com/GrapheneOS) -- build with security and privacy in mind fork of android. Currently supports only Google Pixel devices
- !ANDROID! [DivestOS](https://github.com/Divested-Mobile/DivestOS-Build) -- a soft-fork of LineageOS. DivestOS inherits many supported devices from LineageOS. It has signed builds, making it possible to have verified boot on some non-Pixel devices

## Database stuff

- [PostgreSQL](https://github.com/postgres/postgres) -- a free and open-source relational database management system (RDBMS) emphasizing extensibility and SQL compliance
- [MariaDB](https://github.com/MariaDB/server) -- a community-developed, commercially supported fork of the MySQL, intended to remain free and open-source software under the GNU General Public License
- [dbeaver](https://github.com/dbeaver/dbeaver) -- free multi-platform database tool for developers, SQL programmers, database administrators and analysts
- [DB Browser for SQLite](https://github.com/sqlitebrowser/sqlitebrowser) -- standalone browser for SQLite databases
