{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.custom.thunar;
in
{
  options.custom.thunar = {
    enable = mkEnableOption "Thunar" // { default = false; };
  };

  config = mkIf cfg.enable {
    programs.thunar.enable = true;
    programs.thunar.plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];

    services.gvfs.enable = true; # Mount, trash, and other functionalities
    services.tumbler.enable = true; # Thumbnail support for images
    services.dbus.packages = with pkgs; [
      xfce.xfconf
    ];

    environment.systemPackages = with pkgs; [
      gnome.file-roller
    ];
  };
}
