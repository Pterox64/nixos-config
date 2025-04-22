{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    docker
    docker-compose
  ];
  virtualisation.docker = {
    enable = true;
    storageDriver = "overlay2";
  };
}
