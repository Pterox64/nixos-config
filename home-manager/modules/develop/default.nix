{ pkgs, ... }:
{
  imports = [
    ./git.nix
    ./golang.nix
    ./nodejs.nix
    ./packages.nix
    ./vscode.nix
  ];

  home.packages = with pkgs; [ adoptopenjdk-icedtea-web ];
}
