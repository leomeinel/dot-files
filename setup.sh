#!/bin/bash
###
# File: setup.sh
# Author: Leopold Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2023 Leopold Meinel & contributors
# SPDX ID: GPL-3.0-or-later
# URL: https://www.gnu.org/licenses/gpl-3.0-standalone.html
# -----
###

# Fail on error
set -e

# Define functions
sed_exit() {
    echo "ERROR: 'sed' didn't replace, report this @"
    echo "       https://github.com/leomeinel/dot-files/issues"
    exit 1
}

# Copy dot-files
cp -R ~/dot-files/.config ~/dot-files/.bash_aliases ~/dot-files/.bash_logout ~/dot-files/.bash_profile ~/dot-files/.bashrc ~/
source ~/.bash_profile

# Set screenshot dir
mkdir -p ~/Documents/Pictures/Screenshots
HOME=$(echo ~)
## START sed
FILE=~/.config/spectaclerc
STRING="^defaultSaveLocation=.*"
grep -q "$STRING" "$FILE" || sed_exit
sed -i "s|$STRING|defaultSaveLocation=file://$HOME/Documents/Pictures/Screenshots|" "$FILE"
## END sed

# Create .ssh
mkdir -p ~/.ssh
chmod 700 ~/.ssh

# Create src
mkdir -p ~/src
chmod 700 ~/src

# Create XDG dirs
mkdir -p ~/.local/share/android
mkdir -p ~/.local/share/cargo
mkdir -p ~/.local/share/go
mkdir -p ~/.local/share/platformio
mkdir -p ~/.local/share/rustup
mkdir -p ~/.local/state/bash

# Create ~/.local/share/gnupg
mkdir -p ~/.local/share/gnupg
chmod 700 ~/.local/share/gnupg

# Set default rust if rustup is installed
pacman -Qq rustup >/dev/null 2>&1 &&
    rustup default stable

# Initialize nvim
nvim --headless -c 'sleep 5' -c 'q!'

# Remove repo
rm -rf ~/dot-files
