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
# Run home-manager
nix run home-manager/release-"$NIX_VERSION" -- switch -b "bak" --flake "$SCRIPT_DIR/#$USER"
DATE="$(/usr/bin/date +"%F-%H")"
cd "$SCRIPT_DIR"
git add .
git commit -m "Install dot-files - $DATE"
