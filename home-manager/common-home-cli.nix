/*
  File: common-home.nix
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
  imports = [
    ./configs/home/files.nix
    ./configs/home/programs.nix
    ./configs/home/xdg.nix
  ];

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
    sessionVariables = {
      XDG_CACHE_HOME = "${config.xdg.cacheHome}";
      XDG_CONFIG_HOME = "${config.xdg.configHome}";
      XDG_DATA_HOME = "${config.xdg.dataHome}";
      XDG_STATE_HOME = "${config.xdg.stateHome}";
      EDITOR = "/usr/bin/nvim";
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
        run mkdir -p ${config.home.homeDirectory}/Documents/Pictures/Screenshots
        run mkdir -p ${config.home.homeDirectory}/.ssh
        run chmod 700 ${config.home.homeDirectory}/.ssh
        run mkdir -p ${config.home.homeDirectory}/src
        run chmod 700 ${config.home.homeDirectory}/src

        # Create XDG dirs
        run mkdir -p ${config.xdg.cacheHome}
        run mkdir -p ${config.xdg.configHome}
        run mkdir -p ${config.xdg.dataHome}
        run mkdir -p ${config.xdg.stateHome}
        run mkdir -p ${config.xdg.configHome}/java
        run mkdir -p ${config.xdg.dataHome}/android
        run mkdir -p ${config.xdg.dataHome}/cargo
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
        ${pkgs.neovim}/bin/nvim --headless -c 'sleep 5' -c 'q!' >/dev/null 2>&1

        # Add nixpkgs channel
        nix-channel --add https://nixos.org/channels/nixos-${nixos-version} nixpkgs
        nix-channel --update
      '';
    };
  };
}
