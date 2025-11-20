#!/usr/bin/env bash
###
# File: volume.sh
# Author: Leopold Johannes Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2025 Leopold Johannes Meinel & contributors
# SPDX ID: Apache-2.0
# URL: https://www.apache.org/licenses/LICENSE-2.0
###

CURRENT="$(/usr/bin/pactl get-sink-volume @DEFAULT_SINK@ | /usr/bin/grep -e '%' | /usr/bin/sed 's/ //g' | /usr/bin/cut -d "/" -f 2 | /usr/bin/sed 's/%//')"

up() {
    NEW="$((CURRENT + 5))"
    if [[ "${NEW}" -lt 100 ]]; then
        /usr/bin/pactl set-sink-volume @DEFAULT_SINK@ "${NEW}"%
    else
        /usr/bin/pactl set-sink-volume @DEFAULT_SINK@ 100%
    fi
}

down() {
    NEW="$((CURRENT - 5))"
    if [[ "${NEW}" -gt 0 ]]; then
        /usr/bin/pactl set-sink-volume @DEFAULT_SINK@ "${NEW}"%
    else
        /usr/bin/pactl set-sink-volume @DEFAULT_SINK@ 0%
    fi
}

if [[ "${1}" == "up" ]]; then
    up
elif [[ "${1}" == "down" ]]; then
    down
fi
