#!/bin/zsh

uname=$(uname)

raspi_install(){
    
    sh .install/basics.sh
    sudo apt-get install uwf
    sh .install/neovim_for_pi.sh
    sh .install/zerotier.sh

}

mac_install(){

    brew install nvim
    sh .install/node.sh

}


if [ $uname = 'Darwin' ]; then
    mac_install
elif [ $uname = 'Linux' ]; then
    raspi_install
fi

sh .install/setup_neovim.sh