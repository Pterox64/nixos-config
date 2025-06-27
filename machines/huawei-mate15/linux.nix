{ pkgs, config, ... }:
{
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_12;

  boot.kernelModules = [
    "acpi_cpufreq"
    "powernow-k8"
  ];
  boot.extraModprobeConfig = ''
    options fuse allow_other
  '';
  boot.kernelParams = [
    "amd_pstate=active"
    "i8042.nopnp"
    "iommu=soft" # помогает при проблемах с PCIe
    "processor.max_cstate=5" # ограничивает переходы CPU в глубокие C‑states
    "amdgpu.dcdebugmask=0x10" # выключает PSR
    "mem_sleep_default=deep" # классичесий S3 – надёжнее для AMD
    "tsc=unstable"
  ];

  systemd.services.systemd-suspend.environment.SYSTEMD_SLEEP_FREEZE_USER_SESSIONS = "false"; # предотвращает некорректный возврат из режима заморозки.

  # powerManagement.cpuFreqGovernor = "schedutil";
  services.power-profiles-daemon.enable = true;
  hardware.cpu.amd.updateMicrocode = true;

  system.requiredKernelConfig = with config.lib.kernelConfig; [
    (isYes "X86_AMD_PSTATE")
    (isYes "X86_FEATURE_CPPC")
  ];
}
