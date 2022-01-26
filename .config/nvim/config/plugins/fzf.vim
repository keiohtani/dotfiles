" fzf.vim
nnoremap <expr> <C-f> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
nnoremap <expr> <C-s> :Rg<CR>
nnoremap <expr> <C-b> :Buffers<CR>

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --hidden --line-number --no-heading --color=always --smart-case -- '.shellescape(a:query)
  let spec = {'options': '--delimiter : --nth 4..'} " ignores filename from the search
  call fzf#vim#grep(command_fmt, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)
