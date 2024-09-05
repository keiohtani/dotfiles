# Install starship
curl -sS https://starship.rs/install.sh | sh

# Switch to pure
starship preset pure-preset -o ~/.config/starship.toml

# zsh plugin manager
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
