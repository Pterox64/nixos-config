{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bitwarden-cli
    guake
    nekoray
    obsidian
    keepass
    hydra-check
  ];
}
