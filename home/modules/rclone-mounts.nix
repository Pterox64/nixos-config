# home-rclone-mounts.nix — Home-Manager module for rclone mounts with suspend/hibernate handling
{
  lib,
  pkgs,
  config,
  ...
}:

let
  cfg = config.home.rcloneMounts;
  home = config.home.homeDirectory;
in
{
  options.home.rcloneMounts = {
    enable = lib.mkEnableOption ''Enable automatic rclone mounts.'';

    remotes = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      example = [
        "<Name of remote1>"
        "<Name of remote2>"
      ];
      description = ''List of rclone remote names (as in rclone.conf) to mount.'';
    };

    mountBase = lib.mkOption {
      type = lib.types.str;
      default = "${home}/Sync";
      description = ''Base directory for mounts; each remote will be under $mountBase/<remote>.'';
    };

    mountOpts = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [
        "--vfs-cache-mode=writes"
      ];
      description = ''Additional rclone mount options (excluding logging flags).'';
    };

    logFolder = lib.mkOption {
      type = lib.types.path;
      default = "${home}/.cache/rclone";
      description = ''
        Path to rclone log file.
      '';
    };

    logLevel = lib.mkOption {
      type = lib.types.enum [
        "DEBUG"
        "INFO"
        "NOTICE"
        "ERROR"
        "CRITICAL"
      ];
      default = "NOTICE";
      description = ''
        The logging level for rclone (`--log-level`).

        Possible values:
        - DEBUG:    Detailed output for debugging.
        - INFO:     Standard information.
        - NOTICE:   Default, only important events.
        - ERROR:    Errors only.
        - CRITICAL: Critical errors only.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.rclone
    ];

    systemd.user.targets."rclone-mounts" = {
      Unit = {
        Description = "Target grouping all rclone mount services";
        Wants = [ "network.target" ];
        After = [ "network.target" ];
        Requires = map (r: "rclone-mount@${r}.service") cfg.remotes;
      };
      Install = {
        WantedBy = [ "default.target" ];
      };
    };

    systemd.user.services = lib.listToAttrs (
      map (r: {
        name = "rclone-mount@${r}";
        value = {
          Unit = {
            Description = "Mount rclone remote '${r}'";
            Wants = [ "network.target" ];
            After = [ "network.target" ];
            PartOf = [ "rclone-mounts.target" ];
          };

          Service = {
            Type = "notify";
            ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p ${cfg.mountBase}/${r}";
            ExecStart = lib.concatStringsSep " " (
              [
                "${pkgs.rclone}/bin/rclone"
                "mount"
                "${r}:"
                "${cfg.mountBase}/${r}"
                "--log-file"
                "${cfg.logFolder}/${r}.log"
                "--log-level"
                "${cfg.logLevel}"
              ]
              ++ cfg.mountOpts
            );
            ExecStop = "${pkgs.fuse}/bin/fusermount -u -z ${cfg.mountBase}/${r}";
            Restart = "on-failure";
            RestartSec = 5;
          };

          Install = {
            WantedBy = [ "rclone-mounts.target" ];
          };
        };
      }) cfg.remotes
    );
  };
}
