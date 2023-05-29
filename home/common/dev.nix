{ config, pkgs, ... }:

{
    imports = [
        ./neovim
    ];

    home.packages = with pkgs; [
        gcc
        nodejs
        # zig
    ];

    programs.tmux = {
        enable = true;
        baseIndex = 1;
        clock24 = true;
        mouse = true;
    };

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
