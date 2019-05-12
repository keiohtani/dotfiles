# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
uname=$(uname)
if [[ $uname = 'Linux' ]]; then
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_rsa_github
elif [[ $uname = 'Darwin' ]];then
	ssh-add -K ~/.ssh/id_rsa_github
fi

# Customize to your needs...
#
# zsh initial setting 2018/07/04
# https://qiita.com/ktr_type23/items/3eb782f98c7a5f4c60b0
# enhancing auto completion
autoload -U compinit
compinit

HISTSIZE=1000
HISTFILE=~/.zhistory
SAVEHIST=1000

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
      eval "$(pyenv init -)"
fi

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
alias raspi_NAS='ssh pi@raspinas.local -p 50022'
alias raspi_camera='ssh pi@raspicamera.local -p 50022'

# exports
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/bin/npm:$PATH"
export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# tmux 
# https://qiita.com/ssh0/items/a9956a74bff8254a606a
if [ $uname = 'Darwin' ]; then
    if [[ ! -n $TMUX ]]; then
      # get the IDs
      ID="`tmux list-sessions`"
      if [[ -z "$ID" ]]; then
        tmux new-session
      fi
      create_new_session="Create New Session"
      ID="$ID\n${create_new_session}:"
      ID="`echo $ID | $PERCOL | cut -d: -f1`"
      if [[ "$ID" = "${create_new_session}" ]]; then
        tmux new-session
      elif [[ -n "$ID" ]]; then
        tmux attach-session -t "$ID"
      else
        :  # Start terminal normally
      fi
    fi
fi

