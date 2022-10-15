#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Include ~/.bash_aliases
[ -f ~/.bash_aliases ] &&
    source ~/.bash_aliases

# Prompt
eval "$(starship init bash)"

# Key bindings
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# history
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000
HISTFILESIZE=10000
shopt -s histappend

# Line wrap on window resize
shopt -s checkwinsize

# doas tab completion
complete -cf doas
