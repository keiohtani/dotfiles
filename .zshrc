# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

ssh-add -K ~/.ssh/id_rsa_github

# Customize to your needs...
#
# zsh initial setting 2018/07/04
# https://qiita.com/ktr_type23/items/3eb782f98c7a5f4c60b0
# enhancing auto completion
autoload -U compinit
compinit

eval "$(pyenv init -)" 

# aliases
alias gst='git status'
alias ga='git add'
alias gc='git commit -m'
alias gdf='git diff'
alias gpsh='git push'
alias gco='git checkout'
alias vim='nvim'
alias code='open /Applications/Visual\ Studio\ Code.app'
alias py='python'
alias jn="jupyter notebook --browser='chrome'"
alias ec2='sh ~/.ec2.sh'
alias raspi3b='ssh -i ~/.ssh/id_rsa_raspi3b pi@10.170.1.46'

# exports
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/bin/npm:$PATH"
export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
