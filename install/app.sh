#!/bin/zsh

uname=$(uname)

raspi_install(){
    sh install/basics.sh
    sudo apt-get install uwf
    sh install/neovim_for_pi.sh
    sh install/zerotier.sh
}

mac_install(){
    defaults write -g ApplePressAndHoldEnabled -bool false
    sh install/node.sh
    sh install/brew.sh
    sh install/git.sh
    sh vscode/install_vscode_extensions.sh 
}

if [ $uname = 'Darwin' ]; then
    mac_install
elif [ $uname = 'Linux' ]; then
    raspi_install
fi

sh install/setup_neovim.sh
