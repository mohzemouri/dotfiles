#!/usr/bin/env bash

# Exit immediately if a command fails
set -e

# Check if an argument was provided
if [ -z "$1" ]; then
  echo "Usage: $0 <folder_or_file_name>"
  echo "Example: $0 nvim"
  exit 1
fi

# Strip trailing slashes if the user used tab-completion (e.g., "nvim/" -> "nvim")
NAME="${1%/}"

SOURCE="$HOME/.config/$NAME"
DOTFILES_DIR="$HOME/dotfiles"
DEST_DIR="$DOTFILES_DIR/$NAME/.config"
DEST="$DEST_DIR/$NAME"

# 1. Check if the source exists in ~/.config
if [ ! -e "$SOURCE" ]; then
  echo "Error: '$SOURCE' does not exist."
  exit 1
fi

# 2. Prevent moving something that is already a symlink
if [ -L "$SOURCE" ]; then
  echo "Error: '$SOURCE' is already a symlink."
  exit 1
fi

# 3. Check if the destination already exists to avoid overwriting
if [ -e "$DEST" ]; then
  echo "Error: '$DEST' already exists in your dotfiles."
  exit 1
fi

# 4. Create the target directory structure and move the item
mkdir -p "$DEST_DIR"
mv "$SOURCE" "$DEST"
echo "Moved '$SOURCE' -> '$DEST'"

# 5. Optional: Symlink it back using GNU Stow (if installed) or ln -s
if command -v stow &>/dev/null; then
  stow -d "$DOTFILES_DIR" -t "$HOME" "$NAME"
  echo "Symlinked back using GNU Stow!"
else
  ln -s "$DEST" "$SOURCE"
  echo "Symlinked back using 'ln -s'!"
fi
