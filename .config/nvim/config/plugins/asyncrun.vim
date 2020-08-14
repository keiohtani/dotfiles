" window size
let g:asyncrun_open = 8

" for fugitive
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args> && :ccl
