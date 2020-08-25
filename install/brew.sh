#!/bin/bash 
BREW_FILE=brew.txt
BREW_CASK_FILE=brewcask.txt
BASE_DIR=$(dirname $0)

if not type brew 2>/dev/null; then 
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

brew update
brew upgrade
brew cask upgrade
brew cleanup
brew cask cleanup
brew doctor
brew tap teamookla/speedtest

for i in `cat $BASE_DIR/$BREW_FILE`
do
    brew list $i || brew install $i
done

for i in `cat $BASE_DIR/$BREW_CASK_FILE`
do
    brew cask list $i || brew cask install $i
done
