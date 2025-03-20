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

# btrfs
alias df='/usr/bin/btrfs fi df'

# Rust core-utils aliases
alias ls='/usr/bin/eza -la --color=automatic'
alias cat='/usr/bin/bat --decorations auto --color auto'
alias grep='/usr/bin/rg -s --color auto'
alias find='/usr/bin/fd -Hs -c auto'
alias du='/usr/bin/dust'
alias ps='/usr/bin/procs'
alias neofetch='/usr/bin/macchina'
alias bench='/usr/bin/hyperfine -w 3 -r 12 --style auto'

# xdg-ninja recommendations
alias adb='HOME="${XDG_DATA_HOME}"/android adb'
alias wget='wget --hsts-file="${XDG_DATA_HOME}"/wget-hsts'
