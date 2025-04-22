{ pkgs, config, ... }:
{
  imports = [ ../modules/zsh.nix ];

  zsh.enable = true;
  zsh.initCmd = [ "complete -C ${pkgs.syncthing}/bin/syncthing syncthing" ];
  zsh.userName = "tanya";
  zsh.nixosConfigurations = "htpc";
  zsh.omz.enable = true;
  zsh.omz.plugins = [
    "fzf"
    "man"
  ];
  zsh.omz.theme = "agnoster";
}
