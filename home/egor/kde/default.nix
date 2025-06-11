{ pkgs, lib, ... }:
{
  programs.kdeconnect.enable = true;
  home.packages = with pkgs.kdePackages; [
    kio-gdrive
    kio-fuse
    kio-zeroconf
    kio-extras
    kio-admin
    kaccounts-integration
    kaccounts-providers
    kdepim-addons
    signond
    kmail
    kmail-account-wizard
  ];
}
