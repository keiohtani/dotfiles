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

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk
