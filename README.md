
# Dotfiles Setup Guide

Personal dotfiles and configuration scripts for macOS, WSL, and development tools. Automate your environment setup and keep your configs in sync across machines.

---

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Setup Instructions](#setup-instructions)
  - [macOS](#macos)
  - [Windows Subsystem for Linux (WSL)](#windows-subsystem-for-linux-wsl)
  - [General Configs](#general-configs)
- [VSCode Setup](#vscode-setup)
- [Troubleshooting](#troubleshooting)
- [Additional Settings](#additional-settings)
- [Recommended Chrome Extensions](#recommended-chrome-extensions)

---

## Overview

This repository contains scripts and configuration files to quickly set up a development environment on macOS or Windows (WSL). It includes shell scripts, system preferences, VSCode settings, and more.

## Prerequisites

- [git](https://git-scm.com/)

> **Note:** The following tools are automatically installed by the setup scripts:
> - Homebrew (for macOS)
> - tmux
> - VSCode
> - Other development tools and dependencies

## Setup Instructions

### macOS

1. **Run the main setup script:**
    ```bash
    bash ./install/mac.sh
    ```
2. **Apply macOS system preferences:**
    ```bash
    sudo cp ./system/* /Library/Preferences/
    ```
3. **Install tmux plugins:**
    - In a tmux session, press prefix (`Ctrl` + `t`) then `I` (capital i)

### Windows Subsystem for Linux (WSL)

1. Enable WSL in "Turn Windows features on or off"
2. Install Ubuntu and Windows Terminal from Microsoft Store
3. [Optional] Set up DNS configs if you have connectivity issues:
    - [No internet connection on WSL Ubuntu](https://stackoverflow.com/questions/62314789/no-internet-connection-on-wsl-ubuntu-windows-subsystem-for-linux/69636203#69636203)
    - [No write permissions on a file even with `sudo`](https://askubuntu.com/questions/947574/no-write-permissions-on-a-file-even-with-sudo)
4. Clone and set up dotfiles:
    ```bash
    git clone https://github.com/keiohtani/dotfiles.git && cd dotfiles && source install/wsl.sh
    ```
5. Configure Windows Terminal:
    - Open settings and add to your Ubuntu profile:
      ```json
      "colorScheme": "Solarized Dark",
      "fontSize": 9
      ```
6. **Install tmux plugins:**
    - In a tmux session, press prefix (`Ctrl` + `t`) then `I`

### General Configs

- Set up configs (applies to both macOS and WSL):
    ```bash
    source install/configs.sh
    ```

## VSCode Setup

See [vscode/README.md](vscode/README.md) for recommended extensions and settings.

## Troubleshooting

- [Increase memory and CPU limits for WSL2](https://learn.microsoft.com/en-us/answers/questions/1296124/how-to-increase-memory-and-cpu-limits-for-wsl2-win)
- [Custom npm registry for coc.nvim](https://github.com/neoclide/coc.nvim/issues/2127#issuecomment-1312269359)

## Additional Settings

- **Git Credential Manager (for WSL):**
    ```bash
    git config --global credential.helper "/mnt/c/Users/kohtani/AppData/Local/Programs/Git/mingw64/bin/git-credential-manager.exe"
    ```
- **Azure DevOps Only:**
    ```bash
    git config --global credential.https://dev.azure.com.useHttpPath true
    ```

## Recommended Chrome Extensions

- Grammarly
- 1Password
- Vimium
