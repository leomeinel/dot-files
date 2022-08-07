#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## Standard
alias ls='ls --color=auto'
alias fixaudio='$HOME/.local/bin/pipewire.sh'
alias ssh-git='eval "$(ssh-agent -s)";ssh-add $HOME/.ssh/id_ed25519_github'
## Ease of Life
PS1='\u@\h \W\$ '

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
