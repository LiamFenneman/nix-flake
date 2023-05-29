{ config, pkgs, ... }:

{
    imports = [
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

    programs.kitty = {
        enable = true;
        theme = "Tokyo Night";
    };
}
