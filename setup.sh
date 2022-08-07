#!/bin/sh

cd
mkdir -p ./Images/screenshot
cp -R ./dot-files/.local ./dot-files/Images ./dot-files/.bashrc ./dot-files/.gitconfig ./dot-files/.Xresources ./
rm -Rf ./dot-files
