#!/usr/bin/env bash
###
# File: input-graphics-tablet.sh
# Author: Leopold Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2025 Leopold Meinel & contributors
# SPDX ID: MIT
# URL: https://opensource.org/licenses/MIT
# -----
###

# Switch display for graphics tablets on workspace switch
swaymsg -t SUBSCRIBE -m '["workspace"]' | while read -r line; do
    OUTPUT="$(jq -r 'select(.change == "focus") | .current.output' <<<"${line}")"
    IDENTIFIERS=(
        "type:tablet_pad"
        "type:tablet_tool"
    )
    for identifier in "${IDENTIFIERS[@]}"; do
        swaymsg "input \"${identifier}\" map_to_output ${OUTPUT}"
        ## Maintain aspect ratio of 16:10 input region
        ## See: https://man.archlinux.org/man/sway-input.5#MAPPING_CONFIGURATION
        swaymsg "input \"${identifier}\" map_from_region 0x0 1x0.9"
    done
done
