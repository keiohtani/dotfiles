source $HOME/.zsh/tmux.zsh
if [ "$TMUX" ]; then
  source $HOME/.zsh/zsh.zsh
  source $HOME/.zsh/plugins.zsh
  source $HOME/.zsh/alias.zsh
  source $HOME/.zshrc_local.zsh
fi

# include these lines in ~/.zshrc_local.zsh if needed
# source $HOME/.zsh/github.zsh
# source $HOME/.zsh/env.zsh
