#!/usr/bin/env bash
set -euo pipefail

# ============================
# Dotfiles Setup Script
# ============================

# Go to repo root
cd "$(dirname "$0")/.."

# --- Link dotfiles (.*) ---
echo "Linking top-level dotfiles..."
for dotfile in .?*; do
  # Skip special directories
  [[ "$dotfile" == "." || "$dotfile" == ".." ]] && continue
  
  if [[ -f "$dotfile" ]]; then
    ln -visnf "$PWD/$dotfile" "$HOME/"
  fi
done

# --- Link .zsh folder ---
ln -visnf "$PWD/.zsh" "$HOME/"

# --- Link .config subdirectories ---
echo "Linking .config directories..."
for config_dir in .config/*; do
  [[ -d "$config_dir" ]] || continue

  dest_dir="$HOME/$config_dir"
  mkdir -p "$dest_dir"
  ln -visnf "$PWD/$config_dir/"* "$dest_dir/"
done

# --- Create local zshrc if missing ---
touch "$HOME/.zshrc_local.zsh"

# --- Run Neovim installer if available ---
if command -v nvim &>/dev/null; then
  if [[ -f install/neovim.sh ]]; then
    echo "Neovim detected — running install/neovim.sh..."
    bash install/neovim.sh
  else
    echo "Neovim detected but install/neovim.sh not found."
  fi
else
  echo "Neovim not installed — skipping Neovim setup."
fi

echo "✅ Dotfiles setup complete!"

