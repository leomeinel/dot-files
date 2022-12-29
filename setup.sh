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

# Create .ssh
mkdir -p ~/.ssh
chmod 700 ~/.ssh

# Create src
mkdir -p ~/src
chmod 700 ~/src

# Create XDG dirs
# Some of these exist, even tho the program isn't installed.
# This is on purpose in case one of the programs gets installed later on.
mkdir -p ~/.local/share/android
mkdir -p ~/.local/share/cargo
mkdir -p ~/.local/share/go
mkdir -p ~/.local/share/platformio
mkdir -p ~/.local/share/rustup
mkdir -p ~/.local/state/bash

# Create ~/.local/share/gnupg
mkdir -p ~/.local/share/gnupg
chmod 700 ~/.local/share/gnupg

# Initialize nvim
nvim --headless -c 'sleep 5' -c 'q!'

# Remove repo
rm -rf ~/dot-files
