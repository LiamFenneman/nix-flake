{ config, lib, pkgs, hostName, ... }:

with lib;

let
  cfg = config.custom.base;
in
{
  options.custom.base = {
    enable = mkEnableOption "base" // { default = true; };
  };

  config = mkIf cfg.enable {
    networking.hostName = hostName;

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
