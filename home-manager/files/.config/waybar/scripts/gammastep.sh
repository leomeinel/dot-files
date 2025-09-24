#!/usr/bin/env bash
###
# File: gammastep.sh
# Author: Leopold Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2025 Leopold Meinel & contributors
# SPDX ID: MIT
# URL: https://opensource.org/licenses/MIT
# -----
###

# Fail on error
set -e

# Toggle gammastep
if pgrep "gammastep" >/dev/null 2>&1; then
	/usr/bin/killall gammastep >/dev/null 2>&1 || true
	/usr/bin/echo "deactivated"
else
	/usr/bin/gammastep -P &
	/usr/bin/echo "activated"
fi
