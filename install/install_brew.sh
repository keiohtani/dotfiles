#!/bin/bash 

BASE_DIR=$(dirname $0)

BREW_FILE=brew.txt
BREW_CASK_FILE=brewcask.txt
BREW_TAP_FILE=tap.txt

if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> ~/.zprofile
    eval $(/opt/homebrew/bin/brew shellenv)
fi

brew update
brew upgrade
brew upgrade --cask

for i in `cat $BASE_DIR/$BREW_FILE`
do
    if ! brew ls --versions $i > /dev/null; then brew install $i; fi
done

for i in `cat $BASE_DIR/$BREW_CASK_FILE`
do
    if ! brew ls --cask --versions $i > /dev/null; then brew install --cask $i; fi
done

for i in `cat $BASE_DIR/$BREW_TAP_FILE`
do
    brew tap $i
done
