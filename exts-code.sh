#!/usr/bin/env bash
###
# File: exts-code.sh
# Author: Leopold Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2025 Leopold Meinel & contributors
# SPDX ID: GPL-3.0-or-later
# URL: https://www.gnu.org/licenses/gpl-3.0-standalone.html
# -----
###

# Install codium extensions
codium --list-extensions | xargs -n 1 codium --uninstall-extension
# FIXME: Codium currently shows a warning that the extensions have changed on disk after installing.
#        This warning was shown in the nix,aur and flatpak version. I should probably report this to vscodium.
#        -> This causes some extensions not to be loaded because the necessary files have been deleted from disk.
#           To fix this, one has to reinstall it. It also seems like some extensions just don't get installed at all. This is probably because of a different error.
parallel --retries 10 codium --install-extension <~/dot-files/exts-code.txt

# Fail on error
set -e

# Remove repo
rm -rf ~/dot-files
