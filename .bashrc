#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Include ~/.bashrc_aliases
[ -f ~/.bashrc_aliases ] &&
    source ~/.bash_aliases

# Prompt
eval "$(starship init bash)"

# Key bindings
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# ~/.bash_history
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000
HISTFILESIZE=10000
shopt -s histappend

# Line wrap on window resize
shopt -s checkwinsize

# doas tab completion
complete -cf doas

# List number of outdated packages
if [ "$(checkupdates | wc -l)" -gt 0 ]; then
    echo -e "\e[31m$(checkupdates | wc -l)\e[0m packages are out of date!"
fi
