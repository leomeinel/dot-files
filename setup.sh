#!/bin/sh

# Fail on error
set -e

# Copy dot-files
cp -R ~/dot-files/.bashrc ~/dot-files/.bashrc_aliases ~/dot-files/.xprofile ~/dot-files/.gitconfig ~/dot-files/.Xresources ~/
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
mkdir ~/.config
{
  echo "[Wallet]"
  echo "Enabled=false"
} > ~/.config/kwalletrc
{

} > ~/.config/starship.toml

# Create .ssh
mkdir ~/.ssh
chmod 700 ~/.ssh

# Remove repo
rm -rf ~/dot-files
