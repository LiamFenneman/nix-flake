{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.custom.home.neovim;
in
{
  options.custom.home.neovim = {
    enable = mkEnableOption "neovim" // { default = true; };
  };

  config = mkIf cfg.enable {
    programs.neovim = {
      enable = true;
    };

    programs.zsh.sessionVariables = {
      EDITOR = "nvim";
    };

    home.file.nvim = {
      enable = true;
      recursive = true;
      source = ../../config/nvim/init.lua;
      target = ".config/nvim/init.lua";
    };

    home.packages = with pkgs; [
      llvmPackages_16.clang-unwrapped
    ];

    home.file.rustfmt = {
      enable = true;
      source = ../../config/nvim/rustfmt.toml;
      target = ".config/rustfmt/rustfmt.toml";
    };
  };
}
