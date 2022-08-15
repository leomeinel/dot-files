#!/bin/sh

set -e
cp -R ~/dot-files/.bashrc ~/dot-files/.gitconfig ~/dot-files/.Xresources ~/
if pacman -Qq | grep -q "nvidia-settings"
then
echo "nvidia-settings -l &" > ~/.xprofile
cp -R ~/dot-files/nvidia-install.sh ~/
chmod +x ~/nvidia-install.sh
fi
mkdir ~/.config
{
  echo "[Wallet]"
  echo "Enabled=false"
} > ~/.config/kwalletrc
rm -Rf ~/dot-files
