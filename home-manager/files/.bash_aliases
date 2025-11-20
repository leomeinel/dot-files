#!/usr/bin/env bash
###
# File: .bash_aliases
# Author: Leopold Johannes Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2025 Leopold Johannes Meinel & contributors
# SPDX ID: Apache-2.0
# URL: https://www.apache.org/licenses/LICENSE-2.0
###

# Aliases for sudo/doas to also use aliases
alias doas='/usr/bin/doas '
alias sudo='/usr/bin/sudo '

# Rust core-utils
alias bat='/usr/bin/bat --decorations auto --color auto'
alias eza='/usr/bin/eza -lag --color=automatic'
alias ll='/usr/bin/eza -lag --color=automatic'
alias fd='/usr/bin/fd -Hs -c auto'
alias hyperfine='/usr/bin/hyperfine -w 3 -r 12 --style auto'
alias rg='/usr/bin/rg -s --color auto'

# xdg-ninja recommendations
alias adb='HOME="${XDG_DATA_HOME}"/android command /usr/bin/adb'
alias wget='/usr/bin/wget --hsts-file="${XDG_DATA_HOME}"/wget-hsts'

# Miscellaneous programs
alias java='/usr/bin/java -Djava.util.prefs.userRoot=${XDG_CONFIG_HOME}/java'
