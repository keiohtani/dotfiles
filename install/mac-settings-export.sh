#!/usr/bin/env bash
set -euo pipefail

# Export select macOS preference plist files (trackpad, mouse, gestures, dock, HIToolbox)
# Writes XML-converted plists into the repository's `system/` directory and creates a tar.gz archive.

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)"
  SOURCE="$(readlink "$SOURCE")"
  [[ "$SOURCE" != /* ]] && SOURCE="$DIR/$SOURCE"
done
SCRIPT_DIR="$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)"
BASE_DIR="$SCRIPT_DIR"

TARGET_DIR="$BASE_DIR/../system"
EXPORT_ARCHIVE_DIR="$BASE_DIR/exports"
mkdir -p "$TARGET_DIR" "$TARGET_DIR/ByHost" "$EXPORT_ARCHIVE_DIR"

echo "Exporting macOS preference plists to: $TARGET_DIR"

FILES=(
  "$HOME/Library/Preferences/com.apple.driver.AppleBluetoothMultitouch.trackpad.plist"
  "$HOME/Library/Preferences/com.apple.driver.AppleBluetoothMultitouch.mouse.plist"
  "$HOME/Library/Preferences/com.apple.dock.plist"
  "$HOME/Library/Preferences/com.apple.HIToolbox.plist"
)

# Add Finder and global keyboard repeat settings
FILES+=(
  "$HOME/Library/Preferences/com.apple.finder.plist"
)

# Export global key repeat values into a small file
echo "# Global key repeat settings exported by mac-settings-export.sh" > "$TARGET_DIR/global-key-repeat.txt"
{
  echo "InitialKeyRepeat=$(defaults read -g InitialKeyRepeat 2>/dev/null || echo '')"
  echo "KeyRepeat=$(defaults read -g KeyRepeat 2>/dev/null || echo '')"
} >> "$TARGET_DIR/global-key-repeat.txt"

copy_convert() {
  local src="$1" dst="$2"
  if [[ ! -e "$src" ]]; then
    return 1
  fi
  # Try plutil conversion to XML; if it fails, fallback to a plain copy
  if plutil -convert xml1 -o "$dst" "$src" 2>/dev/null; then
    echo "Saved: $(basename "$dst")"
  else
    cp -p "$src" "$dst"
    echo "Copied (no plutil conversion): $(basename "$dst")"
  fi
}

for f in "${FILES[@]}"; do
  if [[ -e "$f" ]]; then
    dst="$TARGET_DIR/$(basename "$f")"
    copy_convert "$f" "$dst" || true
  else
    echo "Not found, skipping: $f"
  fi
done

# Export ByHost preference files (these store per-machine gestures/IDs)
shopt -s nullglob
for f in "$HOME/Library/Preferences/ByHost/com.apple.driver.AppleBluetoothMultitouch.trackpad."*.plist; do
  dst="$TARGET_DIR/ByHost/$(basename "$f")"
  copy_convert "$f" "$dst" || true
done
for f in "$HOME/Library/Preferences/ByHost/com.apple.driver.AppleBluetoothMultitouch.mouse."*.plist; do
  dst="$TARGET_DIR/ByHost/$(basename "$f")"
  copy_convert "$f" "$dst" || true
done
shopt -u nullglob

# Optional: bundle the exported files into a timestamped tar.gz for easy transport
ts="$(date -u +%Y%m%dT%H%M%SZ)"
archive="$EXPORT_ARCHIVE_DIR/macos-settings-$ts.tar.gz"
(
  cd "$TARGET_DIR" && tar -czf "$archive" .
)

echo "Created archive: $archive"
echo "Export complete. Review files in: $TARGET_DIR"
