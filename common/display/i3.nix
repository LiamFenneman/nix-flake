{ lib, ... }:
{
  services.xserver.windowManager.i3.enable = true;
  services.displayManager.defaultSession = lib.mkForce "none+i3";
}
