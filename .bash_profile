# Start ssh-agent if it is not already started
[ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)"

# Update rust toolchains
rustup update

# Set environment variables
export JAVA_HOME="/usr/lib/jvm/default"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

## For application data/settings
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export ANDROID_HOME="$XDG_DATA_HOME"/android
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOPATH="$XDG_DATA_HOME"/go
export PLATFORMIO_CORE_DIR="$XDG_DATA_HOME"/platformio
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export HISTFILE="$XDG_STATE_HOME"/bash/history

# FIXME: When this is configured, gradle doesn't work correctly in vscodium
#export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle

# FIXME: Files still get generated in $HOME
#export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
#export RUSTUP_HOME="$XDG_DATA_HOME"/rustup