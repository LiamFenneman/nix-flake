{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.custom.utils;
in
{
  options.custom.utils = {
    enable = mkEnableOption "utils" // { default = true; };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      curl
      fd
      file
      inetutils
      p7zip
      pciutils
      ripgrep
      tree
      unzip
      wget
      which
      xclip
    ];
  };
}