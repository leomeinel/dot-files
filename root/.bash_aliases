#!/bin/bash
###
# File: .bash_aliases
# Author: Leopold Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2022 Leopold Meinel & contributors
# SPDX ID: GPL-3.0-or-later
# URL: https://www.gnu.org/licenses/gpl-3.0-standalone.html
# -----
###

#
# ~/.bash_aliases
#

# sudo
alias sudo='doas '
alias doas='doas '

# btrfs
alias df='btrfs fi df'

# Rust core-utils aliases
alias ls='exa -la --color=automatic'
alias cat='bat --decorations auto --color auto'
alias grep='rg -s --color auto'
alias find='fd -Hs -c auto'
alias du='dust'
alias ps='procs'
alias neofetch='macchina'
alias time='hyperfine --show-output --style auto'
alias bench='hyperfine -w 3 -r 12 --style auto'
