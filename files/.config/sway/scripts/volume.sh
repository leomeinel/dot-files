#!/usr/bin/env bash
###
# File: volume.sh
# Author: Leopold Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2023 Leopold Meinel & contributors
# SPDX ID: GPL-3.0-or-later
# URL: https://www.gnu.org/licenses/gpl-3.0-standalone.html
# -----
###
CURRENT=$(/usr/bin/pactl get-sink-volume @DEFAULT_SINK@ | /usr/bin/grep -e '%' | /usr/bin/sed 's/ //g' | /usr/bin/cut -d "/" -f 2 | /usr/bin/sed 's/%//')

up() {
    new="$(($CURRENT + 5))"
    if [ $new -lt 100 ]; then
        /usr/bin/pactl set-sink-volume @DEFAULT_SINK@ $new%
    else
        /usr/bin/pactl set-sink-volume @DEFAULT_SINK@ 100%
    fi
}

down() {
    new="$(($CURRENT - 5))"
    if [ $new -gt 0 ]; then
        /usr/bin/pactl set-sink-volume @DEFAULT_SINK@ $new%
    else
        /usr/bin/pactl set-sink-volume @DEFAULT_SINK@ 0%
    fi
}

if [[ "$1" == "--up" ]]; then
    up
elif [[ "$1" == "--down" ]]; then
    down
fi
