{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.custom.display.kde;
in
{
  options.custom.display.kde = {
    enable = mkEnableOption "KDE desktop environment" // { default = false; };
  };

  config = mkIf cfg.enable {
    services.xserver.desktopManager.plasma5.enable = true;

    environment.plasma5.excludePackages = with pkgs; [
      ark
      elisa
      gwenview
      khelpcenter
      kinfocenter
      konsole
      okular
      spectacle
    ];
  };
}
