{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.custom.display.i3;
in
{
  options.custom.display.i3 = {
    enable = mkEnableOption "i3" // { default = false; };
  };

  config = mkIf cfg.enable {
    services.xserver.displayManager.defaultSession = "none+i3";

    services.xserver.windowManager.i3 = {
      enable = true;
      configFile = ../../config/i3/config;
      extraPackages = with pkgs; [
        dmenu
        i3status
      ];
    };
  };
}
