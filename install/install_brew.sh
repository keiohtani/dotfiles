#!/bin/bash 

BASE_DIR=$(dirname $0)

BREW_FILE=brew.txt
BREW_CASK_FILE=brewcask.txt
BREW_TAP_FILE=tap.txt

if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

brew update
brew upgrade
brew cask upgrade
brew cleanup
brew cask cleanup
brew doctor

for i in `cat $BASE_DIR/$BREW_FILE`
do
    brew list $i || brew install $i
done

for i in `cat $BASE_DIR/$BREW_CASK_FILE`
do
    brew cask list $i || brew cask install $i
done

for i in `cat $BASE_DIR/$BREW_TAP_FILE`
do
    brew tap $i
done
