{
  pkgs ? import <nixpkgs> { },
}:
pkgs.callPackage ./spoofdpi.nix { }
