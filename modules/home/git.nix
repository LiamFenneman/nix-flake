{ config, lib, ... }:

with lib;

let
  cfg = config.custom.home.git;
in
{
  options.custom.home.git = {
    enable = mkEnableOption "git" // { default = true; };
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      userName = "LiamFenneman";
      userEmail = "liamfennemanbusiness@gmail.com";
    };
  };
}
