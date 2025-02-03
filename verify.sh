#!/bin/bash

DOTFILES_DIR=~/dotfiles

echo "Verifying dotfiles backup..."

# Check Zsh config
if [ -f "$DOTFILES_DIR/zshrc" ]; then
  echo "✓ Zsh configuration found"
else
  echo "✗ Zsh configuration missing"
fi

# Check Neovim configs
NEOVIM_CONFIGS=(
  "$DOTFILES_DIR/nvim/init.lua"
  "$DOTFILES_DIR/nvim/lazyvim.json"
  "$DOTFILES_DIR/nvim/stylua.toml"
)

for config in "${NEOVIM_CONFIGS[@]}"; do
  if [ -f "$config" ]; then
    echo "✓ Neovim config found: $(basename "$config")"
  else
    echo "✗ Neovim config missing: $(basename "$config")"
  fi
done

# Check Lua configs
if [ -d "$DOTFILES_DIR/nvim/lua" ] && [ "$(ls -A "$DOTFILES_DIR/nvim/lua")" ]; then
  echo "✓ Neovim Lua configurations found"
else
  echo "✗ Neovim Lua configurations missing"
fi

# Check Tmux config
if [ -f "$DOTFILES_DIR/tmux.conf" ]; then
  echo "✓ Tmux configuration found"
else
  echo "✗ Tmux configuration missing"
fi

# Show total file count
echo -e "\nTotal files in dotfiles:"
find "$DOTFILES_DIR" -type f | wc -l
