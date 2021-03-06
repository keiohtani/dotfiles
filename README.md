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

## Issues
- [zsh compinit: insecure directories](https://stackoverflow.com/questions/13762280/zsh-compinit-insecure-directories)
`compaudit | xargs chmod g-w`
- Multiple users for git
  * [Multiple GitHub Accounts & SSH Config](https://stackoverflow.com/questions/3225862/multiple-github-accounts-ssh-config#8483960)
  * [Can I specify multiple users for myself in .gitconfig?](https://stackoverflow.com/questions/4220416/can-i-specify-multiple-users-for-myself-in-gitconfig)
  * [SSH Keys with Multiple GitHub Accounts](https://medium.com/@trionkidnapper/ssh-keys-with-multiple-github-accounts-c67db56f191e)
