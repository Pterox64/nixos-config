{ pkgs, home, ... }:
let
  ffconfig = builtins.readFile ./user.js;
  firefox-package = pkgs.firefox.override {
    nativeMessagingHosts = [
      pkgs.gnome-browser-connector
    ];
  };
in
{
  imports = [
    ./policies.nix
    ./profiles
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
