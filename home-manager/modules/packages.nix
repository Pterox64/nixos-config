{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bitwarden-desktop
    dbeaver-bin
    guake
    nekoray
    obsidian
    keepass
    hydra-check
  ];
}
