#!/bin/sh

set -e

workdir=$(mktemp -d)
trap 'rm -rf "$workdir"' EXIT
git -C "$srcdir" archive HEAD | tar -x -C "$workdir"

mkdir -p "$pkgdir/$pkgname"
for entry in "$workdir"/* "$workdir"/.[!.]*; do
	[ -e "$entry" ] || continue
	name=$(basename "$entry")
	if [ "$name" = "plugins" ]; then
		for plugin in "$entry"/*; do
			[ -d "$plugin" ] || continue
			cp -r "$plugin" "$pkgdir/$(basename "$plugin")"
		done
	else
		cp -r "$entry" "$pkgdir/$pkgname/"
	fi
done
