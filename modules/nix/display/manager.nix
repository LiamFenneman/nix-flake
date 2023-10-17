{ config, lib, user, ... }:

with lib;

let
  cfg = config.custom.display.manager;
in
{
  options.custom.display.manager = {
    enable = mkEnableOption "Display Manager" // { default = false; };
  };

  config = mkIf cfg.enable {
    services.xserver.enable = true;

    services.xserver.displayManager = {
      autoLogin.enable = true;
      autoLogin.user = user;
      lightdm.enable = true;
      lightdm.greeter.enable = true;
    };

    services.getty.autologinUser = user;
  };
}