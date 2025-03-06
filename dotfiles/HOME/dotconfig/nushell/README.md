# nushell

Installation of 3rd-party plugins:

```nu
cd ~/.config/nushell

# oh-my-posh: https://ohmyposh.dev/docs/installation/prompt
oh-my-posh init nu | save -f oh-my-posh.nu

# starship: https://starship.rs/guide/
starship init nu | save -f starship.nu

# atuin: https://docs.atuin.sh/guide/installation/
atuin init nu | save -f atuin.nu
# import history from other shells if needed: https://docs.atuin.sh/guide/import/
atuin import auto
# or
atuin import zsh
# generate completions if needed: https://docs.atuin.sh/reference/gen-completions/
atuin gen-completions --shell nushell | save -f atuin_completions.nu

# carapace: https://carapace-sh.github.io/carapace-bin/setup.html
carapace _carapace nushell | save -f carapace.nu
```

Then, edit your `config.nu`:

```nu
source ~/.config/nushell/oh-my-posh.nu
source ~/.config/nushell/atuin.nu
source ~/.config/nushell/atuin_completions.nu
source ~/.config/nushell/starship.nu
source ~/.config/nushell/carapace.nu
```
