{ pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
      amdvlk
    ];
    extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
  };
  hardware.amdgpu.amdvlk.enable = true;
}
