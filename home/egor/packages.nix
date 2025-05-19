{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    bitwarden-desktop
    cryptomator
    dbeaver-bin
    nekoray
    obsidian
    keepass
    v2ray
    qv2ray
    zbar
    rclone
    vlc
    vlc-bittorrent
    xdg-desktop-portal-gnome
  ];
}
