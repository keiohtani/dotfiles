uname=$(uname)

node_setup(){
    eval "$(nodenv init -)"
}

tmux_setup(){

  # tmux 
  # https://qiita.com/ssh0/items/a9956a74bff8254a606a

  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
  if [[ ! -n $TMUX ]]; then
    # get the IDs
    ID="`tmux list-sessions`"
    if [[ -z "$ID" ]]; then
      tmux new-session
    else 
      create_new_session="Create New Session"
      ID="$ID\n${create_new_session}:"
      ID="`echo $ID | fzf | cut -d: -f1`"
      if [[ "$ID" = "${create_new_session}" ]]; then
        tmux new-session
      elif [[ -n "$ID" ]]; then
        tmux attach-session -t "$ID"
      fi
    fi
  fi
  
}

standard_setup(){

    # Source Prezto.
    if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
      source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
    fi
    
    if [[ $uname = 'Linux' ]]; then
    	eval "$(ssh-agent -s)"
    	ssh-add ~/.ssh/id_rsa_github
    elif [[ $uname = 'Darwin' ]]; then
    	ssh-add -K ~/.ssh/id_rsa_github
    fi
    
    # zsh initial setting 2018/07/04
    # https://qiita.com/ktr_type23/items/3eb782f98c7a5f4c60b0
    # enhancing auto completion
    autoload -U compinit
    
    HISTSIZE=1000
    HISTFILE=~/.zhistory
    SAVEHIST=1000
    
    # aliases
    alias gst='git status'
    alias ga='git add'
    alias gc='git commit -m'
    alias gdf='git diff'
    alias gb='git checkout -b'
    alias gp='git pull'
    alias gpsh='git push'
    alias vim='nvim'

}

linux_setup(){
    
    # Homebrew path
    export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

    node_setup

}

mac_setup(){

    alias py='python'
    alias jn="jupyter notebook --browser='chrome'"
    alias ec2='sh ~/.ec2.sh'
    alias raspi_NAS='ssh pi@raspinas.local -p 50022 -i ~/.ssh/raspi3b'
    alias raspi_camera='ssh pi@raspicamera.local -p 50022 -i ~/.ssh/id_rsa_raspi3b'
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"

    if command -v pyenv 1>/dev/null 2>&1; then
        eval "$(pyenv init -)"
    fi

    # exports
    export PATH="/usr/local/opt/icu4c/bin:$PATH"
    export PATH="/usr/local/opt/icu4c/sbin:$PATH"
    export PATH="/usr/local/opt/openssl/bin:$PATH"
    export PATH="/usr/local/bin/npm:$PATH"
    export NVM_DIR="$HOME/.nvm"
    export PATH=${PATH}:/usr/loca/mysql/bin/
    
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    export PATH=/usr/local/mysql/bin:$PATH
    export PATH=$PATH:/usr/local/mongodb/bin
    export PATH=$HOME/local/bin:$PATH

    tmux_setup
}

standard_setup

if [[ $uname = 'Linux' ]]; then
    linux_setup 
elif [[ $uname = 'Darwin' ]]; then
    mac_setup
fi

