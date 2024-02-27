# zsh/nano config

Prerequisites:

- zsh
- nano
- [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)
- [powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [exa](https://github.com/ogham/exa)
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
