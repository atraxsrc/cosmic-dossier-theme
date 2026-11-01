#!/usr/bin/env bash
# Installs the Dossier lazygit colours beside your own config.yml
set -e
dir="$(cd "$(dirname "$0")" && pwd)"
dest=~/.config/lazygit
mkdir -p "$dest"
[ -f "$dest/dossier.yml" ] && cp "$dest/dossier.yml" "$dest/dossier.yml.bak"
cp "$dir/dossier.yml" "$dest/"
echo "Done. zsh/dossier.zsh points LG_CONFIG_FILE at config.yml plus dossier.yml; without it:"
echo "  export LG_CONFIG_FILE=\"\$HOME/.config/lazygit/config.yml,\$HOME/.config/lazygit/dossier.yml\""
