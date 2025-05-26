{ lib, pkgs, ... }:
{
  services.xserver.windowManager.i3 = {
    enable = true;
    extraPackages = with pkgs; [
      dmenu
      i3status
    ];
  };
  programs.i3lock.enable = true;
  services.displayManager.defaultSession = lib.mkForce "none+i3";
}
