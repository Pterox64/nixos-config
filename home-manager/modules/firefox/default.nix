{
  pkgs,
  config,
  home,
  ...
}:
let
  firefox-package = pkgs.firefox.override {
    nativeMessagingHosts = [
      pkgs.gnome-browser-connector
      (pkgs.callPackage ./firefox-profile-switcher-connector.nix { })
    ];
  };
in
{
  home.file = {
    "firefoxprofileswitcher/config.json" = {
      target = "${config.xdg.configHome}/firefoxprofileswitcher/config.json";
      text = builtins.toJSON { browser_binary = "${firefox-package}/bin/firefox"; };
    };
  };

  programs.firefox = {
    enable = true;
    package = firefox-package;
    policies = {
      HardwareAcceleration = true;
      DefaultDownloadDirectory = "${config.xdg.userDirs.download}";
      DNSOverHTTPS = {
        Enabled = true;
        Locked = true;
        Fallback = false;
        ExcludedDomains = [
          "pterox.website"
          "local"
        ];
      };
      TranslateEnabled = false;
      SearchBar = "unified";
      RequestedLocales = [
        "ru"
        "en-US"
      ];
      PostQuantumKeyAgreementEnabled = true;
      ExtensionUpdate = true;
      EnableTrackingProtection = {
        Value = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisplayBookmarksToolbar = "newtab";
    };
    profiles.egor = {
      name = "Личный";
      id = 0;
      extensions = with config.nur.repos.rycee.firefox-addons; [
        privacy-badger
        betterttv
        bitwarden
        onetab
        ublock-origin
        tampermonkey
        # smartproxy
        foxyproxy-standard
        tree-style-tab
        profile-switcher
        immersive-translate
      ];
      # containersForce = true;
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
    profiles.eteron = {
      name = "Eteron";
      id = 1;
      extensions = with config.nur.repos.rycee.firefox-addons; [
        privacy-badger
        bitwarden
        onetab
        ublock-origin
        tampermonkey
        foxyproxy-standard
        tree-style-tab
        profile-switcher
        immersive-translate
      ];
      containersForce = true;
      containers = {
        eteron.id = 0;
        eteron.name = "Eteron";
        eteron.icon = "briefcase";
        eteron.color = "blue";
      };
      bookmarks = [
        {
          name = "Yandex Cloud";
          url = "https://console.yandex.cloud";
        }
        {
          name = "GitLab";
          url = "https://gitlab.eteron.ru";
        }
        {
          name = "Grafana";
          url = "https://grafana.eteron.ru";
        }
        {
          name = "Prometheus";
          url = "https://prometheus.eteron.ru/alerts";
        }
        {
          name = "Zabbix";
          url = "https://zabbix.eteron.ru";
        }
        {
          name = "Graylog";
          url = "https://logs.eteron.ru";
        }
        {
          name = "Bareos";
          url = "https://backups.eteron.ru";
        }
        {
          name = "BigBird";
          url = "https://app.bigbird.ru";
        }
        {
          name = "BigBird2";
          url = "https://app2.bigbird.ru";
        }
        {
          name = "BigBird Demo";
          url = "https://demo.bigbird.ru";
        }
        {
          name = "BigBird2 Demo";
          url = "https://demo2.bigbird.ru";
        }
        {
          name = "YandexGPT";
          url = "https://a.ya.ru";
        }
      ];
    };
  };

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    MOZ_USE_XINPUT2 = "1";
  };
}
