#!/bin/bash

echo '[*] Removing default configurations ...'
# rm ~/.profile ~/.zprofile ~/.gitconfig ~/.aliases ~/.config/git/ignore ~/.config/htop/htoprc ~/.zshrc
rm -rF ~/.config/nvim

echo '[*] Stowing/Creating simlinks'
stow -vSt ~ neovim zsh tmux kitty# lazygit moonlander

echo '[*] Installing/Updating Neovim plugins ...'
nvim -c ':PlugInstall' -c ':UpdateRemotePlugins' -c ':qall'
