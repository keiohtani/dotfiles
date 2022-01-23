source $HOME/.zsh/tmux.zsh

if [ "$TMUX" ]; then
  source $HOME/.zsh/github.zsh
  source $HOME/.zsh/alias.zsh
  source $HOME/.zsh/exports.zsh
  source $HOME/.zsh/go.zsh
  source $HOME/.zsh/plugins.zsh
  source $HOME/.zsh/zsh.zsh
  source $HOME/.zshrc_local.zsh
fi
