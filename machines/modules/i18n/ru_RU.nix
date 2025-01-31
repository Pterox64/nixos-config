{ pkgs, lib, ... }:
{
  i18n.defaultLocale = "ru_RU.UTF-8";
  i18n.supportedLocales = [
    "ru_RU.UTF-8/UTF-8"
    "C.UTF-8/UTF-8"
    "en_US.UTF-8/UTF-8"
  ];
  # services.xserver.xkb = {
  # layout = "us,ru";
  # options = "grp:win_space_toggle";
  # };
  console = {
    earlySetup = true;
    packages = [ pkgs.terminus_font ];
    font = "cyr-sun16";
    keyMap = lib.mkDefault "ru";
    # useXkbConfig = true; # use xkb.options in tty.
  };
}
