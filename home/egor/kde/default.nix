{ pkgs, lib, ... }:
{
  imports = [
    ./konsole.nix
    ./plasmaManager.nix
  ];
  programs.plasma.enable = true;
  home.packages = with pkgs.kdePackages; [
    plasma-workspace
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
    kwallet
    kwallet-pam
    signon-kwallet-extension
    kconfig
    yakuake
    (pkgs.cheese) # Well, kamoso is marked as broken so...
    (pkgs.ocs-url)
  ];
}
