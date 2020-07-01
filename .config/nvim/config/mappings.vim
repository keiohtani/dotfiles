" Global Leader
let mapleader = " "
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>t :15new term://zsh<CR>

" LocalLeader
let maplocalleader = ','
nnoremap <LocalLeader>c :sp ~/dotfiles/vim_cheat_sheet.md<CR>
nnoremap <LocalLeader>s :sp ~/dotfiles/.config/nvim/init.vim<CR>

inoremap <silent> jj <ESC>
tnoremap <silent> jj <C-\><C-n>

nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
