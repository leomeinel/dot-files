#!/bin/sh

cd
mkdir -p ./Images/screenshot
cp -R ./.local ./Images ./.bashrc ./.gitconfig ./.Xresources ./
rm -Rf ./dot-files
