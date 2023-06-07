{ ... }:

{
  imports = [
    ../../common
    ../../common/dev.nix
    ../../common/ssh.nix
    ../../common/tex.nix
    ../../common/office.nix
  ];

  home.username = "liam";
  home.homeDirectory = "/liam";

  programs.home-manager.enable = true;
  programs.git.enable = true;

  home.stateVersion = "22.11";
}