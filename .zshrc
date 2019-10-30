uname=$(uname)

zsh_setup(){

    # Source Prezto.
    if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
      source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
    fi
    
    # zsh initial setting 2018/07/04
    # https://qiita.com/ktr_type23/items/3eb782f98c7a5f4c60b0
    # enhancing auto completion
    autoload -U compinit
    
    HISTSIZE=1000
    HISTFILE=~/.zhistory
    SAVEHIST=1000
    
}

alias_setup(){
    alias gst='git status'
    alias ga='git add'
    alias gc='git commit -m'
    alias gdf='git diff'
    alias gb='git checkout -b'
    alias gp='git pull'
    alias gpsh='git push'
    alias vim='nvim'
}

github_setup(){
    if [[ $uname = 'Linux' ]]; then
    	eval "$(ssh-agent -s)"
    	ssh-add ~/.ssh/id_rsa_github
    elif [[ $uname = 'Darwin' ]]; then
    	ssh-add -K ~/.ssh/id_rsa_github
    fi
    
}

python_setup(){
    alias py='python'
    eval "$(pyenv init -)"
}

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

  if [[ -n "$TMUX" ]]; then	
      mac_setup
  fi
  
}

raspi_setup(){
    alias raspi_NAS='ssh pi@raspi_extender.local -p 50022 -i ~/.ssh/raspi3b'
    alias raspi_camera='ssh pi@raspicamera.local -p 50022 -i ~/.ssh/id_rsa_raspi3b'
    alias raspi4nas='ssh pi@raspi4nas.local -p 50022 -i ~/.ssh/raspi4_nas'
}

linuxbrew_setup(){
    export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
}

standard_setup(){

    zsh_setup
    github_setup
    alias_setup

}

linux_setup(){

    standard_setup
    linuxbrew_setup
    node_setup

}

mac_setup(){

    standard_setup
    raspi_setup
    node_setup
    python_setup

}

if [[ $uname = 'Linux' ]]; then
    linux_setup 
elif [[ $uname = 'Darwin' ]]; then
    # tmux_setup
    mac_setup
fi

