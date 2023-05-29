{ config, pkgs, ... }:

{
    imports = [
        ./kitty
        ./neovim
        ./tmux
    ];

    home.packages = with pkgs; [
        gcc
        nodejs
        # zig
    ];

    programs.git = {
        enable = true;
        userName = "LiamFenneman";
        userEmail = "liamfennemanbusiness@gmail.com";
    };
}
