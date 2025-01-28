{ pkgs, ... }:
{
  home.packages = with pkgs; [
    xdg-desktop-portal-gnome
    xdg-desktop-portal
  ];
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        disabledTrayIcon = true;
        showStartupLaunchMessage = false;
        startupLaunch = true;
        showDesktopNotification = true;
      };
    };
  };
}
