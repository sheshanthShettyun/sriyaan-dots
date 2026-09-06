#!/usr/bin/env bash
# Symlink sriyaan-dots into ~/.config (backup existing with .bak)
set -euo pipefail
DOTDIR="$(cd "$(dirname "$0")" && pwd)"

link() {
  local src="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    cp -a "$dest" "$dest.bak"
    echo "backup: $dest -> $dest.bak"
    rm -rf "$dest"
  fi
  ln -sfn "$src" "$dest"
  echo "link: $dest -> $src"
}

link "$DOTDIR/hypr" "$HOME/.config/hypr"
link "$DOTDIR/DankMaterialShell/settings.json" "$HOME/.config/DankMaterialShell/settings.json"
link "$DOTDIR/ghostty" "$HOME/.config/ghostty"
link "$DOTDIR/kitty" "$HOME/.config/kitty"

echo "done. Patches in DankMaterialShell/ must be run with sudo (see README)."
