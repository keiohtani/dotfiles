#!/bin/sh
cd $(dirname $0)
for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ]
    then
        ln -Fis "$HOME/$dotfile" $HOME
    fi
done
ln -Fis "$PWD/.vim/colors" "$HOME/.config/nvim"

for nvim_file in nvim/*
do
    if [ $nvim_file != '..' ]
    then
        ln -Fis "$PWD/nvim/$nvim_file" "$HOME/.config/nvim"
    fi
done
