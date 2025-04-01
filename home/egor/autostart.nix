{ pkgs, lib, ... }:
let
  autostartApps = {
    flameshot = {
      source = "${pkgs.flameshot}/share/applications/org.flameshot.Flameshot.desktop";
    };
    telegram = {
      text =
        builtins.replaceStrings [ "Exec=telegram-desktop -- %u" ] [ "Exec=telegram-desktop -autostart" ]
          (builtins.readFile "${pkgs.telegram-desktop}/share/applications/org.telegram.desktop.desktop");
    };
    cryptomator = {
      source = "${pkgs.cryptomator}/share/applications/org.cryptomator.Cryptomator.desktop";
    };
    nekoray = {
      source = "${pkgs.nekoray}/share/applications/nekoray.desktop";
    };
  };
in
{
  xdg.configFile = lib.mapAttrs' (
    name: content: lib.nameValuePair "autostart/${name}.desktop" content
  ) autostartApps;
}
