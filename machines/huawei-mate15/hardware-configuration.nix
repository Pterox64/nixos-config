# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/ea75163e-1051-4366-bca9-a77da3e182f0";
    fsType = "btrfs";
    options = [ "subvol=rootfs" ];
  };

  boot.initrd.luks.devices."crypted".device =
    "/dev/disk/by-uuid/ece7d7db-1bc8-41e8-a343-e0952d396ecc";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/8F6E-8C07";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/ea75163e-1051-4366-bca9-a77da3e182f0";
    fsType = "btrfs";
    options = [ "subvol=home" ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/ea75163e-1051-4366-bca9-a77da3e182f0";
    fsType = "btrfs";
    options = [ "subvol=nix" ];
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/d26ad254-f11d-4b23-9ccc-2c925cbcfc70"; }
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp1s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
