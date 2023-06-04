{ inputs, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    xwayland.enable = true;
    xwayland.hidpi = true;
    nvidiaPatches = true;
  };

  environment.plasma5.excludePackages = with pkgs; [
    dolphin
    spectacle
  ];
}