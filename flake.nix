/*
  * File: flake.nix
  * Author: Leopold Meinel (leo@meinel.dev)
  * -----
  * Copyright (c) 2023 Leopold Meinel & contributors
  * SPDX ID: GPL-3.0-or-later
  * URL: https://www.gnu.org/licenses/gpl-3.0-standalone.html
  * -----
*/

{
  # Description of the flake
  description = "home-manager configuration";

  # Input options
  inputs = {
    # nixpkgs
    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    nixpkgs.url = "github:nixos/nixpkgs/nixos-REPLACE_NIX_VERSION"; # FIXME: This should be defined only once
    # home-manager
    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    home-manager.url = "github:nix-community/home-manager/release-REPLACE_NIX_VERSION"; # FIXME: This should be defined only once
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  # Output options
  outputs =
    { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      # FIXME: This should be defined only once
      nixos-version = "REPLACE_NIX_VERSION";
    in
    {
      # Configurations
      homeConfigurations = {
        # Set this for non nixos
        targets.genericLinux.enable = true;
        # Users
        "REPLACE_GUESTUSER" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          # Args to parse
          extraSpecialArgs = { inherit nixos-version; };
          # Modules to use
          modules = [ ./home-manager/configs/GUESTUSER.nix ];
        };
        "REPLACE_HOMEUSER" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          # Args to parse
          extraSpecialArgs = { inherit nixos-version; };
          # Modules to use
          modules = [ ./home-manager/configs/HOMEUSER.nix ];
        };
        "root" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          # Args to parse
          extraSpecialArgs = { inherit nixos-version; };
          # Modules to use
          modules = [ ./home-manager/configs/ROOTUSER.nix ];
        };
        "REPLACE_SYSUSER" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          # Args to parse
          extraSpecialArgs = { inherit nixos-version; };
          # Modules to use
          modules = [ ./home-manager/configs/SYSUSER.nix ];
        };
        "REPLACE_VIRTUSER" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          # Args to parse
          extraSpecialArgs = { inherit nixos-version; };
          # Modules to use
          modules = [ ./home-manager/configs/VIRTUSER.nix ];
        };
        "REPLACE_YOUTUBEUSER" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          # Args to parse
          extraSpecialArgs = { inherit nixos-version; };
          # Modules to use
          modules = [ ./home-manager/configs/YOUTUBEUSER.nix ];
        };
      };
    };
}
