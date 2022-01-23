command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

cnoreabbrev gb Git branch
cnoreabbrev gc Git commit
cnoreabbrev gchp Git cherry-pick
cnoreabbrev gco Git checkout
cnoreabbrev gcod Git checkout develop
cnoreabbrev gm Git merge
cnoreabbrev gmd Git merge develop
cnoreabbrev gp Git pull
cnoreabbrev gpsh Git push
cnoreabbrev gpshu Git push -u origin HEAD
cnoreabbrev gs Git stash
cnoreabbrev gsp Git stash pop


" leader
nnoremap <leader>b :Gblame<CR>
nnoremap <leader>g :G<CR>
nnoremap <leader>h :diffget //2<CR>
nnoremap <leader>l :diffget //3<CR>

" leader leader
nnoremap <leader><leader>b :Gbrowse<CR>
