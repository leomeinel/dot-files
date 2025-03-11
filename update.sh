#!/usr/bin/env bash
###
# File: update.sh
# Author: Leopold Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2025 Leopold Meinel & contributors
# SPDX ID: GPL-3.0-or-later
# URL: https://www.gnu.org/licenses/gpl-3.0-standalone.html
# -----
###

# Source config
SCRIPT_DIR="$(dirname -- "$(readlink -f -- "$0")")"
source "$SCRIPT_DIR/install.conf"

# Fail on error
set -e

# Remove codium configs for home-manager to be able to regenerate them
rm -rf ~/.vscode-oss ~/.vscode-R ~/.config/vscode-sqltools ~/.local/share/vscode-sqltools
# Update lock file
cd "$SCRIPT_DIR"
nix flake update --commit-lock-file
# Run home-manager
nix run home-manager/release-"$NIX_VERSION" -- switch -b "bak" --flake "$SCRIPT_DIR/#$USER"
DATE="$(date +"%F-%H")"
git add .
## Don't fail on error
set +e
git commit -m "Update dot-files - $DATE" ||
    git commit --no-gpg-sign -m "Update dot-files - $DATE"
## Fail on error
set -e

# Source ~/.bash_profile
source ~/.bash_profile

# Set default rust if rustup is installed
[[ -n $(which rustup) ]] >/dev/null 2>&1 &&
    rustup default stable

# Initialize nvim
nvim --headless -c 'sleep 5' -c 'q!' >/dev/null 2>&1

# Add nixpkgs channel
nix-channel --add https://nixos.org/channels/nixos-${nixos-version} nixpkgs || true
nix-channel --update
