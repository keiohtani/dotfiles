-- Add config directory to Lua's module search path
local config_path = vim.fn.stdpath('config')
package.path = config_path .. "/?.lua;" .. config_path .. "/?/init.lua;" .. package.path

-- Load core configuration
require('config.settings')
require('config.leader')
require('config.local-leader')
require('config.mappings')
require('config.autocmd')
require('config.functions')

-- Load plugins configuration
require('config.plugins')

-- Theme settings
vim.o.termguicolors = true
vim.o.background = "dark"
-- vim.cmd[[colorscheme tokyonight-night]]
vim.cmd[[colorscheme kanagawa]]
