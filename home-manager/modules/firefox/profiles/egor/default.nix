{
  pkgs,
  config,
  home,
  ...
}:
let
  ffconfig = builtins.readFile ../user.js;
in
{
  imports = [ ./containers.nix ];

  programs.firefox.profiles.egor = {
    name = "Личный";
    id = 0;
    extraConfig = ffconfig;
    extensions = with config.nur.repos.rycee.firefox-addons; [
      immersive-translate
      betterttv
      bitwarden
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
}
