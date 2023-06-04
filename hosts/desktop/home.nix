{ pkgs, ... }:

{
  imports = [
    ../../home/common
    ../../home/common/dev.nix
    ../../home/common/media.nix
    ../../home/common/office.nix
    ../../home/common/tex.nix

    ../../home/desktop/hyprland/home.nix
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
  ];

  home.stateVersion = "22.11";
}