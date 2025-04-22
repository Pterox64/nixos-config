{ pkgs, config, ... }:
{
  imports = [ ../modules/zsh.nix ];

  zsh.enable = true;
  zsh.initCmd = [ "complete -C ${pkgs.syncthing}/bin/syncthing syncthing" ];
  zsh.userName = "egor";
  zsh.nixosConfigurations = "huawei_mate15";
  zsh.omz.enable = true;
  zsh.omz.plugins = [
    "fzf"
    "git"
    "python"
    "man"
    "docker-compose"
    "docker"
  ];
  zsh.omz.theme = "agnoster";
}
