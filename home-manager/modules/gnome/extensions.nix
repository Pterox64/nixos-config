{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.bluetooth-battery-meter
    gnomeExtensions.syncthing-indicator
    gnomeExtensions.pano
    # libgda
    # gsound
  ];
}
