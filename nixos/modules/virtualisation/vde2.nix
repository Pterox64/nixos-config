{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ vde2 ];

  systemd.services."vde-switch" =
    let
      interface = "tap0";
      group = "users";
      mode = "0600";
      dirmode = "0750";
    in
    {
      description = "Virtual Distributed Ethernet";
      after = "syslog.target";
      wantedBy = "multi-user.target";
      serviceConfig = {
        Type = "forking";
        PIDFile = "/run/vde_${interface}.pid";
        ExecStartPre = "${pkgs.coreutils}/bin/rm -f /run/vde_${interface}.pid";
        ExecStart = ''
          ${pkgs.vde2}/bin/vde_switch --tap ${interface} \
          --mode ${mode} --dirmode ${dirmode} --group ${group} \
          --pidfile /run/vde_${interface}.pid \ 
          --sock /run/vde_${interface}.sock \
          --daemon
        '';
        Restart = "on-abort";
      };
    };
}
