#!/bin/zsh

basic_setup(){

    username=$(user)
    dependency="zsh git vim tmux uwf"
    echo Installing $dependency
    sudo apt-get install dependency
    chsh -s /bin/zsh $username

}

ubuntu_setup(){
    
    basic_setup

    # install neovim
    echo Installing neovim
    sudo apt-get install software-properties-common
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt-get update
    sudo apt-get install neovim

    zsh
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

}


raspi_setup(){
    
    basic_setup
    
    # setup firewall using uwf
    
    # install fzf for tmux
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    
    # install nvim
    # https://wilkins.tech/posts/neovim-raspberry-pi/
    echo Installing nvim... 
    sudo apt-get install cmake automake libtool libtool-bin gettext
    done
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
        if z=$(curl -s 'https://install.zerotier.com/' | gpg); then echo "$z" | sudo bash fi
    sudo systemctl enable zerotier-one
    sudo zerotier-cli join $networkID
    echo Authenticate your device at https://my.zerotier.com/network/$networkID
    sudo touch /var/lib/zerotier-one/networks.d/${networkID}.conf

}


UNAME=$(uname)

if [ $UNAME = 'Darwin' ]; then
    brew install nvim
elif [ $UNAME = 'Linux' ]; then
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

