{ ... }:

{
  imports = [ ];

  home.username = "liam";
  home.homeDirectory = "/home/liam";

  programs.home-manager.enable = true;
  programs.git.enable = true;

  home.stateVersion = "22.11";
}