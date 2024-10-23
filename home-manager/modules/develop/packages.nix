{ pkgs, ... }:
{
  home.packages = with pkgs; [ adoptopenjdk-icedtea-web ];
}
