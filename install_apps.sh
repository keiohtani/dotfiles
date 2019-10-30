#!/bin/zsh

node_install(){
    
    echo 'Installing nodenv'
    brew install nodenv
    nodenv init

}

basic_install(){
    
    sudo apt -y update && sudo apt -y upgrade && sudo apt-get -y update && sudo apt-get -y upgrade

    dependencies="zsh git vim tmux"
    echo Installing $dependencies
    sudo apt-get install $dependencies

    chsh -s /bin/zsh $USER
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

}

linuxbrew_install(){
    echo 'Installing linuxbrew...' 
    sudo apt -y install linuxbrew-wrapper
    test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
    test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
}

yarn_install(){
    echo 'Installing yarn...'
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt remove cmdtest
    sudo apt install yarn
}

zerotier_install(){

    # install zerotier
    # https://iamkelv.in/blog/2017/06/zerotier.html
    
    echo 'Installing zerotier...'
    echo 'Enter network ID for zerotier:' 
    read networkID 
    curl -s 'https://raw.githubusercontent.com/zerotier/download.zerotier.com/master/htdocs/contact%40zerotier.com.gpg' | gpg --import && \
        if z=$(curl -s 'https://install.zerotier.com/' | gpg); then echo "$z" | sudo bash; fi
    sudo systemctl enable zerotier-one
    sudo zerotier-cli join $networkID
    echo 'Authenticate your device at https://my.zerotier.com/network/$networkID'
    sudo touch /var/lib/zerotier-one/networks.d/${networkID}.conf

}

fzf_install(){

    # install fzf for tmux
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    
}

neovim_install_for_pi(){
    
    echo "Installing neovim..."
    # install nvim
    # https://wilkins.tech/posts/neovim-raspberry-pi/
    echo 'Installing nvim...' 
    sudo apt-get install cmake automake libtool libtool-bin gettext
    git clone https://github.com/neovim/neovim.git
    cd neovim
    make -j8 CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make install
    pip3 install --user neovim

}

neovim_setup(){

    echo 'Installing dein plugin manager'
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh ~/.cache/dein
    rm ./installer.sh

    # run ":call dein#install()" in NVIM
    echo 'run ":call dein#install()" in neovim'

}

ubuntu_install(){
    
    basic_install
    linuxbrew_install
    yarn_install
    brew install neovim

}


raspi_install(){
    
    basic_install
    fzf_install
    
    # install firewall using uwf
    sudo apt-get install uwf
    
    neovim_install_for_pi
    install_zerotier

}


uname=$(uname)

if [ $uname = 'Darwin' ]; then
    brew install nvim
elif [ $uname = 'Linux' ]; then
    ubuntu_install
fi

neovim_setup