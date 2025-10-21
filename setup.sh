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

# flake.nix
## START sed
FILE="${SCRIPT_DIR}/flake.nix"
if [[ -n "${SYSUSER}" ]]; then
    STRING="REPLACE_SYSUSER"
    grep -q "${STRING}" "${FILE}" || sed_exit
    sed -i "s|${STRING}|${SYSUSER}|g" "${FILE}"
fi
if [[ -n "${GUESTUSER}" ]]; then
    STRING="REPLACE_GUESTUSER"
    grep -q "${STRING}" "${FILE}" || sed_exit
    sed -i "s|${STRING}|${GUESTUSER}|g" "${FILE}"
fi
if [[ -n "${HOMEUSER}" ]]; then
    STRING="REPLACE_HOMEUSER"
    grep -q "${STRING}" "${FILE}" || sed_exit
    sed -i "s|${STRING}|${HOMEUSER}|g" "${FILE}"
fi
if [[ -n "${VIRTUSER}" ]]; then
    STRING="REPLACE_VIRTUSER"
    grep -q "${STRING}" "${FILE}" || sed_exit
    sed -i "s|${STRING}|${VIRTUSER}|g" "${FILE}"
fi
if [[ -n "${WORKUSER}" ]]; then
    STRING="REPLACE_WORKUSER"
    grep -q "${STRING}" "${FILE}" || sed_exit
    sed -i "s|${STRING}|${WORKUSER}|g" "${FILE}"
fi
STRING="REPLACE_NIX_VERSION"
grep -q "${STRING}" "${FILE}" || sed_exit
sed -i "s|${STRING}|${NIX_VERSION}|g" "${FILE}"
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
STRING="REPLACE_BACKLIGHT_DEVICE"
grep -q "${STRING}" "${FILE}" || sed_exit
sed -i "s|${STRING}|${BACKLIGHT_DEVICE}|g" "${FILE}"
KEYLAYOUT="$(localectl status | grep "X11 Layout:" | awk '{print $3}')"
STRING="REPLACE_KEYLAYOUT"
grep -q "${STRING}" "${FILE}" || sed_exit
sed -i "s|${STRING}|${KEYLAYOUT}|g" "${FILE}"
## END sed
## START awk
## INFO: ${INDENT_STRING} is necessary because of the formatting of flake.nix
INDENT_STRING="          "
STRING="${INDENT_STRING}REPLACE_SWAY_AUTOSTART"
grep -q "${STRING}" "${FILE}" || awk_exit
tmpfile="$(mktemp /tmp/dot-files-XXXXXX)"
if cp "${FILE}" "${tmpfile}"; then
    # shellcheck disable=SC2001
    awk -v a="${STRING}" -v b="$(sed "s/^/${INDENT_STRING}/" <<<"${SWAY_AUTOSTART//\${/\'\'\${}")" '{gsub(a,b)}1' "${tmpfile}" >"${FILE}"
fi
STRING="${INDENT_STRING}REPLACE_SWAY_OUTPUT"
grep -q "${STRING}" "${FILE}" || awk_exit
tmpfile="$(mktemp /tmp/dot-files-XXXXXX)"
if cp "${FILE}" "${tmpfile}"; then
    # shellcheck disable=SC2001
    awk -v a="${STRING}" -v b="$(sed "s/^/${INDENT_STRING}/" <<<"${SWAY_OUTPUT//\${/\'\'\${}")" '{gsub(a,b)}1' "${tmpfile}" >"${FILE}"
fi
## End awk

# Remove codium configs for home-manager to be able to regenerate them
rm -rf ~/.vscode-oss ~/.vscode-R ~/.config/vscode-sqltools ~/.local/share/vscode-sqltools
rm -rf ~/.config/VSCodium

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
cd "${SCRIPT_DIR}"
git add .
git commit --no-gpg-sign -m "Install dot-files - ${DATE}"

# Set default rust if rustup is installed and update
[[ -n "$(which rustup)" ]] >/dev/null 2>&1 &&
    {
        rustup default stable
        rustup update
    }

# Notify user if script has finished successfully
echo "'$(basename "${0}")' has finished successfully."
