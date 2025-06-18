-- Specify a directory for plugins
local Plug = vim.fn['plug#']
vim.call('plug#begin', vim.fn.stdpath('data') .. '/plugged')

Plug('airblade/vim-gitgutter')
Plug('alvan/vim-closetag')
Plug('christoomey/vim-system-copy')
Plug('dkarter/bullets.vim', { ['for'] = 'markdown' })
Plug('folke/tokyonight.nvim')
Plug('github/copilot.vim')
Plug('itchyny/lightline.vim')
Plug('jparise/vim-graphql')
Plug('junegunn/fzf', { ['do'] = function() vim.fn['fzf#install']() end })
Plug('junegunn/fzf.vim')
Plug('junegunn/gv.vim')
Plug('junegunn/vim-plug')
Plug('justinmk/vim-dirvish')
Plug('justinmk/vim-sneak')
Plug('kana/vim-textobj-function')
Plug('kana/vim-textobj-indent')
Plug('kana/vim-textobj-line')
Plug('kana/vim-textobj-user')
Plug('leafOfTree/vim-svelte-plugin')
Plug('machakann/vim-highlightedyank')
Plug('majutsushi/tagbar')
Plug('neoclide/coc.nvim', { branch = 'release' })
Plug('nvim-lua/plenary.nvim')
Plug('rebelot/kanagawa.nvim')
Plug('roginfarrer/vim-dirvish-dovish', { branch = 'main' })
Plug('CopilotC-Nvim/CopilotChat.nvim')
Plug('skywind3000/asyncrun.vim')
Plug('tommcdo/vim-fubitive')
Plug('tomtom/tcomment_vim')
Plug('tpope/vim-eunuch')
Plug('tpope/vim-fugitive')
Plug('tpope/vim-projectionist')
Plug('tpope/vim-rails')
Plug('tpope/vim-repeat')
Plug('tpope/vim-rhubarb')
Plug('tpope/vim-sensible')
Plug('tpope/vim-surround')
Plug('tpope/vim-unimpaired')
Plug('tsony-tsonev/nerdtree-git-plugin')

-- Initialize plugin system
vim.call('plug#end')

vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')

-- Load plugin configs with an improved approach
local function load_plugin_configs()
  local config_path = vim.fn.stdpath('config')
  local plugin_dir = config_path .. '/config/plugins'
  
  -- Get a list of all .lua files in the plugins directory
  local plugin_files = vim.fn.glob(plugin_dir .. '/*.lua', false, true)
  
  -- Loop through each file and source it directly
  for _, file in ipairs(plugin_files) do
    -- Skip the current file if somehow included
    if not string.match(file, 'plugins%.lua$') then
      local success, err = pcall(dofile, file)
      if not success then
        vim.notify('Error loading plugin config ' .. file .. ': ' .. err, vim.log.levels.ERROR)
      end
    end
  end
end

-- Call the function to load all plugin configs
load_plugin_configs()

-- vim-repeat setup
vim.cmd('silent! call repeat#set("\\<Plug>MyWonderfulMap", v:count)')

-- fubitive setup
vim.g.fubitive_domain_pattern = 'git\\.forge\\.lmig\\.com'

-- vim-system-copy
if vim.fn.system('uname -r | grep WSL') ~= "" then
  vim.g["system_copy#copy_command"] = '/mnt/c/Windows/System32/clip.exe'
end
