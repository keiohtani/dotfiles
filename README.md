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
