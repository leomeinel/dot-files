#!/bin/sh

# Fail on error
set -e

# Copy dot-files
cp -R ~/dot-files/.bashrc ~/dot-files/.bashrc_aliases ~/dot-files/.gitconfig ~/dot-files/.config ~/
chmod 744 ~/.bashrc_aliases
chmod -R 744 ~/.config/custom-autostart

# Copy nvidia-install.sh if required
pacman -Qq "nvidia-settings" &&
{
  echo "#!/bin/bash"
  echo ""
  echo "# Load nvidia-settings"
  echo "nvidia-settings -l &"
} > ~/.config/custom-autostart/nvidia-settings.sh &&
chmod 744 ~/.config/custom-autostart/nvidia-settings.sh &&
cp ~/dot-files/nvidia-install.sh ~/ &&
chmod +x ~/nvidia-install.sh

# Create .ssh
mkdir ~/.ssh
chmod 700 ~/.ssh

# Create src
mkdir ~/src
chmod 700 ~/src

# Set default rust
rustup default stable

# Initialize nvim
nvim --headless -c 'sleep 10' -c 'q!'

# Remove repo
rm -rf ~/dot-files
