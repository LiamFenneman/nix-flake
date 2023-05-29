{ config, pkgs, ... }:

{
    imports = [
        ../../home/common
        ../../home/common/core.nix
        ../../home/common/dev.nix
        ../../home/common/ssh.nix
    ];

    home.username = "liam";
    home.homeDirectory = "/home/liam";

    home.stateVersion = "22.11";
    programs.home-manager.enable = true;
}
