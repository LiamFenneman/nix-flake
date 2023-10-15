{ config, lib, user, ... }:

with lib;

let
  cfg = config.custom.docker;
in
{
  options.custom.docker = {
    enable = mkEnableOption "docker" // { default = false; };
  };

  config = mkIf cfg.enable {
    virtualisation.docker.enable = true;
    virtualisation.docker.rootless = {
      enable = true;
      setSocketVariable = true;
    };

    users.users.${user}.extraGroups = [ "docker" ];
  };
}
