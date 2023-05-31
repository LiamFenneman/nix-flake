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
    source = ./nvim;
    target = ".config/nvim";
  };
}