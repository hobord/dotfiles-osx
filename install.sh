#!/bin/bash
# creates Brewfile in the current directory from currently-installed packages
# brew bundle dump
#
# install everything from the Brewfile
brew bundle

echo '[*] Removing default configurations ...'
# rm ~/.profile ~/.zprofile ~/.gitconfig ~/.aliases ~/.config/git/ignore ~/.config/htop/htoprc ~/.zshrc
rm -rF ~/.config/nvim

echo '[*] Stowing/Creating simlinks'
stow -vSt ~ neovim zsh tmux kitty# lazygit moonlander

echo '[*] Installing/Updating Neovim plugins ...'
nvim -c ':PlugInstall' -c ':UpdateRemotePlugins' -c ':qall'
