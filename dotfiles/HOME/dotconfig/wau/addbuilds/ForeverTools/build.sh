#!/bin/sh

set -e
mkdir -p "$pkgdir/$pkgname"
git -C "$srcdir" archive HEAD | tar -x -C "$pkgdir/$pkgname"
