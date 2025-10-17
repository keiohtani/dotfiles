#!/usr/bin/env bash
set -Euo pipefail

# ===== Config =====
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BREW_FILE="${BASE_DIR}/brew.txt"
LOG_DIR="${BASE_DIR}/logs"
mkdir -p "$LOG_DIR"
RUN_LOG="${LOG_DIR}/brew_setup_$(date +%Y%m%d_%H%M%S).log"

# ===== Tracking =====
INSTALLED=()
SKIPPED=()
UPGRADED_FORMULAE=()
UPGRADED_CASKS=()
FAILED=()

log()  { echo -e "$@" | tee -a "$RUN_LOG"; }
fail() { FAILED+=("$1"); log "❌ $1"; }

exists() { command -v "$1" >/dev/null 2>&1; }

ensure_brew() {
  if ! exists brew; then
    log "Installing Homebrew..."
    if /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" >>"$RUN_LOG" 2>&1; then
      # Initialize shell env
      eval "$(/bin/bash -lc 'brew shellenv')"
      SHELLENV="$(brew shellenv)"
      grep -qs 'brew shellenv' "${HOME}/.zprofile" 2>/dev/null || echo "eval \"$SHELLENV\"" >> "${HOME}/.zprofile"
      grep -qs 'brew shellenv' "${HOME}/.bash_profile" 2>/dev/null || echo "eval \"$SHELLENV\"" >> "${HOME}/.bash_profile"
      log "✅ Homebrew installed."
    else
      fail "Homebrew install failed"
      return 1
    fi
  else
    eval "$(brew shellenv)"
    log "ℹ️ Homebrew already installed."
  fi
}

ensure_tap() {
  local tap="$1"
  if ! brew tap | grep -qx "$tap"; then
    log "Tapping $tap..."
    if brew tap "$tap" >>"$RUN_LOG" 2>&1; then
      INSTALLED+=("tap:$tap")
    else
      fail "tap:$tap"
    fi
  else
    SKIPPED+=("tap:$tap")
  fi
}

install_formula() {
  local name="$1"
  if brew list --formula --versions "$name" >/dev/null 2>&1; then
    SKIPPED+=("formula:$name")
  else
    log "Installing formula $name..."
    if brew install "$name" >>"$RUN_LOG" 2>&1; then
      INSTALLED+=("formula:$name")
    else
      fail "formula:$name"
    fi
  fi
}

install_cask() {
  local name="$1"
  if brew list --cask --versions "$name" >/dev/null 2>&1; then
    SKIPPED+=("cask:$name")
  else
    log "Installing cask $name..."
    if brew install --cask "$name" >>"$RUN_LOG" 2>&1; then
      INSTALLED+=("cask:$name")
    else
      fail "cask:$name"
    fi
  fi
}

install_mas() {
  local app="$1" id="${2:-}"
  if ! exists mas; then
    log "Installing mas..."
    if brew list --formula --versions mas >/dev/null 2>&1 || brew install mas >>"$RUN_LOG" 2>&1; then
      :
    else
      fail "mas-cli"
      return
    fi
  fi

  if [[ -n "$id" ]]; then
    if mas list | awk '{print $1}' | grep -qx "$id"; then
      SKIPPED+=("mas:$app($id)")
    else
      log "Installing MAS app $app ($id)..."
      if mas install "$id" >>"$RUN_LOG" 2>&1; then
        INSTALLED+=("mas:$app($id)")
      else
        fail "mas:$app($id)"
      fi
    fi
  else
    if mas list | awk '{$1=""; print substr($0,2)}' | grep -Fxq "$app"; then
      SKIPPED+=("mas:$app")
    else
      log "Searching MAS for \"$app\"..."
      local found_id
      found_id="$(mas search "$app" | awk -v a="$app" -F' ' '$0 ~ a {print $1; exit}')"
      if [[ -n "$found_id" ]]; then
        log "Installing MAS app $app ($found_id)..."
        if mas install "$found_id" >>"$RUN_LOG" 2>&1; then
          INSTALLED+=("mas:$app($found_id)")
        else
          fail "mas:$app($found_id)"
        fi
      else
        fail "mas-search:$app"
      fi
    fi
  fi
}

# ===== Run =====
ensure_brew || { log "⚠️  Continuing without brew operations due to install failure."; }

if exists brew; then
  log "Updating Homebrew..."
  if ! brew update >>"$RUN_LOG" 2>&1; then
    fail "brew update"
  fi

  # Upgrades (collect which ones actually upgraded)
  outdated_formulae="$(brew outdated --quiet || true)"
  if [[ -n "${outdated_formulae}" ]]; then
    log "Upgrading formulas..."
    if brew upgrade >>"$RUN_LOG" 2>&1; then
      while IFS= read -r pkg; do
        [[ -n "$pkg" ]] && UPGRADED_FORMULAE+=("$pkg")
      done <<< "$outdated_formulae"
    else
      fail "brew upgrade (formulae)"
    fi
  else
    log "No formula upgrades."
  fi

  outdated_casks="$(brew outdated --cask --quiet || true)"
  if [[ -n "${outdated_casks}" ]]; then
    log "Upgrading casks..."
    if brew upgrade --cask >>"$RUN_LOG" 2>&1; then
      while IFS= read -r pkg; do
        [[ -n "$pkg" ]] && UPGRADED_CASKS+=("$pkg")
      done <<< "$outdated_casks"
    else
      fail "brew upgrade (casks)"
    fi
  else
    log "No cask upgrades."
  fi

  # Process brew.txt
  if [[ -f "$BREW_FILE" ]]; then
    log "Reading $BREW_FILE..."
    while IFS= read -r raw || [[ -n "$raw" ]]; do
      line="${raw#"${raw%%[![:space:]]*}"}"; line="${line%"${line##*[![:space:]]}"}"
      [[ -z "$line" || "${line:0:1}" == "#" ]] && continue

      type="formula"; rest="$line"
      if [[ "$line" == formula* || "$line" == cask* || "$line" == tap* || "$line" == mas* ]]; then
        type="${line%% *}"
        rest="${line#*$type }"
      fi

      name=""; id=""
      if [[ "$type" == "mas" && "$rest" == \"*\"* ]]; then
        name="$(sed -n 's/^"\(.*\)".*/\1/p' <<< "$rest" || true)"
        id="$(sed -n 's/^".*"[[:space:]]\+\([0-9]\+\).*$/\1/p' <<< "$rest" || true)"
        [[ -z "$name" ]] && { fail "malformed mas line: $line"; continue; }
      else
        read -r name id <<< "$rest" || true
        [[ -z "$name" ]] && { fail "malformed line: $line"; continue; }
      fi

      case "$type" in
        tap)       ensure_tap "$name" ;;
        cask)      install_cask "$name" ;;
        mas)       install_mas "$name" "${id:-}" ;;
        formula|*) install_formula "$name" ;;
      esac
    done < "$BREW_FILE"
  else
    log "ℹ️ No $BREW_FILE found — skipping package installs."
  fi

  log "Cleaning up..."
  if ! brew cleanup >>"$RUN_LOG" 2>&1; then
    fail "brew cleanup"
  fi
fi

# ===== Summary =====
echo
log "================ Summary ================"
[[ ${#INSTALLED[@]} -gt 0 ]]       && log "✅ Installed: ${#INSTALLED[@]}  ->  ${INSTALLED[*]}"
[[ ${#SKIPPED[@]} -gt 0 ]]         && log "⏭️  Skipped (already present): ${#SKIPPED[@]}  ->  ${SKIPPED[*]}"
[[ ${#UPGRADED_FORMULAE[@]} -gt 0 ]] && log "⬆️  Upgraded formulas: ${#UPGRADED_FORMULAE[@]}  ->  ${UPGRADED_FORMULAE[*]}"
[[ ${#UPGRADED_CASKS[@]} -gt 0 ]]    && log "⬆️  Upgraded casks: ${#UPGRADED_CASKS[@]}  ->  ${UPGRADED_CASKS[*]}"
[[ ${#FAILED[@]} -gt 0 ]]          && log "❌ Failed: ${#FAILED[@]}  ->  ${FAILED[*]}"
log "Log file: $RUN_LOG"
[[ ${#FAILED[@]} -gt 0 ]] && exit 2 || exit 0

