###
# File = .bash_logout
# Author = Leopold Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2025 Leopold Meinel & contributors
# SPDX ID = MIT
# URL = https://opensource.org/licenses/MIT
# -----
###

# Stop ssh-agent if it is started
[[ -n "${SSH_AUTH_SOCK}" ]] &&
    eval "$(/usr/bin/ssh-agent -k)"

# Clear screen
[[ "${SHLVL}" = 1 ]] &&
    /usr/bin/clear
