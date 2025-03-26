{ pkgs, ... }:
{
  home.packages = with pkgs; [
    cascadia-code
    tilix
  ];
}
