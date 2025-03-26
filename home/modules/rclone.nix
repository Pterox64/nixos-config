{ pkgs, ... }:
{
  home.packages = with pkgs; [ rclone ];

  systemd.user.services =
    let
      Service =
        { remote }:
        let
          local = "%h/Sync/${toString remote}";
        in
        {
          Unit = {
            Description = "Rclone Mount Service for ${toString remote}";
            Requires = [ "default.target" ];
            After = [ "network.target" ];
          };
          Install = {
            WantedBy = [ "default.target" ];
          };
          Service = {
            Type = "notify";
            Restart = "on-failure";
            ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p ${local}"; # Создаем директорию для монтирования
            ExecStart = "${pkgs.rclone}/bin/rclone mount ${toString remote}: ${local} --vfs-cache-mode writes";
            ExecStop = "/run/wrappers/bin/fusermount -u ${local}";
          };
        };
    in
    {
      "rclone-mount-gdrive-pterox64" = Service { remote = "gdrive-pterox64"; };
      "rclone-mount-yd-pterox.ru" = Service { remote = "yd-pterox.ru"; };
    };
}
