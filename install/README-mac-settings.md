# macOS Settings Export / Import

Small helper scripts to export a curated set of macOS preferences from one machine and import them on another. The goal is to make moving to a new Mac less manual while keeping operations safe and reviewable.

Files
- `install/mac-settings-export.sh` — Export selected preferences to the repo `system/` directory and create a timestamped tar.gz under `install/exports`.
- `install/mac-settings-import.sh` — Import preferences from `system/` back into `~/Library/Preferences`. The script performs a dry-run by default; pass `--apply` to actually write changes. When applying, the script makes a timestamped backup of existing preferences first.

What this covers (current conservative set)
- Trackpad and mouse preferences
  - Domains: `com.apple.driver.AppleBluetoothMultitouch.trackpad`, `com.apple.driver.AppleBluetoothMultitouch.mouse`, plus ByHost variants if present
- Dock
  - Domain: `com.apple.dock` (persistent apps, size, magnification, autohide, hot corners)
- Finder
  - Domain: `com.apple.finder` (view style, show/hide UI elements, sidebar settings)
- Keyboard repeat
  - Global keys: `InitialKeyRepeat` and `KeyRepeat` (stored to `system/global-key-repeat.txt`)
- HIToolbox (input sources)
  - Domain: `com.apple.HIToolbox`

These choices are intentionally conservative — they are commonly useful and generally safe to move between machines.

How to use

1) Export from the source machine (old Mac)

```bash
cd /path/to/dotfiles
./install/mac-settings-export.sh
```

This will:
- Save XML-converted plist files into `system/` (e.g. `system/com.apple.finder.plist`).
- Save `system/global-key-repeat.txt` with `InitialKeyRepeat` and `KeyRepeat` values.
- Create a timestamped archive in `install/exports/` (e.g. `macos-settings-20251018T123456Z.tar.gz`).

2) Move the repository or copy the `system/` folder to the target machine (new Mac).

3) Dry-run import on the target machine (safe, no changes):

```bash
cd /path/to/dotfiles
./install/mac-settings-import.sh
```

4) Apply import (this will backup current prefs and then write files):

```bash
./install/mac-settings-import.sh --apply
```

What the import script does when `--apply` is used
- Backs up existing preference files to `~/Library/Preferences/backup-macos-settings-<timestamp>`.
- Copies plist files from the repo `system/` into `~/Library/Preferences/` (ByHost files to `~/Library/Preferences/ByHost/`).
- Applies global key repeat values with `defaults write -g`.
- Restarts `Finder`, `Dock`, and `SystemUIServer` to pick up many of the changes.

Safety notes & caveats
- ByHost files are tied to machine-specific identifiers. They may not map perfectly between different machines; importing them may produce unexpected behavior for some device-specific settings.
- Some preferences require logout/login or a reboot to take effect fully (esp. low-level hardware or system services).
- Domain keys can change between macOS versions. Review exported plists before importing to avoid applying incompatible keys.
- The import script intentionally requires `--apply` to avoid accidental overwrites.

Troubleshooting & recovery
- If anything goes wrong after applying, restore the backup created during `--apply`:

```bash
# Example: restore backed-up plist files
cp ~/Library/Preferences/backup-macos-settings-<timestamp>/*.plist ~/Library/Preferences/
cp ~/Library/Preferences/backup-macos-settings-<timestamp>/ByHost/*.plist ~/Library/Preferences/ByHost/
# Restart services
killall Finder Dock SystemUIServer 2>/dev/null || true
```

- If a specific UI element didn’t change (e.g., Finder view style), try restarting the app or logging out/in.

Extending this setup
- Add more domains: Finder/Dock/Keyboard are a good start — we already added these. Other useful domains to add (optional): `com.apple.screencapture` (screenshots), `com.apple.spotlight`, `com.apple.symbolichotkeys` (keyboard shortcuts), `com.apple.universalaccess` (accessibility), power settings (use `pmset`), and network settings (handled more safely via `networksetup`).
- Per-key import: Instead of overwriting whole plist files we can implement per-key `defaults read`/`defaults write` logic which merges safer and avoids wiping keys not present in the exported file.
- Interactive import: ask to confirm each domain before applying.

If you want, I can:
- Add per-domain flags (e.g. `--finder --dock --keyboard`) so you can control what to import/export.
- Implement per-key merging for Finder/Dock to avoid overwriting unrelated keys.
- Add interactive prompts for the import script.

Contact / Next steps
Open an issue or request the specific domains/flags you want added and I’ll implement them in the scripts.
# macOS settings export/import

This small pair of scripts lets you export selected macOS preference files (trackpad, mouse, gestures, Dock, keyboard input sources) into the repository `system/` folder and import them back on a new machine.

Files added
- `install/mac-settings-export.sh` — Export preferences from the current Mac into `system/` and create a timestamped tar.gz archive in `install/exports`.
- `install/mac-settings-import.sh` — Import preferences from `system/` back into `~/Library/Preferences`. Requires `--apply` to actually write files; without it performs a dry-run.

How to use

1. On the source machine (old Mac), run:

```bash
./install/mac-settings-export.sh
```

This writes XML-converted plist files into `system/` and creates an archive under `install/exports`.

2. Move the repository (or copy the `system/` files) to the target Mac.

3. On the new Mac, inspect the files and run a dry-run first:

```bash
./install/mac-settings-import.sh
```

To actually apply the settings:

```bash
./install/mac-settings-import.sh --apply
```

Safety and notes
- The import script will back up existing plist files to `~/Library/Preferences/backup-macos-settings-<timestamp>` before overwriting when `--apply` is used.
- Some preferences (especially those tied to hardware UUIDs, per-host settings, or system services) may not apply correctly between different machines (Intel vs Apple Silicon) or require logout/restart.
- The scripts intentionally avoid automating more invasive steps (like kernel extensions or low-level drivers).
- Review the exported plists before applying. If you only want specific settings, copy the relevant plist files from `system/` instead of running a full import.

Compatibility
- Scripts use `plutil` and only standard POSIX/Bash utilities. Tested on macOS with Bash. They should work on Intel and Apple Silicon Macs but some ByHost files may not translate across machines.

Limitations & next steps
- The export is intentionally conservative — it only targets a handful of plists. If you want more keys exported (keyboard, accessibility, Finder preferences) we can extend the list.
- We can add a per-key `defaults read` and write converter to make the import more robust for certain domains.
