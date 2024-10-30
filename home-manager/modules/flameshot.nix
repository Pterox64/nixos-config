{ pkgs, ... }:
{
  services.flameshot.enable = true;
  services.flameshot.settings = {
    General = {
      disabledTrayIcon = false;
      showStartupLaunchMessage = false;
      startupLaunch = true;
      showDesktopNotification = true;
    };
  };
}
