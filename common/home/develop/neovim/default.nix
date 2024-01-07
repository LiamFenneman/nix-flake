{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
  };

  home.packages = with pkgs; [
    nixpkgs-fmt
    nil
  ];

  home.file.rustfmt = {
    enable = true;
    recursive = true;
    source = ./rustfmt;
    target = ".config/rustfmt";
  };
}