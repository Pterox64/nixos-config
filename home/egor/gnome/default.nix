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
        "org.gnome.Nautilus.desktop"
        "com.gexperts.Tilix.desktop"
        "code.desktop"
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
    "org/gnome/shell/weather" = {
      automatic-location = true;
      # locations = [
      #   (mkVariant [
      #     (mkUint32 2)
      #     (mkVariant [
      #       "Moscow"
      #       "UUWW"
      #       true
      #       [
      #         (mkTuple [
      #           0.9712757287348442
      #           0.6504260403943176
      #         ])
      #       ]
      #       [
      #         (mkTuple [
      #           0.9730598392028181
      #           0.6565153021683081
      #         ])
      #       ]
      #     ])
      #   ])
      # ];
    };
  };
}
