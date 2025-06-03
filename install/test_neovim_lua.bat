@echo off
:: Windows batch file to help with Vim to Lua conversion
:: This will help Windows users run the WSL commands to test the Neovim Lua configuration

echo Testing Neovim Lua configuration in WSL...
echo.

:: Change to the WSL distribution
wsl -d Ubuntu -e bash -c "cd ~/projects/dotfiles && ./install/test_neovim_lua.sh"

echo.
echo If the test was successful, you can now use your new Lua configuration.
echo If you need to make further adjustments, edit the files in ~/.config/nvim/config/
echo.
pause
