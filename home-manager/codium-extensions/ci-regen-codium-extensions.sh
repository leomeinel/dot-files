#!/usr/bin/env bash
###
# File: ci-regen-codium-extensions.sh
# Author: Leopold Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2025 Leopold Meinel & contributors
# SPDX ID: MIT
# URL: https://opensource.org/licenses/MIT
# -----
###

# INFO: This file is for CI and not needed for the installation

# Fail on error
set -e

# Define functions
log_err() {
    /usr/bin/logger -s -p local0.err <<<"'$(basename "${0}"):' ${*}"
}
sed_exit() {
    log_err "'sed' didn't replace, report this at https://github.com/leomeinel/dot-files/issues."
    exit 1
}

# Source config
SCRIPT_DIR="$(dirname -- "$(readlink -f -- "${0}")")"
# shellcheck source=/dev/null
. "${SCRIPT_DIR}"/../../install.conf

# Set current version of codium
CODIUM_VERSION="$(nix-search -c "${NIX_VERSION}" -n 'vscodium' | grep 'vscodium @' | awk '{print $3}' | awk 'BEGIN{FS=OFS="."}{$NF=""; NF--; print}')"
if [[ -n "${CODIUM_VERSION}" ]] >/dev/null 2>&1; then
    ## START sed
    FILE="${SCRIPT_DIR}"/config.toml
    STRING="vscode_version =.*"
    grep -q "${STRING}" "${FILE}" || sed_exit
    sed -i "s/${STRING}/vscode_version = \"${CODIUM_VERSION}\"/" "${FILE}"
    ## END sed
else
    log_err "Unable to get 'CODIUM_VERSION'."
    exit 1
fi

# Generate codium-extensions.nix dynamically
cd "${SCRIPT_DIR}"/nix4vscode
nix develop --command bash -c "cargo run -q -- ${SCRIPT_DIR}/config.toml -o ${SCRIPT_DIR}/codium-extensions.nix"
