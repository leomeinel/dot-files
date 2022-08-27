#!/bin/sh

# Fail on error
set -e

# Copy dot-files
cp -R ~/dot-files/.bashrc ~/dot-files/.bashrc_aliases ~/dot-files/.bash_profile ~/dot-files/.bash_logout ~/dot-files/.gitconfig ~/dot-files/.config ~/
chmod 744 ~/.bashrc_aliases

# Copy nvidia-install.sh if required
pacman -Qq "nvidia-settings" &&
{
  echo ""
  echo "# Load nvidia-settings"
  echo "nvidia-settings -l &"
} > ~/.bash_profile &&
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
nvim --headless -c 'silent! sleep 10' -c 'silent! q!'

# Remove repo
rm -rf ~/dot-files
