{ pkgs, lib, ... }:
{
  imports = [
    ./konsole.nix
    ./plasmaManager.nix
  ];
  programs.plasma.enable = true;

  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
  };

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
    kalk
    (pkgs.cheese) # Well, kamoso is marked as broken so...
    kdialog
    kauth
    kdesu
    kpipewire
    (pkgs.ocs-url)
    kservice
    kweather
    plasma-workspace-wallpapers
    plasma-firewall
    (pkgs.qt5.qtbase)
    (pkgs.qt5.qtwayland) # плагин для Qt5+Wayland
    # или для Qt6:
    (pkgs.qt6.qtbase)
    (pkgs.qt6.qtwayland)
  ];
}
