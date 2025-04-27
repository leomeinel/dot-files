#!/usr/bin/env bash
###
# File: .bash_aliases
# Author: Leopold Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2025 Leopold Meinel & contributors
# SPDX ID: MIT
# URL: https://opensource.org/licenses/MIT
# -----
###

# Aliases for sudo/doas to also use aliases
alias doas='/usr/bin/doas '
alias sudo='/usr/bin/sudo '

# Rust core-utils
alias bat='/usr/bin/bat --decorations auto --color auto'
alias eza='/usr/bin/eza -la --color=automatic'
alias ll='/usr/bin/eza -la --color=automatic'
alias fd='/usr/bin/fd -Hs -c auto'
alias hyperfine='/usr/bin/hyperfine -w 3 -r 12 --style auto'
alias rg='/usr/bin/rg -s --color auto'

# xdg-ninja recommendations
alias adb='HOME="${XDG_DATA_HOME}"/android command /usr/bin/adb'
alias wget='/usr/bin/wget --hsts-file="${XDG_DATA_HOME}"/wget-hsts'
