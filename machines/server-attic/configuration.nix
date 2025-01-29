{ pkgs, lib, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  system = {
    stateVersion = "24.05";
    autoUpgrade.enable = true;
  };
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      allowed-users = [ "@wheel" ];
    };
  };
  boot = {
    loader.systemd-boot.enable = true;
    plymouth.enable = false;
  };
  services = {
    cloud-init.network.enable = true;
    fwupd.enable = true;
    openssh = {
      enable = true;
      ports = [ 22 ];
      settings = {
        PasswordAuthentication = false;
        AllowUsers = null;
        UseDns = true;
        X11Forwarding = false;
        PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
      };
    };
    sshguard.enable = true;
  };

  environment.systemPackages = with pkgs; [ ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases =
      let
        flakeDir = "/home/egor/server-config";
      in
      {
        upd = "nix flake update ${flakeDir}";
        rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
        upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";

        ll = "ls -alF";
        ff = "fastfetch";
      };

    ohMyZsh = {
      enable = true;
      plugins = [ "man" ];
      theme = "agnoster";
    };

    syntaxHighlighting = {
      highlighters = [
        "main"
        "brackets"
        "pattern"
        "regexp"
        "root"
        "line"
      ];
    };
  };

  users = {
    mutableUsers = true;
    defaultUserShell = pkgs.zsh;
    users.egor = {
      isNormalUser = true;
      home = "/home/egor";
      description = "Egor Platokhin";
      initialPassword = "qwedcxza";
      extraGroups = [ "wheel" ];
      useDefaultShell = true;
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOwSgNtKQM5axwsgIynVpqgLirNWYxdAj0oIZ0Oo+tIc Personal ssh key"
      ];
    };
  };
}
