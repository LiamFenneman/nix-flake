{ config, lib, user, ... }:

with lib;

let
  cfg = config.custom.user;
in
{
  options.custom.user = {
    enable = mkEnableOption "Enable the user module." // { default = true; };

    displayName = mkOption {
      type = types.str;
      default = "Liam";
      description = "The display name of the user.";
    };

    isAdmin = mkOption {
      type = types.bool;
      default = false;
      description = "Whether the user is an administrator.";
    };

    extraGroups = mkOption {
      type = types.listOf types.str;
      example = [ "video" "audio" "input" ];
      default = [ ];
      description = "Extra groups to add the user to.";
    };
  };

  config = mkIf cfg.enable {
    users.users.${user} = {
      isNormalUser = true;
      description = cfg.displayName;
      extraGroups = mkMerge [
        (mkIf cfg.isAdmin [ "wheel" ])
        cfg.extraGroups
      ];
      initialPassword = "changeme";
    };
  };
}
