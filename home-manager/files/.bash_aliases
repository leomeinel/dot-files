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

# Rust core-utils aliases
eza() {
    /usr/bin/eza -la --color=automatic "${@}"
}
bat() {
    /usr/bin/bat --decorations auto --color auto "${@}"
}
rg() {
    /usr/bin/rg -s --color auto "${@}"
}
fd() {
    /usr/bin/fd -Hs -c auto "${@}"
}
hyperfine() {
    /usr/bin/hyperfine -w 3 -r 12 --style auto "${@}"
}

# xdg-ninja recommendations
adb() {
    HOME="${XDG_DATA_HOME}"/android /usr/bin/adb "${@}"
}
wget() {
    /usr/bin/wget --hsts-file="${XDG_DATA_HOME}"/wget-hsts "${@}"
}
