{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_13;
  boot.kernelModules = [
    "overlay"
    "fuse"
  ];
  boot.blacklistedKernelModules = [ "aufs" ];
}
