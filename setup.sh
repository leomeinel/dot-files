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

if [[ -n "${1}" ]] >/dev/null 2>&1; then
    nix run home-manager/release-"$NIX_VERSION" -- init --switch -b "bak" --flake "$SCRIPT_DIR/#$1"
else
    echo "ERROR: You have to use a user from $SCRIPT_DIR/flake.nix as first argument"
    exit 1
fi
