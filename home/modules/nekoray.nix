{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    nekoray
  ];
  security.wrappers.nekobox_core = {
    source = "${pkgs.nekoray}/bin/nekobox_core";
    capabilities = "cap_net_admin,cap_net_raw=ep";
    owner = "root";
    group = "root";
    permissions = "u+rx,g+rx,o+rx";
  };
}
