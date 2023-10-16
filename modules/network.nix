{ config, lib, hostName, ... }:

with lib;

let
  cfg = config.custom.network;
in
{
  options.custom.network = {
    enable = mkEnableOption "Network configuration" // { default = true; };
  };

  config = mkIf cfg.enable {
    networking.hostName = hostName;

    networking.networkmanager.enable = true;
    programs.nm-applet.enable = true;

    networking.hosts = {
      "192.168.1.20" = [ "fileserver" ];
    };
  };
}
