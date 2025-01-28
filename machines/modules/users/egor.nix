{ pkgs, lib, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.mutableUsers = true;
  users.defaultUserShell = pkgs.zsh;
  users.users.egor = {
    isNormalUser = true;
    home = "/home/egor";
    description = "Egor Platokhin";
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
      "libvirtd"
    ];
    useDefaultShell = true;
  };
}
