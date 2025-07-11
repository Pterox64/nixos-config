{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.home.kde.konsole.profile;
in
{
  imports = [
    ./colorscheme
  ];

  options.home.kde.konsole.profile = {
    enable = lib.mkEnableOption ''Enable konsole profile.'';

    colorScheme = lib.mkOption {
      type = lib.types.str;
      default = "Fumo9";
      example = "Fumo9";
      description = ''
        The name of the konsole color scheme to use.
        This should match the name of the profile file in
        ~/.local/share/konsole/<profile_name>.profile.'';
    };

    name = lib.mkOption {
      type = lib.types.str;
      default = "Admin";
      example = "Admin";
      description = ''
        The name of the konsole profile to use.
        This should match the name of the profile file in
        ~/.local/share/konsole/<profile_name>.profile.'';
    };
  };
  config = lib.mkIf cfg.enable {
    home.file.".local/share/konsole/${cfg.name}.profile".text = ''
      [Appearance]
      ColorScheme=${cfg.colorScheme}
      Font=Cascadia Code PL,12

      [General]
      InvertSelectionColors=true
      Command=${pkgs.zsh}/bin/zsh
      Name=Admin
      Parent=FALLBACK/
    '';
  };
}
