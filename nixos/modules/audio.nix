{ pkgs, ... }:
{
  hardware.firmware = [ pkgs.sof-firmware ];
  # Enable sound.
  hardware.pulseaudio.enable = false;
  sound.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
}
