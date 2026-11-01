#!/usr/bin/env bash
# Installs the Dossier Ghostty theme into ~/.config/ghostty/themes/
set -e
dir="$(cd "$(dirname "$0")" && pwd)"
dest=~/.config/ghostty/themes
mkdir -p "$dest"
[ -f "$dest/Dossier" ] && cp "$dest/Dossier" "$dest/Dossier.bak"
cp "$dir/Dossier" "$dest/"
echo "Done. Add to ~/.config/ghostty/config:  theme = Dossier"
echo "(or  theme = dark:Noir,light:Dossier  to follow COSMIC's toggle), then reload: Ctrl+Shift+,"
