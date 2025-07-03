{
  config,
  lib,
  pkgs,
  ...
}:
{
  i18n.defaultLocale = "ru_RU.UTF-8";
  i18n.supportedLocales = [
    "ru_RU.UTF-8/UTF-8"
  ];
  environment.variables = {
    "LC_CTYPE" = "ru_RU.UTF-8";
    "LC_ALL" = "ru_RU.UTF-8";
  };

  console = {
    earlySetup = true;
    packages = [ pkgs.terminus_font ];
    font = "cyr-sun16";
    keyMap = lib.mkDefault "ru";
  };

  systemd.services.display-manager.environment = lib.mkIf (config.services.displayManager.enable) {
    "LANG" = "ru_RU.UTF-8";
    "LC_CTYPE" = "ru_RU.UTF-8";
    "LC_ALL" = "ru_RU.UTF-8";
  };
}
