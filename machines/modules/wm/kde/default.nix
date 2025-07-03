{ pkgs, ... }:
{
  # Disable the X11 windowing system.
  services.xserver.enable = false;
  # Display Manager (SDDM) и KDE Plasma 6 в Wayland
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  services.displayManager.defaultSession = "plasma";

  services.desktopManager.plasma6.enable = true;
  # environment.plasma6.excludePackages = with pkgs.kdePackages; [
  #   konsole # терминал KDE
  # ];
  security.pam.services.sddm.kwallet.enable = true;
  programs.kdeconnect.enable = true;
}
