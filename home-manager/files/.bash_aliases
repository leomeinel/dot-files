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

# Aliases for sudo/doas to also use functions
alias doas="/usr/bin/doas "
alias sudo="/usr/bin/sudo "

# Rust core-utils
eza() {
    command /usr/bin/eza -la --color=automatic "${@}"
}
bat() {
    command /usr/bin/bat --decorations auto --color auto "${@}"
}
rg() {
    command /usr/bin/rg -s --color auto "${@}"
}
fd() {
    command /usr/bin/fd -Hs -c auto "${@}"
}
hyperfine() {
    command /usr/bin/hyperfine -w 3 -r 12 --style auto "${@}"
}

# xdg-ninja recommendations
adb() {
    HOME="${XDG_DATA_HOME}"/android command /usr/bin/adb "${@}"
}
wget() {
    command /usr/bin/wget --hsts-file="${XDG_DATA_HOME}"/wget-hsts "${@}"
}
