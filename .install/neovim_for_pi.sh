echo "Installing neovim..."
# install nvim
# https://wilkins.tech/posts/neovim-raspberry-pi/
echo 'Installing nvim...' 
sudo apt-get install cmake automake libtool libtool-bin gettext
git clone https://github.com/neovim/neovim.git
cd neovim
make -j8 CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
pip3 install --user neovim