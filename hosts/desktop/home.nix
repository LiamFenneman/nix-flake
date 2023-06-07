{ pkgs, ... }:

{
  imports = [
    ../../common/home
    ../../common/home/develop
    ../../common/home/media
    ../../common/home/office

    ../../desktop/hyprland/home.nix
  ];

  home.username = "liam";
  home.homeDirectory = "/home/liam";

  programs.home-manager.enable = true;
  programs.git.enable = true;
  programs.git.signing = {
    key = "6E2A9775A476DC6A";
    signByDefault = true;
  };

  home.packages = with pkgs; [
    networkmanagerapplet
    pavucontrol
  ];

  home.stateVersion = "22.11";
}