{ inputs, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    xwayland.enable = true;
    xwayland.hidpi = true;
    nvidiaPatches = true;
  };

  services.getty.autologinUser = "liam";

  services.xserver.displayManager = {
    autoLogin.enable = true;
    autoLogin.user = "liam";
    defaultSession = "hyprland";
    lightdm.enable = true;
    lightdm.greeter.enable = true;
  };
}