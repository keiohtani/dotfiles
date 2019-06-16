#!/bin/sh
cd $(dirname $0)
for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ]
    then
        ln -vis $PWD/$dotfile $HOME
    fi
done

for nvim_file in nvim/*
do
    if [ $nvim_file != '..' ] && [ $nvim_file != '.' ]
    then
        ln -vis $PWD/$nvim_file $HOME/.config/nvim/
    fi
done
