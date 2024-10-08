{ pkgs, ... }:
{
  # programs.winbox.enable = true; 
  home.packages = with pkgs; [ winbox ];
}
