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

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#fff,bold,underline"
