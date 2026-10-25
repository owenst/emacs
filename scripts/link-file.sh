#!/bin/sh
# Usage: link-file.sh NAME   (e.g. link-file.sh .jedrc)
# Symlink ~/NAME to the NAME file in this directory.
# An existing ~/NAME that is not already this link is moved aside as a backup.
set -eu

if [ $# -ne 1 ]; then
  echo "usage: $0 NAME" >&2
  exit 1
fi

name="$1"
src="$(cd "$(dirname "$0")" && pwd)/$name"
dest="$HOME/$name"

# Check for source
if [ ! -f "$src" ]; then
  echo "error: $src not found" >&2
  exit 1
fi

# Check if already linked
if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
  echo "$dest already links to $src"
  exit 0
fi

# Backup any existing destination file
if [ -e "$dest" ] || [ -L "$dest" ]; then
  backup="$dest.bak.$(date +%Y%m%d%H%M%S)"
  mv "$dest" "$backup"
  echo "BACKED UP existing $dest to $backup"
fi

# Symbolically link
ln -s "$src" "$dest"
echo "linked $dest -> $src"
