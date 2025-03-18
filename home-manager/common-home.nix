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
  config,
  lib,
  nixos-version,
  pkgs,
  ...
}:

{
  # Imports
  imports = [
    ./configs/home/file.nix
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
    # Activation script
    activation = {
      common-home = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        # Create dirs
        run /usr/bin/mkdir -p ${config.home.homeDirectory}/.ssh
        run /usr/bin/chmod 700 ${config.home.homeDirectory}/.ssh
        run /usr/bin/mkdir -p ${config.home.homeDirectory}/src
        run /usr/bin/chmod 700 ${config.home.homeDirectory}/src

        # Create XDG dirs
        run /usr/bin/mkdir -p ${config.xdg.cacheHome}
        run /usr/bin/mkdir -p ${config.xdg.configHome}
        run /usr/bin/mkdir -p ${config.xdg.dataHome}
        run /usr/bin/mkdir -p ${config.xdg.stateHome}
        run /usr/bin/mkdir -p ${config.xdg.configHome}/java
        run /usr/bin/mkdir -p ${config.xdg.dataHome}/android
        run /usr/bin/mkdir -p ${config.xdg.dataHome}/cargo
        run mkdir -p ${config.xdg.dataHome}/gnupg
        run chmod 700 ${config.xdg.dataHome}/gnupg
        run /usr/bin/mkdir -p ${config.xdg.dataHome}/go
        run /usr/bin/mkdir -p ${config.xdg.dataHome}/gradle
        run /usr/bin/mkdir -p ${config.xdg.configHome}/gtk-2.0
        run /usr/bin/mkdir -p ${config.xdg.stateHome}/bash
        run /usr/bin/mkdir -p ${config.xdg.configHome}/parallel
        run /usr/bin/mkdir -p ${config.xdg.dataHome}/platformio
        run /usr/bin/mkdir -p ${config.xdg.configHome}/r
        run /usr/bin/mkdir -p ${config.xdg.dataHome}/r/library
        run /usr/bin/mkdir -p ${config.xdg.stateHome}/r
        run /usr/bin/mkdir -p ${config.xdg.dataHome}/rustup
        run /usr/bin/mkdir -p ${config.xdg.configHome}/screen
        run /usr/bin/mkdir -p ${config.xdg.cacheHome}/texlive
      '';
    };
  };
}
