#!/bin/bash 

BASE_DIR=$(dirname $0)

BREW_FILE=brew.txt

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
