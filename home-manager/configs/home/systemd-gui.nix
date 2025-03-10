/*
  File = systemd-gui.nix
  Author = Leopold Meinel (leo@meinel.dev)
  -----
  Copyright (c) 2025 Leopold Meinel & contributors
  SPDX ID = MIT
  URL = https://opensource.org/licenses/MIT
  -----
*/
{
  pkgs,
  ...
}:

{
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
