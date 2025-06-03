#!/bin/bash

# Test script for the Neovim Lua configuration with better diagnostics
# This will create a temporary file and open it with Neovim

echo "Testing Neovim Lua configuration..."

# Create a temporary file
TEMP_FILE=$(mktemp)
echo "// Temporary test file" > $TEMP_FILE
echo "console.log('Hello, world!');" >> $TEMP_FILE

# Check if the configuration files exist
CONFIG_DIR=~/.config/nvim/config
if [ ! -d "$CONFIG_DIR" ]; then
  echo "ERROR: Configuration directory not found: $CONFIG_DIR"
  exit 1
fi

# List all Lua files to verify
echo "Verifying Lua configuration files:"
find ~/.config/nvim -name "*.lua" | sort

# Create a simple diagnostic init.lua
DIAG_FILE=$(mktemp)
cat > $DIAG_FILE << 'EOL'
-- Simple diagnostic script for Neovim Lua configuration

-- Print config path
local config_path = vim.fn.stdpath('config')
print("Config path: " .. config_path)

-- Update package path to properly find modules
package.path = config_path .. "/?.lua;" .. config_path .. "/?/init.lua;" .. package.path

-- Try loading each module with better error handling
local function try_load(module_name)
  local status, err = pcall(function() require(module_name) end)
  if status then
    print("✓ Successfully loaded: " .. module_name)
    return true
  else
    print("✗ Failed to load: " .. module_name)
    print("  Error: " .. tostring(err))
    return false
  end
end

-- Core modules to test
local modules = {
  'config.settings',
  'config.leader',
  'config.local-leader',
  'config.mappings', 
  'config.autocmd',
  'config.functions',
  'config.plugins'
}

-- Test each module
print("\nTesting core modules:")
for _, module in ipairs(modules) do
  try_load(module)
end

-- Exit nvim
vim.cmd('qa!')
EOL

# Run diagnostic script
echo "Running diagnostic script..."
nvim -u $DIAG_FILE --headless $TEMP_FILE

# Now test with the actual init.lua
echo -e "\nTesting with the actual init.lua..."
nvim --headless -c "lua print('Neovim started with init.lua')" -c "qa!" $TEMP_FILE 2>nvim_error.log

# Check for errors
if [ -s nvim_error.log ]; then
  echo -e "\nERRORS DETECTED:"
  cat nvim_error.log
  
  echo -e "\nQuick fix for relative paths:"
  echo "1. Edit ~/.config/nvim/init.lua"
  echo "2. Add this at the top of the file:"
  echo "   local config_path = vim.fn.stdpath('config')"
  echo "   package.path = config_path .. '/?.lua;' .. config_path .. '/?/init.lua;' .. package.path"
else
  echo -e "\nSUCCESS! Your Neovim configuration is working correctly."
fi

# Clean up
rm $TEMP_FILE $DIAG_FILE
rm -f nvim_error.log

echo -e "\nTo verify plugins are working correctly, run:"
echo "nvim -c 'checkhealth'"
