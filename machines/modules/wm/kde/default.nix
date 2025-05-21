{ pkgs, ... }:
{
  # Disable the X11 windowing system.
  services.xserver.enable = false;
  # Display Manager (SDDM) и KDE Plasma 6 в Wayland
  services.displayManager.sddm.enable = true;
  services.displayManager.defaultSession = "plasma";
  services.displayManager.sddm.wayland.enable = true;

  services.desktopManager.plasma6.enable = true;
}
