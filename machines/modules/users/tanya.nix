{ pkgs, lib, ... }:
{
  programs.zsh.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.mutableUsers = false;
  users.defaultUserShell = pkgs.zsh;
  users.users.tanya = {
    isNormalUser = true;
    home = "/home/tanya";
    description = "Tanya Platokhina";
    password = "";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    useDefaultShell = true;
  };
  security.sudo.extraRules = [
    {
      users = [ "tanya" ];
      commands = [
        {
          command = "ALL";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];
}
