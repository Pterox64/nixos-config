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
        "org.gnome.Evolution.desktop"
        "org.gnome.Music.desktop"
        "org.gnome.TextEditor.desktop"
        "kitty.desktop"
        "code.desktop"
        "org.gnome.Nautilus.desktop"
        "bitwarden.desktop"
        "org.telegram.desktop.desktop"
        "firefox.desktop"
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
    "org/gnome/desktop/wm/keybindings" = {
      switch-applications = [ ];
      switch-applications-backward = [ ];
      switch-windows = [ "<Alt>Tab" ];
      switch-windows-backward = [ "<Shift><Alt>Tab" ];
    };
    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "hibernate";
      sleep-inactive-battery-timeout = 450;
      sleep-inactive-battery-type = "hibernate";
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
      resize-with-right-button = false;
    };
    "org/gnome/desktop/input-sources" = {
      mru-sources = [
        (mkTuple [
          "xkb"
          "ru"
        ])
        (mkTuple [
          "xkb"
          "us"
        ])
      ];
      per-window = true;
      sources = [
        (mkTuple [
          "xkb"
          "us"
        ])
        (mkTuple [
          "xkb"
          "ru"
        ])
      ];
      xkb-options = [
        "lv3:rwin_switch"
        "compose:ralt"
      ];
    };
  };
}
