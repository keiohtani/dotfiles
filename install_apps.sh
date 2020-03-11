#!/bin/zsh

uname=$(uname)

raspi_install(){
    
    sh .install/basics.sh
    sudo apt-get install uwf
    sh .install/neovim_for_pi.sh
    sh .install/zerotier.sh

}

mac_install(){

    brew_setup
    sh .install/node.sh

}

brew_setup(){

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    brew update
    brew upgrade
    brew cask upgrade
    brew cleanup
    brew cask cleanup
    brew doctor
    brew install nvim 
    brew cask install visual-studio-code font-ricty-diminished google-chrome tableplus postman BetterTouchTool
    
 }
 
 vscode_setup(){
 
    add_vscode_in_path
    code --install-extension eamodio.gitlens ms-vscode.vscode-typescript-tslint-plugin vscodevim.vim scode-icons-team.vscode-icons
    
}

add_vscode_in_path(){

    cat << EOF >> ~/.bash_profile
    # Add Visual Studio Code (code)
    export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
    EOF
    
}

if [ $uname = 'Darwin' ]; then
    mac_install
elif [ $uname = 'Linux' ]; then
    raspi_install
fi

sh .install/setup_neovim.sh
