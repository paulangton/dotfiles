#!/usr/bin/env bash
set -euo pipefail

# create config folder, if not exist
mkdir -p "${HOME}"/.config

DOTFILES_DIR="$HOME/.dotfiles"

pushd $DOTFILES_DIR || 'exit'
git submodule update --init
popd

# configure zsh
cp -r "${HOME}"/.dotfiles/zsh/.zshrc "${HOME}"

ZSH_DIR="$HOME/.oh-my-zsh"

if [ -d "$ZSH_DIR" ]; then
  echo "$ZSH_DIR already exists. Skipping Oh My Zsh installation."
else
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc

  # ZSH plugins
  # install zsh-syntax highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

  # set zsh as default shell
  chsh -s /bin/zsh

  # load zsh
  exec /bin/zsh
fi

# remove and replace existing nvim config
rm -rf "${HOME}/.config/nvim"
cp -r "${HOME}"/.dotfiles/nvim "${HOME}"/.config/nvim

# install neovim
if command -v nvim &> /dev/null
then
    echo "neovim is installed."
    nvim --version
else
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
        sudo rm -rf /opt/nvim-linux-x86_64
        sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-x86_64.tar.gz
        tar xzf nvim-macos-x86_64.tar.gz
        ./nvim-macos-x86_64/bin/nvim
    fi
fi
