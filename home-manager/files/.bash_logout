#!/usr/bin/env bash

# Stop ssh-agent if it is started
[[ -n "${SSH_AUTH_SOCK}" ]] &&
    eval "$(/usr/bin/ssh-agent -k)"

# Clear screen
[[ "${SHLVL}" -eq 1 ]] &&
    /usr/bin/clear

# Avoid non 0 exit status
true
