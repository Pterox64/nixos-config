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
    cryptsetup
    curl
    # geocode-glib
    wget
    pciutils
    inxi
    tree
    mc
    nano
    tmux
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
    clevis
  ];
  environment.gnome.excludePackages = with pkgs; [
    geary
    epiphany
    gnome-tour
  ];
  services.xserver.excludePackages = [ pkgs.xterm ];
}
