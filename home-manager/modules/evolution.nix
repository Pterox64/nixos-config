{ pkgs, ... }:
{
  # programs.evolution.enable = true;
  home.packages = with pkgs; [ evolution ];
}
