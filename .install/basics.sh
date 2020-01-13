sudo apt -y update && sudo apt -y upgrade && sudo apt-get -y update && sudo apt-get -y upgrade

dependencies="zsh git vim tmux"
echo Installing $dependencies
sudo apt-get -y install $dependencies

chsh -s /bin/zsh $USER
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"