uname=$(uname)

mac_setup(){

    eval "$(pyenv init -)"
    eval "$(nodenv init -)"

}


     
if [[ $uname = 'Darwin' ]]; then
    mac_setup
fi