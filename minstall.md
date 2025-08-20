# MacOS installation

## Install brew

Confirm latest official instructions, probably will stay the same:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Install stuff

```sh
# casks
brew install --cask alacritty
brew install --cask font-caskaydia-cove-nerd-font font-noto-nerd-font
brew install --cask visual-studio-code zed
brew install --cask android-studio
brew install --cask google-chrome firefox

# other
brew install atuin carapace bat bottom fastfetch gping helix micro nushell onefetch sqlite starship tealdeer yazi zellij
brew install git gitui openssh
brew install fvm flutter
brew install gradle openjdk
brew install cocoapods firebase-cli
```

Most configs from linux works on macOS as is, but for nushell you'll need a little bit of tweaking.

### alacritty

Since `/opt/homebrew/bin` is not added to `PATH` automatically, you'll need to add full path to shell executable in your `alacritty.toml`:

```toml
shell = "/opt/homebrew/bin/nu"
```

### nushell

On macOS's brew installation, nushell doesn't look for config files in `~/.config/nushell` by default, so you'll need to source these files in `~/Library/Application Support/nushell`

`config.nu`:

```nu
source ~/.config/nushell/config.nu
```

`env.nu`:

```nu
source ~/.config/nushell/env.nu
```

Also, since homebrew apps are not in `PATH` you should add this into your `~/.config/nushell/env.nu`:

```nu
$env.PATH = ($env.PATH | append "/opt/homebrew/bin")
```

And for `flutter`/`dart` pub installs via `fvm` (this is especially useful for LSPs if you have not installed flutter globally):

```nu
$env.PATH = ($env.PATH | append "/Users/%username%/fvm/default/bin")
$env.PATH = ($env.PATH | append "/Users/%username%/.pub-cache/bin")
```

### xcode

`xcode` is installable via `AppStore`

### notes

You'll need to follow macOS notifications about letting software run and so on.

You'll also need to follow the instructions in CLI if these appear when first time running/installing stuff
