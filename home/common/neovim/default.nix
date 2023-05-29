{ config, pkgs, ... }:

{
    programs.neovim = {
        enable = true;
    };

    home.file.nvim = {
        enable = true;
        recursive = true;
        source = ./nvim;
        target = ".config/nvim";
    };
}
