{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_5_15;
  boot.kernelParams = [
    "acpi_enforce_resources=lax"
    "pcie_aspm=force"
  ];
}
