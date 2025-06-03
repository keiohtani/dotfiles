@echo off
:: Windows batch file to run the Neovim validation script in WSL

echo Running Neovim Lua configuration validation in WSL...
echo.

:: Change to the WSL distribution
wsl -d Ubuntu -e bash -c "cd ~/projects/dotfiles && chmod +x ./install/validate_neovim.sh && ./install/validate_neovim.sh"

echo.
echo If all modules loaded successfully, your configuration is working correctly!
echo To test the full configuration, run Neovim directly.
echo.
pause
