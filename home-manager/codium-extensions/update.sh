#!/usr/bin/env bash
###
# File: update.sh
# Author: Leopold Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2025 Leopold Meinel & contributors
# SPDX ID: MIT
# URL: https://opensource.org/licenses/MIT
# -----
###

# FIXME: This should be a CI/CD pipeline.
#        TODO: Configure build environemnt, Get latest nix CODIUM_VERSION dynamically, ...

# Source config
SCRIPT_DIR="$(dirname -- "$(readlink -f -- "$0")")"

# Fail on error
set -e

# Define functions
sed_exit() {
    echo "ERROR: 'sed' didn't replace, report this @"
    echo "       https://github.com/leomeinel/dot-files/issues"
    exit 1
}

# Set current version of codium
CODIUM_VERSION="$(codium -v | head -n 1)"
if [[ -n "${CODIUM_VERSION}" ]] >/dev/null 2>&1; then
    ## START sed
    FILE="$SCRIPT_DIR"/config.toml
    STRING="vscode_version =.*"
    grep -q "$STRING" "$FILE" || sed_exit
    sed -i "s/$STRING/vscode_version = \"$CODIUM_VERSION\"/" "$FILE"
    ## END sed
else
    echo "ERROR: Unable to get CODIUM_VERSION"
    exit 1
fi

# Get latest submodule of nix4vscode
cd "$SCRIPT_DIR"/nix4vscode
git submodule update --remote

# Generate codium-extensions.nix dynamically
nix develop --command bash -c "cargo run -q -- $SCRIPT_DIR/config.toml" >"$SCRIPT_DIR"/codium-extensions.nix
