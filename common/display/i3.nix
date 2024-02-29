{ lib, ... }:
{
  services.xserver.windowManager.i3.enable = true;
  services.xserver.displayManager.defaultSession = lib.mkForce "none+i3";
}
