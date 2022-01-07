#!/bin/zsh

uname=$(uname)

raspi_install(){
    sudo apt-get install uwf
    sh install/install_neovim_for_pi.sh
    sh install/install_zerotier.sh
}

mac_install(){
    sh install/install_brew.sh
    sh install/install_node.sh
    sh install/setup_git.sh
}

if [ $uname = 'Darwin' ]; then
    mac_install
elif [ $uname = 'Linux' ]; then
    raspi_install
fi

sh install/setup_neovim.sh
