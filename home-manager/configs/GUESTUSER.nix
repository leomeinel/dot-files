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
    username = "${installEnv.GUESTUSER}";
    homeDirectory = "/home/${installEnv.GUESTUSER}";
  };
}
