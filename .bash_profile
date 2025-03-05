#
# ~/.bash_profile
#

# Set environment variables
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_STATE_HOME="$HOME"/.local/state
export EDITOR=/usr/bin/nvim
export JAVA_HOME=/usr/lib/jvm/default
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export MYSQL_HOME=/var/lib/mysql
export PAGER=/usr/bin/less
export VISUAL=/usr/bin/nvim
## Set bat as MANPAGER if it is installed
if [[ -n $(/usr/bin/which bat) ]]; then
    export MANPAGER="/usr/bin/sh -c '/usr/bin/col -bx | /usr/bin/bat -l man -p'"
    export MANROFFOPT="-c"
fi
export ANDROID_HOME="$XDG_DATA_HOME"/android
export ANDROID_USER_HOME="$XDG_DATA_HOME"/android
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOPATH="$XDG_DATA_HOME"/go
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export HISTFILE="$XDG_STATE_HOME"/bash/history
export NIX_REMOTE=daemon
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export PLATFORMIO_CORE_DIR="$XDG_DATA_HOME"/platformio
export R_ENVIRON_USER="$XDG_CONFIG_HOME"/r/.Renviron
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc
export TEXMFVAR="$XDG_CACHE_HOME"/texlive/texmf-var
## Add to PATH
PATH="${PATH:+${PATH}:}$XDG_STATE_HOME/nix/profile/bin/"

# If not running interactively, don't do anything
[[ $- != *i* ]] &&
    return

# Start ssh-agent if it is not already started
[[ -z "$SSH_AUTH_SOCK" ]] &&
    eval "$(/usr/bin/ssh-agent -s)" >/dev/null 2>&1

# Update rust toolchains if rustup is installed
[[ -n $(/usr/bin/which rustup) ]] >/dev/null 2>&1 &&
    /usr/bin/rustup update >/dev/null 2>&1

# Source ~/.bashrc
[[ -f "$HOME"/.bashrc ]] && [[ -n "$BASH_VERSION" ]] &&
    source "$HOME"/.bashrc

# If sway is not installed, don't do anything
[[ -z $(/usr/bin/which sway) ]] >/dev/null 2>&1 &&
    return

# If current user is root, don't do anything
[[ "$UID" -eq 0 ]] &&
    return

# Start sway with environment variables
if [[ -z "${WAYLAND_DISPLAY}" ]] && [[ "${XDG_VTNR}" -eq 1 ]]; then
    export MOZ_ENABLE_WAYLAND=1
    export MOZ_WEBRENDER=1
    export GTK_THEME="Arc-Dark"
    export QT_AUTO_SCREEN_SCALE_FACTOR=1
    export QT_QPA_PLATFORM="wayland;xcb"
    export QT_QPA_PLATFORMTHEME=qt6ct
    export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
    export WLR_NO_HARDWARE_CURSORS=1
    export WLR_RENDERER_ALLOW_SOFTWARE=1
    export XCURSOR_SIZE=24
    export XDG_CURRENT_DESKTOP=sway
    export XDG_SESSION_DESKTOP=sway
    export XDG_SESSION_TYPE=wayland
    export TERMINAL=/usr/bin/alacritty
    exec /usr/bin/sway
fi
