#
# ~/.bash_profile
#

# Set environment variables
export JAVA_HOME="/usr/lib/jvm/default"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

## For application data/settings
## FIXME: Files still get generated in $HOME
## "$HOME"/.pki -> mv "$HOME"/.pki "$XDG_DATA_HOME"/pki (not supported by chromium): https://bugzilla.mozilla.org/show_bug.cgi?id=818686#c11
## "$HOME/.java" -> export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java (not supported by some applications): https://bugs.java.com/bugdatabase/view_bug.do?bug_id=JDK-8290140
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
    eval "$(ssh-agent -s)"

# Update rust toolchains if rustup is installed
pacman -Qq rustup >/dev/null 2>&1 &&
    rustup update

# Source ~/.bashrc
[[ -f ~/.bashrc ]] &&
    source ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] &&
    return

if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
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
    exec sway
fi
