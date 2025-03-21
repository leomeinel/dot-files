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
  config,
  lib,
  pkgs,
  ...
}:

{
  # Imports
  imports = [
    ./configs/home/gtk-gui.nix
    ./configs/home/pointer-cursor-gui.nix
    ./configs/home/programs-gui.nix
    ./configs/home/xdg-gui.nix
  ];

  # Nixpkgs options
  nixpkgs = {
    overlays = [ ];
    config = { };
  };

  # Home options
  home = {
    # Packages
    packages =
      with pkgs;
      let
        R-with-my-packages = rWrapper.override {
          packages = with rPackages; [
            httpgd
            languageserver
          ];
        };
      in
      [
        cmake-format
        hasklig
        nixd
        nixfmt-rfc-style
        ocrmypdf
        R-with-my-packages
        radianWrapper
        usbguard-notifier
      ];
    # Activation script
    activation = {
      common-home-gui = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        # Create dirs
        run /usr/bin/mkdir -p ${config.home.homeDirectory}/Documents/Pictures/Screenshots

        # Delete wofi cache to prevent saving deprecated symlinks
        run rm -f ${config.xdg.cacheHome}/wofi-run

        # FIXME: This shouldn't be necessary
        # Reset flatpak override to make sure that no unnecessary overrides are added
        run flatpak override -u --reset
        # Workaround for using the correct font in all applications
        run ln -sfn ${config.xdg.stateHome}/nix/profile/share/fonts ${config.xdg.dataHome}/fonts
        run flatpak override -u --filesystem=${config.xdg.dataHome}/fonts:ro --filesystem=${config.xdg.stateHome}/nix/profile/share/fonts:ro --filesystem=${pkgs.hasklig}/share/fonts:ro --filesystem=${pkgs.noto-fonts}/share/fonts:ro
        # Workaround for using the correct icons in all applications
        run flatpak override -u --filesystem=${config.xdg.dataHome}/icons:ro --filesystem=${config.xdg.stateHome}/nix/profile/share/icons:ro --filesystem=${pkgs.papirus-icon-theme}/share/icons:ro --filesystem=${pkgs.phinger-cursors}/share/icons:ro
        # Workaround for using the correct GTK theme in all applications
        run ln -sfn ${config.xdg.stateHome}/nix/profile/share/themes ${config.xdg.dataHome}/themes
        run flatpak override -u --filesystem=${config.xdg.dataHome}/themes:ro --filesystem=${config.xdg.stateHome}/nix/profile/share/themes:ro --filesystem=${pkgs.arc-theme}/share/themes:ro
      '';
    };
  };

  # Allow unfree packages to install VSCode extensions
  nixpkgs.config.allowUnfree = true;
}
