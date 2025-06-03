vim.api.nvim_create_user_command('Make', 'AsyncRun -program=make @ <args>', { nargs = '*', bang = true, complete = 'file' })

vim.cmd([[
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
]])

-- leader
vim.keymap.set('n', '<leader>b', ':Git blame<CR>', { noremap = true })
vim.keymap.set('n', '<leader>g', ':G<CR>', { noremap = true })
vim.keymap.set('n', '<leader>h', ':diffget //2<CR>', { noremap = true })
vim.keymap.set('n', '<leader>l', ':diffget //3<CR>', { noremap = true })

-- leader leader
vim.keymap.set('n', '<leader><leader>b', ':GBrowse<CR>', { noremap = true })
