# dotfiles

# How to get started

## MacOS

1. Run shell files

    ```bash
    source ./install/mac.sh
    ```

2. Move MacOS preference files

    ```bash
    cp ./system/* /Library/Prefrences/
    ```
    
3. In a TMUX session, press prefix (`ctr` + `t`) + `I` to install the plugins

## Windows Subsystem as Linux
1. Go to "Turn Windows features on or off" and turn on WSL
2. Install Ubuntu and Windows Terminal from Microsoft Store
3. Set up DNS configs
   - [No internet connection on WSL Ubuntu (Windows Subsystem for Linux) [closed]](https://stackoverflow.com/questions/62314789/no-internet-connection-on-wsl-ubuntu-windows-subsystem-for-linux/69636203#69636203)
   - [No write permissions on a file even with `sudo` [duplicate]](https://askubuntu.com/questions/947574/no-write-permissions-on-a-file-even-with-sudo)
5. Start WSL and run 
`git clone https://github.com/keiohtani/dotfiles.git && cd dotfiles && source install/wsl.sh`
6. Configure Windows Terminal
- Open settings in Windows Terminal and add this in a profile with the name "Ubuntu"
```
"colorScheme": "Solarized Dark",
"fontSize": 9
```
4. In a TMUX session, press prefix (`ctr` + `t`) + `I` to install the plugins

### Troubleshooting
- https://learn.microsoft.com/en-us/answers/questions/1296124/how-to-increase-memory-and-cpu-limits-for-wsl2-win
- custom npm registry: https://github.com/neoclide/coc.nvim/issues/2127#issuecomment-1312269359

### Additional settings required to use Git Credential Manager (https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-git#git-credential-manager-setup)
`git config --global credential.helper "/mnt/c/Users/kohtani/AppData/Local/Programs/Git/mingw64/bin/git-credential-manager.exe"`

### Azure DevOps Only
`git config --global credential.https://dev.azure.com.useHttpPath true`

## Chrome Extensions

- Grammarly
- 1Password
- Vimium
