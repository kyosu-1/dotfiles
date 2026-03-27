#!/bin/bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

mkdir -p "$XDG_CONFIG_HOME"

link() {
  local src="$1" dst="$2"
  if [ -L "$dst" ]; then
    rm "$dst"
  elif [ -e "$dst" ]; then
    echo "WARN: $dst exists and is not a symlink, skipping"
    return
  fi
  ln -s "$src" "$dst"
  echo "  $dst -> $src"
}

echo "==> Creating symlinks"

# XDG config directories
link "$DOTFILES/config/nvim"    "$XDG_CONFIG_HOME/nvim"
link "$DOTFILES/config/ghostty" "$XDG_CONFIG_HOME/ghostty"
# Cursor
CURSOR_USER_DIR="$HOME/Library/Application Support/Cursor/User"
mkdir -p "$CURSOR_USER_DIR"
link "$DOTFILES/config/cursor/settings.json" "$CURSOR_USER_DIR/settings.json"

# Starship
link "$DOTFILES/config/starship.toml" "$XDG_CONFIG_HOME/starship.toml"

# zsh
link "$DOTFILES/config/zsh/.zshrc" "$HOME/.zshrc"

# bin
link "$DOTFILES/bin" "$HOME/.local/bin"

echo "==> Done"
