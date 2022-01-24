if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND="rg --files --hidden --color always --smart-case --"
  export FZF_DEFAULT_OPTS="-m --height 50% --border --preview 'bat --plain --color=always {}'"
fi
