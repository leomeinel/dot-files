#
# ~/.bash_aliases
#

# doas
alias doas='/usr/bin/doas '
alias sudo='/usr/bin/sudo '

# btrfs
alias df='/usr/bin/btrfs fi df'

# Rust core-utils aliases
alias ls='/usr/bin/eza -la --color=automatic'
alias cat='/usr/bin/bat --decorations auto --color auto'
alias grep='/usr/bin/rg -s --color auto'
alias find='/usr/bin/fd -Hs -c auto'
alias du='/usr/bin/dust'
alias ps='/usr/bin/procs'
alias neofetch='/usr/bin/macchina'
alias bench='/usr/bin/hyperfine -w 3 -r 12 --style auto'
