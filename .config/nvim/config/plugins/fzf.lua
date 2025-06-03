-- fzf.vim
vim.keymap.set('n', '<C-f>', "len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached'", { expr = true })
vim.keymap.set('n', '<C-s>', ':Rg<CR>', { noremap = true })
vim.keymap.set('n', '<C-b>', ':Buffers<CR>', { noremap = true })

local function ripgrep_fzf(query, fullscreen)
  local command_fmt = 'rg --column --hidden --line-number --no-heading --color=always --smart-case -- ' .. vim.fn.shellescape(query)
  local spec = {options = '--delimiter : --nth 4..'} -- ignores filename from the search
  vim.fn['fzf#vim#grep'](command_fmt, 1, vim.fn['fzf#vim#with_preview'](spec), fullscreen)
end

vim.api.nvim_create_user_command('Rg', function(opts)
  ripgrep_fzf(opts.args, opts.bang == 1)
end, { nargs = '*', bang = true })
