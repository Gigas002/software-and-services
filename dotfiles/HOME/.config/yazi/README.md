# yazi plugins

Install with: `ya pkg add %plugn%`

Required plugins/flavors:

- `yazi-rs/flavors:catppuccin-mocha`
- `yazi-rs/plugins:chmod`
- `yazi-rs/plugins:compress` (requires yazi nightly and `7z`)
- `yazi-rs/plugins:git`
- `yazi-rs/plugins:mount` (requires `udisks2`)

Update with: `ya pkg upgrade`

## Custom keybinds

Defined in `keymap.toml`:

| Key     | Action                                               |
| ------- | ---------------------------------------------------- |
| `T`     | Open a new terminal (`alacritty`) in the current dir |
| `c` `m` | Chmod selected files (`chmod` plugin)                |
| `C`     | Compress selected files (`compress` plugin)          |
| `E`     | Extract selected archives here (built-in `extract`)  |
| `M`     | Mount manager: mount/unmount/eject (`mount` plugin)  |
