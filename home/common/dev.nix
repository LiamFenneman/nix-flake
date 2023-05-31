{ config, pkgs, ... }:

{
    imports = [
        ./git
        ./kitty
        ./neovim
        ./shell
        ./tmux
    ];

    home.packages = with pkgs; [
        gcc
        gnumake
        nodejs
        cargo
        rustc
        zig
    ];
}
