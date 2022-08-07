#!/bin/sh

mkdir -p "$HOME"/Images/screenshot
cp -R ./.local ./Images ./.bashrc ./.gitconfig ./.Xresources "$HOME"/
rm -Rf "$HOME"/dot-files
