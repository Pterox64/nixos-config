{ pkgs, ... }:
{
  imports = [ ./extensions.nix ];

  home.packages = with pkgs; [
    gnome-tweaks
    gnome-terminal
    libheif
    gst_all_1.gst-plugins-bad
  ];
  home.sessionVariables = {
    GST_PLUGIN_SYSTEM_PATH_1_0 = "${pkgs.gst_all_1.gst-plugins-bad}/lib/gstreamer-1.0";
  };
}
