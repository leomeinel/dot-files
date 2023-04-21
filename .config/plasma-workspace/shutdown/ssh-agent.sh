#!/bin/bash
###
# File: ssh-agent.sh
# Author: Leopold Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2023 Leopold Meinel & contributors
# SPDX ID: GPL-3.0-or-later
# URL: https://www.gnu.org/licenses/gpl-3.0-standalone.html
# -----
###

# Stop ssh-agent if it is started
[[ -n "$SSH_AUTH_SOCK" ]] &&
    eval "$(ssh-agent -k)"
