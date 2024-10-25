{ pkgs, ... }:
{
  imports = [ ./extensions.nix ];

  home.packages = with pkgs; [ gnome.gnome-tweaks ];
}
