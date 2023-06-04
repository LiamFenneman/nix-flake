{ pkgs, ... }:

{
  home.file.hypr = {
    enable = true;
    recursive = true;
    source = ./hypr;
    target = ".config/hypr";
  };

  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = 1;
  };

  home.packages = with pkgs; [
    eww-wayland
    hyprpaper
    wl-clipboard
    wofi
  ];
}