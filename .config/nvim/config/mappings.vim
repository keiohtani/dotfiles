inoremap <silent> jj <ESC>
tnoremap <silent> jj <C-\><C-n>
cnoremap <silent> jj <C-c>

autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

nnoremap <F6> <C-i>
nnoremap <F5> <C-o>

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
" nnoremap <silent> <Leader>bp :bprevious<CR>
" nnoremap <silent> <Leader>bn :bnext<CR> 
" nnoremap <silent> <Leader>bf :bfirst<CR>
" nnoremap <silent> <Leader>bl :blast<CR>
" nnoremap <silent> <Leader>bd :bd<CR>
" nnoremap <silent> <Leader>bk :bw<CR>

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
