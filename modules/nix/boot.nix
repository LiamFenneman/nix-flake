{ config, lib, ... }:

with lib;

let
  cfg = config.custom.boot;
in
{
  options.custom.boot = {
    loader = mkOption {
      type = types.str;
      example = "grub";
      default = "systemd-boot";
      description = "Boot loader to use";
    };

    configLimit = mkOption {
      type = types.int;
      default = 30;
      description = "The maximum number of boot entries to show in the boot loader";
    };
  };

  config = mkMerge [
    (mkIf (cfg.loader == "grub") {
      boot.loader = {
        efi = {
          canTouchEfiVariables = true;
          efiSysMountPoint = "/boot";
        };
        grub = {
          enable = true;
          efiSupport = true;
          devices = [ "nodev" ];
          useOSProber = true;
          configurationLimit = cfg.configLimit;
        };
      };
    })
    (mkIf (cfg.loader == "systemd-boot") {
      boot.loader.systemd-boot = {
        configurationLimit = cfg.configLimit;
        enable = true;
      };
      boot.loader.efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    })
  ];
}
