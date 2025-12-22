/*
  File: common-home.nix
  Author: Leopold Johannes Meinel (leo@meinel.dev)
  -----
  Copyright (c) 2025 Leopold Johannes Meinel & contributors
  SPDX ID: Apache-2.0
  URL: https://www.apache.org/licenses/LICENSE-2.0
*/

{
  config,
  installEnv,
  lib,
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

  # Home options
  home = {
    # State version
    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "${installEnv.NIX_VERSION}";
    # Packages
    packages = with pkgs; [
      xdg-ninja
    ];
    # Activation script
    activation = {
      common-home = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        # Create dirs
        run /usr/bin/mkdir -p ${config.home.homeDirectory}/.ssh
        run /usr/bin/mkdir -p ${config.home.homeDirectory}/src
        run /usr/bin/chmod 700 ${config.home.homeDirectory}/.ssh
        run /usr/bin/chmod 700 ${config.home.homeDirectory}/src

        # Create XDG dirs
        run /usr/bin/mkdir -p ${config.xdg.cacheHome}
        run /usr/bin/mkdir -p ${config.xdg.cacheHome}/texlive
        run /usr/bin/mkdir -p ${config.xdg.configHome}
        run /usr/bin/mkdir -p ${config.xdg.configHome}/gtk-2.0
        run /usr/bin/mkdir -p ${config.xdg.configHome}/java
        run /usr/bin/mkdir -p ${config.xdg.configHome}/parallel
        run /usr/bin/mkdir -p ${config.xdg.configHome}/r
        run /usr/bin/mkdir -p ${config.xdg.configHome}/screen
        run /usr/bin/mkdir -p ${config.xdg.dataHome}
        run /usr/bin/mkdir -p ${config.xdg.dataHome}/android
        run /usr/bin/mkdir -p ${config.xdg.dataHome}/cargo
        run /usr/bin/mkdir -p ${config.xdg.dataHome}/gnupg
        run /usr/bin/mkdir -p ${config.xdg.dataHome}/go
        run /usr/bin/mkdir -p ${config.xdg.dataHome}/gradle
        run /usr/bin/mkdir -p ${config.xdg.dataHome}/platformio
        run /usr/bin/mkdir -p ${config.xdg.dataHome}/r/library
        run /usr/bin/mkdir -p ${config.xdg.dataHome}/rustup
        run /usr/bin/mkdir -p ${config.xdg.stateHome}
        run /usr/bin/mkdir -p ${config.xdg.stateHome}/bash
        run /usr/bin/mkdir -p ${config.xdg.stateHome}/r
        run /usr/bin/mkdir -p ${config.xdg.stateHome}/radian
        run /usr/bin/chmod 700 ${config.xdg.dataHome}/gnupg
      '';
    };
  };

  # Nix options
  nix = with pkgs; {
    package = nix;
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      use-xdg-base-directories = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
}
