{
  pkgs ? import <nixpkgs> { },
}:
pkgs.callPackage ./firefox-profile-switcher-connector.nix { }
