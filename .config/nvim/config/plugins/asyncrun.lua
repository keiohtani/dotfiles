-- window size
vim.g.asyncrun_open = 8

-- for fugitive
vim.api.nvim_create_user_command('Make', 'AsyncRun -program=make @ <args> && :ccl', { nargs = '*', bang = true, complete = 'file' })
