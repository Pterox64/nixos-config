{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_13;
  boot.extraModprobeConfig = ''
    options fuse allow_other
  '';
  boot.kernelParams = [
    "i8042.nopnp"
  ];
}
