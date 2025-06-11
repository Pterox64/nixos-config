{ pkgs, config, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.kernelModules = [
    "amd_pstate"
    "acpi_cpufreq"
    "powernow-k8"
  ];
  boot.extraModprobeConfig = ''
    options fuse allow_other
  '';
  boot.kernelParams = [
    "amd_pstate=active"
    "i8042.nopnp"
  ];

  powerManagement.cpuFreqGovernor = "schedutil";
  services.power-profiles-daemon.enable = true;
  hardware.cpu.amd.updateMicrocode = true;

  system.requiredKernelConfig = with config.lib.kernelConfig; [
    (isYes "X86_AMD_PSTATE")
    (isYes "X86_FEATURE_CPPC")
  ];
}
