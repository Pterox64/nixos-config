let
  extraconfig = builtins.readFile ../../modules/firefox/profiles/user.js;
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
    extraConfig = extraconfig;
  };
}
