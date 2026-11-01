#!/usr/bin/env bash
# Installs the Dossier Alacritty colour scheme into ~/.config/alacritty/themes/
set -e
dir="$(cd "$(dirname "$0")" && pwd)"
dest=~/.config/alacritty/themes
mkdir -p "$dest"
[ -f "$dest/dossier.toml" ] && cp "$dest/dossier.toml" "$dest/dossier.toml.bak"
cp "$dir/dossier.toml" "$dest/"
echo "Done. Add to ~/.config/alacritty/alacritty.toml:"
echo '  [general]'
echo '  import = ["~/.config/alacritty/themes/dossier.toml"]'
