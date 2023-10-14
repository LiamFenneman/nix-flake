{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.custom.fonts;
in
{
  options.custom.fonts = {
    enable = mkEnableOption "Enable additional fonts";
  };

  config = mkIf cfg.enable {
    fonts.packages = with pkgs; [
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      lmodern
    ];
  };
}
