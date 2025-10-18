#!/usr/bin/env bash
set -euo pipefail

# Import previously exported macOS preference plists from the repository `system/` directory.
# WARNING: This will overwrite local preferences. To actually apply changes pass --apply.

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)"
  SOURCE="$(readlink "$SOURCE")"
  [[ "$SOURCE" != /* ]] && SOURCE="$DIR/$SOURCE"
done
SCRIPT_DIR="$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)"
BASE_DIR="$SCRIPT_DIR"

TARGET_DIR="$BASE_DIR/../system"

DO_APPLY=0
while [[ $# -gt 0 ]]; do
  case "$1" in
    --apply) DO_APPLY=1; shift ;;
    --help|-h) echo "Usage: $0 [--apply]"; exit 0 ;;
    *) echo "Unknown arg: $1"; exit 1 ;;
  esac
done

if [[ $DO_APPLY -ne 1 ]]; then
  echo "Dry run: no files will be changed. Rerun with --apply to actually import settings." >&2
fi

if [[ ! -d "$TARGET_DIR" ]]; then
  echo "No exported settings found at: $TARGET_DIR" >&2
  exit 1
fi

backup_dir="$HOME/Library/Preferences/backup-macos-settings-$(date -u +%Y%m%dT%H%M%SZ)"
if [[ $DO_APPLY -eq 1 ]]; then
  mkdir -p "$backup_dir"
  echo "Backing up current prefs to: $backup_dir"
  for f in "$HOME/Library/Preferences"/com.apple.*.plist; do
    [[ -e "$f" ]] || continue
    cp -p "$f" "$backup_dir/" || true
  done
  mkdir -p "$backup_dir/ByHost"
  cp -p "$HOME/Library/Preferences/ByHost"/*.plist "$backup_dir/ByHost/" 2>/dev/null || true
fi

apply_file() {
  local src="$1"
  local dest="$2"
  if [[ $DO_APPLY -ne 1 ]]; then
    echo "Would copy: $src -> $dest"
    return 0
  fi

  # Ensure dest dir exists
  mkdir -p "$(dirname "$dest")"

  # Use plutil to convert if source is XML or binary; cp preserves mode
  if plutil -convert binary1 -o "$dest" "$src" 2>/dev/null; then
    echo "Applied: $(basename "$dest")"
  else
    cp -p "$src" "$dest"
    echo "Copied: $(basename "$dest")"
  fi
}

FILES=(
  "$(pwd)/$TARGET_DIR/../system/com.apple.driver.AppleBluetoothMultitouch.trackpad.plist"
  "$(pwd)/$TARGET_DIR/../system/com.apple.driver.AppleBluetoothMultitouch.mouse.plist"
  "$(pwd)/$TARGET_DIR/../system/com.apple.dock.plist"
  "$(pwd)/$TARGET_DIR/../system/com.apple.HIToolbox.plist"
)

# If the repository `system/` path exists use that; fallback to BASE_DIR/../system
repo_system_dir="$BASE_DIR/../system"
if [[ ! -d "$repo_system_dir" ]]; then
  echo "No system directory found in repo: $repo_system_dir" >&2
  exit 1
fi

for src in "$repo_system_dir"/*.plist; do
  [[ -e "$src" ]] || continue
  dest="$HOME/Library/Preferences/$(basename "$src")"
  apply_file "$src" "$dest"
done

# ByHost files
mkdir -p "$HOME/Library/Preferences/ByHost"
for src in "$repo_system_dir/ByHost"/*.plist; do
  [[ -e "$src" ]] || continue
  dest="$HOME/Library/Preferences/ByHost/$(basename "$src")"
  apply_file "$src" "$dest"
done

# Apply global key repeat settings if present
if [[ -f "$repo_system_dir/global-key-repeat.txt" ]]; then
  if [[ $DO_APPLY -ne 1 ]]; then
    echo "Would apply global key repeat values from: $repo_system_dir/global-key-repeat.txt"
  else
    echo "Applying global key repeat values from: $repo_system_dir/global-key-repeat.txt"
    # Read values safely
    while IFS='=' read -r key val; do
      case "$key" in
        InitialKeyRepeat)
          if [[ -n "$val" ]]; then
            defaults write -g InitialKeyRepeat -int "$val" || true
          fi
          ;;
        KeyRepeat)
          if [[ -n "$val" ]]; then
            defaults write -g KeyRepeat -int "$val" || true
          fi
          ;;
      esac
    done < "$repo_system_dir/global-key-repeat.txt"
  fi
fi

# Restart affected services to pick up changes
if [[ $DO_APPLY -eq 1 ]]; then
  echo "Restarting Finder, Dock, and SystemUIServer to pick up changes..."
  killall Finder 2>/dev/null || true
  killall Dock 2>/dev/null || true
  killall SystemUIServer 2>/dev/null || true
fi

if [[ $DO_APPLY -eq 1 ]]; then
  echo "Reloading Dock and other affected services..."
  # Restart Dock to pick up preference changes
  killall Dock 2>/dev/null || true
  # Note: some settings require logout/login or reboot to fully apply.
fi

echo "Import complete (dry-run=$((1-DO_APPLY)))."
