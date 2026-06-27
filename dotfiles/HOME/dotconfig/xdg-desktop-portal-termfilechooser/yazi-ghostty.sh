#!/usr/bin/env sh
# Custom yazi wrapper for xdg-desktop-portal-termfilechooser using ghostty.
# See xdg-desktop-portal-termfilechooser(5) for argument details.

multiple="$1"
directory="$2"
save="$3"
path="$4"
out="$5"
debug="$6"

set -e

if [ "$debug" = 1 ]; then
    set -x
fi

if [ "$save" = "1" ] || [ "$multiple" = "1" ]; then
    ghostty -e yazi --chooser-file="$out" "$path"
elif [ "$directory" = "1" ]; then
    ghostty -e yazi --chooser-file="$out" --cwd-file="$out.1" "$path"
    if [ ! -s "$out" ] && [ -s "$out.1" ]; then
        cat "$out.1" > "$out"
        rm "$out.1"
    else
        rm -f "$out.1"
    fi
else
    ghostty -e yazi --chooser-file="$out" "$path"
fi
