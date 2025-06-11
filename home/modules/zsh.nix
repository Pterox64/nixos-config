{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) types mkEnableOption mkOption;
in
{
  options.zsh = {
    enable = mkEnableOption "Enable custom zsh configuration management";

    flakeDir = mkOption {
      type = types.path;
      default = "${config.home.homeDirectory}/git/nixos-config";
      description = "Path to NixOS flake directory";
    };

    userName = mkOption {
      type = types.nonEmptyStr;
      default = "";
      example = "alice";
      description = "System username for home-manager profile";
    };

    nixosConfigurations = mkOption {
      type = types.nonEmptyStr;
      default = "";
      example = "comp1";
      description = "Hostname of NixOS configuration to target in rebuild commands";
    };

    shellAliases = mkOption {
      type = types.attrsOf types.str;
      default = {
        ll = "ls -alF";
        ff = "fastfetch";
      };
      description = "Custom shell aliases";
    };

    initCmd = mkOption {
      type = types.listOf types.str;
      default = [ ];
      example = [
        "fastfetch"
        "uname -a"
      ];
      description = "Shell commands to run during zsh initialization";
    };

    omz.enable = mkEnableOption "Oh My Zsh framework";

    omz.plugins = mkOption {
      type = types.listOf types.str;
      default = [ ];
      example = [
        "fzf"
        "git"
        "python"
        "man"
        "docker-compose"
        "docker"
      ];
      description = "Oh My Zsh plugins to load in zshrc";
    };

    omz.theme = mkOption {
      type = types.str;
      default = "agnoster";
      description = "Oh My Zsh theme name to apply";
    };

    syntaxHighlighting = mkOption {
      type = types.listOf types.str;
      default = [
        "main"
        "brackets"
        "pattern"
        "regexp"
        "root"
        "line"
      ];
      description = "Zsh-syntax-highlighting components to activate (highlighters)";

    };
  };

  config = lib.mkIf config.zsh.enable {
    home.packages = [
      pkgs.zsh-nix-shell
    ];
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      initContent = lib.concatStringsSep "\n" config.zsh.initCmd;

      shellAliases =
        let
          flakeDir = toString config.zsh.flakeDir;
          nixosConfigurations = config.zsh.nixosConfigurations;
        in

        config.zsh.shellAliases
        // {
          upd = "nix flake update --flake ${flakeDir}";

          rb = "sudo nixos-rebuild switch --flake ${flakeDir}#${nixosConfigurations}";
          upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}#${nixosConfigurations}";

          hms = "home-manager switch --flake ${flakeDir}#${config.zsh.userName}";
        };

      oh-my-zsh = {
        enable = config.zsh.omz.enable;
        plugins = config.zsh.omz.plugins;
        theme = config.zsh.omz.theme;
      };

      syntaxHighlighting = {
        highlighters = config.zsh.syntaxHighlighting;
      };

      history.size = 10000;
      history.path = "${config.xdg.dataHome}/zsh/history";
    };
  };
}
