{ pkgs, home, ... }:
let
  spoofdpi = pkgs.callPackage ../../pkgs/SpoofDPI/spoofdpi.nix { };
in
{
  home.packages = [ spoofdpi ];

  systemd.user.services.spoofdpi = {
    Unit = {
      Description = "A simple and fast anti-censorship tool written in Go";
      Requires = [ "default.target" ];
      After = [ "default.target" ];
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
    Service = {
      Type = "simple";
      Restart = "always";
      ExecStart = "${spoofdpi}/bin/spoofdpi -silent -dns-addr 1.1.1.1 -port 8687 -enable-doh";
    };
  };
}
