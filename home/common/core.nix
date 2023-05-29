{ config, pkgs, ... }:

{
    imports = [
        ./chromium
    ];

    home.packages = with pkgs; [];
}
