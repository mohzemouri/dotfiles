#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE}")" && pwd)"

PACKAGES=(
  git
  stow
  neovim
  zsh
  starship
  hyprland
  kitty
  tmux
  noctalia
)

STOW_DIRS=(
  nvim
  zsh
  starship
  hypr
  kitty
  tmux
  noctalia
)

echo "Installing required packages via pacman..."
sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"

echo "Configuring /etc/zsh/zshenv for XDG_CONFIG_HOME and ZDOTDIR..."
sudo mkdir -p /etc/zsh
sudo tee /etc/zsh/zshenv >/dev/null <<'EOF'
if [[ -z "$XDG_CONFIG_HOME" ]]
then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

if [[ -d "$XDG_CONFIG_HOME/zsh" ]]
then
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
fi
EOF

echo "Backing up any existing configurations..."
backup_if_exists() {
  if [ -e "$1" ] && [ ! -L "$1" ]; then
    echo "Backing up $1 to $1.bak"
    mv "$1" "$1.bak"
  fi
}

backup_if_exists "$HOME/.zshrc"
backup_if_exists "$HOME/.config/zsh"
backup_if_exists "$HOME/.tmux.conf"
backup_if_exists "$HOME/.config/nvim"
backup_if_exists "$HOME/.config/starship.toml"
backup_if_exists "$HOME/.config/hypr"
backup_if_exists "$HOME/.config/kitty"
backup_if_exists "$HOME/.config/tmux"
backup_if_exists "$HOME/.config/noctalia"

echo "Symlinking dotfiles with GNU Stow..."
cd "$DOTFILES_DIR"
for dir in "${STOW_DIRS[@]}"; do
  if [ -d "$dir" ]; then
    stow -R "$dir"
  fi
done

echo "Syncing Neovim plugins via vim.pack..."
nvim --headless "+lua vim.pack.update()" +qa

if [ "$SHELL" != "$(which zsh)" ]; then
  echo "Changing default shell to Zsh..."
  chsh -s "$(which zsh)"
fi

echo "Setup complete! Log out and select Hyprland (or restart your terminal) to apply changes."
