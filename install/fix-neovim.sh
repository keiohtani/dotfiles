#!/bin/bash
# Script to fix common issues with Neovim Lua configuration

CONFIG_DIR=~/.config/nvim
echo "Checking Neovim configuration directory: $CONFIG_DIR"

# Check if config directory exists
if [ ! -d "$CONFIG_DIR" ]; then
  echo "ERROR: Neovim configuration directory not found!"
  echo "Creating directory structure..."
  mkdir -p "$CONFIG_DIR/config/plugins"
fi

# Fix permissions
echo "Setting correct permissions on Lua files..."
find "$CONFIG_DIR" -name "*.lua" -exec chmod 644 {} \;

# Check if Lua files exist
echo "Checking for Lua configuration files..."
LUA_FILES=$(find "$CONFIG_DIR" -name "*.lua" | wc -l)
if [ "$LUA_FILES" -eq 0 ]; then
  echo "ERROR: No Lua files found in the configuration directory!"
  exit 1
else
  echo "Found $LUA_FILES Lua configuration files."
fi

# Create a backup of init.lua
if [ -f "$CONFIG_DIR/init.lua" ]; then
  echo "Creating backup of init.lua..."
  cp "$CONFIG_DIR/init.lua" "$CONFIG_DIR/init.lua.bak"
fi

# Create or update fallback init.lua
echo "Creating fallback init.lua that uses relative paths..."
cat > "$CONFIG_DIR/init.lua" << 'EOL'
-- filepath: ~/.config/nvim/init.lua
-- Use package.path to add the config directory to Lua's module search path
local config_path = vim.fn.stdpath('config')
package.path = config_path .. "/?.lua;" .. config_path .. "/?/init.lua;" .. package.path

-- Now we can use require with relative paths
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
EOL

echo "Updating plugins.lua to use require for plugin configs..."
PLUGINS_LUA="$CONFIG_DIR/config/plugins.lua"
if [ -f "$PLUGINS_LUA" ]; then
  # Make backup
  cp "$PLUGINS_LUA" "$PLUGINS_LUA.bak"
  
  # Add the plugins directory to package.path and use require for each plugin
  sed -i '/vim.cmd.*syntax enable/a \
-- Properly configure the runtime path for plugin configs\
local config_path = vim.fn.stdpath("config")\
package.path = package.path .. ";" .. config_path .. "/config/plugins/?.lua"\
\
-- Load plugin configs\
local plugin_configs = {\
  "asyncrun", "coc", "fugitive", "fzf", "gv", "lightline", \
  "projectionist", "tagbar", "vim-closetag", "vim-highlightedyank", "vim-plug"\
}\
\
for _, plugin in ipairs(plugin_configs) do\
  local success, err = pcall(require, plugin)\
  if not success then\
    vim.notify("Failed to load plugin config: " .. plugin .. " - " .. err, vim.log.levels.WARN)\
  end\
end' "$PLUGINS_LUA"
  
  # Remove any existing plugin loading code
  sed -i '/-- Load all plugin configurations/,/end/d' "$PLUGINS_LUA"
fi

echo "Debugging information:"
echo "======================"
echo "Lua files in the config directory:"
find "$CONFIG_DIR" -name "*.lua" | sort

echo "Fix complete! Try testing with ./test_neovim_lua.sh again."
