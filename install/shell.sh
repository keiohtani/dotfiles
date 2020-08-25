sudo apt -y update && sudo apt -y upgrade && sudo apt-get -y update && sudo apt-get -y upgrade

dependencies="zsh git vim tmux"
echo Installing $dependencies
sudo apt-get -y install $dependencies

sudo chsh -s /bin/zsh $USER
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# zsh plugin manager
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

# tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
