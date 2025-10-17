#!/usr/bin/env bash
set -euo pipefail

# ============================
# Terminal Setup Script (idempotent)
# ============================

# --- Install Starship prompt ---
if ! command -v starship &>/dev/null; then
  echo "Installing Starship..."
  curl -fsSL https://starship.rs/install.sh | bash -s -- -y
else
  echo "Starship already installed."
fi

# --- Apply Pure preset (only if config doesn't exist) ---
if [ ! -f ~/.config/starship.toml ]; then
  echo "Applying Pure preset..."
  mkdir -p ~/.config
  starship preset pure-preset -o ~/.config/starship.toml
else
  echo "Starship config already exists, skipping preset."
fi

# --- Install Zinit (Zsh plugin manager) ---
if [ ! -d ~/.local/share/zinit ]; then
  echo "Installing Zinit..."
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
else
  echo "Zinit already installed."
fi

# --- Install Tmux Plugin Manager ---
if [ ! -d ~/.tmux/plugins/tpm ]; then
  echo "Installing Tmux Plugin Manager..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  echo "Tmux Plugin Manager already installed."
fi

echo "✅ Setup complete!"

