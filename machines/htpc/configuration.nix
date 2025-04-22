# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ pkgs, ... }:
{
  networking.hostName = "htpc";
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ./linux.nix
    ./env.nix
    ./gpu.nix
    ./pakages.nix

    ../modules/boot/systemd-boot.nix
    ../modules/i18n/ru_RU.nix
    ../modules/network/nm.nix
    ../modules/time/Europe/Moscow.nix

    ../modules/users/tanya.nix

    ../modules/wm/gnome

    ../modules/appimage.nix
    ../modules/audio.nix
    ../modules/flatpak.nix
    ../modules/git.nix
    ../modules/gnupg.nix
    ../modules/nix.nix
    ../modules/zram.nix
  ];

  environment.etc = {
    "polkit-1/rules.d/85-suspend.rules".text = ''
      polkit.addRule(function(action, subject) {
        if (action.id == "org.freedesktop.login1.suspend" && subject.isInGroup("users")) {
          return polkit.Result.YES;
        }
      });
    '';
  };

  hardware.enableRedistributableFirmware = true;
  hardware.sensor.hddtemp.enable = true;
  hardware.sensor.hddtemp.drives = [ "/dev/nvme0n1" ];

  powerManagement.enable = true;
  powerManagement.powertop.enable = true;

  system.autoUpgrade.enable = true;

  # nix.settings.allowed-users = [ "@wheel" ];

  services.fwupd.enable = true;

  # # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.wayland = false;
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "tanya";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,ru";
    options = "grp:win_space_toggle";
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # xdg.portal.config.common.default = "gtk";

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # nix.gc = {
  #   automatic = true;
  #   dates = "weekly";
  #   options = "--delete-older-than 30d";
  # };
  # nix.settings.experimental-features = [
  #   "nix-command"
  #   "flakes"
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

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
  system.stateVersion = "24.05"; # Did you read the comment?
}
