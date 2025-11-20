#!/usr/bin/env bash
###
# File: gammastep.sh
# Author: Leopold Johannes Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2025 Leopold Johannes Meinel & contributors
# SPDX ID: Apache-2.0
# URL: https://www.apache.org/licenses/LICENSE-2.0
###

# Fail on error
set -e

# Toggle gammastep
if pgrep -x "gammastep" >/dev/null 2>&1; then
	if [[ -z "${1}" ]]; then
		/usr/bin/killall -9 -e gammastep >/dev/null 2>&1 || true
		STATUS="deactivated"
	else
		STATUS="activated"
	fi
else
	if [[ -z "${1}" ]]; then
		{
			/usr/bin/gammastep -P &
		} >/dev/null 2>&1
		STATUS="activated"
	else
		STATUS="deactivated"
	fi
fi
/usr/bin/echo "{\"alt\": \"${STATUS}\", \"class\": \"${STATUS}\", \"tooltip\": \"Toggle night light\"}"
