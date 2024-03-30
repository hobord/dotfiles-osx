#!/bin/bash

echo '[*] Installing Homebrew ...'

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# creates Brewfile in the current directory from currently-installed packages
# brew bundle dump
#
echo '[*] Install everything from the Brewfile'
brew bundle

echo '[*] Removing default configurations ...'
rm ~/.profile ~/.zprofile ~/.gitconfig ~/.aliases  ~/.zshrc ~/.tmux* ~/.p10k.zsh ~/.skhdrc ~/.yabairc ~/.config/posh.toml
rm -rF ~/.config/kitty
# rm -rF ~/.config/alacritty

rm -rF ~/.tmux
rm -rF ~/.config/smug

rm -rF ~/.config/nvim
rm -rf ~/.local/share/nvim

echo '[*] Stowing/Creating simlinks'
stow -vSt ~ neovim zsh tmux smug kitty posh moonlander git

echo "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Monaspace.zip"
