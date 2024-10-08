{
  pkgs,
  pkgs-unstable,
  config,
  home,
  ...
}:
{
  home.packages = with pkgs-unstable; [ yandex-disk ];

  xdg.dataFile.iconYandexDisk512 = {
    source = builtins.fetchurl {
      url = "https://upload.wikimedia.org/wikipedia/commons/f/f6/YandexDisk.png";
      sha256 = "sha256:222352b7a7cf2ddfa2adbf0a5560ec4ffdc8783ef88d8e7a6103e564d382abfe";
    };
    target = "${config.xdg.dataHome}/pixmaps/YandexDisk.png";
  };

  xdg.desktopEntries.yandex-disk = {
    name = "Yandex Disk";
    genericName = "Яндекс Диск";
    exec = "${pkgs.yandex-disk}/bin/yandex-disk sync";
    terminal = true;
    type = "Application";
    categories = [ "Network" ];
    icon = "YandexDisk";
    noDisplay = false;
    actions = {
      "Sync" = {
        exec = "${pkgs.yandex-disk}/bin/yandex-disk sync";
      };
      "Start" = {
        exec = "${pkgs.yandex-disk}/bin/yandex-disk start";
      };
      "Stop" = {
        exec = "${pkgs.yandex-disk}/bin/yandex-disk stop";
      };
      "Status" = {
        exec = "${pkgs.yandex-disk}/bin/yandex-disk status";
      };
    };
  };

  # systemd.user.services.yandex-disk = {
  #   Unit = {
  #     Description = "Yandex.Disk";
  #     Requires = [ "default.target" ];
  #     After = [ "default.target" ];
  #   };
  #   Install = {
  #     WantedBy = [ "default.target" ];
  #   };
  #   Service = {
  #     Type = "simple";
  #     Restart = "always";
  #     ExecStart = "${pkgs.yandex-disk}/bin/yandex-disk start --config ${config.xdg.configHome}/yandex-disk/config.cfg";
  #     ExecStop = "${pkgs.yandex-disk}/bin/yandex-disk stop";
  #   };
  # };
}
