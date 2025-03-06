#!/usr/bin/env bash
###
# File: setup.sh
# Author: Leopold Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2025 Leopold Meinel & contributors
# SPDX ID: MIT
# URL: https://opensource.org/licenses/MIT
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

# Set variables
## flake.nix
## START sed
FILE="$SCRIPT_DIR/flake.nix"
STRING="REPLACE_NIX_VERSION"
grep -q "$STRING" "$FILE" || sed_exit
sed -i "s|$STRING|$NIX_VERSION|g" "$FILE"
STRING="REPLACE_GUESTUSER"
grep -q "$STRING" "$FILE" || sed_exit
sed -i "s|$STRING|$GUESTUSER|g" "$FILE"
STRING="REPLACE_HOMEUSER"
grep -q "$STRING" "$FILE" || sed_exit
sed -i "s|$STRING|$HOMEUSER|g" "$FILE"
STRING="REPLACE_SYSUSER"
grep -q "$STRING" "$FILE" || sed_exit
sed -i "s|$STRING|$SYSUSER|g" "$FILE"
STRING="REPLACE_VIRTUSER"
grep -q "$STRING" "$FILE" || sed_exit
sed -i "s|$STRING|$VIRTUSER|g" "$FILE"
STRING="REPLACE_YOUTUBEUSER"
grep -q "$STRING" "$FILE" || sed_exit
sed -i "s|$STRING|$YOUTUBEUSER|g" "$FILE"
## END sed
## home-manager/common-home-cli.nix
## START sed
FILE="$SCRIPT_DIR/home-manager/common-home-cli.nix"
STRING="REPLACE_GIT_SIGNING_KEY"
grep -q "$STRING" "$FILE" || sed_exit
sed -i "s|$STRING|$GIT_SIGNING_KEY|g" "$FILE"
## END sed
## home-manager/common-home-gui.nix
## START sed
FILE="$SCRIPT_DIR/home-manager/common-home-gui.nix"
STRING="REPLACE_GIT_SIGNING_KEY"
grep -q "$STRING" "$FILE" || sed_exit
sed -i "s|$STRING|$GIT_SIGNING_KEY|g" "$FILE"
## END sed
## home-manager/configs/GUESTUSER.nix
## START sed
FILE="$SCRIPT_DIR/home-manager/configs/GUESTUSER.nix"
STRING="REPLACE_GUESTUSER"
grep -q "$STRING" "$FILE" || sed_exit
sed -i "s|$STRING|$GUESTUSER|g" "$FILE"
## END sed
## home-manager/configs/HOMEUSER.nix
## START sed
FILE="$SCRIPT_DIR/home-manager/configs/HOMEUSER.nix"
STRING="REPLACE_HOMEUSER"
grep -q "$STRING" "$FILE" || sed_exit
sed -i "s|$STRING|$HOMEUSER|g" "$FILE"
## END sed
## home-manager/configs/SYSUSER.nix
## START sed
FILE="$SCRIPT_DIR/home-manager/configs/SYSUSER.nix"
STRING="REPLACE_SYSUSER"
grep -q "$STRING" "$FILE" || sed_exit
sed -i "s|$STRING|$SYSUSER|g" "$FILE"
## END sed
## home-manager/configs/VIRTUSER.nix
## START sed
FILE="$SCRIPT_DIR/home-manager/configs/VIRTUSER.nix"
STRING="REPLACE_VIRTUSER"
grep -q "$STRING" "$FILE" || sed_exit
sed -i "s|$STRING|$VIRTUSER|g" "$FILE"
## END sed
## home-manager/configs/YOUTUBEUSER.nix
## START sed
FILE="$SCRIPT_DIR/home-manager/configs/YOUTUBEUSER.nix"
STRING="REPLACE_YOUTUBEUSER"
grep -q "$STRING" "$FILE" || sed_exit
sed -i "s|$STRING|$YOUTUBEUSER|g" "$FILE"
## END sed

if [[ -n "${1}" ]] >/dev/null 2>&1; then
    # Remove codium configs for home-manager to be able to regenerate them
    rm -rf ~/.vscode-oss ~/.vscode-R ~/.config/vscode-sqltools ~/.local/share/vscode-sqltools
    rm -rf ~/.config/VSCodium
    # Run home-manager
    nix run home-manager/release-"$NIX_VERSION" -- switch -b "bak" --flake "$SCRIPT_DIR/#$1"
    DATE="$(/usr/bin/date +"%F-%H")"
    git add .
    git commit -m "Install dot-files - $DATE"
else
    echo "ERROR: You have to use a user from $SCRIPT_DIR/flake.nix as first argument"
    exit 1
fi
