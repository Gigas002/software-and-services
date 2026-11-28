#!/bin/sh
# steam-frozen launcher: runs the pacman-owned Steam client from
# /opt/steam out of a per-user Steam folder.
#
# The per-user folder (~/.steam/root, by default ~/.local/share/Steam) holds
# real directories with symlinks to every client file in /opt/steam, so
# whatever Steam writes (config, userdata, steamapps, logs, ...) lands there
# and the client itself stays read-only. The links are refreshed at every
# start: a package upgrade is picked up and a client file Steam replaced is
# put back. Moving the data out (gaki-cli steam relocate) and the client's
# runtime (sruman steam link) are left to gaki and sruman.
set -eu

# /opt, not /usr: the client runs in a container with its own /usr, which
# shares /opt, so the links resolve both outside and inside it.
lib=${STEAM_FROZEN_LIB:-/opt/steam}
rt=steamrt64/pv-runtime/steam-runtime-steamrt

die() {
  echo "steam-frozen: $*" >&2
  if [ ! -t 2 ] && command -v zenity >/dev/null 2>&1; then
    zenity --error --title=Steam --width=480 --text="$*" 2>/dev/null || :
  fi
  exit 1
}

if [ -d "$HOME/.steam/root/" ]; then
  root=$(cd "$HOME/.steam/root/" && pwd -P)
else
  root="${XDG_DATA_HOME:-$HOME/.local/share}/Steam"
fi

case "$root/" in
  "$lib"/*) die "the Steam folder $root is the read-only client in $lib; point ~/.steam/root at a folder of your own" ;;
esac

mkdir -p "$root" "$HOME/.steam"
[ -e "$HOME/.steam/root" ] || [ -L "$HOME/.steam/root" ] || ln -s "$root" "$HOME/.steam/root"
[ -e "$HOME/.steam/steam" ] || [ -L "$HOME/.steam/steam" ] || ln -s "$root" "$HOME/.steam/steam"

# Link every client file; package files win over copies in the user folder.
# cp gives new directories the client's modes; Steam must write in them.
writable() {
  (cd "$lib" && find . -mindepth 1 -type d -print0) |
    (cd "$root" && xargs -0r chmod u+w 2>/dev/null) || :
}
writable
# Per top-level entry, copying into each folder: one gaki moved and left a
# link for (package -> ~/.cache/steam/package) gets the links inside it.
for src in "$lib"/*; do
  dst="$root/${src##*/}"
  if [ -d "$src" ] && [ ! -L "$src" ]; then
    mkdir -p "$dst"
    cp -rs --remove-destination "$src/." "$dst/"
  else
    cp -s --remove-destination "$src" "$dst"
  fi
done
writable
# The client finds its Steam folder from /proc/self/exe: through a link it
# would take /opt/steam for it, so its main binary is a copy of the
# package's (cp -rs made it a link again).
for f in steamrt64/steam; do
  rm -f "$root/$f"
  cp "$lib/$f" "$root/$f"
done
# Drop links to client files a newer package no longer ships.
find "$root" -xdev -path "$root/steamapps" -prune -o \
  -xtype l -lname "$lib/*" -print0 | xargs -0r rm -f

# The client runs in its Steam Runtime (steamrt3c), which this package doesn't
# ship: sruman links it. Steam would unpack or download it, but updates are off.
want=$(tr -d '\r' < "$lib/${rt}.version.txt")
have=$({ tr -d '\r' < "$root/$rt/VERSIONS.txt"; } 2>/dev/null || :)
if [ "$want" != "$have" ]; then
  build=$(printf '%s\n' "$want" | awk '$1 == "depot" { print $2 }')
  die "This Steam client needs the steamrt3c runtime $build at
$root/$rt
which is missing or another build. Runtimes come from sruman, not from this
package: install that build and link it there, then start Steam again:

  sruman install steamrt3c=$build
  ln -sfn \"\${XDG_DATA_HOME:-\$HOME/.local/share}/sruman/runtimes/steamrt3c/$build\" \\
    \"$root/$rt\"

(If that path is a folder, Steam's own copy, run 'sruman steam link' instead.)"
fi

# The 64-bit SteamRT3 client only: there are no 32-bit files.
export STEAM_FORCE_CLIENT=steamrt64
# Valve's Protons need WoW64 mode without 32-bit host libraries.
export PROTON_USE_WOW64="${PROTON_USE_WOW64:-1}"

exec "$root/steam.sh" -noverifyfiles -norepairfiles -skipinitialbootstrap "$@"
