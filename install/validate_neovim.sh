#!/bin/bash

# Neovim Lua Configuration Validator
# This script checks your Neovim Lua configuration and helps identify issues

CONFIG_DIR=~/.config/nvim
echo "Validating Neovim Lua configuration in $CONFIG_DIR"

# Create a temporary diagnostic file
DIAG_FILE=$(mktemp)
cat > $DIAG_FILE << 'EOL'
-- Print Lua paths for debugging
print("package.path: " .. package.path)
print("Config dir: " .. vim.fn.stdpath('config'))

-- Try to load each core module
local core_modules = {
  'config.settings',
  'config.leader',
  'config.local-leader',
  'config.mappings',
  'config.autocmd',
  'config.functions',
  'config.plugins'
}

print("\n== Testing Core Modules ==")
for _, module in ipairs(core_modules) do
  local status, err = pcall(require, module)
  print(module .. ": " .. (status and "OK" or "FAILED - " .. err))
end

-- Try to load each plugin config
local plugin_configs = {
  "asyncrun", "coc", "fugitive", "fzf", "gv", "lightline", 
  "projectionist", "tagbar", "vim-closetag", "vim-highlightedyank", "vim-plug"
}

-- Add the plugins directory to package.path
local config_path = vim.fn.stdpath('config')
package.path = package.path .. ";" .. config_path .. "/config/plugins/?.lua"

print("\n== Testing Plugin Modules ==")
for _, plugin in ipairs(plugin_configs) do
  local status, err = pcall(require, plugin)
  print(plugin .. ": " .. (status and "OK" or "FAILED - " .. err))
end

-- Check plugin health
print("\n== Plugin Health Check ==")
vim.cmd('checkhealth')

-- Exit Neovim after a delay to see the output
vim.defer_fn(function() vim.cmd('qa!') end, 5000)
EOL

# Run Neovim with our diagnostic script
echo "Running Neovim diagnostics..."
nvim -u $DIAG_FILE --headless 2>&1 | tee nvim_validate.log

# Clean up
rm $DIAG_FILE

echo "Validation complete! Check nvim_validate.log for results."
echo "If everything looks good, try running Neovim normally."
