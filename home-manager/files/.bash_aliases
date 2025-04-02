#!/usr/bin/env bash
###
# File = .bash_aliases
# Author = Leopold Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2025 Leopold Meinel & contributors
# SPDX ID = MIT
# URL = https://opensource.org/licenses/MIT
# -----
###

# doas
alias doas='/usr/bin/doas '
alias sudo='/usr/bin/sudo '

# Rust core-utils aliases
alias eza='/usr/bin/eza -la --color=automatic'
alias bat='/usr/bin/bat --decorations auto --color auto'
alias rg='/usr/bin/rg -s --color auto'
alias fd='/usr/bin/fd -Hs -c auto'
alias hyperfine='/usr/bin/hyperfine -w 3 -r 12 --style auto'

# xdg-ninja recommendations
alias adb='HOME="${XDG_DATA_HOME}"/android /usr/bin/adb'
alias wget='/usr/bin/wget --hsts-file="${XDG_DATA_HOME}"/wget-hsts'
