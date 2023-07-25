#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] &&
    return

# Include ~/.bash_aliases
[[ -f ~/.bash_aliases ]] &&
    source ~/.bash_aliases

# Key bindings
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# History
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000
HISTFILESIZE=10000
shopt -s histappend

# Line wrap on window resize
shopt -s checkwinsize

# Tab completion for doas
complete -cf /usr/bin/doas

# If GUI isn't available, don't do anything
[[ -z "$XDG_CURRENT_DESKTOP" ]] &&
    return

# Prompt
eval "$(/usr/bin/starship init /usr/bin/bash)"

# List number of outdated packages
UPDATES="$(/usr/bin/timeout 6 /usr/bin/checkupdates 2> /dev/null | /usr/bin/wc -l)"
[[ "$UPDATES" -gt 0 ]] &&
    /usr/bin/echo -e "\e[31m$UPDATES\e[0m packages are out of date!"
