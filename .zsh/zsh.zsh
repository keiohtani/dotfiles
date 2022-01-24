# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# zsh initial setting 2018/07/04
# https://qiita.com/ktr_type23/items/3eb782f98c7a5f4c60b0
# enhancing auto completion
autoload -U compinit

HISTSIZE=1000
SAVEHIST=1000

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

bindkey -M viins '^E'  autosuggest-accept
