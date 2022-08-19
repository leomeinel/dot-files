#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Include ~/.bashrc_aliases
[ -f ~/.bashrc_aliases ] &&
. ~/.bashrc_aliases

# Prompt
PS1='\u@\h \W\$ '

# Key bindings
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
