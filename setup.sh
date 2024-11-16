#!/bin/bash

# Install packages
case "$(uname)" in
    Linux) sudo apt install $(cat packages.txt) ;;
    Darwin) brew install $(cat packages.txt) ;;
esac

# setup.sh
# Symlink dotfiles to the correct locations
# Commented out files have been omitted as to not mess with current configs. uncomment to include them in them
DIR=$HOME/dotfiles
DOTFILES=(
  ".config/alacritty"
  ".config/dunst"
  ".config/picom"
  ".config/tmux"
  ".config/qtile"
  ".config/rofi"
  ".config/k9s"
  ".wezterm"
  # ".zshrc"
  ".ideavimrc"
  # ".config/nvim"
)
# ln -sf .config/cvim ~/.config/cvim
for dot in "${DOTFILES[@]}"; do
    # rm -rf "${HOME}/$dot"
    ln -sf "${DIR}/${dot}" "${HOME}/${dot}"
done

# if ~/.fzf-git doesnt exist, clone it
[ ! -d ~/.fzf-git ] && 
git clone https://github.com/junegunn/fzf-git.sh.git ~/.fzf-git
