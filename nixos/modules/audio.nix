{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    alsa-utils
    wireplumber
  ];
  hardware.firmware = [ pkgs.sof-firmware ];
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
}
