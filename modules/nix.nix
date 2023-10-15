{ config, lib, ... }:

with lib;

let
  cfg = config.custom.nix;
in
{
  options.custom.nix = {
    flakes.enable = mkEnableOption "Enable flakes" // { default = true; };
    gc.enable = mkEnableOption "Enable GC" // { default = true; };
    allowUnfree = mkEnableOption "Allow unfree packages" // { default = true; };
  };

  config = {
    nixpkgs.config.allowUnfree = cfg.allowUnfree;

    nix = {
      settings = {
        experimental-features = mkIf cfg.flakes.enable [ "nix-command" "flakes" ];
        auto-optimise-store = mkDefault true;
      };

      gc = mkIf cfg.gc.enable {
        automatic = true;
        dates = "monthly";
        options = "--delete-older-than 30d";
      };
    };
  };
}