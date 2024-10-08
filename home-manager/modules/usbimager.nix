{ pkgs, ... }:
{
  home.packages = with pkgs; [ usbimager ];
}
