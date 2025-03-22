{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bitwarden-desktop
    dbeaver-bin
    freecad-wayland
    nekoray
    obsidian
    keepass
    tilix
    zbar
    rclone
  ];
}
