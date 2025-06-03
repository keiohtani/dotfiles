# Install vim-plug for Neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install Python support for Neovim
python3 -m pip install --user --upgrade pynvim

# Install Ruby support for Neovim
gem install neovim

# Install Node.js support for Neovim
npm install -g neovim

# Make the Lua configuration files executable for testing
chmod +x ~/dotfiles/install/test_neovim_lua.sh
