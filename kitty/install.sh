#!/usr/bin/env bash
# Installs the Dossier kitty colour scheme into ~/.config/kitty/themes/
set -e
dir="$(cd "$(dirname "$0")" && pwd)"
dest=~/.config/kitty/themes
mkdir -p "$dest"
[ -f "$dest/Dossier.conf" ] && cp "$dest/Dossier.conf" "$dest/Dossier.conf.bak"
cp "$dir/Dossier.conf" "$dest/"
echo "Done. Add to ~/.config/kitty/kitty.conf:  include themes/Dossier.conf"
echo "then reload kitty (Ctrl+Shift+F5)."
