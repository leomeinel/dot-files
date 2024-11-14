#!/usr/bin/env bash
###
# File: pull-betterfox.sh
# Author: Leopold Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2024 Leopold Meinel & contributors
# SPDX ID: GPL-3.0-or-later
# URL: https://www.gnu.org/licenses/gpl-3.0-standalone.html
# -----
###

# Fail on error
set -e

# Set variables
TEMP_DIR=$(mktemp -d /tmp/pull-betterfox.sh-XXXXXX)
cd "$TEMP_DIR"

# Copy firefox user.js
curl -LJO https://raw.githubusercontent.com/yokoffing/Betterfox/refs/heads/main/user.js
CONFIG_DIR=$(/usr/bin/find ~/.mozilla/firefox/ -type d -name "*.default-release")
cp "$TEMP_DIR"/user.js "$CONFIG_DIR"

# Remove $TEMP_DIR
rm -rf "$TEMP_DIR"
