# Dotfiles

Personal **Arch Linux** configuration files for **Neovim** (`vim.pack`), **Zsh**, and **Starship**, managed with [GNU Stow](https://gnu.org).

## Quick Start

Clone the repository and run the bootstrap script:

```bash
git clone https://github.com<your-username>/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## What `install.sh` Does

- Installs `git`, `stow`, `neovim`, `zsh`, and `starship` via `pacman`.
- Backs up existing `zsh`, `nvim`, and `starship.toml` files to `.bak`.
- Symlinks configurations into `$HOME` using GNU Stow.
- Headlessly installs Neovim plugins using built-in `vim.pack`.
- Sets Zsh as the default login shell.

## Updating

To update your configs and sync Neovim plugins:

```bash
cd ~/dotfiles && git pull
nvim --headless "+lua vim.pack.update()" +qa
```
