uname=$(uname)

source ./alias/git.zsh

if [[ $uname = 'Darwin' ]]; then
    source ./alias/mac.zsh
    source ./alias/docker.zsh
fi
