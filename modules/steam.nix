{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.custom.steam;
in
{
  options.custom.steam = {
    enable = mkEnableOption "steam" // { default = false; };

    remotePlay = mkEnableOption "remotePlay" // { default = false; };
    dedicatedServer = mkEnableOption "dedicatedServer" // { default = false; };
  };

  config = mkIf cfg.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = cfg.remotePlay;
      dedicatedServer.openFirewall = cfg.dedicatedServer;
    };

    hardware.opengl.enable = true;
    hardware.opengl.driSupport32Bit = true;

    environment.systemPackages = with pkgs; [
      protonup-qt
    ];
  };
}
