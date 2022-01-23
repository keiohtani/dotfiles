## VSCode

### Export for Mac OS X
- Export settings.json and keybindings.json
```
cp ~/Library/Application\ Support/Code/User/*.json ./vscode/
```
- Export extensions
```
code --list-extensions >! ./vscode/extensions.txt
```

### Import for Mac OS X
- Place settings.json and keybindings.json in `~/Library/Application Support/Code/User/`
```
cp ./vscode/*.json ~/Library/Application\ Support/Code/User/
```
- Import extensions
```
sh ./vscode/install_vscode_extensions.sh
```
