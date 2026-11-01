#!/usr/bin/env bash
# Installs the Dossier Helix theme into ~/.config/helix/themes/
set -e
dir="$(cd "$(dirname "$0")" && pwd)"
dest=~/.config/helix/themes
mkdir -p "$dest"
[ -f "$dest/dossier.toml" ] && cp "$dest/dossier.toml" "$dest/dossier.toml.bak"
cp "$dir/dossier.toml" "$dest/"
echo 'Done. Add to ~/.config/helix/config.toml:  theme = "dossier"'
