{ pkgs, ... }:
{
  home.packages = with pkgs; [
    transmission-gtk
    transmission-remote-gtk
  ];
}
