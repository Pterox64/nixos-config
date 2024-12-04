{
  pkgs,
  config,
  home,
  ...
}:
let
  ffconfig = builtins.readFile ./user.js;
  firefox-package = pkgs.firefox.override {
    nativeMessagingHosts = [
      pkgs.gnome-browser-connector
    ];
  };
in
{
  imports = [ ./policies.nix ];

  programs.firefox = {
    enable = true;
    package = firefox-package;
    profiles = {
      egor = {
        name = "Личный";
        id = 0;
        extraConfig = ffconfig;
        extensions = with config.nur.repos.rycee.firefox-addons; [
          immersive-translate
          betterttv
          bitwarden
          # foxytab
          open-url-in-container
          container-tab-groups
          multi-account-containers
          onetab
          privacy-badger
          qr-code-address-bar
          smartproxy
          stylus
          tampermonkey
          ublock-origin
        ];
        containersForce = true;
        containers = {
          private = {
            id = 1;
            name = "Личное";
            icon = "fingerprint";
            color = "toolbar";
          };
          proxy = {
            id = 2;
            name = "Запрет";
            icon = "fence";
            color = "turquoise";
          };
          banking = {
            id = 3;
            name = "Банкинг";
            icon = "dollar";
            color = "green";
          };
          shopping = {
            id = 4;
            name = "Покупки";
            icon = "cart";
            color = "pink";
          };
          youtube = {
            id = 5;
            name = "YouTube";
            icon = "circle";
            color = "red";
          };
          cit = {
            id = 1001;
            name = "СОГАУ ЦИТ";
            icon = "briefcase";
            color = "red";
          };
          eteron = {
            id = 1002;
            name = "Eteron";
            icon = "briefcase";
            color = "purple";
          };
        };
        bookmarks = [
          {
            name = "YouTube";
            url = "https://www.youtube.com";
          }
          {
            name = "YouTube Music";
            url = "https://music.youtube.com";
          }
          {
            name = "Twitch";
            url = "https://twitch.tv";
          }
          {
            name = "YandexGPT";
            url = "https://a.ya.ru";
          }
          {
            name = "Yandex Music";
            url = "https://music.yandex.ru/home";
          }
        ];
      };
    };
  };

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    MOZ_USE_XINPUT2 = "1";
  };
}
