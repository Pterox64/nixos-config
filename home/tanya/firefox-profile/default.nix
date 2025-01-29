let
  extraconfig = builtins.readFile ../../modules/firefox/profiles/user.js;
in
{
  imports = [
    ./bookmarks.nix
    ./extensions.nix
  ];

  programs.firefox.profiles.tanya = {
    name = "Личный";
    id = 0;
    extraConfig = extraconfig;
  };
}
