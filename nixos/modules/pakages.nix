{ pkgs, lib, ... }:
{
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "libfprint-2-tod1-goodix"
      "oraclejre"
    ];
  environment.systemPackages = with pkgs; [
    wget
    curl
    pciutils
    python3
    docker
    docker-compose
    pulsemixer
    inxi
    tree
    mc
    nano
    tmux
    git
    gnumake
    cmake
    translate-shell
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
    opentofu
    openssl
  ];
  environment.gnome.excludePackages = with pkgs; [
    gnome.geary
    epiphany
    gnome-tour
  ];
  services.xserver.excludePackages = [ pkgs.xterm ];
}
