#!/usr/bin/env bash
###
# File: .ci-update.sh
# Author: Leopold Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2025 Leopold Meinel & contributors
# SPDX ID: MIT
# URL: https://opensource.org/licenses/MIT
# -----
###

# Source config
SCRIPT_DIR="$(dirname -- "$(readlink -f -- "$0")")"
source "$SCRIPT_DIR/../../install.conf"

# Fail on error
set -e

# Define functions
sed_exit() {
    echo "ERROR: 'sed' didn't replace, report this @"
    echo "       https://github.com/leomeinel/dot-files/issues"
    exit 1
}

# Install nix
sh <(curl -L https://nixos.org/nix/install) --daemon --yes
mkdir -p /etc/nix/
echo "experimental-features = nix-command flakes" >>/etc/nix/nix.conf
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

# Set current version of codium
CODIUM_VERSION="$(nix run nixpkgs#nix-search-cli -- -c $NIX_VERSION -n 'vscodium' | grep 'vscodium @' | awk '{print $3}' | awk 'BEGIN{FS=OFS="."}{$NF=""; NF--; print}')"
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
git submodule update --init --remote

# Generate codium-extensions.nix dynamically
nix develop --command bash -c "cargo run -q -- $SCRIPT_DIR/config.toml" >"$SCRIPT_DIR"/codium-extensions.nix

# FIXME: Sort top-level entries in codium-extensions.nix alphabetically before committing, this avoids confusing git diffs
