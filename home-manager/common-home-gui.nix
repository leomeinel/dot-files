/*
  File = common-home-gui.nix
  Author = Leopold Meinel (leo@meinel.dev)
  -----
  Copyright (c) 2025 Leopold Meinel & contributors
  SPDX ID = MIT
  URL = https://opensource.org/licenses/MIT
  -----
*/

{
  config,
  lib,
  nix4vscode,
  pkgs,
  ...
}:

{
  # Imports
  imports = [
    ./configs/home/fonts-gui.nix
    ./configs/home/gtk-gui.nix
    ./configs/home/pointer-cursor-gui.nix
    ./configs/home/programs-gui.nix
    ./configs/home/qt-gui.nix
    ./configs/home/xdg-gui.nix
  ];

  # Nixpkgs options
  nixpkgs = {
    overlays = [ nix4vscode.overlays.default ];
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
            jsonlite
          ];
        };
      in
      [
        autotiling-rs
        clang
        clang-tools
        cmake
        cmake-format
        go
        gradle
        htmlhint
        libllvm
        lld
        lldb
        maven
        nerd-fonts.hasklug
        nerd-fonts.noto
        networkmanagerapplet
        nixd
        nixfmt-rfc-style
        nodejs
        nodePackages.prettier
        ocrmypdf
        php
        R-with-my-packages
        radianWrapper
        ruff
        rustup
        shellcheck
        shfmt
        slurp
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

        # FIXME: This shouldn't be necessary
        # Reset flatpak override to make sure that no unnecessary overrides are added
        run /usr/bin/flatpak override -u --reset
        # Workaround for using the correct font in all applications
        run /usr/bin/ln -sfn ${config.home.profileDirectory}/share/fonts ${config.xdg.dataHome}/fonts
        run /usr/bin/flatpak override -u --filesystem=xdg-data/fonts:ro --filesystem=${config.home.profileDirectory}/share/fonts:ro --filesystem=${pkgs.nerd-fonts.hasklug}/share/fonts:ro
        # Workaround for using the correct icons in all applications
        run /usr/bin/flatpak override -u --filesystem=xdg-data/icons:ro --filesystem=${config.home.profileDirectory}/share/icons:ro --filesystem=${pkgs.papirus-icon-theme}/share/icons:ro --filesystem=${pkgs.phinger-cursors}/share/icons:ro
        # Workaround for using the correct GTK theme in all applications
        run /usr/bin/ln -sfn ${config.home.profileDirectory}/share/themes ${config.xdg.dataHome}/themes
        run /usr/bin/flatpak override -u --filesystem=xdg-data/themes:ro --filesystem=${config.home.profileDirectory}/share/themes:ro --filesystem=${pkgs.arc-theme}/share/themes:ro
        # Workaround for using the correct QT theme in all applications (should actually use Arc-Dark, but that isn't available)
        run /usr/bin/flatpak override -u --env=QT_STYLE_OVERRIDE="Adwaita-Dark"
        run /usr/bin/flatpak override -u --env=QT_STYLE_OVERRIDE="" org.raspberrypi.rpi-imager
        run /usr/bin/flatpak override -u --env=QT_STYLE_OVERRIDE="" com.calibre_ebook.calibre
        run /usr/bin/flatpak override -u --env=QT_STYLE_OVERRIDE="" com.nitrokey.nitrokey-app2
      '';
    };
  };

  # Allow unfree packages to install VSCode extensions
  nixpkgs.config.allowUnfree = true;
}
