#!/bin/zsh

uname=$(uname)

raspi_install(){
    
    sh .install/basics.sh
    sudo apt-get install uwf
    sh .install/neovim_for_pi.sh
    sh .install/zerotier.sh

}

mac_install(){

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    brew update
    brew upgrade
    brew cask upgrade
    brew cleanup
    brew cask cleanup
    brew doctor
    brew install nvim visual-studio-code font-ricty-diminished google-chrome tableplus postman BetterTouchTool
    brew cask install 
    sh .install/node.sh

}


if [ $uname = 'Darwin' ]; then
    mac_install
elif [ $uname = 'Linux' ]; then
    raspi_install
fi

sh .install/setup_neovim.sh
