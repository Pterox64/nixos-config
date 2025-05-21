{
  config,
  pkgs,
  lib,
  ...
}:

let
  isPlasma = config.services.desktopManager.plasma6.enable or false;
  isGnome = config.services.desktopManager.gnome.enable or false;
  nativeMessaging =
    (if isPlasma then [ pkgs.kdePackages.plasma-browser-integration ] else [ ])
    ++ (if isGnome then [ pkgs.gnome-browser-connector ] else [ ]);
in
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    nativeMessagingHosts = nativeMessaging;
  };

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    MOZ_USE_XINPUT2 = "1";
  };
}
