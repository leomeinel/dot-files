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
    username = "${installEnv.VIRTUSER}";
    homeDirectory = "/home/${installEnv.VIRTUSER}";
  };
}
