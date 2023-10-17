{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.custom.home.gtk;
in
{
  options.custom.home.gtk = {
    enable = mkEnableOption "gtk" // { default = true; };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      gnome.gnome-themes-extra
      gtk-engine-murrine
      dconf
    ];

    gtk = {
      enable = true;
      font = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
        size = 10;
      };
      theme = {
        package = pkgs.libsForQt5.breeze-gtk;
        name = "Breeze-Dark";
      };
      iconTheme = {
        package = pkgs.libsForQt5.breeze-icons;
        name = "Breeze Dark";
      };
      cursorTheme = {
        package = pkgs.capitaine-cursors;
        name = "Capitaine Cursors";
        size = 16;
      };
    };

    home.pointerCursor = {
      gtk.enable = true;
      package = pkgs.capitaine-cursors;
      name = "Capitaine Cursors";
      size = 16;
    };
    xresources.extraConfig = "Xcursor.theme: Capitaine Cursors";
  };
}
