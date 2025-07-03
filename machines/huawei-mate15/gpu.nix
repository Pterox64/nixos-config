{ pkgs, ... }:

{
  boot.kernelParams = [
    "amdgpu.dc=1"
    "amdgpu.sg_display=0"
  ];

  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        vulkan-tools
        glxinfo
        mesa
        amdvlk
      ];
    };
    amdgpu.amdvlk.enable = false;
  };

  environment = {
    systemPackages = with pkgs; [
      vulkan-tools
      glxinfo
      mesa
    ];
    variables = {
      AMD_VULKAN_ICD = "RADV";
      RADV_PERFTEST = "gpl";
    };
  };
}
