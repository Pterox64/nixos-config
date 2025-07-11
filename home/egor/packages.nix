{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    bitwarden-desktop
    cryptomator
    dbeaver-bin
    nekoray
    obsidian
    keepass
    zbar
    rclone
    vlc
    vlc-bittorrent
    xdg-desktop-portal-gnome
    vaults
    sirikali
  ];
}
