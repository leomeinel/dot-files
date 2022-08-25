# Stop ssh-agent if it is started
[ -v "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -k)"
