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

# INFO: This file is not needed for the installation

# Source config
SCRIPT_DIR="$(dirname -- "$(readlink -f -- "${0}")")"
# shellcheck source=/dev/null
. "${SCRIPT_DIR}"/install.conf

# Fail on error
set -e

# Remove codium configs for home-manager to be able to regenerate them
rm -rf ~/.vscode-oss ~/.vscode-R ~/.config/vscode-sqltools ~/.local/share/vscode-sqltools
# Update lock file
cd "${SCRIPT_DIR}"
nix flake update --commit-lock-file
# Run home-manager
nix run home-manager/release-"${NIX_VERSION}" -- switch -b "bak" --flake "${SCRIPT_DIR}/#${USER}"

# Source ~/.bash_profile
# shellcheck source=/dev/null
. ~/.bash_profile

# Commit
DATE="$(date +"%F-%H")"
git add .
if ! git commit -m "Update dot-files - ${DATE}"; then
    git commit --no-gpg-sign -m "Update dot-files - ${DATE}" || true
fi

# Set default rust if rustup is installed
[[ -n "$(which rustup)" ]] >/dev/null 2>&1 &&
    rustup default stable

# Add nixpkgs channel
nix-channel --add https://nixos.org/channels/nixos-"${NIX_VERSION}" nixpkgs || true
nix-channel --update

# Notify user if script has finished successfully
echo "INFO: $(basename "${0}") has finished successfully."
