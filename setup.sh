#!/bin/sh

set -e
cp -R ~/dot-files/.bashrc ~/dot-files/.gitconfig ~/dot-files/.Xresources ~/
mkdir ~/.config
{
  echo "[Wallet]"
  echo "Enabled=false"
} > ~/.config/kwalletrc
if pacman -Qqd | grep -q "nvidia-settings"
then
nvidia-settings -r
echo "nvidia-settings -l &" > ~/.xprofile
fi
rm -Rf ~/dot-files
