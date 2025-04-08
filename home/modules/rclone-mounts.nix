{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) types mkEnableOption mkOption;
in
{
  options.rcloneMounts = {
    enable = mkEnableOption "Enable rclone mounts";

    remotes = mkOption {
      type = types.listOf types.str;
      default = [ ];
      example = [
        "<Name of remote1>"
        "<Name of remote2>"
      ];
      description = "List of remote storage names to mount";
    };

    mountPoint = mkOption {
      type = types.str;
      default = "/tmp";
      description = "Prefix path for mount points";
    };

    extraOptions = mkOption {
      type = types.listOf types.str;
      default = [ "--vfs-cache-mode writes" ];
      description = "Extra options for rclone mount command";
    };
  };

  config = lib.mkIf config.rcloneMounts.enable {
    home.packages = [ pkgs.rclone ];

    systemd.user.services = lib.listToAttrs (
      map (remote: {
        name = "rclone-mount-${remote}";
        value = {
          Unit = {
            Description = "Rclone Mount Service for ${remote}";
            Requires = [ "default.target" ];
            After = [ "network.target" ];
          };
          Install = {
            WantedBy = [ "default.target" ];
          };
          Service = {
            Type = "notify";
            Restart = "on-failure";
            ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p ${config.rcloneMounts.mountPoint}/${remote}";
            ExecStart =
              lib.concatStringsSep " " [
                "${pkgs.rclone}/bin/rclone mount"
                "${remote}:"
                "${config.rcloneMounts.mountPoint}/${remote}"
              ]
              + " "
              + lib.concatStringsSep " " config.rcloneMounts.extraOptions;
            ExecStop = "${pkgs.fuse}/bin/fusermount -u ${config.rcloneMounts.mountPoint}/${remote}";
          };
        };
      }) config.rcloneMounts.remotes
    );
  };
}
