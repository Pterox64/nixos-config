{ pkgs, ... }:
{
  home.packages = with pkgs; [
    cascadia-code
  ];
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
  };
}
