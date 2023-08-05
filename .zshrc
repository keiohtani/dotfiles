eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

  source $HOME/.zsh/bat.zsh
  source $HOME/.zsh/docker.zsh
  source $HOME/.zsh/dotnet.zsh
  source $HOME/.zsh/dust.zsh
  source $HOME/.zsh/exa.zsh
  source $HOME/.zsh/fzf.zsh
  source $HOME/.zsh/git.zsh
  source $HOME/.zsh/github.zsh
  source $HOME/.zsh/go.zsh
  source $HOME/.zsh/mac.zsh
  source $HOME/.zsh/node.zsh
  source $HOME/.zsh/nvm.zsh
  source $HOME/.zsh/plugins.zsh
  source $HOME/.zsh/procs.zsh
  source $HOME/.zsh/rbenv.zsh
  source $HOME/.zsh/windows.zsh
  source $HOME/.zsh/zsh.zsh
  source $HOME/.zshrc_local.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
