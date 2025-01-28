{ pkgs, ... }:
{
  nixpkgs.config.permittedInsecurePackages = [ "oraclejre-8u281" ];
  programs.java = {
    enable = true;
    package = pkgs.oraclejre8;
  };
}
