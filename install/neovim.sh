#!/usr/bin/env bash
set -euo pipefail

echo "==> Neovim setup"

# --- Install vim-plug if missing ---
NVIM_AUTOLOAD_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload"
PLUG_VIM="${NVIM_AUTOLOAD_DIR}/plug.vim"

if [[ -f "$PLUG_VIM" ]]; then
  echo "vim-plug already installed at: $PLUG_VIM"
else
  echo "Installing vim-plug..."
  mkdir -p "$NVIM_AUTOLOAD_DIR"
  curl -fLo "$PLUG_VIM" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# --- Python provider (optional but recommended) ---
if command -v python3 >/dev/null 2>&1; then
  echo "Ensuring Python provider (pynvim)..."
  python3 -m pip install --user --upgrade pynvim >/dev/null
  echo "✔ Python provider ready ($(python3 --version))"
else
  echo "⚠ python3 not found; skipping Python provider."
fi

# --- Node.js provider (required for coc.nvim, copilot, etc.) ---
if command -v npm >/dev/null 2>&1; then
  if npm list -g neovim >/dev/null 2>&1; then
    echo "Node provider already installed (neovim npm)."
  else
    echo "Installing Node provider (neovim npm)..."
    npm install -g neovim
  fi
  echo "✔ Node provider ready (node $(node -v))"
else
  echo "⚠ npm not found; skipping Node provider."
fi

# --- Make Lua test script executable (if exists) ---
TEST_SCRIPT="$HOME/dotfiles/install/test_neovim_lua.sh"
if [[ -f "$TEST_SCRIPT" ]]; then
  chmod +x "$TEST_SCRIPT"
  echo "✔ Made executable: $TEST_SCRIPT"
fi

echo "✅ Neovim setup complete."

