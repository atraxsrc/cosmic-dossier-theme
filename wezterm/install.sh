#!/usr/bin/env bash
# Installs the Dossier WezTerm colour module into ~/.config/wezterm/
set -e
dir="$(cd "$(dirname "$0")" && pwd)"
dest=~/.config/wezterm
mkdir -p "$dest"
[ -f "$dest/dossier.lua" ] && cp "$dest/dossier.lua" "$dest/dossier.lua.bak"
cp "$dir/dossier.lua" "$dest/"
echo 'Done. Add to ~/.config/wezterm/wezterm.lua:  config.colors = require("dossier")'
