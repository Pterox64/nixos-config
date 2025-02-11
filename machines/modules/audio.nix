{ pkgs, ... }:
{
  hardware = {
    firmware = [ pkgs.sof-firmware ];
    pulseaudio.enable = false;
  };

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

  # # Сервис для восстановления звукового профиля
  # systemd.services.alsactl-restore = {
  #   description = "Restore ALSA settings";
  #   wantedBy = [ "multi-user.target" ];
  #   after = [ "sound.target" ];
  #   serviceConfig = {
  #     Type = "oneshot";
  #     ExecStart = "${pkgs.alsa-utils}/bin/alsactl restore";
  #     RemainAfterExit = true;
  #   };
  # };
}
