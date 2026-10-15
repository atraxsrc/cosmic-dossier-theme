#!/usr/bin/env bash
# Install the cosmic-noir theme for Claude Desktop (the unofficial
# claude-desktop-extra Linux build) into its themes.d drop-in folder.
# Backs up a different existing copy. Never deletes.
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/cosmic-noir.jsonc"
DEST_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/Claude/themes.d"
DEST="$DEST_DIR/cosmic-noir.jsonc"

mkdir -p "$DEST_DIR"
if [[ -f "$DEST" ]] && ! cmp -s "$SRC" "$DEST"; then
  BAK="$DEST.bak-$(date +%Y%m%d-%H%M%S)"
  cp "$DEST" "$BAK"
  echo "  backed up existing cosmic-noir.jsonc -> $(basename "$BAK")"
fi
cp "$SRC" "$DEST"
echo "  installed $DEST"

# the app watches themes.d and reloads on its own; this just makes it immediate
if command -v claude-desktop >/dev/null 2>&1; then
  claude-desktop --reload-theme >/dev/null 2>&1 || true
fi

echo
echo "Done. In Claude Desktop press Ctrl+Shift+T and pick cosmic-noir."
echo "Settings -> Appearance switches between the dark and light halves."
