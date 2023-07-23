#
# ~/.bash_profile
#

# Set environment variables
## Applications
export JAVA_HOME="/usr/lib/jvm/default"
export VISUAL=/usr/bin/nvim
export EDITOR=/usr/bin/nvim
### Set bat as MANPAGER if it is installed
[[ -n $(/usr/bin/which bat) ]] >/dev/null 2>&1 &&
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
## Application data/settings
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export ANDROID_HOME="$XDG_DATA_HOME"/android
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOPATH="$XDG_DATA_HOME"/go
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export HISTFILE="$XDG_STATE_HOME"/bash/history
export PLATFORMIO_CORE_DIR="$XDG_DATA_HOME"/platformio
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

# Start ssh-agent if it is not already started
[[ -z "$SSH_AUTH_SOCK" ]] &&
    eval "$(/usr/bin/ssh-agent -s)" >/dev/null 2>&1

# Update rust toolchains if rustup is installed
[[ -n $(/usr/bin/which rustup) ]] >/dev/null 2>&1 &&
    /usr/bin/rustup update >/dev/null 2>&1

# Source ~/.bashrc
[[ -f ~/.bashrc ]] &&
    source ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] &&
    return

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
    export QT_AUTO_SCREEN_SCALE_FACTOR=1
    export QT_QPA_PLATFORM=wayland
    export QT_QPA_PLATFORMTHEME=qt5ct
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
