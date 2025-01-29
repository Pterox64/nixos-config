{ pkgs, lib, ... }:
{
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "libfprint-2-tod1-goodix"
      "oraclejre"
    ];
  environment.systemPackages = with pkgs; [
    attic-client
    cmake
    curl
    wget
    pciutils
    python3
    inxi
    tree
    mc
    nano
    tmux
    gnumake
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
    geary
    epiphany
    gnome-tour
  ];
  services.xserver.excludePackages = [ pkgs.xterm ];
}
