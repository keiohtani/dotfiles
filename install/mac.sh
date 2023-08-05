#!/bin/bash 

# Set up zsh
source shell.sh

# Install homebrew
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> ~/.zprofile
    eval $(/opt/homebrew/bin/brew shellenv)
fi

source ./brew.sh

## Install brew cask applications
BREW_CASK_FILE=brewcask.txt

for i in `cat $BASE_DIR/$BREW_CASK_FILE`
do
    if ! brew ls --cask --versions $i > /dev/null; then brew install --cask $i; fi
done

# Install node

source ./node.sh

# MacOS system configs
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
