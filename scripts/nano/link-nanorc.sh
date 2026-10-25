#!/bin/sh
# Symlink ~/.nanorc to the .nanorc in this directory.
# An existing ~/.nanorc that is not already this link is moved aside as a backup.
set -eu

src="$(cd "$(dirname "$0")" && pwd)/.nanorc"
dest="$HOME/.nanorc"

if [ ! -f "$src" ]; then
  echo "error: $src not found" >&2
  exit 1
fi

if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
  echo "$dest already links to $src"
  exit 0
fi

if [ -e "$dest" ] || [ -L "$dest" ]; then
  backup="$dest.bak.$(date +%Y%m%d%H%M%S)"
  mv "$dest" "$backup"
  echo "backed up existing $dest to $backup"
fi

ln -s "$src" "$dest"
echo "linked $dest -> $src"
