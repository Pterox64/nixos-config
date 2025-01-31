{ pkgs, ... }:
{
  environment.variables._JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=lcd";
  nixpkgs.config.permittedInsecurePackages = [ "oraclejre-8u281" ];
  programs.java = {
    enable = true;
    package = pkgs.oraclejre8;
  };
}
