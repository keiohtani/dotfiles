#!/bin/zsh

uname=$(uname)

raspi_install(){
    
    sh .install/basics.sh
    sudo apt-get install uwf
    sh .install/neovim_for_pi.sh
    sh .install/zerotier.sh

}

mac_install(){
    
    defaults write -g ApplePressAndHoldEnabled -bool false
    brew_setup
    sh .install/node.sh
    git_secrets_setup

}

git_secrets_setup() {
   git secrets --register-aws --global
   git secrets --install ~/.git-templates/git-secrets
   git config --global init.templatedir '~/.git-templates/git-secrets'
}

brew_setup(){

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    brew update
    brew upgrade
    brew cask upgrade
    brew cleanup
    brew cask cleanup
    brew doctor
    brew tap teamookla/speedtest
    brew install nvim tig speedtest git-secrets
    brew cask install visual-studio-code font-ricty-diminished google-chrome tableplus postman BetterTouchTool docker
    
 }
 
 vscode_setup(){
 
    add_vscode_in_path
    sh vscode/install_vscode_extensions.sh 
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
