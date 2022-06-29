# List of minor linux tweks

**Export list of installed packages:**

`pacman -Qqe > installs.txt`


**yay first run:**

```text
yay -Y --gendb
yay -Y --devel --save
```


**/etc/pacman.conf options for yay:**

```text
UseSyslog
Color
CheckSpace
VerbosePkgLists
```


**Rebuild packages after python update:**

`yay -S $(pacman -Qoq /usr/lib/python3.9) --answerclean All`


**Force linux to use local time:**

`timedatectl set-local-rtc 1 --adjust-system-clock`


**Cleanup cache:**

`yay -Sc`


**Remove unneeded dependencies:**

`yay -Yc`


**Force program to run with specific language:**

`LANG=en_US.UTF-8 yay`


**Always add choice to edit PKGBUILD:**

`yay --editmenu --save`


**Remove withour checking for installed dependencies:**

`yay -Rdd`


**Create new package for AUR:**

First, add your `ssh` key to aur account. Then you can clone the empty (non-existant) repo and start making the package:

`git clone ssh://aur@aur.archlinux.org/package-name.git`

Now you can create PKGBUILD file in this directory. To generate `.SRCINFO` file before pushing commit, use `makepkg --printsrcinfo >.SRCINFO`


**Update binary package sums before pushing the new version:**

`updpkgsums`


**Enable NumLock on SDDM in /etc/sddm.conf:**

```text
[General]
...
Numlock=on
```


**Grub tweaks in /etc/default/grub:**

```text
GRUB_TIMEOUT=2
GRUB_TIMEOUT_STYLE=menu
```

**Use dolphin for vscode:**

See: https://github.com/microsoft/vscode/issues/50386#issuecomment-1035081994
