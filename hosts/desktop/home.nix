{ ... }:

{
  imports = [
    ../../home/common
    ../../home/common/dev.nix
    ../../home/common/ssh.nix
    #../../home/common/tex.nix
    #../../home/common/office.nix
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

  home.stateVersion = "22.11";
}