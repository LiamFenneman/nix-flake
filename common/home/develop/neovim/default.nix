{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
  };

  home.packages = with pkgs; [
    nixpkgs-fmt
    nil
  ];

  home.file.nvim = {
    enable = true;
    recursive = true;
    source = ./nvim/init.lua;
    target = ".config/nvim/init.lua";
  };

  home.file.rustfmt = {
    enable = true;
    recursive = true;
    source = ./rustfmt;
    target = ".config/rustfmt";
  };
}