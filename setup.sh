#!/bin/sh

# Fail on error
set -e

# Copy dot-files
cp -R ~/dot-files/.bashrc ~/dot-files/.bashrc_aliases ~/dot-files/.gitconfig ~/dot-files/.Xresources ~/
chmod 744 ~/.bashrc_aliases

# Copy nvidia-install.sh if required
pacman -Qq "nvidia-settings" &&
echo "nvidia-settings -l &" > ~/.xprofile &&
cp -R ~/dot-files/nvidia-install.sh ~/ &&
chmod +x ~/nvidia-install.sh

# Disable KWallet
mkdir ~/.config
{
  echo "[Wallet]"
  echo "Enabled=false"
} > ~/.config/kwalletrc

# Create .ssh
mkdir ~/.ssh
chmod 700 ~/.ssh

# Remove repo
rm -Rf ~/dot-files
