echo 'Installing dein plugin manager'
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
rm ./installer.sh

# run ":call dein#install()" in NVIM
echo 'run ":call dein#install()" in neovim'