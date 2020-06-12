uname=$(uname)

mac_setup(){

    eval "$(pyenv init -)"
    eval "$(nodenv init -)"
    export VISUAL=nvim
    export EDITOR="$VISUAL"

}

raspi_setup(){

    export PATH=$PATH:~/.local/bin
    
}


     
if [[ $uname = 'Darwin' ]]; then
    mac_setup
elif [[ $uname = 'Linux' ]]; then
    raspi_setup
fi
