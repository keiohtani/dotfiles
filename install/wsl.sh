#!/bin/bash 
# No Network connection in WSL2 - https://stackoverflow.com/a/69636203/12090110

# Updating apt/apt-get
sudo apt update
sudo apt upgrade
sudo apt upgrade --fix-broken
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install zsh

sudo apt install ruby-rubygems

# Install Python
sudo apt install python3 python3-pip ipython3

# Install homebrew

export HOMEBREW_NO_INSTALL_FROM_API=1

## Bypass curl SSL issue https://stackoverflow.com/a/57655105/12090110
echo insecure >> ~/.curlrc
export HOMEBREW_CURLRC=1

## install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

sudo apt-get install build-essential

source install/brew.sh

# Configs 

source install/neovim.sh
source install/configs.sh
source install/shell.sh
