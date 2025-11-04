#!/usr/bin/env bash
###
# File: .bash_profile
# Author: Leopold Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2025 Leopold Meinel & contributors
# SPDX ID: MIT
# URL: https://opensource.org/licenses/MIT
# -----
###

# Source hm-session-vars.sh
if [[ -f ~/.local/state/nix/profile/etc/profile.d/hm-session-vars.sh ]]; then
    # shellcheck source=/dev/null
    . ~/.local/state/nix/profile/etc/profile.d/hm-session-vars.sh
fi

# Set environment variables
export ANDROID_HOME="${XDG_DATA_HOME}"/android
export ANDROID_USER_HOME="${XDG_DATA_HOME}"/android
export BROWSER=/usr/local/bin/librewolf
export CARGO_HOME="${XDG_DATA_HOME}"/cargo
# FIXME: Find a way to use an absolute path for nix packages here
export DIFFPROG="nvim -d"
export GNUPGHOME="${XDG_DATA_HOME}"/gnupg
export GOPATH="${XDG_DATA_HOME}"/go
export GRADLE_USER_HOME="${XDG_DATA_HOME}"/gradle
export HISTFILE="${XDG_STATE_HOME}"/bash/history
export JAVA_HOME=/usr/lib/jvm/default
export MANPAGER="/bin/sh -c '/usr/bin/col -bx | /usr/bin/bat -l man -p'"
export MANROFFOPT="-c"
export MYSQL_HOME=/var/lib/mysql
export NODE_REPL_HISTORY="${XDG_DATA_HOME}"/node_repl_history
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}"/npm/npmrc
export PAGER=/usr/bin/less
export PARALLEL_HOME="${XDG_CONFIG_HOME}"/parallel
export PDF_VIEWER=/usr/local/bin/papers
export PLATFORMIO_CORE_DIR="${XDG_DATA_HOME}"/platformio
export R_ENVIRON_USER="${XDG_CONFIG_HOME}"/r/Renviron
export RUSTUP_HOME="${XDG_DATA_HOME}"/rustup
export SCREENRC="${XDG_CONFIG_HOME}"/screen/screenrc
export TERMINAL=/usr/bin/alacritty
export TEXMFVAR="${XDG_CACHE_HOME}"/texlive/texmf-var
# FIXME: Find a way to use an absolute path for nix packages here
export VISUAL=nvim

# Commands that should be applied only for interactive shells
[[ "${-}" != *i* ]] &&
    return

# Set environment variables that need seperate declaration and assigning
GPG_TTY="$(tty)"
export GPG_TTY

# Start ssh-agent if it is not already started
[[ -z "${SSH_AUTH_SOCK}" ]] &&
    eval "$(/usr/bin/ssh-agent -s)" >/dev/null 2>&1

# Source ~/.bashrc
if [[ -f ~/.bashrc ]] && [[ -n "${BASH_VERSION}" ]]; then
    # shellcheck source=/dev/null
    . ~/.bashrc
fi

# If sway is not installed, don't do anything
[[ -z "$(/usr/bin/which sway)" ]] >/dev/null 2>&1 &&
    return

# If current user is root, don't do anything
[[ "${UID}" -eq 0 ]] &&
    return

# Start sway with environment variables
if [[ -z "${WAYLAND_DISPLAY}" ]] && [[ "${XDG_VTNR}" -eq 1 ]]; then
    export GTK_THEME="Fluent-Dark-compact"
    export GTK2_RC_FILES="${XDG_CONFIG_HOME}"/gtk-2.0/gtkrc
    export MOZ_ENABLE_WAYLAND=1
    export MOZ_WEBRENDER=1
    export QT_AUTO_SCREEN_SCALE_FACTOR=1
    export QT_QPA_PLATFORM="wayland;xcb"
    export QT_QPA_PLATFORMTHEME="gtk3"
    export QT_STYLE_OVERRIDE="breeze"
    export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
    export WLR_NO_HARDWARE_CURSORS=1
    export WLR_RENDERER_ALLOW_SOFTWARE=1
    export XDG_CURRENT_DESKTOP=sway
    export XDG_SESSION_DESKTOP=sway
    export XDG_SESSION_TYPE=wayland
    exec /usr/bin/sway
fi
