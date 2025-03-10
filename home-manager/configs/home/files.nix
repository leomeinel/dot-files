/*
  File = file.nix
  Author = Leopold Meinel (leo@meinel.dev)
  -----
  Copyright (c) 2025 Leopold Meinel & contributors
  SPDX ID = MIT
  URL = https://opensource.org/licenses/MIT
  -----
*/

{
  config,
  ...
}:

{
  # Files in $HOME
  files = {
    "${config.home.homeDirectory}/.bash_aliases" = {
      text = ''
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

        # xdg-ninja recommendations
        alias adb='HOME="$XDG_DATA_HOME"/android adb'
        alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
      '';
    };
    "${config.home.homeDirectory}/.bash_logout" = {
      text = ''
        #
        # ~/.bash_logout
        #

        # Stop ssh-agent if it is started
        [[ -n "$SSH_AUTH_SOCK" ]] &&
            eval "$(/usr/bin/ssh-agent -k)"

        # Clear screen
        [[ "$SHLVL" = 1 ]] &&
            /usr/bin/clear
      '';
    };
    "${config.home.homeDirectory}/.bash_profile" = {
      text = ''
        #
        # ~/.bash_profile
        #

        # Commands that should be applied only for interactive shells.
        [[ $- == *i* ]] || return

        # Start ssh-agent if it is not already started
        [[ -z "$SSH_AUTH_SOCK" ]] &&
            eval "$(/usr/bin/ssh-agent -s)" >/dev/null 2>&1

        # Update rust toolchains if rustup is installed
        [[ -n $(/usr/bin/which rustup) ]] >/dev/null 2>&1 &&
            /usr/bin/rustup update >/dev/null 2>&1

        # Source ~/.bashrc
        [[ -f "$HOME"/.bashrc ]] && [[ -n "$BASH_VERSION" ]] &&
            source "$HOME"/.bashrc

        # If sway is not installed, don't do anything
        [[ -z $(/usr/bin/which sway) ]] >/dev/null 2>&1 &&
            return

        # If current user is root, don't do anything
        [[ "$UID" -eq 0 ]] &&
            return

        # Start sway with environment variables
        if [[ -z "''${WAYLAND_DISPLAY}" ]] && [[ "''${XDG_VTNR}" -eq 1 ]]; then
            export MOZ_ENABLE_WAYLAND=1
            export MOZ_WEBRENDER=1
            export GTK_THEME="Arc-Dark"
            export QT_AUTO_SCREEN_SCALE_FACTOR=1
            export QT_QPA_PLATFORM="wayland;xcb"
            export QT_QPA_PLATFORMTHEME=qt6ct
            export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
            export WLR_NO_HARDWARE_CURSORS=1
            export WLR_RENDERER_ALLOW_SOFTWARE=1
            export XCURSOR_SIZE=24
            export XDG_CURRENT_DESKTOP=sway
            export XDG_SESSION_DESKTOP=sway
            export XDG_SESSION_TYPE=wayland
            export TERMINAL=/usr/bin/alacritty
            exec /usr/bin/sway
        fi
      '';
    };
    "${config.home.homeDirectory}/.bashrc" = {
      text = ''
        #
        # ~/.bashrc
        #

        # Commands that should be applied only for interactive shells.
        [[ $- == *i* ]] || return

        # Include ~/.bash_aliases
        [[ -f "$HOME"/.bash_aliases ]] &&
            source "$HOME"/.bash_aliases

        # Key bindings
        bind '"\e[A": history-search-backward'
        bind '"\e[B": history-search-forward'

        # History
        HISTCONTROL=ignoredups:ignorespace
        HISTSIZE=10000
        HISTFILESIZE=100000
        shopt -s histappend

        # Line wrap on window resize
        shopt -s checkwinsize

        # Tab completion for doas
        complete -cf /usr/bin/doas

        # If GUI isn't available and not connected through ssh, don't do anything
        [[ -z "$XDG_CURRENT_DESKTOP" ]] && [[ -z "$SSH_CLIENT" ]] && [[ -z "$SSH_TTY" ]] &&
            return

        # Prompt
        if [[ $TERM != "dumb" ]]; then
          eval "$(/usr/bin/starship init /usr/bin/bash)"
        fi

        # List number of outdated packages
        UPDATES="$(/usr/bin/timeout 4 /usr/bin/checkupdates 2> /dev/null | /usr/bin/wc -l)"
        [[ "$UPDATES" -gt 0 ]] &&
            /usr/bin/echo -e "\e[31m$UPDATES\e[0m packages are out of date!"
      '';
    };
  };
}
