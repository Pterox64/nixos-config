{ pkgs, ... }:
{
  home.packages = with pkgs; [
    yubioath-flutter
    yubikey-personalization-gui
  ];
}
