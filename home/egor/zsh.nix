{ pkgs, config, ... }:
{
  home.packages = [
    pkgs.zsh-nix-shell
  ];
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
      complete -C ${pkgs.syncthing}/bin/syncthing syncthing
    '';

    shellAliases =
      let
        flakeDir = "~/git/nixos-config";
      in
      {
        upd = "nix flake update --flake ${flakeDir}";

        rb = "sudo nixos-rebuild switch --flake ${flakeDir}#huawei_mate15";
        upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}#huawei_mate15";

        hms = "home-manager switch --flake ${flakeDir}#egor";

        ll = "ls -alF";
        ff = "fastfetch";
      };

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
    history.path = "${config.xdg.dataHome}/zsh/history";
  };
}
