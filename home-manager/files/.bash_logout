#!/usr/bin/env bash
###
# File: .bash_logout
# Author: Leopold Johannes Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2025 Leopold Johannes Meinel & contributors
# SPDX ID: Apache-2.0
# URL: https://www.apache.org/licenses/LICENSE-2.0
###

# Stop ssh-agent if it is started
[[ -n "${SSH_AUTH_SOCK}" ]] &&
    eval "$(/usr/bin/ssh-agent -k)"

# Clear screen
[[ "${SHLVL}" -eq 1 ]] &&
    /usr/bin/clear

# Avoid non 0 exit status
true
