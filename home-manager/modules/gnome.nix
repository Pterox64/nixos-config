{ pkgs, ... }:
{
  # services.gnome.gnome-browser-connector.enable = true;
  home.packages = with pkgs; [
    gnome.gnome-tweaks
    gnomeExtensions.appindicator
    gnomeExtensions.bluetooth-battery-meter
    gnomeExtensions.syncthing-indicator
  ];
}
