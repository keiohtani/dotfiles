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

-- ~/.config/nvim/init.lua
vim.opt.termguicolors = true
vim.o.background = "dark"   -- or "light" to match your Terminal profile
vim.cmd("colorscheme solarized8")  -- or 'solarized'

-- Disable Ruby
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
