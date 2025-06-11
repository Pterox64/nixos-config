{ pkgs, ... }:
{
  hardware.firmware = [ pkgs.sof-firmware ];

  services.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [
    alsa-utils
    pulsemixer
    wireplumber
  ];
}
