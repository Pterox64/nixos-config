{ pkgs, lib, ... }:

with lib.hm.gvariant;

{
  home.packages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.bluetooth-battery-meter
    gnomeExtensions.syncthing-indicator
    gnomeExtensions.pano
  ];
  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "org.gnome.Calendar.desktop"
        "org.gnome.Music.desktop"
        "kitty.desktop"
        "code.desktop"
        "org.gnome.Nautilus.desktop"
        "bitwarden.desktop"
        "org.telegram.desktop.desktop"
        "firefox.desktop"
        "org.gnome.Evolution.desktop"
      ];
      enabled-extensions = [
        "system-monitor@gnome-shell-extensions.gcampax.github.com"
        "places-menu@gnome-shell-extensions.gcampax.github.com"
        "status-icons@gnome-shell-extensions.gcampax.github.com"
        "syncthing@gnome.2nv2u.com"
        "pano@elhan.io"
        "Bluetooth-Battery-Meter@maniacx.github.com"
        "appindicatorsupport@rgcjonas.gmail.com"
      ];
    };
    "org/gnome/mutter" = {
      dynamic-workspaces = true;
    };
    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "hibernate";
      sleep-inactive-battery-timeout = 300;
      sleep-inactive-battery-type = "hibernate";
    };
  };
}
