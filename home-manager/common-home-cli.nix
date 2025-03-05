/*
  File: common-home-gui.nix
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
      "${config.xdg.configHome}/git" = {
        source = ./files/.config/git;
        recursive = true;
      };
      "${config.xdg.configHome}/nvim" = {
        source = ./files/.config/nvim;
        recursive = true;
      };
      ".bash_aliases" = {
        source = ../files/.bash_aliases;
        recursive = true;
      };
      ".bash_logout" = {
        source = ../files/.bash_logout;
        recursive = true;
      };
      ".bash_profile" = {
        source = ../files/.bash_profile;
        recursive = true;
      };
      ".bashrc" = {
        source = ../files/.bashrc;
        recursive = true;
      };
    };
    # Activation script
    activation = {
      common-home = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        # Define functions
        sed_exit() {
            echo "ERROR: 'sed' didn't replace, report this @"
            echo "       https://github.com/leomeinel/dot-files/issues"
            exit 1
        }

        # Create dirs
        mkdir -p ~/.local/bin/
        mkdir -p ~/.ssh
        chmod 700 ~/.ssh
        mkdir -p ~/src
        chmod 700 ~/src

        # Create XDG dirs
        mkdir -p "$HOME"/.cache
        mkdir -p "$HOME"/.config
        mkdir -p "$HOME"/.local/share
        mkdir -p "$HOME"/.local/state
        mkdir -p "$XDG_CONFIG_HOME"/java
        mkdir -p "$XDG_DATA_HOME"/android
        mkdir -p "$XDG_DATA_HOME"/cargo
        mkdir -p "$XDG_DATA_HOME"/gnupg
        chmod 700 "$XDG_DATA_HOME"/gnupg
        mkdir -p "$XDG_DATA_HOME"/go
        mkdir -p "$XDG_DATA_HOME"/gradle
        mkdir -p "$XDG_CONFIG_HOME"/gtk-2.0
        mkdir -p "$XDG_STATE_HOME"/bash
        mkdir -p "$XDG_CONFIG_HOME"/parallel
        mkdir -p "$XDG_DATA_HOME"/platformio
        mkdir -p "$XDG_CONFIG_HOME"/r
        mkdir -p "$XDG_DATA_HOME"/r/library
        mkdir -p "$XDG_STATE_HOME"/r
        mkdir -p "$XDG_DATA_HOME"/rustup
        mkdir -p "$XDG_CONFIG_HOME"/screen
        mkdir -p "$XDG_CACHE_HOME"/texlive

        # Chmod ~/.local/bin/*.sh
        chmod +x ~/.local/bin/*.sh

        # Set default rust if rustup is installed
        [[ -n $(which rustup) ]] >/dev/null 2>&1 &&
            rustup default stable

        # Initialize nvim
        nvim --headless -c 'sleep 5' -c 'q!' >/dev/null 2>&1

        # Add nix channel
        nix-channel --add https://nixos.org/channels/nixos-${nixos-version} nixpkgs
      '';
    };
  };

  # Program options
  programs = {
    home-manager.enable = true;
  };

  # xdg options
  xdg.enable = true;
}
