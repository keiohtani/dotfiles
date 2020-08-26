if type exa &>/dev/null; then
  alias ls="exa"
  alias l='exa -l --all --group-directories-first --git'
  alias ll='exa -l --all --all --group-directories-first --git'
else
  alias l='ls -lah'
  alias ll='ls -alF'
  alias la='ls -A'
fi
