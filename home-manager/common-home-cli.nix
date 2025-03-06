/*
  File: common-home-cli.nix
  Author: Leopold Meinel (leo@meinel.dev)
  -----
  Copyright (c) 2025 Leopold Meinel & contributors
  SPDX ID: MIT
  URL: https://opensource.org/licenses/MIT
  -----
*/

{
  lib,
  config,
  pkgs,
  nixos-version,
  ...
}:

{
  # Imports
  imports = [ ];

  # Nixpkgs options
  nixpkgs = {
    overlays = [ ];
    config = { };
  };

  # Home options
  home = {
    # State version
    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "${nixos-version}";
    # Packages
    packages = with pkgs; [
      xdg-ninja
    ];
    # Files in $HOME
    file = {
      "${config.xdg.configHome}" = {
        source = ../files/.config;
        recursive = true;
      };
    };
    sessionVariables = {
      JAVA_HOME = "/usr/lib/jvm/default";
      _JAVA_OPTIONS = "-Djava.util.prefs.userRoot=${config.xdg.configHome}/java";
      MYSQL_HOME = "/var/lib/mysql";
      PAGER = "/usr/bin/less";
      VISUAL = "/usr/bin/nvim";
      MANPAGER = "/usr/bin/sh -c '/usr/bin/col -bx | /usr/bin/bat -l man -p'";
      MANROFFOPT = "-c";
      ANDROID_HOME = "${config.xdg.dataHome}/android";
      ANDROID_USER_HOME = "${config.xdg.dataHome}/android";
      CARGO_HOME = "${config.xdg.dataHome}/cargo";
      GNUPGHOME = "${config.xdg.dataHome}/gnupg";
      GOPATH = "${config.xdg.dataHome}/go";
      GRADLE_USER_HOME = "${config.xdg.dataHome}/gradle";
      HISTFILE = "${config.xdg.stateHome}/bash/history";
      NIX_REMOTE = "daemon";
      PARALLEL_HOME = "${config.xdg.configHome}/parallel";
      PLATFORMIO_CORE_DIR = "${config.xdg.dataHome}/platformio";
      R_ENVIRON_USER = "${config.xdg.configHome}/r/.Renviron";
      RUSTUP_HOME = "${config.xdg.dataHome}/rustup";
      SCREENRC = "${config.xdg.configHome}/screen/screenrc";
      TEXMFVAR = "${config.xdg.cacheHome}/texlive/texmf-var";
    };
    # Activation script
    activation = {
      common-home = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        # Define functions
        sed_exit() {
            run echo "ERROR: 'sed' didn't replace, report this @"
            run echo "       https://github.com/leomeinel/dot-files/issues"
            run exit 1
        }

        # Create dirs
        run mkdir -p ~/Documents/Pictures/Screenshots
        run mkdir -p ~/.ssh
        run chmod 700 ~/.ssh
        run mkdir -p ~/src
        run chmod 700 ~/src

        # Create XDG dirs
        run mkdir -p ${config.xdg.cacheHome}
        run mkdir -p ${config.xdg.configHome}
        run mkdir -p ${config.xdg.dataHome}
        run mkdir -p ${config.xdg.stateHome}
        run mkdir -p ${config.xdg.configHome}/java
        run mkdir -p ${config.xdg.dataHome}/android
        run mkdir -p ${config.xdg.dataHome}/cargo
        run mkdir -p ${config.xdg.dataHome}/gnupg
        run chmod 700 ${config.xdg.dataHome}/gnupg
        run mkdir -p ${config.xdg.dataHome}/go
        run mkdir -p ${config.xdg.dataHome}/gradle
        run mkdir -p ${config.xdg.configHome}/gtk-2.0
        run mkdir -p ${config.xdg.stateHome}/bash
        run mkdir -p ${config.xdg.configHome}/parallel
        run mkdir -p ${config.xdg.dataHome}/platformio
        run mkdir -p ${config.xdg.configHome}/r
        run mkdir -p ${config.xdg.dataHome}/r/library
        run mkdir -p ${config.xdg.stateHome}/r
        run mkdir -p ${config.xdg.dataHome}/rustup
        run mkdir -p ${config.xdg.configHome}/screen
        run mkdir -p ${config.xdg.cacheHome}/texlive

        # Set default rust if rustup is installed
        [[ -n $(run which rustup) ]] >/dev/null 2>&1 &&
            run rustup default stable

        # Initialize nvim
        run nvim --headless -c 'sleep 5' -c 'q!' >/dev/null 2>&1
      '';
    };
  };

  # Program options
  programs = {
    starship.enable = true;
    home-manager.enable = true;
    # Bash options
    bash = {
      enableCompletion = true;
      # Equivalent to .bashrc for interactive sessions
      bashrcExtra = ''
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

        # If GUI isn't available and not connected through ssh, don't do anything
        [[ -z "$XDG_CURRENT_DESKTOP" ]] && [[ -z "$SSH_CLIENT" ]] && [[ -z "$SSH_TTY" ]] &&
            return

        # List number of outdated packages
        UPDATES="$(/usr/bin/timeout 4 /usr/bin/checkupdates 2> /dev/null | /usr/bin/wc -l)"
        [[ "$UPDATES" -gt 0 ]] &&
            /usr/bin/echo -e "\e[31m$UPDATES\e[0m packages are out of date!"
      '';
      # Aliases
      shellAliases = {
        # doas
        doas = "/usr/bin/doas ";
        sudo = "/usr/bin/sudo ";

        # btrfs
        df = "/usr/bin/btrfs fi df";

        # Rust core-utils aliases
        ls = "/usr/bin/eza -la --color=automatic";
        cat = "/usr/bin/bat --decorations auto --color auto";
        grep = "/usr/bin/rg -s --color auto";
        find = "/usr/bin/fd -Hs -c auto";
        du = "/usr/bin/dust";
        ps = "/usr/bin/procs";
        neofetch = "/usr/bin/macchina";
        bench = "/usr/bin/hyperfine -w 3 -r 12 --style auto";

        # xdg-ninja recommendations
        adb = "HOME = ${config.xdg.dataHome}/android adb";
        wget = "wget --hsts-file=${config.xdg.dataHome}/wget-hsts";
      };
      # Equivalent to .bash_profile
      profileExtra = ''
        # If not running interactively, don't do anything
        [[ $- != *i* ]] &&
            return

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
      # Equivalent to .bash_logout
      logoutExtra = ''
        # Stop ssh-agent if it is started
        [[ -n "$SSH_AUTH_SOCK" ]] &&
            eval "$(/usr/bin/ssh-agent -k)"

        # Clear screen
        [[ "$SHLVL" = 1 ]] &&
            /usr/bin/clear
      '';
    };
    # git options and config (.config/git/config)
    git = {
      enable = true;
      userEmail = "leo@meinel.dev";
      userName = "Leopold Johannes Meinel";
      signing.signByDefault = true;
      signing.key = "REPLACE_GIT_SIGNING_KEY";
      # git delta
      delta = {
        enable = true;
        options = {
          decorations = {
            commit-decoration-style = "blue ol";
            commit-style = "raw";
            file-style = "omit";
            hunk-header-decoration-style = "blue box";
            hunk-header-file-style = "red";
            hunk-header-line-number-style = "#067a00";
            hunk-header-style = "file line-number syntax";
          };
          interactive.keep-plus-minus-markers = false;
          navigate = true;
          light = false;
          features = "decorations";
        };
      };
      # custom config
      extraConfig = {
        core = {
          editor = "nvim";
          autocrlf = "input";
        };
        init.defaultBranch = "main";
        pull.rebase = true;
        merge.conflictstyle = "diff3";
        diff.colorMoved = "default";
        add.interactive.useBuiltin = false;
        credential.helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
      };
    };
    # Neovim options
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
    };
  };

  # Services
  services = {
    # Gpg-agent options
    gpg-agent = with pkgs; {
      enable = true;
    };
  };

  # xdg options
  xdg.enable = true;

  # Nix options
  # FIXME: Either remove this if unsupported or readd with correct syntax; nixpkgs is unknown, pkgs isn't correct
  #nix.channels = { inherit nixpkgs; };
}
