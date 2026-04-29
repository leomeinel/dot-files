{
  ...
}:

{
  # Imports
  imports = [
    ../common-home.nix
  ];

  # Home options
  home = {
    username = "root";
    homeDirectory = "/root";
  };
}
