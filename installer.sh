#!/usr/bin/env bash
cd ~

# Upgrade ubuntu system
sudo apt update
sudo apt upgrade

# Install dependencies:
sudo apt install ninja-build gettext cmake unzip curl python3 python3-pip clangd golang

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install tools
sudo apt install tmux zsh fzf surfraw
sudo python3 -m pip install thefuck
curl -fsSL https://fnm.vercel.app/install | bash

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

go install github.com/zquestz/s@latest
cd ~

cargo install fd-find tokei lolcat toipe ripgrep topgrade cargo-update leetcode-tui-rs ast-grep zellij aoc-cli ttyper

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# Zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Build and install neovim 9

wget https://github.com/neovim/neovim/archive/refs/tags/v0.9.4.tar.gz -O nvim-source.tar.gz

tar xf nvim-source.tar.gz
rm nvim-source.tar.gz

cd neovim-0.9.4
make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb


cd ~
rm -rf neovim-0.9.4

# Install lunarvim
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

# Get dotfiles repo
git init
git remote add origin https://github.com/Pytness/dotfiles.git
git reset --hard HEAD
git config --global status.showUntrackedFiles no


sudo chsh $USER -s /bin/zsh

