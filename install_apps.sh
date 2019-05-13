#!/bin/zsh

# Install editor
echo Installing editors
brew install nvim

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
