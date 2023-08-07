# dotfiles

## How to get started

### MacOS

1. Run shell files

    ```bash
    source ./install/mac.sh
    ```

2. Move MacOS preference files

    ```bash
    cp ./system/* /Library/Prefrences/
    ```

### WSL2

```bash
source install/wsl.sh
```

## Additional settings required to use Git Credential Manager (https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-git#git-credential-manager-setup)
`git config --global credential.helper "/mnt/c/Users/kohtani/AppData/Local/Programs/Git/mingw64/bin/git-credential-manager.exe"`

### Azure DevOps Only
`git config --global credential.https://dev.azure.com.useHttpPath true`

## Chrome Extensions

- Grammarly
- 1Password
- Vimium
