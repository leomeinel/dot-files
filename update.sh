#!/usr/bin/env bash
###
# File: update.sh
# Author: Leopold Johannes Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2025 Leopold Johannes Meinel & contributors
# SPDX ID: Apache-2.0
# URL: https://www.apache.org/licenses/LICENSE-2.0
###

# INFO: This file is not needed for the installation

# Fail on error
set -e

# Source config
SCRIPT_DIR="$(dirname -- "$(readlink -f -- "${0}")")"
# shellcheck source=/dev/null
. "${SCRIPT_DIR}"/install.conf

# Remove codium configs for home-manager to be able to regenerate them
rm -rf ~/.vscode-oss ~/.vscode-R ~/.config/vscode-sqltools ~/.local/share/vscode-sqltools
# Update lock file
cd "${SCRIPT_DIR}"
nix flake update

# Add nixpkgs channel
nix-channel --add https://nixos.org/channels/nixos-"${NIX_VERSION}" nixpkgs || true
nix-channel --update

# Run home-manager
nix-shell -p home-manager --command "home-manager switch -b bak --flake ${SCRIPT_DIR}/#${USER}"

# Source ~/.bash_profile
# shellcheck source=/dev/null
. ~/.bash_profile

# Commit
DATE="$(date +"%FT%H-%M-%S")"
git add .
git commit --no-gpg-sign -m "Update dot-files - ${DATE}" || true

# Set default rust if rustup is installed and update
command -v rustup >/dev/null 2>&1 &&
    {
        rustup default stable
        rustup update
    }

# Notify user if script has finished successfully
echo "'$(basename "${0}")' has finished successfully."
