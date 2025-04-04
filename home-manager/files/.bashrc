#!/usr/bin/env bash
###
# File = .bashrc
# Author = Leopold Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2025 Leopold Meinel & contributors
# SPDX ID = MIT
# URL = https://opensource.org/licenses/MIT
# -----
###

# Commands that should be applied only for interactive shells
[[ "${-}" != *i* ]] &&
    return

# Source ~/.bash_aliases
if [[ -f ~/.bash_aliases ]]; then
    # shellcheck source=/dev/null
    . ~/.bash_aliases
fi

# Key bindings
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# History
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=10000
HISTFILESIZE=100000
shopt -s histappend

# Line wrap on window resize
shopt -s checkwinsize

# Tab completion for doas
complete -F _command doas

# If GUI isn't available and not connected through ssh, don't do anything
[[ -z "${XDG_CURRENT_DESKTOP}" ]] && [[ -z "${SSH_CLIENT}" ]] && [[ -z "${SSH_TTY}" ]] &&
    return

# Prompt
if [[ "${TERM}" != "dumb" ]]; then
    eval "$(/usr/bin/starship init /bin/bash)"
fi

# List number of outdated packages
UPDATES="$(/usr/bin/timeout 4 /usr/bin/checkupdates 2>/dev/null | /usr/bin/wc -l)"
[[ "${UPDATES}" -gt 0 ]] &&
    /usr/bin/echo -e "\e[31m${UPDATES}\e[0m packages are out of date."

# Avoid non 0 exit status
true
