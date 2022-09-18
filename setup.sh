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

# Copy dot-files
cp -R ~/dot-files/.config ~/dot-files/.bash_logout ~/dot-files/.bash_profile ~/dot-files/.bashrc ~/dot-files/.bashrc_aliases ~/dot-files/.gtkrc-2.0 ~/
chmod 744 ~/.bashrc_aliases
source ~/.bash_profile

# Create .ssh
mkdir ~/.ssh
chmod 700 ~/.ssh

# Create src
mkdir ~/src
chmod 700 ~/src

# Create XDG dirs
mkdir -p ~/.config/gtk-2.0
mkdir -p ~/.local/share/android
mkdir -p ~/.local/share/cargo
mkdir -p ~/.local/share/go
mkdir -p ~/.local/share/platformio
mkdir -p ~/.local/share/rustup
mkdir -p ~/.local/state/bash

## Create ~/.local/share/gnupg
mkdir -p ~/.local/share/gnupg
/usr/bin/find ~/.local/share/gnupg -type f -exec chmod 600 {} \;
/usr/bin/find ~/.local/share/gnupg -type d -exec chmod 700 {} \;

# Set default rust
rustup default stable

# Initialize nvim
nvim --headless -c 'sleep 5' -c 'q!'
