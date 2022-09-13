# Start ssh-agent if it is not already started
[ -v "$SSH_AUTH_SOCK" ] || eval "$(ssh-agent -s)"

# Update rust toolchains
rustup update

# Set JAVA_HOME
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk"