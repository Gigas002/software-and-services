# dotfiles

This directory contains redistributable bits of my system's configuration files. Some files needs additional tweaking, in case you decided to use it yourself, I'll try to add these notes below.

The overall structure:

- `boot` -> `/boot`
- `dotcargo` -> `~/.cargo`
- `dotconfig` -> `~/.config`
- `dotlocal` -> `~/.local`
- `etc` -> `/etc`
- files in directory root -> `~`

## Requirements

All theming here relies on [sweet packages](https://github.com/Gigas002/awesome-sweet), keep this in mind. You also will need to install `nerd-fonts` for font support: [NotoSans Nerd](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Noto)

Also, some configs specify datetime format, which is `24h` and week start as `monday`. Keep this in mind.

## alacritty

It's not possible to set relative path or `~`/`$HOME` for `env` variables in `alacritty.toml` config file, [wontfix](https://github.com/alacritty/alacritty/issues/7801), so you'll need to change these lines to your user path:

```toml
[env]
ZDOTDIR = "/home/gigas/.config/zsh/"
```

## flameshot

Change your screenshot save location in config:

```ini
savePath=/home/gigas/images/screenshots
```

## hypr

Don't copy this directory if you don't know what you're doing. Compositor config tweaking is important to do on your own

## mpv

Config uses 3rd-party shaders, links are available in `mpv.conf` file

## nano

Relies on `nano-syntax-highlighting-git` package for a proper syntax highlighting

## waybar

Relies on some scripts in `~/.local/bin`, some functionality won't be available without them

## zsh

Prerequisites:

- [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)
- [powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [lsd](https://github.com/lsd-rs/lsd)
- [fzf](https://github.com/junegunn/fzf)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-interactive-cd](https://github.com/mrjohannchang/zsh-interactive-cd)
- [powerline-fonts](https://github.com/powerline/powerline)
- [optional] [awesome-terminal-fonts](https://github.com/gabrielelana/awesome-terminal-fonts)
- [optional] [nerd-fonts](https://github.com/ryanoasis/nerd-fonts)

Notes:

Powerlevel10k and some plugins will probably be included in OMZ:

https://github.com/ohmyzsh/ohmyzsh/issues/11995

For Windows Terminal, as a lightweight alternative a [CascadiaCodePL](https://github.com/microsoft/cascadia-code) powerline font can be used

Run configuration of `p10k` (`.p10k.zsh`):

`source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme`

Check if terminal supports 256 colors:

```sh
for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
```

## baloofilerc

Exclude directories you don't want to be scanned (for a better perf and less mem consumption)

## user-dirs.dirs

Your default directories locations

## Stuff in /etc and /boot

Don't copy if you don't know what you're doing, use these configs only as a reference material for your own configurations. Copying this can break your stuff and you'll have bad time

### grub theme

TODO: try to implement `Sweet` theme for grub

`git clone https://github.com/vinceliuice/grub2-themes`

`sudo ./install.sh -t whitesur -i whitesur -s 1080p -b`
