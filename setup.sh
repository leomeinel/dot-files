#!/bin/sh

# Fail on error
set -e

# Copy dot-files
cp ~/dot-files/.bashrc ~/dot-files/.bashrc_aliases ~/dot-files/.xprofile ~/dot-files/.gitconfig ~/
chmod 744 ~/.bashrc_aliases

# Copy nvidia-install.sh if required
pacman -Qq "nvidia-settings" &&
{
  echo ""
  echo "# Load nvidia-settings"
  echo "nvidia-settings -l &"
} >> ~/.xprofile &&
cp ~/dot-files/nvidia-install.sh ~/ &&
chmod +x ~/nvidia-install.sh

# Disable KWallet
mkdir -p ~/.config/alacritty
{
  echo "[Wallet]"
  echo "Enabled=false"
} > ~/.config/kwalletrc
cp ~/dot-files/starship.toml ~/.config/
cp ~/dot-files/alacritty.yml ~/.config/alacritty/

# Create .ssh
mkdir ~/.ssh
chmod 700 ~/.ssh

# Remove repo
rm -rf ~/dot-files
