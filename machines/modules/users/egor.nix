{ pkgs, lib, ... }:
{
  programs.zsh.enable = true;
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
      "video"
    ];
    useDefaultShell = true;
    initialPassword = "!12345678";
  };
}
