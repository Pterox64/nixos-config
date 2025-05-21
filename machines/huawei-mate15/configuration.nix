{ pkgs, ... }:
{
  networking.hostName = "huawei-mate15";

  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ./linux.nix
    ./env.nix
    ./gpu.nix
    ./pakages.nix

    ../modules/boot/lanzaboote.nix
    ../modules/hardware/fprintd/goodix.nix
    ../modules/i18n/ru_RU.nix
    ../modules/network/nm.nix
    ../modules/services/yubikey.nix
    ../modules/time/Europe/Moscow.nix
    ../modules/users/egor.nix
    ../modules/virtualisation/virt-manager
    ../modules/wm/kde
    ../modules/appimage.nix
    ../modules/audio.nix
    ../modules/bluetooth.nix
    ../modules/cups.nix
    ../modules/docker.nix
    ../modules/flatpak.nix
    ../modules/git.nix
    ../modules/gnupg.nix
    ../modules/nix.nix
    # ../modules/zram.nix
  ];

  # disabledModules = [
  #   ./modules/fprintd.nix
  #   ./modules/java.nix
  # ];

  boot.initrd.clevis.enable = true;

  boot.kernelParams = [
    "resume=/dev/nvme0n1p3" # Говорим ядру, что гибернация идёт в дисковый swap
  ];

  hardware = {
    enableRedistributableFirmware = true;
    cpu.amd.ryzen-smu.enable = true;
    sensor.hddtemp = {
      enable = true;
      drives = [ "/dev/nvme0n1" ];
    };
  };

  powerManagement = {
    enable = true;
    powertop.enable = true;
  };

  security.rtkit.enable = true;
  security.pam.services.gdm.enableGnomeKeyring = true;
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (action.id == "org.freedesktop.udisks2.filesystem-mount" &&
          subject.isInGroup("users")) {
        return polkit.Result.YES;
      }
    });
  '';

  programs.fuse.userAllowOther = true;

  # Сервис для восстановления звукового профиля
  systemd.services.alsactl-restore =
    let
      soundCardNumber = 1;
      script = pkgs.writeShellScript "alsa-cfg" ''
        ${pkgs.alsa-utils}/bin/amixer -c ${toString soundCardNumber} sset 'Right Headphone Mixer Right DAC' on
        ${pkgs.alsa-utils}/bin/amixer -c ${toString soundCardNumber} sset 'Left Headphone Mixer Left DAC' on
      '';
    in
    {
      description = "Restore ALSA settings";
      wantedBy = [ "multi-user.target" ];
      after = [ "sound.target" ];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${script}";
        RemainAfterExit = true;
      };
    };

  systemd.sleep.extraConfig = ''
    HibernateMode=shutdown
    HibernateState=disk
  '';

  services = {
    fwupd.enable = true;

    dbus.enable = true;
    dbus.packages = [ pkgs.gnome-keyring ];

    samba-wsdd.enable = true;

    avahi.nssmdns4 = true;
    avahi.nssmdns6 = true;

    # Configure keymap in X11
    xserver.xkb = {
      layout = "us,ru";
      options = "grp:win_space_toggle";
    };

    # Enable touchpad support (enabled default in most desktopManager).
    libinput.enable = true;

    # List services that you want to enable:

    # Enable the OpenSSH daemon.
    # openssh.enable = true;
  };

  # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # xdg.portal.config.common.default = "gtk";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPortRanges = [
    {
      from = 1714;
      to = 1764;
    }
  ];
  networking.firewall.allowedUDPPortRanges = [
    {
      from = 1714;
      to = 1764;
    }
  ];
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  system = {
    # This option defines the first version of NixOS you have installed on this particular machine,
    # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
    #
    # Most users should NEVER change this value after the initial install, for any reason,
    # even if you've upgraded your system to a new NixOS release.
    #
    # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
    # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
    # to actually do that.
    #
    # This value being lower than the current NixOS release does NOT mean your system is
    # out of date, out of support, or vulnerable.
    #
    # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
    # and migrated your data accordingly.
    #
    # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
    stateVersion = "24.11"; # Did you read the comment?
    autoUpgrade.enable = true;
  };
}
