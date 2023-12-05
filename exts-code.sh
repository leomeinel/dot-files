#!/usr/bin/env bash
###
# File: exts-code.sh
# Author: Leopold Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2023 Leopold Meinel & contributors
# SPDX ID: GPL-3.0-or-later
# URL: https://www.gnu.org/licenses/gpl-3.0-standalone.html
# -----
###

# Install vscodium extensions
vscodium --list-extensions | xargs -n 1 vscodium --uninstall-extension
xargs -n 1 vscodium --install-extension <~/dot-files/exts-code.txt

# Fail on error
set -e

# Remove repo
rm -rf ~/dot-files
