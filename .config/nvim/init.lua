local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)

vim.o.termguicolors = true
vim.o.background = "dark"
-- vim.cmd[[colorscheme tokyonight-night]]
vim.cmd[[colorscheme kanagawa]]
