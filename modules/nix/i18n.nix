{ config, lib, ... }:

with lib;

let
  cfg = config.custom.i18n;
in
{
  options.custom.i18n = {
    enable = mkEnableOption "Enable i18n" // { default = true; };

    timeZone = mkOption {
      type = types.str;
      default = "Pacific/Auckland";
    };

    hardwareClockInLocalTime = mkOption {
      type = types.bool;
      default = true;
    };

    defaultLocale = mkOption {
      type = types.str;
      default = "en_NZ.UTF-8";
    };

    keyboardLayout = mkOption {
      type = types.str;
      default = "us";
    };
  };

  config = mkIf cfg.enable {
    time.timeZone = cfg.timeZone;
    time.hardwareClockInLocalTime = cfg.hardwareClockInLocalTime;

    i18n.defaultLocale = cfg.defaultLocale;
    i18n.extraLocaleSettings = {
      LC_ADDRESS = cfg.defaultLocale;
      LC_IDENTIFICATION = cfg.defaultLocale;
      LC_MEASUREMENT = cfg.defaultLocale;
      LC_MONETARY = cfg.defaultLocale;
      LC_NAME = cfg.defaultLocale;
      LC_NUMERIC = cfg.defaultLocale;
      LC_PAPER = cfg.defaultLocale;
      LC_TELEPHONE = cfg.defaultLocale;
      LC_TIME = cfg.defaultLocale;
    };

    services.xserver = {
      layout = cfg.keyboardLayout;
      xkbVariant = "";
    };
  };
}
