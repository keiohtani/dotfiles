uname=$(uname)

BASEDIR=$(dirname "$0")

source $BASEDIR/alias/git.zsh

if [[ $uname = 'Darwin' ]]; then
    source $BASEDIR/alias/mac.zsh
    source $BASEDIR/alias/docker.zsh
fi
