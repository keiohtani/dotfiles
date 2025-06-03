# Neovim Lua Configuration

This directory contains the Lua configuration files for Neovim. The configuration has been converted from VimScript to Lua for better performance and maintainability.

## Directory Structure

```
.config/nvim/
├── init.lua              # Main initialization file
├── config/               # Configuration directory
│   ├── autocmd.lua       # Autocommands
│   ├── functions.lua     # Custom functions
│   ├── leader.lua        # Leader key mappings
│   ├── local-leader.lua  # Local leader key mappings
│   ├── mappings.lua      # General key mappings
│   ├── plugins.lua       # Plugin management
│   ├── settings.lua      # General settings
│   └── plugins/          # Plugin-specific configurations
│       ├── asyncrun.lua
│       ├── coc.lua
│       ├── fugitive.lua
│       ├── fzf.lua
│       ├── gv.lua
│       ├── lightline.lua
│       ├── projectionist.lua
│       ├── tagbar.lua
│       ├── vim-closetag.lua
│       ├── vim-highlightedyank.lua
│       └── vim-plug.lua
```

## Key Benefits of Lua Configuration

1. **Performance**: Lua is faster than VimScript
2. **Readability**: Cleaner syntax and better organization
3. **Extensibility**: Easier to extend with Lua functions and modules
4. **Integration**: Better integration with modern Neovim plugins

## Testing the Configuration

You can test the configuration by running:

```bash
# From within WSL
./install/test_neovim_lua.sh

# From Windows
./install/test_neovim_lua.bat
```

## Reverting to VimScript

If you need to revert to the original VimScript configuration, edit the `init.lua` file to use:

```lua
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)
```

## Notes

- The conversion preserves all functionality from the original VimScript configuration
- Plugin configurations are automatically loaded by the `plugins.lua` file
- Some VimScript-specific features have been replaced with Lua equivalents
