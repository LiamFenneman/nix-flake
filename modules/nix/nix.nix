{ config, lib, ... }:

with lib;

let
  cfg = config.custom.nix;
in
{
  options.custom.nix = {
    flakes.enable = mkEnableOption "Enable flakes" // { default = true; };
    templates.enable = mkEnableOption "Enable templates" // { default = true; };
    gc.enable = mkEnableOption "Enable GC" // { default = true; };
    direnv.enable = mkEnableOption "Enable direnv" // { default = true; };
    allowUnfree = mkEnableOption "Allow unfree packages" // { default = true; };
  };

  config = {
    nixpkgs.config.allowUnfree = cfg.allowUnfree;

    programs.direnv = mkIf cfg.direnv.enable {
      enable = true;
      nix-direnv.enable = true;
      silent = mkDefault true;
    };

    nix = {
      settings = {
        experimental-features = mkIf cfg.flakes.enable [ "nix-command" "flakes" ];
        auto-optimise-store = mkDefault true;
      };

      registry.liam = mkIf cfg.templates.enable {
        from = {
          id = "liam";
          type = "indirect";
        };
        to = {
          owner = "LiamFenneman";
          repo = "nix-flake-templates";
          type = "github";
        };
      };

      gc = mkIf cfg.gc.enable {
        automatic = true;
        dates = "monthly";
        options = "--delete-older-than 30d";
      };
    };
  };
}
