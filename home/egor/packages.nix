{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bitwarden-desktop
    cryptomator
    dbeaver-bin
    freecad-wayland
    nekoray
    obsidian
    keepass
    zbar
    rclone
  ];
}
