## Additional instruction for Windows Subsystem as Linux
1. Go to "Turn Windows features on or off" and turn on WSL
2. Install Ubuntu and Windows Terminal from Microsoft Store
3. Set up DNS configs https://stackoverflow.com/questions/62314789/no-internet-connection-on-wsl-ubuntu-windows-subsystem-for-linux/69636203#69636203
4. Start WSL and run 
`git clone https://github.com/keiohtani/dotfiles.git && cd dotfiles && source install/wsl.sh`
5. Configure Windows Terminal
- Open settings in Windows Terminal and add this in a profile with the name "Ubuntu"
```
"colorScheme": "Solarized Dark",
"fontSize": 9
```
