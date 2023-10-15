{ config, lib, ... }:

with lib;

let
  cfg = config.custom.input;
in
{
  options.custom.input = {
    enable = mkEnableOption "input" // { default = false; };

    mouseSpeed = mkOption {
      type = types.str;
      default = "-0.3";
      description = "Mouse acceleration speed modifier";
    };
  };

  config = mkIf cfg.enable {
    services.xserver.libinput.enable = true;
    services.xserver.libinput.mouse.accelSpeed = cfg.mouseSpeed;
  };
}
