{ pkgs, ... }:
{
  home.packages = with pkgs; [
    cascadia-code
  ];
  programs.kitty =
    let
      bgImage = pkgs.stdenv.mkDerivation {
        name = "miku-image";
        src = ./img/miku.png;
        phases = [ "installPhase" ];
        installPhase = "cp $src $out";
      };
    in
    {
      enable = true;
      font = {
        name = "Cascadia Code PL";
        size = 12;
      };
      themeFile = "Gnome-ish_gray-on-black";
      settings = {
        term = "xterm-256color";
        update_check_interval = 0;
        scrollback_lines = 100000;
        linux_display_server = "wayland";
        wayland_titlebar_color = "system";
        remember_window_size = true;
        initial_window_width = 800;
        initial_window_height = 600;
        window_border_width = "1pt";
        draw_minimal_borders = false;
        tab_bar_edge = "bottom";
        copy_on_select = true;
        strip_trailing_spaces = "smart";
        clipboard_control = "write-clipboard write-primary read-clipboard-ask read-primary-ask";
        window_logo_path = "${bgImage}";
        window_logo_position = "bottom-right";
        window_logo_alpha = 0.15;
        window_logo_scale = 80;
        background_opacity = 0.95;
        background_blur = 180;
      };
    };
}
