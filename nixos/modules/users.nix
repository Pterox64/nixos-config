{ pkgs, lib, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.mutableUsers = false;
  users.defaultUserShell = pkgs.zsh;
  users.users.egor = {
    isNormalUser = true;
    home = "/home/egor";
    description = "Egor Platokhin";
    hashedPassword = lib.strings.fileContents ../user.egor.secret;
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
    ];
    useDefaultShell = true;
  };
}
