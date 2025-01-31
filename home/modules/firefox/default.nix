{ pkgs, home, ... }:
let
  firefox-package = pkgs.firefox.override {
    nativeMessagingHosts = [
      pkgs.gnome-browser-connector
    ];
  };
in
{
  imports = [
    ./policies.nix
  ];

  programs.firefox = {
    enable = true;
    package = firefox-package;
  };

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    MOZ_USE_XINPUT2 = "1";
  };
}
