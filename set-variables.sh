#!/usr/bin/env bash
###
# File: update-variables.sh
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

# Define functions
sed_exit() {
    echo "ERROR: 'sed' didn't replace, report this @"
    echo "       https://github.com/leomeinel/dot-files/issues"
    exit 1
}

# flake.nix
FILE="$SCRIPT_DIR/flake.nix"
STRING="REPLACE_NIX_VERSION"
grep -q "$STRING" "$FILE" || sed_exit
sed -i "s|$STRING|$NIX_VERSION|g" "$FILE"
# home-manager/common-home-cli.nix
FILE="$SCRIPT_DIR/home-manager/common-home-cli.nix"
STRING="REPLACE_NIX_VERSION"
grep -q "$STRING" "$FILE" || sed_exit
sed -i "s|$STRING|$NIX_VERSION|g" "$FILE"
# home-manager/common-home-gui.nix
FILE="$SCRIPT_DIR/home-manager/common-home-gui.nix"
STRING="REPLACE_NIX_VERSION"
grep -q "$STRING" "$FILE" || sed_exit
sed -i "s|$STRING|$NIX_VERSION|g" "$FILE"
# home-manager/configs/GUESTUSER.nix
FILE="$SCRIPT_DIR/home-manager/configs/GUESTUSER.nix"
STRING="REPLACE_GUESTUSER"
grep -q "$STRING" "$FILE" || sed_exit
sed -i "s|$STRING|$GUESTUSER|g" "$FILE"
# home-manager/configs/HOMEUSER.nix
FILE="$SCRIPT_DIR/home-manager/configs/HOMEUSER.nix"
STRING="REPLACE_HOMEUSER"
grep -q "$STRING" "$FILE" || sed_exit
sed -i "s|$STRING|$HOMEUSER|g" "$FILE"
# home-manager/configs/SYSUSER.nix
FILE="$SCRIPT_DIR/home-manager/configs/SYSUSER.nix"
STRING="REPLACE_SYSUSER"
grep -q "$STRING" "$FILE" || sed_exit
sed -i "s|$STRING|$SYSUSER|g" "$FILE"
# home-manager/configs/VIRTUSER.nix
FILE="$SCRIPT_DIR/home-manager/configs/VIRTUSER.nix"
STRING="REPLACE_VIRTUSER"
grep -q "$STRING" "$FILE" || sed_exit
sed -i "s|$STRING|$VIRTUSER|g" "$FILE"
# home-manager/configs/YOUTUBEUSER.nix
FILE="$SCRIPT_DIR/home-manager/configs/YOUTUBEUSER.nix"
STRING="REPLACE_YOUTUBEUSER"
grep -q "$STRING" "$FILE" || sed_exit
sed -i "s|$STRING|$YOUTUBEUSER|g" "$FILE"
