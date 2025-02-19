{ pkgs, lib, ... }:
{
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
    ];
  environment.systemPackages = with pkgs; [
    curl
    wget
    mc
    nano
    tmux
    dig
    jq
    home-manager
    oh-my-zsh
    fzf
    fzf-zsh
    zsh-fzf-history-search
    fastfetch
  ];
}
