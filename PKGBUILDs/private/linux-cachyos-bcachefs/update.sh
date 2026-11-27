#!/usr/bin/env bash
# Resync the vendored upstream linux-cachyos PKGBUILD + config, and bump the
# built-in bcachefs to match the bcachefs-tools package from the repos.
#
#   ./update.sh            # bcachefs version = repo's bcachefs-tools
#   ./update.sh 1.40.0     # pin a specific bcachefs-tools tag
set -euo pipefail
cd "$(dirname "$0")"

upstream=https://raw.githubusercontent.com/CachyOS/linux-cachyos/master/linux-cachyos

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

echo ":: Fetching upstream linux-cachyos PKGBUILD and config..."
curl -fsSL "$upstream/PKGBUILD" -o "$tmp/PKGBUILD"
curl -fsSL "$upstream/config" -o "$tmp/config"

old_kver=$(bash -c 'source ./linux-cachyos.PKGBUILD >/dev/null 2>&1; echo "$pkgver-$pkgrel"' 2>/dev/null || echo none)
new_kver=$(bash -c 'source "$1" >/dev/null 2>&1; echo "$pkgver-$pkgrel"' _ "$tmp/PKGBUILD")
mv "$tmp/PKGBUILD" linux-cachyos.PKGBUILD
mv "$tmp/config" config
echo "   kernel:   $old_kver -> $new_kver"

if [[ $# -ge 1 ]]; then
    bc_ver=$1
else
    # e.g. "3:1.39.7-1.1" -> "1.39.7"
    bc_ver=$(LC_ALL=C pacman -Si bcachefs-tools | awk '/^Version/ {print $3; exit}')
    bc_ver=${bc_ver#*:}
    bc_ver=${bc_ver%-*}
fi
old_bc=$(sed -n 's/^_bcachefs_ver=//p' PKGBUILD)
echo "   bcachefs: $old_bc -> $bc_ver"

if [[ $bc_ver != "$old_bc" ]]; then
    echo ":: Checksumming bcachefs-tools v$bc_ver..."
    sum=$(curl -fsSL "https://github.com/koverstreet/bcachefs-tools/archive/refs/tags/v${bc_ver}.tar.gz" | b2sum | cut -d' ' -f1)
    sed -i -e "s/^_bcachefs_ver=.*/_bcachefs_ver=${bc_ver}/" \
           -e "s/^_bcachefs_b2sum=.*/_bcachefs_b2sum='${sum}'/" PKGBUILD
fi

echo ":: Regenerating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO
(cd ../linux-cachyos-bcachefs-nvidia && makepkg --printsrcinfo > .SRCINFO)

echo ":: Done. Build with: makepkg -s   (here for AMD/Intel, or in ../linux-cachyos-bcachefs-nvidia)"
