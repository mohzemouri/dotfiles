#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing required packages via pacman..."
sudo pacman -S --needed --noconfirm git stow neovim zsh starship

echo "Backing up any existing configurations..."
backup_if_exists() {
  if [ -e "$1" ] && [ ! -L "$1" ]; then
    echo "Backing up $1 to $1.bak"
    mv "$1" "$1.bak"
  fi
}

backup_if_exists "$HOME/.zshrc"
backup_if_exists "$HOME/.config/zsh"
backup_if_exists "$HOME/.config/nvim"
backup_if_exists "$HOME/.config/starship.toml"

echo "Symlinking dotfiles with GNU Stow..."
cd "$DOTFILES_DIR"
stow -R nvim
stow -R zsh
if [ -d "starship" ]; then
  stow -R starship
fi

echo "Syncing Neovim plugins via vim.pack..."
nvim --headless "+lua vim.pack.update()" +qa

if [ "$SHELL" != "$(which zsh)" ]; then
  echo "Changing default shell to Zsh..."
  chsh -s "$(which zsh)"
fi

echo "Setup complete! Restart your terminal to apply changes."
