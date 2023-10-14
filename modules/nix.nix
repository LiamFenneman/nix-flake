{ config, lib, ... }:

with lib;

let
  cfg = config.custom.nix;
in
{
  options.custom.nix = {
    flakes.enable = mkEnableOption "Enable flakes" // { default = true; };

    auto-optimse.enable = mkEnableOption "Enable auto optimisation of the Nix store" // { default = true; };

    gc = {
      enable = mkEnableOption "Enable GC" // { default = true; };

      dates = mkOption {
        type = types.str;
        default = "monthly";
        description = "Dates to run GC";
      };

      options = mkOption {
        type = types.str;
        default = "--delete-older-than 30d";
        description = "Options to pass to nix-collect-garbage";
      };
    };
  };

  config = {
    nix = {
      settings = {
        experimental-features = [ "nix-command" "flakes" ];
        auto-optimise-store = true;
      };

      gc = mkIf cfg.gc.enable {
        automatic = true;
        dates = cfg.gc.dates;
        options = cfg.gc.options;
      };
    };
  };
}
