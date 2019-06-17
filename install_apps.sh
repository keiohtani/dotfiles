#!/bin/zsh

UNAME = $(uname)

if [ UNAME = 'Darwin' ]; then
    brew install nvim
elif [ UNAME = 'Linux' ]; then
    linux_setup
fi

linux_setup(){
    
    echo Type the username: 
    read username
    dependency="zsh git vim tmux uwf"
    echo Installing $dependency
    sudo apt-get install dependency
    chsh -s /bin/zsh $username
    done 
    
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
        if z=$(curl -s 'https://install.zerotier.com/' | gpg); then echo "$z" | sudo bash; fi
    sudo systemctl enable zerotier-one
    sudo zerotier-cli join $networkID
    echo Authenticate your device at https://my.zerotier.com/network/$networkID
    sudo touch /var/lib/zerotier-one/networks.d/${networkID}.conf

}

nvim --version  # to test nvim installation

# install plugin manager for NVIM
echo Installing NVIM plugin manager
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
# For example, we just use `~/.cache/dein` as installation directory
sh ./installer.sh ~/.cache/dein
rm ./installer.sh

# run ":call dein#install()" in NVIM

