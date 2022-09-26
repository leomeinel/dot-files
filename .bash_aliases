#
# ~/.bash_aliases
#

# sudo
alias sudo='doas'

# btrfs
alias df='btrfs fi df'

# Rust core-utils aliases
alias ls='exa -la --color=automatic'
alias cat='bat --decorations auto --color auto'
alias grep='rg -s --color auto'
alias find='fd -Hs -c auto'
alias du='dust'
alias ps='procs'
alias neofetch='macchina'
alias time='hyperfine --show-output --style auto'
alias bench='hyperfine -w 3 -r 12 --style auto'
