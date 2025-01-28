{ pkgs, ... }:
{
  imports = [ ./extensions.nix ];

  home.packages = with pkgs; [
    gnome-tweaks
    gnome-terminal
  ];
}
