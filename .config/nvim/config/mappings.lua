vim.keymap.set('i', 'jj', '<ESC>', { noremap = true, silent = true })
vim.keymap.set('t', 'jj', '<C-\\><C-n>', { noremap = true, silent = true })
vim.keymap.set('c', 'jj', '<C-c>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd("CmdwinEnter", {
  pattern = "*",
  callback = function()
    vim.keymap.set('n', '<CR>', '<CR>', { noremap = true, buffer = true })
  end
})

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "quickfix",
  callback = function()
    vim.keymap.set('n', '<CR>', '<CR>', { noremap = true, buffer = true })
  end
})

vim.keymap.set('n', '<F6>', '<C-i>', { noremap = true })
vim.keymap.set('n', '<F5>', '<C-o>', { noremap = true })

-- j/k will move virtual lines (lines that wrap)
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })

-- for large jumps, add a mark
vim.keymap.set('n', 'k', "v:count > 3 ? \"m'\" . v:count . 'k' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count > 3 ? \"m'\" . v:count . 'j' : 'j'", { expr = true })
