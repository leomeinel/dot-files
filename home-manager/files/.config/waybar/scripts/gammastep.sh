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
	if [[ -z "${1}" ]]; then
		/usr/bin/killall gammastep >/dev/null 2>&1 || true
	fi
	STATUS="deactivated"
else
	{
		/usr/bin/gammastep -P &
	} >/dev/null 2>&1
	STATUS="activated"
fi
/usr/bin/echo "{\"class\": \"${STATUS}\"}"
