/*
  File: common-home-gui.nix
  Author: Leopold Johannes Meinel (leo@meinel.dev)
  -----
  Copyright (c) 2025 Leopold Johannes Meinel & contributors
  SPDX ID: Apache-2.0
  URL: https://www.apache.org/licenses/LICENSE-2.0
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
    ./configs/home/fonts-gui.nix
    ./configs/home/programs-gui.nix
    ./configs/home/xdg-gui.nix
  ];

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
            jsonlite
          ];
        };
      in
      [
        htmlhint
        nixd
        nixfmt-rfc-style
        ocrmypdf
        R-with-my-packages
        radianWrapper
        toml2json
        usbguard-notifier
        wl-clipboard-rs
        yaml2json
      ];
    # Activation script
    activation = {
      common-home-gui = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        # Create dirs
        run /usr/bin/mkdir -p ${config.home.homeDirectory}/Documents/Pictures/Screenshots

        # Delete wofi cache to prevent saving deprecated symlinks
        run /usr/bin/rm -f ${config.xdg.cacheHome}/wofi-run

        # Configure gsettings
        run /usr/bin/gsettings set org.gnome.desktop.interface icon-theme Papirus-Dark
        run /usr/bin/gsettings set org.gnome.desktop.interface color-scheme prefer-dark
        run /usr/bin/gsettings set org.gnome.desktop.interface cursor-size 24
        run /usr/bin/gsettings set org.gnome.desktop.interface cursor-theme phinger-cursors-dark
        run /usr/bin/gsettings set org.gnome.desktop.interface gtk-theme Fluent-Dark-compact

        # FIXME: This shouldn't be necessary
        # Reset flatpak override to make sure that no unnecessary overrides are added
        run /usr/bin/flatpak override -u --reset
        # Workaround for using the correct font in all applications
        run /usr/bin/rm -rf ${config.xdg.dataHome}/fonts
        run /usr/bin/rsync -urlq --delete /usr/share/fonts/ ${config.xdg.dataHome}/fonts
        run /usr/bin/flatpak override -u --filesystem=xdg-data/fonts:ro
        # Workaround for using the correct icons in all applications
        run /usr/bin/rm -rf ${config.xdg.dataHome}/icons
        run /usr/bin/rsync -urlq --delete /usr/share/icons/ ${config.xdg.dataHome}/icons
        run /usr/bin/flatpak override -u --filesystem=xdg-data/icons:ro
        # Workaround for using the correct theme in all applications
        run /usr/bin/rm -rf ${config.xdg.dataHome}/themes
        run /usr/bin/rsync -urlq --delete /usr/share/themes/ ${config.xdg.dataHome}/themes
        run /usr/bin/flatpak override -u --filesystem=xdg-data/themes:ro
        # Workaround for using the correct QT theme in all applications
        run /usr/bin/flatpak override -u --env=QT_STYLE_OVERRIDE="breeze"
      '';
    };
  };
}
