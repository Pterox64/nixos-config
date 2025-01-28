{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    alsa-utils pulsemixer
    wireplumber
  ];
  hardware.firmware = [ pkgs.sof-firmware ];
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
}
