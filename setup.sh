#!/bin/bash

# setup.sh
# Symlink dotfiles to the correct locations
DIR=$HOME/dotfiles
DOTFILES=(
  ".config/alacritty"
  ".config/dunst"
  ".config/picom"
  ".config/tmux"
  ".config/qtile"
  ".config/rofi"
  ".zshrc"
  ".ideavimrc"
)

for dot in "${DOTFILES[@]}"; do
    rm -rf "${HOME}/$dot"
    ln -sf "${DIR}/${dot}" "${HOME}/${dot}"
done
