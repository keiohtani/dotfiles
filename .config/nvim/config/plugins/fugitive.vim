command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

cnoreabbrev gc Gcommit
cnoreabbrev gpsh Gpush
cnoreabbrev gco Git checkout
cnoreabbrev gp Git pull
nnoremap <leader>gs :G<CR>
nnoremap <leader>h :diffget //2<CR>
nnoremap <leader>l :diffget //2<CR>
