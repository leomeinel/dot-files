#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Include ~/.bashrc_aliases
[ -f ~/.bashrc_aliases ] &&
source ~/.bashrc_aliases

# Prompt
PS1='\u@\h \W\$ '

# Key bindings
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# ~/.bash_history
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

# Line wrap on window resize
shopt -s checkwinsize
