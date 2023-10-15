{ ... }:

{
  services.xserver.enable = true;

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  custom.mounts.enable = true;
  custom.user.isAdmin = true;

  system.stateVersion = "23.05";
}
