{
  pkgs,
  config,
  home,
  ...
}:
let
  ffconfig = builtins.readFile ../user.js;
in
{
  imports = [
    ./bookmarks.nix
    ./containers.nix
    ./extensions.nix
  ];

  programs.firefox.profiles.egor = {
    name = "Личный";
    id = 0;
    extraConfig = ffconfig;
  };
}
