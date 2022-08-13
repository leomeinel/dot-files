#!/bin/sh

set -e
cp -R ~/dot-files/Images ~/dot-files/.bashrc ~/dot-files/.gitconfig ~/dot-files/.Xresources ~/
rm -Rf ~/dot-files
{
  echo "[Wallet]"
  echo "Enabled=false"
} > ~/.config/kwalletrc
