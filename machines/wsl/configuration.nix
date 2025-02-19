# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
    <home-manager/nixos>
  ];

  time.timeZone = "Europe/Moscow";
  services.timesyncd.enable = true;

  i18n.defaultLocale = "ru_RU.UTF-8";
  i18n.supportedLocales = [
    "ru_RU.UTF-8/UTF-8"
    "C.UTF-8/UTF-8"
    "en_US.UTF-8/UTF-8"
  ];
  console = {
    earlySetup = true;
    packages = [ pkgs.terminus_font ];
    font = "cyr-sun16";
    keyMap = lib.mkDefault "ru";
  };

  nix = {
    settings = {
      allowed-users = [ "@wheel" ];
      trusted-users = [
        "root"
        "@wheel"
      ];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    extraOptions = ''
      keep-build-log = true
      keep-outputs = true
      keep-derivations = true
    '';
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  environment.systemPackages = with pkgs; [
    wget
    mc
    tmux
    docker
    docker-compose
    fzf
    fzf-zsh
    zsh-fzf-history-search
  ];

  virtualisation.docker.enable = true;

  programs.nix-ld.enable = true;
  programs.git = {
    enable = true;
    prompt.enable = true;
  };
  programs.zsh.enable = true;

  wsl.enable = true;
  wsl.defaultUser = "egor";

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
    ];
    useDefaultShell = true;
  };
  home-manager.users.egor = { pkgs, ... }: {
    home.packages = [ pkgs.atool pkgs.httpie ];
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      oh-my-zsh = {
        enable = true;
        plugins = [
          "fzf"
          "git"
          "python"
          "man"
          "docker-compose"
          "docker"
        ];
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

      history.size = 10000;
    };

    programs.git = {
      enable = true;
      userName = "Egor Platohin";
      userEmail = "e.platohin@eteron.ru";
      lfs.enable = true;
      ignores = [
        "*~"
        ".*.swp"
        ".DS_Store"
      ];
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
        core.autocrlf = "input";
        alias = {
          hist = "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short";
          st = "status -sb";
          co = "checkout";
          ci = "commit -a";
        };
      };
    };

    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "24.11";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
