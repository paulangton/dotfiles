#!/usr/bin/env bash
set -e

git submodule update --init

# install zsh
cp -r "${HOME}"/.dotfiles/zsh/.zshrc "${HOME}"

# install zsh, if not installed already
if [ -z "${ZSH}" ] || ! [ -d "${ZSH}" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc

  # set zsh as default shell
  chsh -s /bin/zsh

  # load zsh
  exec /bin/zsh
fi

# create config folder, if not exist
mkdir -p "${HOME}"/.config

# remove existing nvim directory/symlink
rm -rf "${HOME}/.config/nvim"

# create symlink
cp -r "${HOME}"/.dotfiles/nvim "${HOME}"/.config/nvim

# install neovim
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
	sudo rm -rf /opt/nvim-linux-x86_64
	sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
elif [[ "$OSTYPE" == "darwin"* ]]; then
	curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-x86_64.tar.gz
	tar xzf nvim-macos-x86_64.tar.gz
	./nvim-macos-x86_64/bin/nvim
fi
