vim.g.mapleader = " "

vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

vim.keymap.set('n', '<leader>o', ':only<CR>', { noremap = true })
vim.keymap.set('n', '<leader>q', ':quit<CR>', { noremap = true })
vim.keymap.set('n', '<leader>r', ':registers<CR>', { noremap = true })
vim.keymap.set('n', '<leader>s', ':noh<CR>', { noremap = true })
vim.keymap.set('n', '<leader>t', ':15new term://zsh<CR>', { noremap = true })
vim.keymap.set('n', '<leader>w', ':write<CR>', { noremap = true })
vim.keymap.set('n', '<leader>x', ':xit<CR>', { noremap = true })
