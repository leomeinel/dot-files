#!/bin/bash
###
# File: setup.sh
# Author: Leopold Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2022 Leopold Meinel & contributors
# SPDX ID: GPL-3.0-or-later
# URL: https://www.gnu.org/licenses/gpl-3.0-standalone.html
# -----
###

# Fail on error
set -e

# Copy dot-files
cp -R ~/dot-files/.config ~/dot-files/.bash_logout ~/dot-files/.bash_profile ~/dot-files/.bashrc ~/dot-files/.bash_aliases ~/
source ~/.bash_profile

# Set screenshot dir
HOME=$(echo ~)
sed -i "s|defaultSaveLocation=.*|defaultSaveLocation=file://$HOME/Documents/Pictures/Screenshots|" ~/.config/spectaclerc

# Give KDE logout scripts correct permissions
chmod 744 ~/.config/plasma-workspace/shutdown/*.sh

# Create .ssh
mkdir ~/.ssh
chmod 700 ~/.ssh

# Create src
mkdir ~/src
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

# Set default rust
rustup default stable

# Initialize nvim
nvim --headless -c 'sleep 5' -c 'q!'
