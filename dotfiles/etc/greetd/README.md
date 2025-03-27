# migration from sddm to regreet

1. install regreet:

```sh
yay -S greetd-regreet-git
```

2. `sudo nano` the `/etc/greetd/config.toml`:

```toml
[terminal]
# The VT to run the greeter on. Can be "next", "current" or a number
# designating the VT.
vt = 1

# The default session, also known as the greeter.
[default_session]

# `agreety` is the bundled agetty/login-lookalike. You can replace `/bin/sh`
# with whatever you want started, such as `sway`.
command = "Hyprland --config /etc/greetd/hyprland.conf"

# The user to run the command as. The privileges this user must have depends
# on the greeter. A graphical greeter may for example require the user to be
# in the `video` group.
user = "greeter"
```

3. `sudo nano` the `/etc/greetd/hyprland.conf`:

```hyprlang
exec-once = regreet; hyprctl dispatch exit

input {
    kb_layout = us
    numlock_by_default = true
}
```

4. `sudo nano` the `/etc/greetd/regreet.toml` (tweak the values if needed):

```toml
# SPDX-FileCopyrightText: 2022 Harish Rajagopal <harish.rajagopals@gmail.com>
#
# SPDX-License-Identifier: GPL-3.0-or-later

[background]
# Path to the background image
path = "/usr/share/backgrounds/greet.png"

# How the background image covers the screen if the aspect ratio doesn't match
# Available values: "Fill", "Contain", "Cover", "ScaleDown"
# Refer to: https://docs.gtk.org/gtk4/enum.ContentFit.html
# NOTE: This is ignored if ReGreet isn't compiled with GTK v4.8 support.
fit = "Contain"

# The entries defined in this section will be passed to the session as environment variables when it is started
[env]

[GTK]
# Whether to use the dark theme
application_prefer_dark_theme = true

# Cursor theme name
cursor_theme_name = "Sweet-cursors"

# Font name and size
font_name = "NotoSans Nerd Font 16"

# Icon theme name
icon_theme_name = "Sweet-Rainbow"

# GTK theme name
theme_name = "Sweet"

[commands]
# The command used to reboot the system
reboot = [ "systemctl", "reboot" ]

# The command used to shut down the system
poweroff = [ "systemctl", "poweroff" ]
```

5. `sudo systemctl disable` the `sddm.service` and `sudo systemctl enable` the `greetd.service`

```sh
sudo systemctl disable sddm.service
sudo systemctl enable greetd.service
```

6. `reboot`
