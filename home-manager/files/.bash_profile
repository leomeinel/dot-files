#!/usr/bin/env bash
###
# File = .bash_profile
# Author = Leopold Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2025 Leopold Meinel & contributors
# SPDX ID = MIT
# URL = https://opensource.org/licenses/MIT
# -----
###

# Source hm-session-vars.sh
[[ -f ~/.local/state/nix/profile/etc/profile.d/hm-session-vars.sh ]] &&
    {
        # shellcheck source=/dev/null
        . ~/.local/state/nix/profile/etc/profile.d/hm-session-vars.sh
    }

# Set environment variables
export JAVA_HOME=/usr/lib/jvm/default
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=${XDG_CONFIG_HOME}/java"
export MYSQL_HOME=/var/lib/mysql
export PAGER=/usr/bin/less
export VISUAL=nvim
export MANPAGER="/bin/sh -c '/usr/bin/col -bx | bat -l man -p'"
export MANROFFOPT="-c"
export ANDROID_HOME="${XDG_DATA_HOME}"/android
export ANDROID_USER_HOME="${XDG_DATA_HOME}"/android
export CARGO_HOME="${XDG_DATA_HOME}"/cargo
export GNUPGHOME="${XDG_DATA_HOME}"/gnupg
export GOPATH="${XDG_DATA_HOME}"/go
export GRADLE_USER_HOME="${XDG_DATA_HOME}"/gradle
export HISTFILE="${XDG_STATE_HOME}"/bash/history
export PARALLEL_HOME="${XDG_CONFIG_HOME}"/parallel
export PLATFORMIO_CORE_DIR="${XDG_DATA_HOME}"/platformio
export R_ENVIRON_USER="${XDG_CONFIG_HOME}"/r/.Renviron
export RUSTUP_HOME="${XDG_DATA_HOME}"/rustup
export SCREENRC="${XDG_CONFIG_HOME}"/screen/screenrc
export TEXMFVAR="${XDG_CACHE_HOME}"/texlive/texmf-var

# Commands that should be applied only for interactive shells.
[[ $- != *i* ]] && return

# Start ssh-agent if it is not already started
[[ -z "${SSH_AUTH_SOCK}" ]] &&
    eval "$(/usr/bin/ssh-agent -s)" >/dev/null 2>&1

# Update rust toolchains if rustup is installed
[[ -n $(/usr/bin/which rustup) ]] >/dev/null 2>&1 &&
    rustup update >/dev/null 2>&1

# Source ~/.bashrc
[[ -f ~/.bashrc ]] && [[ -n "${BASH_VERSION}" ]] &&
    {
        # shellcheck source=/dev/null
        . ~/.bashrc
    }

# If sway is not installed, don't do anything
[[ -z $(/usr/bin/which sway) ]] >/dev/null 2>&1 &&
    return

# If current user is root, don't do anything
[[ "${UID}" -eq 0 ]] &&
    return

# Start sway with environment variables
if [[ -z "${WAYLAND_DISPLAY}" ]] && [[ "${XDG_VTNR}" -eq 1 ]]; then
    export BROWSER=/usr/local/bin/librewolf
    export GTK_THEME="Arc-Dark"
    export MOZ_ENABLE_WAYLAND=1
    export MOZ_WEBRENDER=1
    export PDF_VIEWER=evince
    export QT_AUTO_SCREEN_SCALE_FACTOR=1
    export QT_QPA_PLATFORM="wayland;xcb"
    export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
    export TERMINAL=/usr/bin/alacritty
    export WLR_NO_HARDWARE_CURSORS=1
    export WLR_RENDERER_ALLOW_SOFTWARE=1
    export XDG_CURRENT_DESKTOP=sway
    export XDG_SESSION_DESKTOP=sway
    export XDG_SESSION_TYPE=wayland
    exec /usr/bin/sway
fi
