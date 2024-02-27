{ lib, ... }:
{
  services.xserver.windowManager.i3 = {
    enable = true;
    configFile = lib.mkDefault ./i3/desktop;
  };

  services.xserver.displayManager.defaultSession = lib.mkForce "none+i3";
}
