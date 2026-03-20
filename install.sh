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
