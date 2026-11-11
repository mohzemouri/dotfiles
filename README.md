# Dotfiles

Personal **Arch Linux** Wayland environment and terminal configurations, managed with [GNU Stow](https://gnu.org).

## Stack

- **Compositor:** [Hyprland](https://hypr.land/)
- **Desktop Shell:** [Noctalia](https://github.com/noctalia-dev/noctalia)
- **Terminal:** [Kitty](https://kovidgoyal.net)
- **Multiplexer:** [Tmux](https://github.com)
- **Shell & Prompt:** Zsh + [Starship](https://starship.rs)
- **Editor:** [Neovim](https://neovim.io) (managed with built-in `vim.pack`)

## Quick Start

Clone the repository and run the automated bootstrap script:

```bash
git clone https://github.com/<your-username>/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## What `install.sh` Does

1. Installs `git`, `stow`, `neovim`, `zsh`, `starship`, `hyprland`, `kitty`, `tmux`, and `noctalia` via `pacman`.
2. Backs up any pre-existing configuration files or directories with a `.bak` extension.
3. Symlinks all configuration folders into `$HOME` using GNU Stow.
4. Syncs Neovim plugins headlessly via `vim.pack`.
5. Sets Zsh as the default login shell.

## Updating

Pull the latest repository changes, restow any new files, and update Neovim plugins:

```bash
cd ~/dotfiles && git pull
./install.sh
```
