{ pkgs, ... }:
{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
      };
    };
    package = pkgs.bluez;
  };

  services.blueman.enable = true;
  environment.etc."xdg/blueman/plugins.conf".text = ''
    [General]
    disabled-plugins = GameControllerWakelock, DhcpClient, PPPSupport
  '';
}
