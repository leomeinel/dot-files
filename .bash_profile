# Start ssh-agent if it is not already started
[ -v "$SSH_AUTH_SOCK" ] || eval "$(ssh-agent -s)"
