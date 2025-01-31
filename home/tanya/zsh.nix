{ pkgs, config, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
      complete -C ${pkgs.syncthing}/bin/syncthing syncthing
      fastfetch
    '';

    shellAliases =
      let
        flakeDir = "~/git/nixos-config";
      in
      {
        upd = "nix flake update ${flakeDir}";

        rb = "sudo nixos-rebuild switch --flake ${flakeDir}#htpc";
        upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}#htpc";

        hms = "home-manager switch --flake ${flakeDir}#tanya";

        ll = "ls -alF";
        ff = "fastfetch";
      };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "fzf"
        "man"
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
