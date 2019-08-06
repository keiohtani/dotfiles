#!/bin/zsh

node_setup(){
    
    echo Installing nvm...
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
    nvm install node
    nvm install 10 
    nvm install 8

    echo Installing nodenv
    brew install nodenv
    nodenv init
}

wsl_setup(){
   
    sudo apt-get install libgtk-3-0 libxss1 libgconf-2-4 libnss3 libasound2
    sudo apt-get install x11-apps x11-utils x11-xserver-utils fonts-ipafont
    echo 'export DISPLAY=localhost:0.0' >> ~/.zshrc
    echo Install X Server
    
}

basic_setup(){
    
    sudo apt update && sudo apt upgrade && sudo apt-get update && sudo apt-get upgrade

    dependency="git vim tmux"
    echo Installing $dependency
    sudo apt-get install dependency
    sudo apt install zsh
    chsh -s /bin/zsh $USER

    zsh
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

}

ubuntu_setup(){
    
    basic_setup

    # install neovim
    echo Installing neovim
    sudo apt-get install software-properties-common
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt-get update
    sudo apt-get install neovim


    echo Installing Homebrew... 
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
    test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
    test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
    # solution to the Homebrew installation error https://github.com/Homebrew/linuxbrew-core/issues/13596
    sudo apt-get install build-essential
    sudo apt-get install binutils
    sudo apt-get install file
    brew install hello

    echo Installing yarn...
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt update
    sudo apt install yarn

}


raspi_setup(){
    
    basic_setup
    
    # setup firewall using uwf
    sudo apt-get install uwf
    
    # install fzf for tmux
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    
    # install nvim
    # https://wilkins.tech/posts/neovim-raspberry-pi/
    echo Installing nvim... 
    sudo apt-get install cmake automake libtool libtool-bin gettext
    git clone https://github.com/neovim/neovim.git
    cd neovim
    make -j8 CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make install
    pip3 install --user neovim

    # Setup zerotier
    # https://iamkelv.in/blog/2017/06/zerotier.html
    
    echo Installing zerotier...
    echo Enter network ID for zerotier: 
    read networkID 
    curl -s 'https://raw.githubusercontent.com/zerotier/download.zerotier.com/master/htdocs/contact%40zerotier.com.gpg' | gpg --import && \
        if z=$(curl -s 'https://install.zerotier.com/' | gpg); then echo "$z" | sudo bash; fi
    sudo systemctl enable zerotier-one
    sudo zerotier-cli join $networkID
    echo Authenticate your device at https://my.zerotier.com/network/$networkID
    sudo touch /var/lib/zerotier-one/networks.d/${networkID}.conf

}

uname=$(uname)

if [ $uname = 'Darwin' ]; then
    brew install nvim
elif [ $uname = 'Linux' ]; then
    # linux_setup
    ubuntu_setup
fi

nvim --version  # to test nvim installation

# install plugin manager for NVIM
echo Installing NVIM plugin manager
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
# For example, we just use `~/.cache/dein` as installation directory
sh ./installer.sh ~/.cache/dein
rm ./installer.sh

# run ":call dein#install()" in NVIM
echo 'run ":call dein#install()" in neovim'
