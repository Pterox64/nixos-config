{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bitwarden-desktop
    dbeaver-bin
    freecad-wayland
    guake
    nekoray
    obsidian
    keepass
  ];
}
