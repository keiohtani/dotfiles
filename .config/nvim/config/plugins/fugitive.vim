command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

cnoreabbrev gb Git branch
cnoreabbrev gc Git commit
cnoreabbrev gchp Git cherry-pick
cnoreabbrev gco Git checkout
cnoreabbrev gcob Git checkout -b 
cnoreabbrev gcod Git checkout develop
cnoreabbrev gcom Git checkout master
cnoreabbrev gm Git merge
cnoreabbrev gmd Git merge develop
cnoreabbrev gp Git pull
cnoreabbrev gpsh Git push
cnoreabbrev gpshu Git push -u origin HEAD
cnoreabbrev gs Git stash
cnoreabbrev gsp Git stash pop
cnoreabbrev gl Git log


" leader
nnoremap <leader>b :Git blame<CR>
nnoremap <leader>g :G<CR>
nnoremap <leader>h :diffget //2<CR>
nnoremap <leader>l :diffget //3<CR>

" leader leader
nnoremap <leader><leader>b :GBrowse<CR>
