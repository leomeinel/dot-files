#!/bin/sh

set -e
cp -R ~/dot-files/.bashrc ~/dot-files/.gitconfig ~/dot-files/.Xresources ~/
mkdir ~/.config
{
  echo "[Wallet]"
  echo "Enabled=false"
} > ~/.config/kwalletrc
rm -Rf ~/dot-files
