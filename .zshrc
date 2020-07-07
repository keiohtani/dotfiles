source $HOME/.zsh/zsh.zsh

source $HOME/.zsh/plugins.zsh
source $HOME/.zsh/alias.zsh
source $HOME/.zshrc_local.zsh
source $HOME/.zsh/tmux.zsh

# include these lines in ~/.zshrc_local.zsh if needed
# source $HOME/.zsh/github.zsh
# source $HOME/.zsh/env.zsh

# vi mode
bindkey -v

export KEYTIMEOUT=25

precmd() { RPROMPT="" }
function zle-line-init zle-keymap-select {
    VIM_NORMAL="%K{208}%F{black}%k%f%K{208}%F{white} % NORMAL %k%f%K{black}%F{208}%k%f"
    VIM_INSERT="%K{075}%F{black}%k%f%K{075}%F{white} % INSERT %k%f%K{black}%F{075}%k%f"
    RPS1="${${KEYMAP/vicmd/$VIM_NORMAL}/(main|viins)/$VIM_INSERT}"
    RPS2=$RPS1
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# insert mode
bindkey -M viins '^R'  history-incremental-pattern-search-backward
bindkey -M viins '^E'  autosuggest-accept
bindkey -M viins 'jj' vi-cmd-mode

# command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward
