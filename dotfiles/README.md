# dotfiles

This directory contains redistributable bits of my system's configuration files. Some files need additional tweaking; notes for those are below.

The overall structure mirrors the filesystem:

- `boot/` -> `/boot`
- `etc/` -> `/etc`
- `HOME/` -> `~/`
  - `dotcargo/` -> `~/.cargo`
  - `dotconfig/` -> `~/.config`
  - `dotlocal/` -> `~/.local`
  - `dotmozilla/` -> `~/.mozilla`
- `usr/` -> `/usr`

Configs that are no longer actively used are kept under `HOME/dotconfig/legacy/`.

## Requirements

All theming here relies on [sweet packages](https://github.com/Gigas002/awesome-sweet). You will also need `nerd-fonts` for font support: [NotoSans Nerd](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Noto), [CaskaydiaCove](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/CascadiaCode).

Some configs specify datetime format as `24h` with week start on `monday`.

## hypr

Don't copy this directory without understanding what you're doing. Compositor config tweaking needs to be done for your own hardware.

## mpv

Config references 3rd-party shaders (commented out by default). Links are in `mpv.conf`. The Windows-specific config (`mpv-windows.conf`) contains absolute `C:\Users\gigas\...` paths — update these if reusing it.

## nushell

Requires generating plugin init scripts before use. See `HOME/dotconfig/nushell/README.md` for full setup instructions (starship, atuin, carapace).

## baloofilerc

Excludes directories from KDE's Baloo file indexer for performance. Adjust excluded paths to match your layout.

## user-dirs.dirs

Defines default XDG directory locations. Update paths to match your home directory structure.

## etc/profile

Contains a hardcoded `PATH` entry:

```sh
export PATH=/home/gigas/.local/bin:$PATH
```

Change this to your username or replace with `$HOME/.local/bin`.

## Stuff in /etc and /boot

Don't copy these directly — use them only as reference for your own configuration. Copying blindly can break your system.

The boot config uses `systemd-boot`. See `boot/README.md` for kernel parameters and `sdboot-manage` usage.
