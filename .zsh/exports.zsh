if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi
