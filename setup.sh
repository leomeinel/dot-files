#!/usr/bin/env bash
###
# File = setup.sh
# Author = Leopold Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2025 Leopold Meinel & contributors
# SPDX ID = MIT
# URL = https://opensource.org/licenses/MIT
# -----
###

# Fail on error
set -e

# Define functions
log_err() {
    /usr/bin/logger -s -p local0.err <<<"$(basename "${0}"): ${*}"
}
awk_exit() {
    log_err "'awk' didn't replace, report this at https://github.com/leomeinel/dot-files/issues."
    exit 1
}
sed_exit() {
    log_err "'sed' didn't replace, report this at https://github.com/leomeinel/dot-files/issues."
    exit 1
}

# Source config
SCRIPT_DIR="$(dirname -- "$(readlink -f -- "${0}")")"
# shellcheck source=/dev/null
. "${SCRIPT_DIR}"/install.conf

# Set variables
## flake.nix
## START sed
FILE="${SCRIPT_DIR}/flake.nix"
STRING="REPLACE_NIX_VERSION"
grep -q "${STRING}" "${FILE}" || sed_exit
sed -i "s|${STRING}|${NIX_VERSION}|g" "${FILE}"
[[ -n "${SYSUSER}" ]] &&
    {
        STRING="REPLACE_SYSUSER"
        grep -q "${STRING}" "${FILE}" || sed_exit
        sed -i "s|${STRING}|${SYSUSER}|g" "${FILE}"
    }
[[ -n "${GUESTUSER}" ]] &&
    {
        STRING="REPLACE_GUESTUSER"
        grep -q "${STRING}" "${FILE}" || sed_exit
        sed -i "s|${STRING}|${GUESTUSER}|g" "${FILE}"
    }
[[ -n "${HOMEUSER}" ]] &&
    {
        STRING="REPLACE_HOMEUSER"
        grep -q "${STRING}" "${FILE}" || sed_exit
        sed -i "s|${STRING}|${HOMEUSER}|g" "${FILE}"
    }
[[ -n "${VIRTUSER}" ]] &&
    {
        STRING="REPLACE_VIRTUSER"
        grep -q "${STRING}" "${FILE}" || sed_exit
        sed -i "s|${STRING}|${VIRTUSER}|g" "${FILE}"
    }
[[ -n "${WORKUSER}" ]] &&
    {
        STRING="REPLACE_WORKUSER"
        grep -q "${STRING}" "${FILE}" || sed_exit
        sed -i "s|${STRING}|${WORKUSER}|g" "${FILE}"
    }
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
STRING="REPLACE_GIT_SIGNINGKEY"
grep -q "${STRING}" "${FILE}" || sed_exit
sed -i "s|${STRING}|${GIT_SIGNINGKEY}|g" "${FILE}"
STRING="REPLACE_GIT_GPGSIGN"
grep -q "${STRING}" "${FILE}" || sed_exit
sed -i "s|${STRING}|${GIT_GPGSIGN}|g" "${FILE}"
## END sed
## home-manager/files/.config/sway/config.d/input
## START sed
KEYLAYOUT="$(localectl status | grep "X11 Layout:" | awk '{print $3}')"
FILE="${SCRIPT_DIR}/home-manager/files/.config/sway/config.d/input"
STRING="REPLACE_KEYLAYOUT"
grep -q "${STRING}" "${FILE}" || sed_exit
sed -i "s|${STRING}|${KEYLAYOUT}|g" "${FILE}"
## END sed
## home-manager/files/.config/sway/config.d/autostart
## START awk
FILE="${SCRIPT_DIR}/home-manager/files/.config/sway/config.d/autostart"
STRING="REPLACE_SWAY_AUTOSTART"
grep -q "${STRING}" "${FILE}" || awk_exit
tmpfile="$(mktemp /tmp/dot-files-XXXXXX)"
cp "${FILE}" "${tmpfile}" &&
    awk -v a="${STRING}" -v b="${SWAY_AUTOSTART}" '{gsub(a,b)}1' "${tmpfile}" >"${FILE}"
## END awk
## home-manager/files/.config/sway/config.d/output
## START awk
FILE="${SCRIPT_DIR}/home-manager/files/.config/sway/config.d/output"
STRING="REPLACE_SWAY_OUTPUT"
grep -q "${STRING}" "${FILE}" || awk_exit
tmpfile="$(mktemp /tmp/dot-files-XXXXXX)"
cp "${FILE}" "${tmpfile}" &&
    awk -v a="${STRING}" -v b="${SWAY_OUTPUT}" '{gsub(a,b)}1' "${tmpfile}" >"${FILE}"
## END awk
## home-manager/files/.config/swaync/config.json
## START sed
FILE="${SCRIPT_DIR}/home-manager/files/.config/swaync/config.json"
STRING="REPLACE_BACKLIGHT_DEVICE"
grep -q "${STRING}" "${FILE}" || sed_exit
sed -i "s|${STRING}|${BACKLIGHT_DEVICE}|g" "${FILE}"
## END sed
## home-manager/configs/SYSUSER.nix
[[ -n "${SYSUSER}" ]] &&
    {
        ## START sed
        FILE="${SCRIPT_DIR}/home-manager/configs/SYSUSER.nix"
        STRING="REPLACE_SYSUSER"
        grep -q "${STRING}" "${FILE}" || sed_exit
        sed -i "s|${STRING}|${SYSUSER}|g" "${FILE}"
        ## END sed
    }
## home-manager/configs/GUESTUSER.nix
[[ -n "${GUESTUSER}" ]] &&
    {
        ## START sed
        FILE="${SCRIPT_DIR}/home-manager/configs/GUESTUSER.nix"
        STRING="REPLACE_GUESTUSER"
        grep -q "${STRING}" "${FILE}" || sed_exit
        sed -i "s|${STRING}|${GUESTUSER}|g" "${FILE}"
        ## END sed
    }
## home-manager/configs/HOMEUSER.nix
[[ -n "${HOMEUSER}" ]] &&
    {
        ## START sed
        FILE="${SCRIPT_DIR}/home-manager/configs/HOMEUSER.nix"
        STRING="REPLACE_HOMEUSER"
        grep -q "${STRING}" "${FILE}" || sed_exit
        sed -i "s|${STRING}|${HOMEUSER}|g" "${FILE}"
        ## END sed
    }
## home-manager/configs/VIRTUSER.nix
[[ -n "${VIRTUSER}" ]] &&
    {
        ## START sed
        FILE="${SCRIPT_DIR}/home-manager/configs/VIRTUSER.nix"
        STRING="REPLACE_VIRTUSER"
        grep -q "${STRING}" "${FILE}" || sed_exit
        sed -i "s|${STRING}|${VIRTUSER}|g" "${FILE}"
        ## END sed
    }
## home-manager/configs/WORKUSER.nix
[[ -n "${WORKUSER}" ]] &&
    {
        ## START sed
        FILE="${SCRIPT_DIR}/home-manager/configs/WORKUSER.nix"
        STRING="REPLACE_WORKUSER"
        grep -q "${STRING}" "${FILE}" || sed_exit
        sed -i "s|${STRING}|${WORKUSER}|g" "${FILE}"
        ## END sed
    }

# Remove codium configs for home-manager to be able to regenerate them
rm -rf ~/.vscode-oss ~/.vscode-R ~/.config/vscode-sqltools ~/.local/share/vscode-sqltools
rm -rf ~/.config/VSCodium
# Run home-manager
nix run home-manager/release-"${NIX_VERSION}" -- switch -b "bak" --flake "${SCRIPT_DIR}/#${USER}"

# Source ~/.bash_profile
# shellcheck source=/dev/null
. ~/.bash_profile

# Commit
DATE="$(date +"%FT%H-%M-%S")"
cd "${SCRIPT_DIR}"
git add .
git commit --no-gpg-sign -m "Install dot-files - ${DATE}"

# Set default rust if rustup is installed
[[ -n "$(which rustup)" ]] >/dev/null 2>&1 &&
    rustup default stable

# Add nixpkgs channel
nix-channel --add https://nixos.org/channels/nixos-"${NIX_VERSION}" nixpkgs || true
nix-channel --update

# Notify user if script has finished successfully
echo "'$(basename "${0}")' has finished successfully."
