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
    attic-client
  ];
  environment.gnome.excludePackages = with pkgs; [
    geary
    epiphany
    gnome-tour
    gnome-console
  ];
  services.xserver.excludePackages = [ pkgs.xterm ];
}
