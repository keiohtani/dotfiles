#!/usr/bin/env bash
set -euo pipefail

# --- Resolve this script's real directory (handles symlinks) ---
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)"
  SOURCE="$(readlink "$SOURCE")"
  [[ "$SOURCE" != /* ]] && SOURCE="$DIR/$SOURCE"
done
SCRIPT_DIR="$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)"
BASE_DIR="$SCRIPT_DIR"

# --- Set up zsh (relative to this script) ---
# shell.sh should live next to this script.
# If it's optional, guard with -f.
if [[ -f "$BASE_DIR/shell.sh" ]]; then
  # shellcheck source=/dev/null
  source "$BASE_DIR/shell.sh"
fi

# --- Install Homebrew if missing ---
if ! command -v brew >/dev/null 2>&1; then
  if ! command -v curl >/dev/null 2>&1; then
    echo "curl is required to install Homebrew." >&2
    exit 1
  fi

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Support both Apple Silicon (/opt/homebrew) and Intel (/usr/local)
  if [[ -x "/opt/homebrew/bin/brew" ]]; then
    BREW_BIN="/opt/homebrew/bin/brew"
  elif [[ -x "/usr/local/bin/brew" ]]; then
    BREW_BIN="/usr/local/bin/brew"
  else
    BREW_BIN="$(command -v brew)"
  fi

  # Make brew available in future zsh sessions and this one
  echo "eval \"\$($BREW_BIN shellenv)\"" >> "$HOME/.zprofile"
  eval "$("$BREW_BIN" shellenv)"
fi

# --- Brew setup script (relative) ---
if [[ -f "$BASE_DIR/brew.sh" ]]; then
  # shellcheck source=/dev/null
  source "$BASE_DIR/brew.sh"
fi

# --- Install brew cask applications from file ---
BREW_CASK_FILE="$BASE_DIR/brewcask.txt"
if [[ -f "$BREW_CASK_FILE" ]]; then
  # Read non-empty, non-comment lines
  while IFS= read -r app || [[ -n "$app" ]]; do
    # skip blanks and comments
    [[ -z "${app// }" || "$app" =~ ^# ]] && continue
    if ! brew list --cask --versions "$app" >/dev/null 2>&1; then
      brew install --cask "$app"
    fi
  done < "$BREW_CASK_FILE"
fi

# --- Node setup (relative) ---
if [[ -f "$BASE_DIR/node.sh" ]]; then
  # shellcheck source=/dev/null
  source "$BASE_DIR/node.sh"
fi

# --- macOS system configs ---
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 10  # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1          # normal minimum is 2 (30 ms)
