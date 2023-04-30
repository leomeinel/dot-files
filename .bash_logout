#
# ~/.bash_logout
#

# Stop ssh-agent if it is started
[[ -n "$SSH_AUTH_SOCK" ]] &&
    eval "$(ssh-agent -k)"

# Clear screen
[[ "$SHLVL" = 1 ]] &&
    /usr/bin/clear
