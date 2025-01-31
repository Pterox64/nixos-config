{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    curl
    mc
    nano
    tmux
    jq
    fzf
    fzf-zsh
    zsh-fzf-history-search
    fastfetch
  ];

  programs.zsh = {
    ohMyZsh = {
      enable = true;
      plugins = [
        "fzf"
        "git"
        "python"
        "docker-compose"
        "docker"
      ];
    };
  };
}
