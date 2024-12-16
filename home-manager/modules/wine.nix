{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # # support both 32-bit and 64-bit applications
    # wineWowPackages.stable

    # wine-staging (version with experimental features)
    wineWowPackages.staging

    # winetricks (all versions)
    winetricks

    # native wayland support (unstable)
    # wineWowPackages.waylandFull
  ];
}
