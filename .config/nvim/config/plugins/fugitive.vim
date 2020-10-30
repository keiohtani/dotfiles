command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

cnoreabbrev gc Gcommit
cnoreabbrev gpsh Gpush
cnoreabbrev gpshu Gpush -u origin HEAD
cnoreabbrev gco Git checkout
cnoreabbrev gp Git pull
cnoreabbrev gm Git merge
cnoreabbrev gs Git stash
cnoreabbrev gsp Git stash pop
cnoreabbrev gb Git branch


" leader
nnoremap <leader>g :G<CR>
nnoremap <leader>b :Gblame<CR>
nnoremap <leader>h :diffget //2<CR>
nnoremap <leader>l :diffget //3<CR>

" leader leader
nnoremap <leader><leader>b :Gbrowse<CR>
