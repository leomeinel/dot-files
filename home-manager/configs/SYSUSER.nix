/*
  File: SYSUSER.nix
  Author: Leopold Johannes Meinel (leo@meinel.dev)
  -----
  Copyright (c) 2025 Leopold Johannes Meinel & contributors
  SPDX ID: Apache-2.0
  URL: https://www.apache.org/licenses/LICENSE-2.0
*/

{
  installEnv,
  pkgs,
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
    username = "${installEnv.SYSUSER}";
    homeDirectory = "/home/${installEnv.SYSUSER}";
  };

  # Systemd options
  systemd.user = {
    enable = true;
    startServices = true;
    # Systemd services
    services = {
      # Source: https://github.com/Cropi/usbguard-notifier/blob/main/usbguard-notifier.service.in
      usbguard-notifier = {
        Unit = {
          Description = "USBGuard Notifier";
          After = "usbguard.service";
        };
        Install = {
          WantedBy = [ "default.target" ];
        };
        Service = {
          ExecStart = "${pkgs.usbguard-notifier}/bin/usbguard-notifier";
        };
      };
    };
  };
}
