#!/bin/bash

# Dotfiles Repository Setup Script

# Directory to store your dotfiles
DOTFILES_DIR="$HOME/.dotfiles"

# Function to create symlinks
create_symlink() {
  local source="$1"
  local target="$2"

  # Create parent directory if it doesn't exist
  mkdir -p "$(dirname "$target")"

  # Remove existing file/symlink if it exists
  if [ -L "$target" ] || [ -f "$target" ]; then
    rm "$target"
  fi

  # Create symlink
  ln -s "$source" "$target"
  echo "Symlinked $source to $target"
}

# Main setup function
setup_dotfiles() {
  # Clone dotfiles repository if not already present
  if [ ! -d "$DOTFILES_DIR" ]; then
    git clone https://github.com/cesarfda/dotfiles.git "$DOTFILES_DIR"
  else
    cd "$DOTFILES_DIR"
    git pull origin main
  fi

  # Symlink configurations

  # Oh My Zsh configuration
  create_symlink "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"

  # Neovim (LazyVim) configuration
  mkdir -p "$HOME/.config/nvim"
  create_symlink "$DOTFILES_DIR/nvim/init.lua" "$HOME/.config/nvim/init.lua"
  create_symlink "$DOTFILES_DIR/nvim/lua" "$HOME/.config/nvim/lua"

  # Tmux configuration
  create_symlink "$DOTFILES_DIR/tmux.conf" "$HOME/.tmux.conf"

  # Install Oh My Zsh if not already installed
  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi

  # Install Neovim plugins (assumes LazyVim)
  nvim --headless "+Lazy! sync" +qa

  # Install Tmux Plugin Manager if not already installed
  if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
  fi

  # Install Tmux plugins
  "$HOME/.tmux/plugins/tpm/bin/install_plugins"

  echo "Dotfiles setup complete!"
}

# Run the setup
setup_dotfiles
