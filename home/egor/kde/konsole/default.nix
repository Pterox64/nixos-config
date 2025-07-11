{
  lib,
  pkgs,
  config,
  ...
}:
{
  imports = [
    ./profile.nix
  ];

  home.kde.konsole.profile = {
    enable = true;
    name = "Admin";
    colorScheme = "Fumo9";
  };

  programs.konsole = {
    enable = true;
    defaultProfile = "Admin";
  };
}
