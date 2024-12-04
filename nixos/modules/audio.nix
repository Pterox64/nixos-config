{ pkgs, ... }:
{
  hardware.firmware = [ pkgs.sof-firmware ];
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
}
