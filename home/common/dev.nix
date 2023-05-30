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
        nodejs
        # zig
    ];
}
