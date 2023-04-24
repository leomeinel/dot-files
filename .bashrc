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
complete -cf doas

# If GUI isn't available, don't do anything
[[ -z "$XDG_CURRENT_DESKTOP" ]] &&
    return

# List number of outdated packages
[[ "$(checkupdates | wc -l)" -gt 0 ]] &&
    echo -e "\e[31m$(checkupdates | wc -l)\e[0m packages are out of date!"

# Prompt
eval "$(starship init bash)"
