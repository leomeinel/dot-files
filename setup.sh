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
SCRIPT_DIR="$(dirname -- "$(readlink -f -- "${0}")")"
# shellcheck source=/dev/null
. "${SCRIPT_DIR}"/install.conf

# Fail on error
set -e

# Define functions
awk_exit() {
    echo "ERROR: 'awk' didn't replace, report this @"
    echo "       https://github.com/leomeinel/dot-files/issues"
    exit 1
}
sed_exit() {
    echo "ERROR: 'sed' didn't replace, report this @"
    echo "       https://github.com/leomeinel/dot-files/issues"
    exit 1
}

# Set variables
## flake.nix
## START sed
FILE="${SCRIPT_DIR}/flake.nix"
STRING="REPLACE_NIX_VERSION"
grep -q "${STRING}" "${FILE}" || sed_exit
sed -i "s|${STRING}|${NIX_VERSION}|g" "${FILE}"
STRING="REPLACE_GUESTUSER"
grep -q "${STRING}" "${FILE}" || sed_exit
sed -i "s|${STRING}|${GUESTUSER}|g" "${FILE}"
STRING="REPLACE_HOMEUSER"
grep -q "${STRING}" "${FILE}" || sed_exit
sed -i "s|${STRING}|${HOMEUSER}|g" "${FILE}"
STRING="REPLACE_SYSUSER"
grep -q "${STRING}" "${FILE}" || sed_exit
sed -i "s|${STRING}|${SYSUSER}|g" "${FILE}"
STRING="REPLACE_VIRTUSER"
grep -q "${STRING}" "${FILE}" || sed_exit
sed -i "s|${STRING}|${VIRTUSER}|g" "${FILE}"
STRING="REPLACE_WORKUSER"
grep -q "${STRING}" "${FILE}" || sed_exit
sed -i "s|${STRING}|${WORKUSER}|g" "${FILE}"
## END sed
## home-manager/files/.config/git/config
## START sed
FILE="${SCRIPT_DIR}/home-manager/files/.config/git/config"
STRING="REPLACE_GIT_EMAIL"
grep -q "${STRING}" "${FILE}" || sed_exit
sed -i "s|${STRING}|${GIT_EMAIL}|g" "${FILE}"
STRING="REPLACE_GIT_NAME"
grep -q "${STRING}" "${FILE}" || sed_exit
sed -i "s|${STRING}|${GIT_NAME}|g" "${FILE}"
STRING="REPLACE_GIT_SIGNING_KEY"
grep -q "${STRING}" "${FILE}" || sed_exit
sed -i "s|${STRING}|${GIT_SIGNING_KEY}|g" "${FILE}"
## END sed
## home-manager/files/.config/sway/config.d/input
## START sed
KEYLAYOUT="$(localectl status | grep "X11 Layout:" | awk '{print $3}')"
FILE="${SCRIPT_DIR}/home-manager/files/.config/sway/config.d/input"
STRING="REPLACE_KEYLAYOUT"
grep -q "${STRING}" "${FILE}" || sed_exit
sed -i "s|${STRING}|${KEYLAYOUT}|g" "${FILE}"
## END sed
## home-manager/files/.config/sway/config.d/output
## START awk
FILE="${SCRIPT_DIR}/home-manager/files/.config/sway/config.d/output"
STRING="REPLACE_SWAY_OUTPUT"
grep -q "${STRING}" "${FILE}" || awk_exit
tmpfile="$(mktemp /tmp/dot-files-XXXXXX)"
cp "${FILE}" "${tmpfile}" &&
    awk -v a="${STRING}" -v b="${SWAY_OUTPUT}" '{gsub(a,b)}1' "${tmpfile}" >"${FILE}"
rm -f "${tmpfile}"
## END awk
## home-manager/configs/GUESTUSER.nix
## START sed
FILE="${SCRIPT_DIR}/home-manager/configs/GUESTUSER.nix"
STRING="REPLACE_GUESTUSER"
grep -q "${STRING}" "${FILE}" || sed_exit
sed -i "s|${STRING}|${GUESTUSER}|g" "${FILE}"
## END sed
## home-manager/configs/HOMEUSER.nix
## START sed
FILE="${SCRIPT_DIR}/home-manager/configs/HOMEUSER.nix"
STRING="REPLACE_HOMEUSER"
grep -q "${STRING}" "${FILE}" || sed_exit
sed -i "s|${STRING}|${HOMEUSER}|g" "${FILE}"
## END sed
## home-manager/configs/SYSUSER.nix
## START sed
FILE="${SCRIPT_DIR}/home-manager/configs/SYSUSER.nix"
STRING="REPLACE_SYSUSER"
grep -q "${STRING}" "${FILE}" || sed_exit
sed -i "s|${STRING}|${SYSUSER}|g" "${FILE}"
## END sed
## home-manager/configs/VIRTUSER.nix
## START sed
FILE="${SCRIPT_DIR}/home-manager/configs/VIRTUSER.nix"
STRING="REPLACE_VIRTUSER"
grep -q "${STRING}" "${FILE}" || sed_exit
sed -i "s|${STRING}|${VIRTUSER}|g" "${FILE}"
## END sed
## home-manager/configs/WORKUSER.nix
## START sed
FILE="${SCRIPT_DIR}/home-manager/configs/WORKUSER.nix"
STRING="REPLACE_WORKUSER"
grep -q "${STRING}" "${FILE}" || sed_exit
sed -i "s|${STRING}|${WORKUSER}|g" "${FILE}"
## END sed

# Remove codium configs for home-manager to be able to regenerate them
rm -rf ~/.vscode-oss ~/.vscode-R ~/.config/vscode-sqltools ~/.local/share/vscode-sqltools
rm -rf ~/.config/VSCodium
# Run home-manager
nix run home-manager/release-"${NIX_VERSION}" -- switch -b "bak" --flake "${SCRIPT_DIR}/#${USER}"

# Source ~/.bash_profile
# shellcheck source=/dev/null
. ~/.bash_profile

# Commit
DATE="$(date +"%F-%H")"
cd "${SCRIPT_DIR}"
git add .
if ! git commit -m "Install dot-files - ${DATE}"; then
    git commit --no-gpg-sign -m "Install dot-files - ${DATE}"
fi

# Set default rust if rustup is installed
[[ -n $(which rustup) ]] >/dev/null 2>&1 &&
    rustup default stable

# Add nixpkgs channel
nix-channel --add https://nixos.org/channels/nixos-"${NIX_VERSION}" nixpkgs || true
nix-channel --update
