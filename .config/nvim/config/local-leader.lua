vim.g.maplocalleader = ","

vim.keymap.set('n', '<LocalLeader>c', ':sp ~/dotfiles/vim_cheat_sheet.md<CR>', { noremap = true })
vim.keymap.set('n', '<LocalLeader>f', ':let @" = expand("%:t:r")<CR>', { noremap = true })
vim.keymap.set('n', '<LocalLeader>i', ':so ~/dotfiles/.config/nvim/init.vim<CR>', { noremap = true })
vim.keymap.set('n', '<LocalLeader>o', ':silent !open "%:p:h"<CR>', { noremap = true })
vim.keymap.set('n', '<LocalLeader>r', ':let @+ = expand("%")<CR>', { noremap = true })
vim.keymap.set('n', '<LocalLeader>s', ':sp ~/dotfiles/.config/nvim/config/<CR>', { noremap = true })
