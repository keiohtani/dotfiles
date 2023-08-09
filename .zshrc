# tmux 
# https://qiita.com/ssh0/items/a9956a74bff8254a606a

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if type nvim &>/dev/null; then
  alias vim='nvim'
fi

if type bat &>/dev/null; then
  export BAT_THEME='Solarized (light)'
  alias cat="bat --color=always"
fi

if type dust &>/dev/null; then
    alias du="dust"
fi

if type exa &>/dev/null; then
  alias ls="exa"
  alias l='exa -l --all --group-directories-first --git'
  alias ll='exa -l --all --all --group-directories-first --git'
else
  alias l='ls -lah'
  alias ll='ls -alF'
  alias la='ls -la'
fi

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND="rg --files --hidden --color always --smart-case --"
  export FZF_DEFAULT_OPTS="-m --height 50% --border --preview 'bat --plain --color=always {}'"
fi

if type rg &> /dev/null; then
  alias gst='git st -sb'
  alias ga='git add'
  alias gc='git commit -m'
  alias gdiff='git diff'
  alias gp='git pull'
  alias gpshu='git push -u origin HEAD'
  alias gpsh='git push'
  alias gco='git checkout'
  alias gcob='git checkout -b '
  alias gcom='git checkout master'
  alias gcod='git checkout develop'
  alias gb='git branch'
  alias gcp='git cherry-pick'
  alias gcl='git clone'
  alias gm='git merge'
  alias gs='git stash'
  alias gsp='git stash pop'
fi

if [[ $(uname) = 'Linux' ]]; then
elif [[ $(uname) = 'Darwin' ]]; then
  ssh-add -K ~/.ssh/id_ed25519 &>/dev/null
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if type procs &>/dev/null; then
  alias ps="procs"
fi

if type rbenv &> /dev/null; then
  eval "$(rbenv init - zsh)"
fi

if [[ $(uname) = 'Linux' ]]; then
  export SSL_CERT_FILE=~/wbg_root_certificate.crt
fi

if type brew &> /dev/null; then
  export HOMEBREW_NO_INSTALL_FROM_API=1
  echo insecure >> ~/.curlrc
  export HOMEBREW_CURLRC=1
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
  print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
  command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
  command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
    print -P "%F{33} %F{34}Installation successful.%f%b" || \
    print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#859900,underline"

zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode
ZVM_VI_INSERT_ESCAPE_BINDKEY=jj

# Resolves the slow autocompletion issue https://stackoverflow.com/a/76746393/12090110
unsetopt pathdirs

# Disable beeping sound
unsetopt beep

autoload -U compinit

export EDITOR="nvim"
export VISUAL="nvim"

HISTSIZE=1000
SAVEHIST=1000

export KEYTIMEOUT=25

bindkey -M viins '^E' autosuggest-accept
bindkey -M viins '^d' exit_zsh
bindkey -M vicmd '^d' exit_zsh

eval "$(starship init zsh)"
