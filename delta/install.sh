#!/usr/bin/env bash
# Installs the Dossier delta config into ~/.config/delta/. It does not edit
# ~/.gitconfig: add the [include] it prints.
set -e
dir="$(cd "$(dirname "$0")" && pwd)"
dest=~/.config/delta
mkdir -p "$dest"
[ -f "$dest/dossier.gitconfig" ] && cp "$dest/dossier.gitconfig" "$dest/dossier.gitconfig.bak"
cp "$dir/dossier.gitconfig" "$dest/"
if [ -f ~/.gitconfig ] && grep -qF "delta/dossier.gitconfig" ~/.gitconfig; then
    echo "Done. ~/.gitconfig already includes it."
else
    echo "Done. Add to ~/.gitconfig:"
    echo "  [include]"
    echo "      path = ~/.config/delta/dossier.gitconfig"
fi
echo "Needs the bat Dossier theme for the code colours: ./bat/install.sh"
