{ pkgs, ... }:

{
  home.file.hypr = {
    enable = true;
    recursive = true;
    source = ./hypr;
    target = ".config/hypr";
  };

  home.file.waybar = {
    enable = true;
    recursive = true;
    source = ./waybar;
    target = ".config/waybar";
  };

  home.file.wofi = {
    enable = true;
    recursive = true;
    source = ./wofi;
    target = ".config/wofi";
  };

  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = 1;
  };

  home.packages = with pkgs; [
    dunst
    hyprpaper
    qt6.qtwayland
    waybar
    wl-clipboard
    wofi
    xdg-desktop-portal-hyprland
  ];
}