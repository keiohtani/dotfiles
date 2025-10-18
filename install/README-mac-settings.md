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
