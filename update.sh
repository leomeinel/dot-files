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

if [[ -n "${1}" ]] >/dev/null 2>&1; then
    # Remove certain codium configs for home-manager to be able to regenerate them
    rm -rf ~/.vscode-oss ~/.vscode-R ~/.config/vscode-sqltools ~/.local/share/vscode-sqltools
    # Run home-manager
    nix run home-manager/release-"$NIX_VERSION" -- switch -b "bak" --flake "$SCRIPT_DIR/#$1"
    git add .
    git commit -m "Install dot-files - $DATE"
else
    echo "ERROR: You have to use a user from $SCRIPT_DIR/flake.nix as first argument"
    exit 1
fi
