{ pkgs, lib, ... }:
{
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
      "nvidia-persistenced"
    ];
  environment.systemPackages = with pkgs; [
    wget
    curl
    pciutils
    inxi
    tree
    mc
    nano
    tmux
    git
    gnumake
    cmake
    lshw
    usbutils
    nixfmt-rfc-style
    dig
    jq
    home-manager
    oh-my-zsh
    fzf
    fzf-zsh
    zsh-fzf-history-search
    fastfetch
    openssl
  ];
  environment.gnome.excludePackages = with pkgs; [
    gnome.geary
    epiphany
    gnome-tour
  ];
  services.xserver.excludePackages = [ pkgs.xterm ];
}
