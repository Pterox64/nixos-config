{ pkgs, ... }:
{
  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
      amdvlk
    ];
    extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
  };
  hardware.amdgpu.amdvlk.enable = true;
  # Установка необходимых пакетов
  environment.systemPackages = with pkgs; [
    vulkan-tools # Для проверки Vulkan
    mesa # Библиотеки OpenGL
  ];
  environment.variables = {
    AMD_VULKAN_ICD = "RADV"; # Использование RADV вместо AMDVLK
    RADV_PERFTEST = "gpl"; # Включение расширенных функций Vulkan
  };
}
