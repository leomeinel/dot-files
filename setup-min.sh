#!/bin/bash
###
# File: setup-min.sh
# Author: Leopold Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2023 Leopold Meinel & contributors
# SPDX ID: GPL-3.0-or-later
# URL: https://www.gnu.org/licenses/gpl-3.0-standalone.html
# -----
###

# Fail on error
set -e

# Copy dot-files
cp -R ~/dot-files/.bash_aliases ~/dot-files/.bash_logout ~/dot-files/.bash_profile ~/dot-files/.bashrc ~/
mkdir -p ~/.config
cp -R ~/dot-files/.config/git ~/dot-files/.config/macchina ~/dot-files/.config/nvim ~/dot-files/.config/starship.toml ~/.config/
source ~/.bash_profile

# Create .ssh
mkdir -p ~/.ssh
chmod 700 ~/.ssh

# Create src
mkdir -p ~/src
chmod 700 ~/src

# Create XDG dirs
mkdir -p "$XDG_DATA_HOME"/android
mkdir -p "$XDG_DATA_HOME"/cargo
mkdir -p "$XDG_DATA_HOME"/go
mkdir -p "$XDG_DATA_HOME"/platformio
mkdir -p "$XDG_DATA_HOME"/r/library
mkdir -p "$XDG_DATA_HOME"/rustup
mkdir -p "$XDG_STATE_HOME"/bash
mkdir -p "$XDG_STATE_HOME"/r
mkdir -p "$XDG_DATA_HOME"/gnupg
chmod 700 "$XDG_DATA_HOME"/gnupg

# Set default rust if rustup is installed
[[ -n $(which rustup) ]] >/dev/null 2>&1 &&
    rustup default stable

# Initialize nvim
nvim --headless -c 'sleep 5' -c 'q!' >/dev/null 2>&1

# Remove repo
rm -rf ~/dot-files
