{ pkgs, ... }:
{
  imports = [
    ./extensions.nix
    ./packages.nix
  ];

  home.packages = with pkgs; [ gnome.gnome-tweaks ];
}
