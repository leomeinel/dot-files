/*
  File: WORKUSER.nix
  Author: Leopold Johannes Meinel (leo@meinel.dev)
  -----
  Copyright (c) 2025 Leopold Johannes Meinel & contributors
  SPDX ID: Apache-2.0
  URL: https://www.apache.org/licenses/LICENSE-2.0
*/

{
  installEnv,
  ...
}:

{
  # Imports
  imports = [
    ../common-home.nix
    ../common-home-gui.nix
  ];

  # Home options
  home = {
    username = "${installEnv.WORKUSER}";
    homeDirectory = "/home/${installEnv.WORKUSER}";
  };
}
