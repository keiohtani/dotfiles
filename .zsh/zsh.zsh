# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

autoload -U compinit

export EDITOR="nvim"
export VISUAL="nvim"

HISTSIZE=1000
SAVEHIST=1000

export KEYTIMEOUT=25

bindkey -M viins '^E'  autosuggest-accept
