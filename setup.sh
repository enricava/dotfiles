#!/bin/bash

set -e

# -Tsf directly replaces the destintation.

ln -Tsf ~/dotfiles/fish ~/.config/fish
ln -Tsf ~/dotfiles/zellij ~/.config/zellij
ln -Tsf ~/dotfiles/nvim ~/.config/nvim
ln -Tsf ~/dotfiles/starship.toml ~/.config/starship.toml
ln -Tsf ~/dotfiles/.wezterm.lua ~/.wezterm.lua
ln -Tsf ~/dotfiles/yazi ~/.config/yazi
ln -Tsf ~/dotfiles/helix ~/.config/helix
