/*
  * File: flake.nix
  * Author: Leopold Meinel (leo@meinel.dev)
  * -----
  * Copyright (c) 2023 Leopold Meinel & contributors
  * SPDX ID: GPL-3.0-or-later
  * URL: https://www.gnu.org/licenses/gpl-3.0-standalone.html
  * -----
*/

let
  nixos-version = REPLACE_NIX_VERSION;
in
{
  # Description of the flake
  description = "home-manager configuration";

  # Input options
  inputs = {
    # nixpkgs
    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    nixpkgs.url = "github:nixos/nixpkgs/nixos-${nixos-version}";
    # home-manager
    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    home-manager.url = "github:nix-community/home-manager/release-${nixos-version}";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  # Output options
  outputs =
    { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # Configurations
      homeConfigurations = {
        # Users
        "GUESTUSER" = home-manager.lib.homeManagerConfiguration {
          # Args to parse
          specialArgs = { inherit pkgs nixos-version; };
          # Modules to use
          modules = [ ./home-manager/configs/GUESTUSER.nix ];
        };
        "HOMEUSER" = home-manager.lib.homeManagerConfiguration {
          # Args to parse
          specialArgs = { inherit pkgs nixos-version; };
          # Modules to use
          modules = [ ./home-manager/configs/HOMEUSER.nix ];
        };
        "ROOTUSER" = home-manager.lib.homeManagerConfiguration {
          # Args to parse
          specialArgs = { inherit pkgs nixos-version; };
          # Modules to use
          modules = [ ./home-manager/configs/ROOTUSER.nix ];
        };
        "SYSUSER" = home-manager.lib.homeManagerConfiguration {
          # Args to parse
          specialArgs = { inherit pkgs nixos-version; };
          # Modules to use
          modules = [ ./home-manager/configs/SYSUSER.nix ];
        };
        "VIRTUSER" = home-manager.lib.homeManagerConfiguration {
          # Args to parse
          specialArgs = { inherit pkgs nixos-version; };
          # Modules to use
          modules = [ ./home-manager/configs/VIRTUSER.nix ];
        };
        "YOUTUBEUSER" = home-manager.lib.homeManagerConfiguration {
          # Args to parse
          specialArgs = { inherit pkgs nixos-version; };
          # Modules to use
          modules = [ ./home-manager/configs/YOUTUBEUSER.nix ];
        };
      };
    };
}
