#!/bin/sh

# Fail on error
set -e

# Copy dot-files
cp -R ~/dot-files/.bashrc ~/dot-files/.gitconfig ~/dot-files/.Xresources ~/

# Copy nvidia-install.sh if required
if pacman -Qq "nvidia-settings"
then
echo "nvidia-settings -l &" > ~/.xprofile
cp -R ~/dot-files/nvidia-install.sh ~/
chmod +x ~/nvidia-install.sh
fi

# Disable KWallet
mkdir ~/.config
{
  echo "[Wallet]"
  echo "Enabled=false"
} > ~/.config/kwalletrc

# Remove repo
rm -Rf ~/dot-files
