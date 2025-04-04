{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_14;
  # boot.kernelPackages =
  #   let
  #     linux_huawei = pkgs.callPackage ../kernel/linux-6.1.3-huawei.nix { };
  #   in
  #   pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux_huawei);

  # boot.kernelModules = [
  #   "snd_soc_es8316"
  #   "snd_acp3x_pcm_dma"
  #   "snd_acp3x_i2s"
  #   "snd_pci_acp3x"
  #   "snd_soc_acp3x_es8336_mach"
  # ];
  # boot.blacklistedKernelModules = [
  #   "snd_acp3x_rn"
  #   "snd_pci_acp5x"
  #   "snd_rn_pci_acp3x"
  # ];
}
