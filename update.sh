#!/bin/bash

# Dotfiles update script
# Copies current configurations to ~/dotfiles

# Ensure the base dotfiles directory exists
mkdir -p ~/dotfiles/nvim
mkdir -p ~/dotfiles/tmux

# Function to copy with error handling
safe_copy() {
  local source="$1"
  local destination="$2"

  if [ -f "$source" ] || [ -d "$source" ]; then
    cp -R "$source" "$destination"
    echo "Copied $source to $destination"
  else
    echo "Warning: $source not found, skipping..."
  fi
}

# Zsh configuration
safe_copy ~/.zshrc ~/dotfiles/zshrc

# Neovim configurations
# Adjust paths as needed based on your specific setup
safe_copy ~/.config/nvim/init.lua ~/dotfiles/nvim/
safe_copy ~/.config/nvim/lua ~/dotfiles/nvim/
safe_copy ~/.config/nvim/lazyvim.json ~/dotfiles/nvim/
safe_copy ~/.config/nvim/stylua.toml ~/dotfiles/nvim/

# Tmux configuration
safe_copy ~/.tmux.conf ~/dotfiles/tmux.conf

# Optional: LazyVim lock file
safe_copy ~/.config/nvim/lazy-lock.json ~/dotfiles/nvim/

echo "Dotfiles update complete!"

# Optional: If you want to automatically commit changes
cd ~/dotfiles
git add .
git commit -m "Update dotfiles: $(date '+%Y-%m-%d %H:%M:%S')"
