{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.custom.mounts;
in
{
  options.custom.mounts = {
    enable = mkEnableOption "nfs mounts" // { default = false; };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.nfs-utils ];
    services.rpcbind.enable = true; # required for NFS

    systemd.mounts = [{
      type = "nfs";
      mountConfig = {
        Options = "noauto";
      };
      what = "fileserver:/mnt/nfs";
      where = "/mnt/nfs";
    }];

    systemd.automounts = [{
      wantedBy = [ "multi-user.target" ];
      automountConfig = {
        TimeoutIdleSec = "600";
      };
      where = "/mnt/nfs";
    }];
  };
}
