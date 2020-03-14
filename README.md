# dotfiles
## Additional instruction for Windows Subsystem as Linux
1. Go to "Turn Windows features on or off" and turn on WSL
2. Install Ubuntu and Windows Terminal from Microsoft Store
3. Start WSL and run 
`git clone https://github.com/keiohtani/dotfiles.git && cd dotfiles && sh install_apps.sh install.sh`
4. Configure Windows Terminal
- Open settings in Windows Terminal and add this in a profile with name "Ubuntu"

```
"colorScheme": "Solarized Dark",
"fontSize": 9
```

## Chrome Extensions
- Grammarly
- Just Read
- 1Password
- Pesticide for Chrome
- React Developer Tools
- Add to Wunderlist
- Vimium

## Commands
- Compile .zshrc when the file gets bigger
`zcompile ~/.zshrc`

## VSCode
### Export for Mac OS X
- Go to the dotfiles directory
- Export settings.json and keybindings.json
`cp ~/Library/Application\ Support/Code/User/*.json ./vscode/`
- Export extensions
`rm -f ./vscode/extensions.txt && code --list-extensions > ./vscode/extensions.txt`
### Import for Mac OS X
- Go to the dotfiles directory
- Place settings.json and keybindings.json in `~/Library/Application Support/Code/User/`
`cp ./vscode/*.json ~/Library/Application\ Support/Code/User/`
- Import extensions
`sh ./vscode/install_vscode_extensions.sh`
