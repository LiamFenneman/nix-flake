{ ... }:

{
  imports = [
    ../../home/common
    ../../home/common/dev.nix
    ../../home/common/ssh.nix
    #../../home/common/tex.nix
    #../../home/common/office.nix
  ];

  home.username = "liam";
  home.homeDirectory = "/home/liam";

  programs.home-manager.enable = true;
  programs.git.enable = true;
  programs.git.signing = {
    key = "E2F02776F6E9E8DF";
    signByDefault = true;
  };

  home.stateVersion = "22.11";
}