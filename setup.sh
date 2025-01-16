#!/usr/bin/env bash
###
# File: setup.sh
# Author: Leopold Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2025 Leopold Meinel & contributors
# SPDX ID: GPL-3.0-or-later
# URL: https://www.gnu.org/licenses/gpl-3.0-standalone.html
# -----
###

# Fail on error
set -e

# Set variables
SCRIPT_DIR="$(dirname -- "$(readlink -f -- "$0")")"
cd "$SCRIPT_DIR"

# Define functions
sed_exit() {
    echo "ERROR: 'sed' didn't replace, report this @"
    echo "       https://github.com/leomeinel/dot-files/issues"
    exit 1
}

# Copy dot-files
cp -R "$SCRIPT_DIR"/.config "$SCRIPT_DIR"/.bash_aliases "$SCRIPT_DIR"/.bash_logout "$SCRIPT_DIR"/.bash_profile "$SCRIPT_DIR"/.bashrc ~/
rsync -rpq --mkpath "$SCRIPT_DIR"/.local/ ~/.local/
source ~/.bash_profile

# Copy firefox user.js
chmod +x ~/.local/bin/pull-betterfox.sh
~/.local/bin/pull-betterfox.sh

# Set keyboard layout for sway
LAYOUT="$(localectl status | grep "X11 Layout:" | awk '{print $3}')"
## START sed
FILE=~/.config/sway/config.d/input
##
[[ -f "$FILE" ]] && [[ -n "$LAYOUT" ]] &&
    {
        ##
        STRING="^    xkb_layout .*"
        grep -q "$STRING" "$FILE" || sed_exit
        sed -i "s/$STRING/    xkb_layout $LAYOUT/" "$FILE"
        ## END sed
    }

# Create screenshot dir
mkdir -p ~/Documents/Pictures/Screenshots

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

# Install R packages
if [[ -n $(which R) ]] >/dev/null 2>&1; then
    R -e 'install.packages(c("devtools", "lintr", "httpgd", "languageserver", "rmarkdown"))' >/dev/null 2>&1
    R -e 'install.packages("vscDebugger", repos = "https://manuelhentschel.r-universe.dev")' >/dev/null 2>&1
fi

# Remove repo
rm -rf "$SCRIPT_DIR"
