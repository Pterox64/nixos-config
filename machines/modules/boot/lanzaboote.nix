{ pkgs, ... }:
{
  environment.systemPackages = [
    # For debugging and troubleshooting Secure Boot.
    pkgs.sbctl
  ];

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/etc/secureboot";
  };

  imports = [ ./default.nix ];
}
