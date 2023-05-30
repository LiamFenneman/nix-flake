{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        exa
        file
        fzf
        htop
        neofetch
        p7zip
        pciutils
        ripgrep
        tree
        which
    ];
}
