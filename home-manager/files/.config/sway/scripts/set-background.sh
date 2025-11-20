#!/usr/bin/env bash
###
# File: set-background.sh
# Author: Leopold Johannes Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2025 Leopold Johannes Meinel & contributors
# SPDX ID: Apache-2.0
# URL: https://www.apache.org/licenses/LICENSE-2.0
###

# Fail on error
set -e

# Select random background
BACKGROUNDS=(
    cutefishos/wallpaper-2.jpg
    cutefishos/wallpaper-8.jpg
    cutefishos/wallpaper-9.jpg
    budgie/beacon-street-sunset.jpg
    budgie/canyon-wren.jpg
    budgie/oakland-zoo-otters.jpg
    budgie/perched-osprey.jpg
    budgie/tea-gardens.jpg
)
BACKGROUNDS_LENGTH="${#BACKGROUNDS[@]}"
for ((i = 0; i < BACKGROUNDS_LENGTH; i++)); do
    if [[ ! -f /usr/share/backgrounds/"${BACKGROUNDS[${i}]}" ]]; then
        unset 'BACKGROUNDS[${i}]'
        continue
    fi
    BACKGROUNDS=("${BACKGROUNDS[@]}")
done
BACKGROUND="$(/usr/bin/printf "%s\n" "${BACKGROUNDS[@]}" | /usr/bin/shuf -n 1)"

# Set background
/usr/bin/swaybg -i /usr/share/backgrounds/"${BACKGROUND}"
