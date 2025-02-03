# Dotfiles Configuration

## Repository Structure

```
.dotfiles/
├── zshrc
├── tmux.conf
└── nvim/
    ├── init.lua
    └── lua/
        ├── plugins/
        └── config/
```

## Prerequisites

Before running the setup script, ensure you have the following installed:
- Git
- Zsh
- Neovim (0.9+)
- Tmux
- Curl

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
   ```

2. Make the setup script executable:
   ```bash
   chmod +x ~/.dotfiles/setup.sh
   ```

3. Run the setup script:
   ```bash
   ~/.dotfiles/setup.sh
   ```

## Manual Steps

Some configurations may require manual intervention:

- Customize your `zshrc` and add any system-specific configurations
- Review and modify Neovim configurations in `nvim/`
- Check Tmux configurations and add any local customizations

## Updating Configurations

To update your dotfiles:
1. Make changes in the respective configuration files
2. Commit and push to your Git repository
3. Run the setup script on any new system to sync configurations

## Troubleshooting

- Ensure all dependencies are installed
- Check symlink paths if any configuration is not working
- Verify file permissions

