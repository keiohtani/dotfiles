" LocalLeader
let maplocalleader = ','
nnoremap <LocalLeader>o :silent !open "%:p:h"<CR>
nnoremap <LocalLeader>c :sp ~/dotfiles/vim_cheat_sheet.md<CR>
nnoremap <LocalLeader>s :sp ~/dotfiles/.config/nvim/config/<CR>
nnoremap <LocalLeader>f :let @" = expand("%:t:r")<CR>
nnoremap <LocalLeader>r :let @+ = expand("%")<CR>
nnoremap <LocalLeader>i :so ~/dotfiles/.config/nvim/init.vim<CR>
