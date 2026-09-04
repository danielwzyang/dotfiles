#!/bin/bash
set -e # end on fail

sudo dnf install -y zsh

RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mkdir -p ~/.oh-my-zsh/custom/themes
mkdir ~/.config

ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/daniel.zsh-theme ~/.oh-my-zsh/custom/themes/daniel.zsh-theme

chsh -s $(command -v zsh)
